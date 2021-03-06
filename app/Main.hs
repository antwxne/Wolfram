module Main where

import System.Environment
import System.Exit
import CheckingArgs
import Rules

errorHandling :: Maybe Conf -> IO()
errorHandling Nothing = exitWith(ExitFailure 84)
errorHandling (Just(Conf (Just r) (Just s) (Just l) (Just w) (Just m))) =
  displayRules l r (0 + s) w (startGen s r (
    firstLine ((w `div` 2) + m) ((w `div` 2) - m)))

main :: IO ()
main = do
  args <- getArgs
  errorHandling(checkArgs (loadArgs args defaultArgs))
