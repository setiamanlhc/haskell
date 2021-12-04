--mySecondLast [1,2,3,4]
--mySecondLast ['a'..'z']
mySecondLast :: [a] -> a
mySecondLast x = reverse x !! 1

--Problem 3
--elementAt [1,2,3] 2
elementAt :: [a] -> Int -> a
elementAt (x:xs) 1 = x
elementAt [] _ = error "Index out of range!"
elementAt (_:xs) i
    | i < 1 = error "Index out of range!"
    | otherwise = elementAt xs (i - 1)

--elementAt' [1,2,3] 2
elementAt' :: [a] -> Int -> a
elementAt' (x:_) 1  = x
elementAt' [] _     = error "Index out of bounds"
elementAt' (_:xs) k
  | k < 1           = error "Index out of bounds"
  | otherwise       = elementAt' xs (k - 1)

--elementAt'' [1,2,3] 2
elementAt'' :: [a] -> Int -> a
elementAt'' (x:_) 1  = x
elementAt'' (_:xs) i = elementAt'' xs (i - 1)
elementAt'' _ _      = error "Index out of bounds"

--myLength "Hello, world!"
--myLength [123, 456, 789]
myLength :: [a] -> Integer
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

--myReverse "A man, a plan, a canal, panama!"
--myReverse [1,2,3,4]
myReverse :: [a] -> [a]
myReverse [x] = [x]
myReverse (x:xs) = myReverse xs ++ x: []

--isPalindrome [1,2,3]
--isPalindrome "madamimadam"
--isPalindrome [1,2,4,8,16,8,4,2,1]
-- Eq a to tell Haskell it can be compared
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == (reverse x)

--flatten (Elem 5)
--flatten (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
--We have to define a new data type, because lists in Haskell are homogeneous.
--
data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List x) = concatMap flatten x

--Eliminate consecutive duplicates of list elements.
--compress "aaaabccaadeeee"
--https://wiki.haskell.org/99_questions/Solutions/8
--https://stackoverflow.com/questions/25835521/understanding-dropwhile
compress :: Eq a => [a] -> [a]
compress []     = []
compress (x:xs) = x : (compress $ dropWhile (== x) xs)
