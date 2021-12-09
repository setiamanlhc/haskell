import System.IO  
import Control.Monad


main = do  
        let list = []
        handle <- openFile "input.txt" ReadMode
        contents <- hGetContents handle
        let singlewords = words contents
            list = f singlewords
            result = howManyIncrease list 
        print result
        hClose handle  
           


f :: [String] -> [Int]
f = map read


-- howManyIncrease [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
-- howManyIncrease list
howManyIncrease :: [Int] -> Int
howManyIncrease [] = 0
howManyIncrease [x] = 0
howManyIncrease (x:y:zs)
    | y > x = 1 + howManyIncrease (y: zs)
    | otherwise = 0 + howManyIncrease (y: zs)
    