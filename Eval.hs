module Eval where


import Nona




lookup' :: String -> Env -> Maybe SExp
lookup' s [] = Nothing
lookup' s (x:xs) = if (fst x) == s then Just (snd x)
  else lookup s xs

envAdd :: String -> SExp -> Env -> Env
envAdd s exp env = (s, exp) : env


eval :: SExp -> Env -> SExp
eval exp env = case exp of

  Void -> Void
  Unit -> Unit
  Integer n -> Integer n
  Bool b -> Bool b
  Char c -> Char c
  Error msg info -> Error msg info
  Var s -> case lookup' s env of
    Nothing -> Error "No such variable!" (Var s)
    Just x -> x

  Closure s e en -> Closure s e en

  L (L (Var ":=") (L (Var s) v)) e -> eval e (envAdd s v env)
  L (L (L (Var "if") pred) e0) e1 -> case eval pred env of
    Bool True -> eval e0 env
    Bool False -> eval e1 env
    otherwise -> Error "Type error" pred

  L (L (Var "+") a) b -> case ((eval a env), (eval b env)) of
    (Integer x, Integer y) -> Integer (x + y)
    otherwise -> Error "+?" (L (eval a env) (eval b env))
  L (L (Var "-") a) b -> case ((eval a env), (eval b env)) of
    (Integer x, Integer y) -> Integer (x - y)
    otherwise -> Error "-?" (L (eval a env) (eval b env))
  L (L (Var "*") a) b -> case ((eval a env), (eval b env)) of
    (Integer x, Integer y) -> Integer (x * y)
    otherwise -> Error "*?" (L (eval a env) (eval b env))
  L (L (Var "/") a) b -> case ((eval a env), (eval b env)) of
    (Integer x, Integer y) -> Integer (div x  y)
    otherwise -> Error "/?" (L (eval a env) (eval b env))

  L (L (Var "\\") (Var s)) e -> Closure s e env



  L op v -> 
    let v0 = eval op env
        v1 = eval v env
    in case v0 of Closure s e en -> eval e (envAdd s v1 en)
                  otherwise -> Error "Apply error" v0


  --otherwise -> Error "What's this?" otherwise















