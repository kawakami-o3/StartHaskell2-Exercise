main = do
  x <- getLine
  if x == "quit"
    then do
      putStrLn "exit?(yes/no)"
      res <- getLine
      if res == "yes"
        then return ()
        else do
          main
    else do
      putStrLn x
      main


