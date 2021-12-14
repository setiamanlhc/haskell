parseBool :: String -> Maybe Bool
parseBool x = case x of
    "True" -> Just True
    "true" -> Just True
    "False" -> Just False
    "false" -> Just False
    _ -> Nothing 
    
--data Maybe a = Nothing | Just a

double :: Int -> Int
--double x = x * 2
double = (*2)
--double = \x -> x * 2


--lambda
last' :: [a] -> Maybe a
last' [x] = Just x
last' (_:xs) = last' xs
-- tail' [1,2,3]
tail' :: [a] -> Maybe [a]
tail' [] = Nothing
tail' (_:xs) = Just  xs






