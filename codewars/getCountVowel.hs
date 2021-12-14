--https://www.codewars.com/kata/54ff3102c1bad923760001f3/solutions/haskell
getCount''' :: String -> Int
getCount''' = length . filter (`elem` "aeiou")

getCount :: String -> Int
getCount = length . filter (`elem` "aeiou")

getCount' :: String -> Int
getCount' str = length [i | i <- str, i `elem` "aeiou"]


isVowel :: Char -> Int
isVowel c = case c of
          'a' -> 1
          'e' -> 1
          'i' -> 1
          'o' -> 1
          'u' -> 1
          _  -> 0

getCount'' :: String -> Int
getCount'' = sum . map isVowel
