import Data.List

data Section = Section {getA :: Int, getB :: Int, getC :: Int} deriving (Show)
type RoadSystem = [Section]

--heathrowToLondon :: RoadSystem
--heathrowToLondon = [ Section 50 10 30
--                   , Section 5 90 20
--                   , Section 40 2 25
--                   , Section 10 8 0
--                   ]

data Label = A | B | C deriving (Show,Eq)
type Path = [(Label, Int)]
type PathEnd = ([(Label, Int)],Label)

getTime :: Path -> Int
getTime = sum . map snd

genPath :: RoadSystem -> [Path]
genPath []= [[]]
genPath xs = map fst (genPath' xs)
  where
    genPath' :: RoadSystem -> [PathEnd]
    genPath [] = error "Error> genPath"
    genPath' (x:[]) = [([(A,getA x)],A),([(B,getB x)],B)]
    genPath' (x:xs) =
      let paths = genPath' xs
          pathsA = filter (\x -> (snd x) == A) paths
          pathsB = filter (\x -> (snd x) == B) paths
      in (map (\y-> ((A,(getA x)):(fst y),A)) pathsA)
           ++ (map (\y-> ((B,(getB x)):(fst y),B)) pathsB)
           ++ (map (\y-> ((B,(getB x)):(C,(getC x)):(fst y),B)) pathsA)
           ++ (map (\y-> ((A,(getA x)):(C,(getC x)):(fst y),A)) pathsB)

minPath :: [Path] -> Path
minPath [[]] = error "Error> minPath"
minPath (x:[]) = x
minPath (x:xs) =
  let y = minPath xs
  in if (getTime x) <= (getTime y) then x else y

depthSearch :: RoadSystem -> Path
depthSearch = minPath . genPath

groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = (take n xs) : (groupsOf n (drop n xs))

main = do
  contents <- getContents
  let threes = groupsOf 3 (map read $ lines contents)
      roadSystem = map (\[a,b,c] -> Section a b c) threes
      path = depthSearch roadSystem
      paths = genPath roadSystem
      pathString = concat $ map (show . fst) path
      pathTime = sum $ map snd path
      tmp = genPath [Section {getA = 50, getB = 10, getC = 30}]
  putStrLn $ "The best path to take is: " ++ pathString
  putStrLn $ "Time taken: " ++ show pathTime
--putStrLn $ show path
--putStrLn $ show roadSystem
--putStrLn $ show paths
--putStrLn $ show tmp

