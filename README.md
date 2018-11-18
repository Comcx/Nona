![Build Status](https://github.com/Comcx/Nona/blob/master/icon/icon.svg)
# Nona the Programming Language 
***-- Experimental Nano with dependent types***  
***-- Latest version: Nona-0.6***  

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

### >> Usage(Only support Win platform right now)

Jump to the directory where Nona-x.x.exe lies,  
input command: `.\Nona-0.6.exe` or just double click the EXE file

<img width="700" height="450" src="https://github.com/Comcx/Nona/blob/master/repl.jpg"/>

<br><br>
### >> Incomplete Intro  

* #### Expression :=
  - ***Variable***  
  - ***(Fun params)***  
  - ***(: Expression type)***  
  - ***(= (bindings) Expression)***  
  - ***(if Expression Expression Expression)***
  - ***(\ (params) Expression)***  
  - ***(-> (: a t) b) -- for dependent function types***  
  <br>
  
* #### Declaration :=
  - ***(= var Expression)***  
  <br>
 
* #### Preluded terms:
  - ***(0 1 2 ..) with type `Void -> Int`***  
  - ***(+ - * /) for Integers***  
  - ***"_" with type `Void -> String`***  
  - ***(true false) with type `Void -> Bool`***  
  - ***(Int Bool String) which is Set***  
  - ***(, :0 :1) for tuples***  
  - ***:: for lists***  
  ...  
<br><br><br>

### >> Example

```scala
(def ( -- The test file


-- Ploymorphism
(= (: id (-> (: a Set) (-> a a))) (\ (a x) x))
(= (: . (-> (: a Set) (-> (: b Set) (-> (: c Set) (-> (-> b c) (-> (-> a b) (-> a c))))))) 
    (\ (a b c f g x) (f (g x))))
(= (: weird (-> (: x Int) (-> (if (== x 0) Int Bool) String)))
	(\ (x a) "OK"))

-- Boolean functions
(= (: not (-> Bool Bool)) (\ (b) (if b false true)))
(= (: and (-> Bool (-> Bool Bool))) (\ (a b) (if a b false)))
(= (: or  (-> Bool (-> Bool Bool))) (\ (a b) (if a true b)))
(= (: xor (-> Bool (-> Bool Bool)))
	(\ (a b) (if (and (or a b) (not (and a b))) true false)))

-- Recursion
(= (: fact (-> Int Int))
   (= (((: f (-> (-> Int Int) (-> Int Int)))
	      (\ (f n) (if (== n 0) 1 (* n (f (- n 1)))))))
	 (fix (-> Int Int) f)))

(= ^ (= ((PT (-> Int (-> Int Int)))
         ((: f (-> PT (-> Int (-> Int Int))))
           (\ (f x n) (if (== n 0) 1 (* x (f x (- n 1)))))))
      (fix PT f)))))

-- (= (: foldl (-> (: a Set) (-> (: b Set) (-> (-> b (-> a b)) (-> b (List a)))))) undefined)


```










