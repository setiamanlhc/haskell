-- twoSum [1, 2, 3] 4

twoSum :: [Int] -> Int -> (Int,Int)
twoSum = undefined

helper :: Int -> [Int] -> [Int]
helper i xs = [x+ i| x <- xs ]
