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

createChar :: Int -> Int -> String
createChar rule shif
  | ((rule `shiftR` shif) .&. 1) == 1 = "*"
  | otherwise = " "

createNextLine :: Int -> String -> String
createNextLine _ [] = []
createNextLine _ (_:[]) = []
createNextLine rule (' ':' ':[]) = createChar rule 0
createNextLine rule (' ':'*':[]) = createChar rule 1
createNextLine rule ('*':' ':[]) = createChar rule 2
createNextLine rule ('*':'*':[]) = createChar rule 3
createNextLine rule x = (createChar rule (getBinary x))
  ++ createNextLine rule (tail x)

displayRules :: Int -> Int -> Int -> Int -> String -> IO()
displayRules 0 _ _ _ _= exitWith(ExitSuccess)
displayRules line rule skip w prev =  putStrLn(take w (drop skip prev)) >>
  displayRules (line - 1) rule (skip + 1) w ("  "
  ++ (createNextLine rule prev) ++ " ") 

startGen :: Int -> Int -> String -> String
startGen 0 _ prev = prev
startGen line rule prev = startGen (line - 1) rule
  ("  " ++ (createNextLine rule prev) ++ " ")
