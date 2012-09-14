import Text.Printf

print2dArr :: [[a]] -> IO ()
print2dArr [] = return ()
print2dArr (x:xs) = do
  mapM_ (printf "%3d") x
  putStrLn ""
  

main = do
  print2dArr foldl (\a -> \x -> a++"\n"++(show x)) "" [[a*b|a<-[1..9]]|b<-[1..9]]
--  putStrLn $ foldl (\a -> \x -> a++"\n"++(show x)) "" [[a*b|a<-[1..9]]|b<-[1..9]]
