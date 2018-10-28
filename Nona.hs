module Nona where


import Data.List
import Data.Char
import Data.Ord
import Data.Kind
import System.IO
import System.Random
import Control.Monad


data SExp = Unit | Void
          | Integer Integer
          | Bool Bool
          | Char Char
          | Var String
          | Closure String SExp Env
          | L SExp SExp
          | Error String SExp
          deriving (Show)

type Env = [(String, SExp)]




