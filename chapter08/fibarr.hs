import System.IO (hFlush, stdout)

fibList :: Int -> [Int]
fibList 1 = [0]
fibList 2 = [0,1]
fibList n = fibList' [1,0] n
  where
    fibList' ac@(x:y:xs) n | length ac == n = reverse ac
                           | otherwise = fibList' ((x+y):ac) n

main = do
  putStr "input number> "
  hFlush stdout
  x <- getLine
  mapM_ (\x-> do
    putStr $ show x
    putStr " ") (fibList $ read x)
  putStrLn ""
  main
