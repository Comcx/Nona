# Nona : Lazy Programming Language with Dependent Types
![Build Status](https://github.com/Comcx/Nona/blob/master/icon/icon.svg)
![Documentation Status](https://github.com/Comcx/Nona/blob/master/icon/doc-passing.svg)
***-- Experimental Nano with dependent types***  
***-- Latest version: Nona-0.7.3***  

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
input command: `.\Nona-0.7.3.exe` or just double click the EXE file

<img width="700" height="450" src="https://github.com/Comcx/Nona/blob/master/repl-0.7.0.jpg"/>

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
  |Terms                          |Explanation|
  |-------------------------------|-----------|
  |***(0 1 2 ..)***               |with type `Int`| 
  |***(+ - * /)***                |for Integers|  
  |***"_"***                      |with type `String`|  
  |***(true false)***             |with type `Bool`|  
  |***(Int Bool String Symbol)*** |which is Set|  
  |***(, :0 :1)***                |for tuples !note deleted right now!!|  
  |***:: () list***               |for lists|
  |***print***                    |to print|
  ...  
<br><br><br>

* ### REPL use  
  
  - **Global environment:**  
    You can type in `(= <variable> <expression>)` to add variable to global environment  
    
  - **Commands:**  
    `:q` to quit repl  
    `:?` to ask for help  
    `:t` to show type info  
    `:v` to show current version  
    `:na` to load defs  
    `:no` to load *.no files  
    ...  


## Examples

```scala
(Module Test ( -- The test file


-- Ploymorphism
(= (: id (-> (: a Set) a a)) (\ (a x) x))
(= (: . (-> (: a Set) (: b Set) (: c Set) (-> b c) (-> a b) (-> a c)))
    (\ (a b c f g x) (f (g x))))
(= (: weird (-> (: x Int) (if (== x 0) Int Bool) String))
	(\ (x a) "OK"))

-- Boolean functions
(= (: not (-> Bool Bool)) (\ (b) (if b false true)))
(= (: and (-> Bool Bool Bool)) (\ (a b) (if a b false)))
(= (: or  (-> Bool Bool Bool)) (\ (a b) (if a true b)))
(= (: xor (-> Bool Bool Bool))
	(\ (a b) (if (and (or a b) (not (and a b))) true false)))

-- Recursion
(= (: fact (-> Int Int))
   (= (((: f (-> (-> Int Int) (-> Int Int)))
	      (\ (f n) (if (== n 0) 1 (* n (f (- n 1)))))))
	 (fix (-> Int Int) f)))

(= ^ (= ((PT (-> Int Int Int))
         ((: f (-> PT (-> Int Int Int)))
           (\ (f x n) (if (== n 0) 1 (* x (f x (- n 1)))))))
      (fix PT f)))))

-- (= (: foldl (-> (: a Set) (-> (: b Set) (-> (-> b (-> a b)) (-> b (List a)))))) undefined)


```

## Drawbacks

* Not support weak normal head form(WNHF), not completely lazy...
* Lack support of pattern matching for dependent types
* ...








