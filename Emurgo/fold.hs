--folds.hs
--https://wiki.haskell.org/Fold

sum' = foldl (+) 0 [1,2,3]

--reverse
reverse [1..5]
conc = concat
f x y = conc ["(",x,"+",y,")"]
foldl f "0" (map show [1..5])

