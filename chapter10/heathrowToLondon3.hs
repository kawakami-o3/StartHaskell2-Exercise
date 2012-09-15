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
roadStep ((pathA,timeA), (pathB,timeB)) (Section a b c) =
  let forwardTimeToA = timeA + a
      crossTimeToA = timeB + b + c
      forwardTimeToB = timeB + b
      crossTimeToB = timeA + a + c
      newPathToA = if forwardTimeToA <= crossTimeToA
                      then (A:pathA, timeA+a)
                      else (C:B:pathB, timeB+b+c)
      newPathToB = if forwardTimeToB <= crossTimeToB
                      then (B:pathB, timeB+b)
                      else (C:A:pathA, timeA+a+c)
  in (newPathToA, newPathToB)



optimalPath :: RoadSystem -> Path
optimalPath roadSystem =
  let ((pathA, timeA), (pathB, timeB)) = foldl roadStep (([],0),([],0)) roadSystem
  in if timeA <= timeB
          then (reverse pathA, timeA)
          else (reverse pathB, timeB)

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
--putStrLn $ show path

