main = do
  foo <- putStr "Hoo"
  name <- getLine
  putStrLn name
