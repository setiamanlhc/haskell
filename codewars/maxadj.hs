adjacentElementProduct :: [Integer] -> Integer
adjacentElementProduct [] = 0
adjacentElementProduct numbers = maxNo numbers (-10000000000)
    where 
        maxNo :: [Integer] -> Integer -> Integer
        maxNo [x] max = max
        maxNo (x:y:ys) max 
            | (x*y) > max = maxNo (y:ys) (x*y)
            | otherwise = maxNo (y:ys) max

adjacentElementProduct' :: [Integer] -> Integer
adjacentElementProduct' = maximum . (zipWith (*) <*> tail)

--http://zvon.org/other/haskell/Outputprelude/zipWith_f.html
