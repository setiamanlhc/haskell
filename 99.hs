--mySecondLast [1,2,3,4]
--mySecondLast ['a'..'z']
mySecondLast :: [a] -> a
mySecondLast x = reverse x !! 1
