myFilter :: (a -> Bool) -> [a] -> [a]
--           ^ first parameter is a "predicate" function that checks a value `a` and returns a Bool
myFilter _ [] = []
myFilter p (x:xs) = if p x
                    then x : myFilter p xs
                    else myFilter p xs
