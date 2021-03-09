module Rules where

import System.Exit
import Data.Bits


firstLine ::Int -> Int -> String
firstLine l r = (replicate l ' ') ++ "*" ++ (replicate (r - 1) ' ')

getBinary :: String -> Int
getBinary (' ':' ':' ':_) = 0
getBinary (' ':' ':'*':_) = 1
getBinary (' ':'*':' ':_) = 2
getBinary (' ':'*':'*':_) = 3
getBinary ('*':' ':' ':_) = 4
getBinary ('*':' ':'*':_) = 5
getBinary ('*':'*':' ':_) = 6
getBinary ('*':'*':'*':_) = 7

createNextLine :: Int -> String -> String
createNextLine _ [] = []
createNextLine _ (_:_:[]) = " "
createNextLine rule x
  | ((rule `shiftR` (getBinary x)) .&. 1) == 1 = "*" ++
    createNextLine rule (tail x)
  | otherwise = " " ++ createNextLine rule (tail x)

displayRules :: Int -> Int -> String -> IO()
displayRules 0 _ _ = exitWith(ExitSuccess)
displayRules line rule prev =  putStrLn(prev) >>
  displayRules (line - 1) rule (" " ++ createNextLine rule prev) 

startGen :: Int -> Int -> String -> String
startGen 0 _ prev = prev
startGen line rule prev = startGen (line - 1) rule
  (" " ++ createNextLine rule prev)
