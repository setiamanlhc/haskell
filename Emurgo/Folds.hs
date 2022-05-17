{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Avoid lambda" #-}
{-# HLINT ignore "Eta reduce" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use or" #-}
{-# HLINT ignore "Use sum" #-}
{-# HLINT ignore "Use product" #-}


module Foldr where
import Data.List (foldl')

-- Implement the following built-in functions using folds.
-- For each solution, think carefully about the following:
--  1. Which type of fold should be used?
--      * Use `foldr` whenever possible
--      * If a left fold is needed, use the strict version `foldl'`
--  2. Which binary function should be used for the reducer?
--      * Is there a built-in operator or function you can use?
--      * If not, write your own using a lambda expression
--      * Be mindful of parameter order!
--  3. What is the initial (identity) value?

mySum :: Num a => [a] -> a
mySum xs = foldr (+) 0 xs

myProduct :: Num a => [a] -> a
myProduct xs = foldr (*) 1 xs

-- For the following boolean functions, remember the built-in logical operators (||) and (&&):
-- and [True, False, True] == False
-- and [True, True, True] == True
myAnd :: [Bool] -> Bool
-- https://www.stackage.org/haddock/lts-19.6/base-4.15.1.0/Prelude.html#v:and
myAnd = undefined

myOr :: [Bool] -> Bool
-- https://www.stackage.org/haddock/lts-19.6/base-4.15.1.0/Prelude.html#v:or
myOr = undefined

myElem :: Eq a => a -> [a] -> Bool
myElem = undefined

-- The next 3 functions take a predicate (function returning a Bool) as their first parameter

myAny :: (a -> Bool) -> [a] -> Bool
-- https://www.stackage.org/haddock/lts-19.6/base-4.15.1.0/Prelude.html#v:any
myAny = undefined

myAll :: (a -> Bool) -> [a] -> Bool
-- https://www.stackage.org/haddock/lts-19.6/base-4.15.1.0/Prelude.html#v:all
myAll = undefined

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter = undefined


myMap :: (a -> b) -> [a] -> [b]
myMap = undefined

myReverseR :: [a] -> [a]
-- implement `reverse` using `foldr`
myReverseR = undefined

myReverseL :: [a] -> [a]
-- implement `reverse` using `foldl'`.
-- for a challenge, try using the `flip` function:
-- https://www.stackage.org/haddock/lts-19.6/base-4.15.1.0/Prelude.html#v:flip
myReverseL = undefined

-- The next 2 functions are partial functions: they return an error when called on an empty list.
-- Implement the non-empty patterns using folds:
-- Hint: for the initial/identity value, you can use one of two options:
--  1. Use `minBound` or `maxBound`: these will provide the highest or lowest possible value of the given type.
--     Think carefully about which one is appropriate to use for each function!
--  2. Use the head of the list as the initial value, and fold over the tail.
--     If using this option, destructure the list on the left side of the equals sign (from `xs` into `(x:xs)`) to access the head and tail

myMaximum :: Ord a => [a] -> a
--https://www.stackage.org/haddock/lts-19.6/base-4.15.1.0/Prelude.html#v:maximum
myMaximum [] = error "empty list"
myMaximum xs = undefined

myMinimum :: Ord a => [a] -> a
--https://www.stackage.org/haddock/lts-19.6/base-4.15.1.0/Prelude.html#v:minimum
myMinimum [] = error "empty list"
myMinimum xs = undefined