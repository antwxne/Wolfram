module Main where

import System.Environment
import System.Exit
import CheckingArgs

errorHandling :: Maybe Conf -> IO()
errorHandling Nothing = exitWith(ExitFailure 84)
errorHandling flags = print flags

main :: IO ()
main = do
  args <- getArgs
  errorHandling(checkArgs (loadArgs args defaultArgs))
