import System.Environment
import System.IO

headCmd :: FilePath -> IO ()
headCmd fn = withFile fn ReadMode (\handle -> do
  cnt <- hGetContents handle
  mapM_ (putStrLn) (take 10 (lines cnt)))

main = do
  x <- getArgs
  mapM_ (headCmd) x


--main = do
--x <- getArgs
--mapM_ (\fn -> withFile fn ReadMode (\handle -> do
--  cnt <- hGetContents handle
--  mapM_ (putStrLn) (take 10 (lines cnt)))) x


