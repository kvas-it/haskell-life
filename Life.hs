module Life where

import Data.List

data Point = Point Int Int deriving (Show, Eq, Ord)

surrounding (Point x y) =
        [Point (x+dx) (y+dy) | dx <- [-1..1], dy <- [-1..1],
                               dx /= 0 || dy /= 0]
                  
neighbours [] point = []
neighbours (x:xs) point = if elem x (surrounding point)
                        then x : neighbours xs point
                        else neighbours xs point

neighbourCount world point = length $ neighbours world point

willBeAlive world point
    | neighbourCount world point == 3 = True
    | neighbourCount world point == 2 = elem point world
    | otherwise                       = False

uniq pts = uniq' $ sort pts
uniq' [] = []
uniq' [x] = [x]
uniq' (x:xs)
    | x == head xs = uniq' xs
    | otherwise    = x : uniq' xs

nextGeneration world = filter (willBeAlive world) candidates
  where
    candidates = uniq [p | p0 <- world, p <- surrounding p0]
