import Data.List

data Section = Section {getA :: Int, getB :: Int, getC :: Int}
type RoadSystem = [Section]

--heathrowToLondon :: RoadSystem
--heathrowToLondon = [ Section 50 10 30
--                   , Section 5 90 20
--                   , Section 40 2 25
--                   , Section 10 8 0
--                   ]

data Label = A | B | C deriving (Show)
--type Path = [(Label, Int)]
type Path = ([Label],Int)

roadStep :: (Path, Path) -> Section -> (Path, Path)
roadStep (pathA, pathB) (Section a b c) =
  let timeA = snd pathA
      timeB = snd pathB
      forwardTimeToA = timeA + a
      crossTimeToA = timeB + b + c
      forwardTimeToB = timeB + b
      crossTimeToB = timeA + a + c
      newPathToA = if forwardTimeToA <= crossTimeToA
                      then (A:(fst pathA), timeA+a)
                      else (C:B:(fst pathB), timeB+b+c)
      newPathToB = if forwardTimeToB <= crossTimeToB
                      then (B:(fst pathB), timeB+b)
                      else (C:A:(fst pathA), timeA+a+c)
                      --then (B,b):pathB
                      --else (C,c):(A,a):pathA
  in (newPathToA, newPathToB)



optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
  let (bestAPath, bestBPath) = foldl roadStep (([],0),([],0)) roadSystem
  in if (snd bestAPath) <= (snd bestBPath)
          then (reverse (fst bestAPath), snd bestAPath)
          else (reverse (fst bestBPath), snd bestBPath)

groupsOf :: Int -> [a] -> [[a]]
groupsOf 0 _ = undefined
groupsOf _ [] = []
groupsOf n xs = (take n xs) : (groupsOf n (drop n xs))

main = do
  contents <- getContents
  let threes = groupsOf 3 (map read $ lines contents)
      roadSystem = map (\[a,b,c] -> Section a b c) threes
      path = optimalPath roadSystem
      pathString = concat $ map (show) $ fst path
      pathTime = snd path
  putStrLn $ "The best path to take is: " ++ pathString
  putStrLn $ "Time taken: " ++ show pathTime

