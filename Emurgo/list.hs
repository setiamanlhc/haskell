myIndex :: [a] -> Int -> a
myIndex [] _ = error "index too large"
myIndex (x:xs) 0 = x
myIndex (x:xs) i = myIndex xs (i-1)


myTake :: Int -> [a] -> [a]
myTake _ [] = []
myTake 1 (x:_) = [x]
myTake i (x:xs) = x: myTake (i-1) xs

map ($ "world") [ head, last ]
foldl (-) 0 [ 2, 3, 4 ] 
