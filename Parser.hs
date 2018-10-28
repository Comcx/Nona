module Parser where



import Nona
import Text.ParserCombinators.Parsec



symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=?>@^_~#"

readExpr :: String -> String










