module Life where

import qualified Data.HashSet as Set
import Data.Hashable

data Point = Point Int Int deriving (Show, Eq, Ord)

instance Hashable Point where
    hashWithSalt salt (Point x y) = hashWithSalt salt (x, y) 

surrounding (Point x y) =
    [Point (x+dx) (y+dy) | dx <- [-1..1], dy <- [-1..1],
                           dx /= 0 || dy /= 0]

data World = Cells (Set.HashSet Point) deriving (Show, Eq)

fromPoints points = Cells $ Set.fromList points
toPoints (Cells pts) = Set.toList pts

isAlive (Cells pts) point = Set.member point pts

neighbourCount world point = length $ neighbours 
  where
    neighbours = filter (isAlive world) (surrounding point)

willBeAlive world point
    | neighbourCount world point == 3 = True
    | neighbourCount world point == 2 = isAlive world point
    | otherwise                       = False

nextGeneration :: World -> World
nextGeneration world =
    Cells (Set.filter (willBeAlive world) candidates)
  where
    candidates = Set.fromList [p | p0 <- points, p <- surrounding p0]
    points = toPoints world
