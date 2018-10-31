module Parser where



import Nona
import Control.Monad
import Text.ParserCombinators.Parsec hiding (spaces)


symbol :: Parser Char
symbol = oneOf "!$%&|*+-/:<=?>@^_~#[]<>\\;,.{}'"

spaces :: Parser ()
spaces = skipMany1 space




readExpr :: String -> SExpr
readExpr input = case parse parseExper "Nona" input of
  Left err -> Error (show err) Void
  Right val -> val


parseExper :: Parser SExpr
parseExper = parseVar
         <|> parseString
         <|> parseNumber
         <|> do char '('
                x <- try parseList
                char ')'
                return x



parseString :: Parser SExpr
parseString = do 
  char '"'
  x <- many (noneOf "\"")
  char '"'
  return (String x)


parseVar :: Parser SExpr
parseVar = do
  first <- letter <|> symbol
  rest <- many (letter <|> digit <|> symbol)
  let var = [first] ++ rest
  return $ case var of
    "void" -> Void
    "unit" -> Unit
    "true" -> Bool True
    "false" -> Bool False
    otherwise -> Var var


parseNumber :: Parser SExpr
parseNumber = liftM (Integer . read) $ many1 digit


parseList :: Parser SExpr
parseList = liftM L $ sepBy parseExper spaces
{-
parseList = do
  a <- parseExper
  spaces
  b <- parseExper
  return $ L a b
-}

