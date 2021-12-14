--https://www.codewars.com/kata/55d1d6d5955ec6365400006d/solutions/haskell

import Prelude

roundToNext5 :: Int -> Int
roundToNext5 0 = 0
roundToNext5 n 
  | mod n 5 == 0 = n
  | otherwise = 5 + ( 5 * a )
  where 
      a =  n `div` 5
