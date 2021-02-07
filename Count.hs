module Count where

count :: Int -> [a] -> Maybe Int
count n (x:xs) = count (n+1) xs
count n [] = Just n

count2 :: Int -> [a] -> Maybe Int
count2 n (x:xs) = (count2 $! n+1) xs
count2 n [] = Just n

count3 :: Int -> [a] -> Maybe Int
count3 n (x:xs) = count3 (n+1) xs
count3 n [] = Just $! n


