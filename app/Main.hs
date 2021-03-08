module Main where

import System.Environment
import Text.Read
import System.Exit
import Lib

data Conf = Conf {
  rule :: Maybe Int,
  start :: Maybe Int,
  line :: Maybe Int,
  window :: Maybe Int,
  move :: Maybe Int
} deriving(Show)

defaultArgs :: Conf
defaultArgs =  Conf {
  rule = Nothing,
  start = Just(0),
  line = Just(-1),
  window = Just(80),
  move = Just(0)
}
  
loadArgs :: [String] -> Conf -> Maybe Conf
loadArgs [] flags = Just flags
loadArgs (_:[]) _ = Nothing
loadArgs (x:xs:xt) (Conf r s l w m)
  | x == "--rule" = loadArgs xt (Conf (readMaybe xs) s l w m)
  | x == "--start" = loadArgs xt (Conf r (readMaybe xs) l w m)
  | x == "--line" = loadArgs xt (Conf r s (readMaybe xs) w m)
  | x == "--window" = loadArgs xt (Conf r s l (readMaybe xs) m)
  | x == "--move" = loadArgs xt (Conf r s l w (readMaybe xs))
  | otherwise = Nothing

checkArgs :: Maybe Conf -> Bool
checkArgs Nothing = False
checkArgs (Just(Conf r s l w m))
  | r == Nothing = False
  | s == Nothing = False
  | l == Nothing = False
  | w == Nothing = False
  | m == Nothing = False
  | otherwise = True
    

main :: IO ()
main = do
  args <- getArgs
  let caca = checkArgs (loadArgs args defaultArgs)
  print caca
