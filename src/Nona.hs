module Nona where


import Data.List
import Data.Char
import Data.Ord
import Data.Kind
import System.IO
import System.Random

import Data.Functor
import Data.Bifunctor
import Control.Monad



data SExpr = Unit | Void
           | Integer Integer
           | Bool Bool
           | Char Char
           | String String
           | Var String
           | Closure String SExpr Env
           | L [SExpr]
           | Error String SExpr
           deriving (Eq, Ord)

type Env = [(String, SExpr)]



instance Show SExpr where
  show expr = case expr of
    Void -> ""
    Unit -> "Unit"
    Integer i -> show i
    Bool b -> show b
    Char c -> [c]
    String s -> "'" ++ s ++ "'"
    Var s -> s
    Closure s exp env -> "(-> " ++ (show s) ++ " " ++ (show exp) ++ ")"
    L es -> "(" ++ (unwords . map show $ es) ++ ")"
    Error s exp -> "(error " ++ s ++ " " ++ (show exp) ++ ")"





