main = do
  x <- getLine
  if x == "q"
    then return ()
    else do
       putStrLn x
       main

