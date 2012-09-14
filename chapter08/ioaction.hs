
hello :: IO ()
hello = putStrLn "Hello!"

myName :: IO ()
myName = putStrLn "My name is Haskell."

bye :: IO ()
bye = putStrLn "Bye!"

main = do
  hello
  myName
  bye
