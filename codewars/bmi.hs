--import System.Win32 (COORD(yPos))
-- bmi <= 18.5
hitungBeratBadan :: Int -> String 
hitungBeratBadan 0 = "Ngak masuk akal"
hitungBeratBadan n
    | n < 20 = "Kurus"
    | n < 50 = "Ideal"
    | otherwise = "Kegemukan"
-- Guard - > case atau IF statement

f :: Int -> Int -> Int 
f x y = x * y

double :: Int -> Int 
double = (*2)

d
--[a..z] 
-- ['a','b','c'] = 3
-- 'a' :'b' :'c': []
-- 'a': ['b','c']
jumlah :: [Int] -> Int 
jumlah [] = 0
jumlah (a: b) = a + jumlah b

data Boleh = Benar | Salah

length' :: [Int] -> Int 
length' [] = 0
length' (_:xs) = 1 + length' xs
-- 1: [2,3] = 1 + length [2,3]
-- 2: [3]  = 1 + 1 + length [3]
-- 3: [] = 1 + 1 + 1 +length []
-- 4: [] = 1 +1+1+0


--(*) a b