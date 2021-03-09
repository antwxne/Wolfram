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


firstChar :: Int -> String -> String
firstChar rule (' ':[]) = createChar rule 0
firstChar rule ('*':[]) = createChar rule 1
firstChar rule (' ':' ':_) = createChar rule 0
firstChar rule (' ':'*':_) = createChar rule 1
firstChar rule ('*':' ':_) = createChar rule 2
firstChar rule ('*':'*':_) = createChar rule 3

lastChar :: Int -> String -> String
lastChar rule (' ':' ':[]) = createChar rule 0
lastChar rule (' ':'*':[]) = createChar rule 2
lastChar rule ('*':' ':[]) = createChar rule 4
lastChar rule ('*':'*':[]) = createChar rule 6
lastChar rule x = lastChar rule (tail x)

createNextLine :: Int -> String -> String
createNextLine _ [] = []
createNextLine _ (_:[]) = []
createNextLine _ (_:_:[]) = []
createNextLine rule x = (createChar rule (getBinary x))
  ++ createNextLine rule (tail x)

displayRules :: Int -> Int -> String -> IO()
displayRules 0 _ _ = exitWith(ExitSuccess)
displayRules line rule prev =  putStrLn(prev) >>
  displayRules (line - 1) rule ((firstChar rule prev)
  ++ (createNextLine rule prev) ++ (lastChar rule prev)) 

startGen :: Int -> Int -> String -> String
startGen 0 _ prev = prev
startGen line rule prev = startGen (line - 1) rule
  ((firstChar rule prev)
  ++ (createNextLine rule prev) ++ (lastChar rule prev))
