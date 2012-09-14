import System.Environment

add :: Num a => a -> a -> a
add x y = x + y

sub :: Num a => a -> a -> a
sub x y = x - y

times :: Num a => a -> a -> a
times x y = x * y

mydiv :: Fractional a => a -> a -> a
mydiv x y = x / y

dispatcher :: Fractional a => String -> (a->a->a)
dispatcher "add" = add
dispatcher "sub" = sub
dispatcher "times" = times
dispatcher "div" = mydiv

apply :: [String] -> Float
apply (cal:x:y:[]) = (dispatcher cal) (read x) (read y)

main = do
  x <- getArgs
  putStrLn $ show $ apply x

