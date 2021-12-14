--https://adventofcode.com/2021/day/3#part2

import System.IO  
import Control.Monad

--list :: [String]


main = do  
        let list = []
        handle <- openFile "input_day3.txt" ReadMode
        contents <- hGetContents handle
        --list <- words contents
        let list = words contents
        --let list = singlewords
            --result = howManyIncrease list 
        --print list
        let gamma = bin2Dec $ gammaBit $ bit2Digit $ countAllBit nrOfBit list
        let epsilon = bin2Dec $ epsilonBit $ bit2Digit $ countAllBit nrOfBit list
        print gamma
        print epsilon
        print (gamma*epsilon)
        hClose handle  
        where
           


--f :: [String] -> [Int]
--f = map read



--testData = [ "00100","11110","10110","10111","10101","01111","00111","11100","10000","11001","00010","01010"]
-- single quote for character
-- double quote for String
        nrOfBit :: [Int]
        nrOfBit = [0..11]

        -- gammaBit $ bit2Digit $ countAllBit nrOfBit
        gammaBit :: [(Char, Char)] -> String
        gammaBit [] = []
        gammaBit ((i,_): xs) = i: gammaBit xs
        -- epsilonBit $ bit2Digit $ countAllBit nrOfBit
        epsilonBit :: [(Char, Char)] -> String
        epsilonBit [] = []
        epsilonBit ((_,i): xs) = i: epsilonBit xs

        --bit :: [(Char, Char)]
        --bit = bit2Digit $ countAllBit nrOfBit 


        bin2Dec :: String -> Integer
        bin2Dec = foldr (\c s -> s * 2 + c) 0 . reverse . map c2i
            where c2i c = if c == '0' then 0 else 1

        --bit2Digit $ countAllBit nrOfBit
        bit2Digit :: [(Int, Int)] -> [(Char, Char)]
        bit2Digit [] = []
        bit2Digit (x:xs) 
           | fst x > snd x = ('0', '1'): bit2Digit xs
           | otherwise = ('1', '0'): bit2Digit xs             



        --countAllBit nrOfBit
        countAllBit :: [Int] -> [String] ->[(Int, Int)]
        countAllBit [] _ = []
        countAllBit (x:xs) list = countBit list (0,0) x: countAllBit xs list


        --countBit testData (0,0) 1

        countBit :: [String] -> (Int, Int) -> Int -> (Int, Int)
        countBit [] (i, j) _ = (i,j)
        countBit (x:xs) (i,j) p = case x !! p  of
            '1' -> countBit xs (i,j+1) p
            '0' -> countBit xs (i+1,j) p
            _ -> (i,j)

