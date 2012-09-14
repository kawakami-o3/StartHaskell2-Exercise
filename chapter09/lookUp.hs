import System.Random
import System.IO (hFlush, stdout)

exactNum :: String -> String -> Int
exactNum a b = exactNum' 0 a b
  where
    exactNum' n [] [] = n
    exactNum' n (a:as) (b:bs) = exactNum' (if a==b then (n+1) else n) as bs

matchNum :: String -> String -> Int
matchNum = matchNum' 0
  where
    matchNum' n _ [] = n
    matchNum' n a (b:bs) = matchNum' (if (matchChar b a) then (n+1) else n) a bs

matchChar :: Char -> String -> Bool
matchChar _ [] = False
matchChar c (x:xs) | c == x = True
                   | otherwise = matchChar c xs

lookUp :: String -> IO ()
lookUp correct = do
  putStr "> "
  hFlush stdout
  x <- getLine
  if x == correct
    then putStrLn "correct"
    else do
      putStrLn $ ((show (exactNum correct x)) ++ " " ++ (show (matchNum correct x)))
      lookUp correct

main = do
  gen <- getStdGen
  let correct = take 4 (randomRs ('0','9') gen)
  putStrLn correct
  lookUp correct

