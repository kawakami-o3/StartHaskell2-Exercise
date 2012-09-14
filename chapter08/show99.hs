import Text.Printf
--tableX :: a -> [[a]]
--tableX = tableX' 1
--  where
--    tableX' i n | i == n = []
--                | otherwise = (lineX i n) : (tableX' (i+1) n)
--    lineX i n = lineX' 1 i n
--    lineX' a i n | a>n = []
--                 | otherwise = (a*i) : (lineX' (a+1) i n)
    
--myTable :: Int -> [[Int]]
--talbeX n = myTable' 1 n
--  where
--    myTable' i n | i>n = [[]]
--                | otherwise = (map (\x->i*x) [1..9]) : (myTable' (i+1) n)

myLine :: Int -> [Int]
myLine n = map (\x -> n * x) [1..9]

printer :: [[Int]] -> IO String


main = do
--  putStrLn $ show $ (map (\x -> myLine x) [1..9])
  putStrLn $ show $ (map (\x -> myLine x) [1..9])
