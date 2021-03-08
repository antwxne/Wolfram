module Main where

import System.Environment
import System.Exit
import CheckingArgs

main :: IO ()
main = do
  args <- getArgs
  let caca = checkArgs (loadArgs args defaultArgs)
  print caca
