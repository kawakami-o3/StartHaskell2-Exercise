import System.Environment
import System.IO

tailCmd :: FilePath -> IO ()
tailCmd fn = withFile fn ReadMode (\handle ->
  cnt <- hGetContents handle
  let cntLines = lines cnt
  mapM_ (putStrLn) (1

main = do
  x <- getArgs
  mapM_ (tailCmd) x

