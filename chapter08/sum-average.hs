import System.IO (hFlush, stdout)
import Data.List (genericLength)
avg :: Fractional a => [a] -> a
avg x = (sum x) / (genericLength x)
--avg x = (sum x) / (toFloat $ length x)

main = do
  putStr "> "
  hFlush stdout

  xs <- getLine
  let arr = map (\x->(read x)) (words xs)
  putStr $ "sum: " ++ (show $ sum arr)
  putStr $ "avg: " ++ (show $ avg arr)

