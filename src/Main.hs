module Main where


import System.Environment
import Eval
import Parser



main :: IO ()
main = do
  args <- getArgs
  print "2333"


test s = eval (readExpr s) []






