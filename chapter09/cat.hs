import System.Environment
main = do
  fns <- getArgs
  mapM_ (\fn -> do
    cnt <- readFile fn
    putStrLn cnt) fns

