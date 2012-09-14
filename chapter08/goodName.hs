

main = do
  x <- getLine
  if x == "kawakami"
    then putStrLn "good"
    else return ()
  main
