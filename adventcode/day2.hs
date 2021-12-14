--https://adventofcode.com/2021/day/2
import System.IO  
import Control.Monad
import Numeric


main = do  
        let list = []
        handle <- openFile "input_day2.txt" ReadMode
        contents <- hGetContents handle
        let singlewords = lines contents
            list = f singlewords
            result = calcDepth list
            --result = howManyIncrease list 
        print result
        hClose handle  

f :: [String] -> [Move]
f = map readMove

readMove :: String -> Move
readMove move = case words move of
    ("Forward":n:ns) -> Forward $ read n
    ("Up": n: ns) -> Up $ read n
    ("Down": n: ns) -> Down $ read n

data Point = Point Int Int
    deriving (Show)

data Move = Forward Int | Down Int | Up Int
    deriving (Show, Read)

data1 = [ Forward 5, Down 5, Forward 8, Up 3, Down 8, Forward 2]

-- calcDepth data1
calcDepth :: [Move] -> Int
calcDepth movement = getPoint $ depth (Point 0 0) movement
    where
        -- depth (Point 0 0) data1
        depth :: Point -> [Move] -> Point
        depth (Point x y) [] = Point x y
        depth (Point x y) (z: zs) = case z of
            Forward n -> depth (Point x (y+n)) zs
            Up n -> depth (Point (x-n) y) zs
            Down n -> depth (Point (x+n) y) zs

        getPoint :: Point -> Int
        getPoint (Point x y) = x * y








