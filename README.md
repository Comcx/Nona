# Nona : Lazy Programming Language with Dependent Types
![Build Status](https://github.com/Comcx/Nona/blob/master/icon/icon.svg)
![Documentation Status](https://github.com/Comcx/Nona/blob/master/icon/doc-passing.svg)  
  
***Experimental Nano with dependent types***  
***Latest version: Nona-0.8.6***  

```
   __________________________
  / ___  / ___  / ___  / _  |
 / /  / / /__/ / /  / / __  |
/_/  /_/______/_/  /_/_/ |__|     by Comcx

```

***NOTE!***
**Codes in `/src` are out-of-date**  
**EXE file which is fresh can be used directly**  
<br><br>

## Getting Started!

Nona only support `Windows 64bits` platform right now.  

Jump to the directory where Nona-x.x.exe lies,  
input command: `.\Nona-0.8.6.exe` or just double click the EXE file

<img width="700" height="400" src="https://github.com/Comcx/Nona/blob/master/repl-0.8.3.jpg"/>

<br><br>
## Incomplete Intro  

* #### Expression :=
  |Format                                     | Explanation|
  |-------------------------------------------|-------------|
  |***Variable***                             | Single variable|
  |***(Fun params)***                         | Lambda application|
  |***(: Expression type)***                  | Type signature|
  |***(= (bindings) Expression)***            | Bindings|
  |***(=: (bindings) Expression)***           | Inductive families|
  |***(if Expression Expression Expression)***| Conditional|
  |***(\ (params) Expression)***              | Lambda abstraction|
  |***(-> (: a t) b)***                       | Dependent function space|
  <br>
  
* ### Declaration :=
  - ***(= var Expression)***  
  - ***(=: var Type)***
  <br>
 
* ### Preluded terms:
  |Terms                              |Explanation|
  |-----------------------------------|-----------|
  |***(0 1 2 ..)***                   |with type `Int`| 
  |***(+ - * /)***                    |for Integers|  
  |***"_"***                          |with type `String`|  
  |***(true false)***                 |with type `Bool`|  
  |***(Int Bool String Symbol IO)***  |which is Set|  
  |***(, fst snd)***                  |for tuples !note moved to lib right now!!|  
  |***:: () list***                   |for lists|
  |***print***                        |to print|
  ...  
<br><br><br>

* ### REPL use  
  
  - **Global environment:**  
    You can:  
      type in `(= <variable> <expression>)` to add variable to global environment;  
      type in `(=: <variable> <type>)` to construct new types to global environment.  
    
  - **Commands:**  
    `version` to show current version  
    `(quit)` to quit repl  
    `(help)` to ask for help  
    `(type <expr>)` to show type info  
    `(na <file>)` to load defs  
    `(no <file>)` to load *.no files  
    ...  
    
## Features  
   - Lexical scope mangement  
   - Purely functional  
   - Inductive family  
   - Dependent type system  
   - Type inference with unification  
   - Church numeral can be built(refer to lib/Prelude.na)  
   - First class record and typeclass  
   ...  
   
     
## Examples

```scala
(Module Test ( -- The test file


-- Ploymorphism & Dependent types
(= (: id (-> (: a Set) a a)) (\ (a x) x))
(= (: .  (-> (: a Set) (: b Set) (: c Set) (-> b c) (-> a b) (-> a c))) 
    (\ (a b c f g x) (f (g x))))
(= (: weird (-> (: x Int) (if (== x 0) Int Bool) String))
    (\ (x a) "OK"))


-- Boolean functions
(= not (\ b     (if b false true)))
(= and (\ (a b) (if a b false)))
(= or  (\ (a b) (if a true b)))
(= xor (\ (a b) (if (and (or a b) (not (and a b))) true false)))


-- Inductive dependent sum pair
(=: Sum (-> (: A Set) (: B (-> A Set)) Set))
(=: ,   (-> (: A Set) (: B (-> A Set)) (: a A) (: b (B a)) (Sum A B)))


))--------- end of Test ---------((



```

## Drawbacks

* Not support weak normal head form(WNHF), not completely lazy...
* Lack support of pattern matching for dependent types
* ...








