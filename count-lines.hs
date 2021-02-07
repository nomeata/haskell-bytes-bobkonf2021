main = do
    input <- getContents
    putStrLn $ "I read " ++ show (length input) ++ " bytes."
    putStrLn $ "The last line is:"
    putStrLn $ last (lines input)
