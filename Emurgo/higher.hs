import System.Win32 (COORD(yPos))
--Anonymous Function
--greaterThan100 [1,2,100,200,300]

greaterThan100 :: [Integer] -> [Integer]
greaterThan100 xs = filter gt100 xs

gt100 :: Integer -> Bool 
gt100 x = x > 100

-- greaterThan100' [1,2,100,200,300]
greaterThan100' :: [Integer] -> [Integer]
greaterThan100' xs = filter (\x -> x > 100) xs
-- lambda (\x -> x > 100)
-- x is argument
-- x>100 is expression

mul3 :: Integer -> Integer -> Integer 
mul3 x y z =  x * y * z

-- equivalent to (\x y z -> x * y * z)

maxOfTwoNumbers :: Integer -> Integer  -> Integer 
maxOfTwoNumbers x y = if x > y then x else y
-- equivalent (\x y ->if x > y then x else y)

(\x -> x + 100) 10

-- Operati[1,2,100,200,300]on Sections

-- Function Composition

-- Curryig=ng and Partial Application