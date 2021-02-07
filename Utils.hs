module Utils where
import GHC.HeapView
import Text.Printf
import Data.List
import System.Mem

viewClosure :: a -> IO ()
viewClosure a = do
    (_,w,_) <- getClosureRaw a
    putStrLn $ show (asBox a) ++ ": " ++ (concat $ intersperse " " $ map (printf "0x%016x") w)

viewListClosures :: [a] -> IO ()
viewListClosures l@(x:xs) = do
    viewClosure l
    viewClosure x
    viewListClosures xs
viewListClosures l = do
    viewClosure l
