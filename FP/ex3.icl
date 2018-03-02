module ex3

import StdEnv
 
// 1. Compute the product of the elements of a list
//product :: [Int] -> Int
product [] = 1
product [x : rest] = x * product rest

// Start = product [1..5] // 120

// 2. delete the elements equal to 5
not_five :: [Int] -> [Int]
not_five [] = []
not_five [5 : rest] = not_five rest
not_five [x : rest] = [x : not_five rest]

//Start = not_five [5,4,5,4,3]  // [4,4,3]

// 3. Delete an element n from a list
del :: Int [Int] -> [Int]
del n [] = []
del n [x : rest] 
| n == x = del n rest
= [x : del n rest]

//Start = del 5 [1, 5, 6, 7, 5, 8, 5] // [1, 6, 7, 8]


// 4. write a funtion with the patterns depending on the parameter:
// if the param is [] then is equal to 20, if is a two element list starting with 4 then is 30
// if is a two element list ending with 5 then is 40, in all other cases is 50, 
// the order of the patterns is important
gp :: [Int] -> Int
gp [] = 20
gp [4, _] = 30
gp [_, 5] = 40
gp x = 50

//Start = gp [3, 4] // 30


// 5. write a funtion which returns true if a is divisible by b
div_by :: Int Int -> Bool
div_by a b = a rem b == 0

//Start = div_by 4 16      // True


// 6. write a funtion which returns true if a is divisible by b or vice versa
div_any :: Int Int -> Bool
div_any a b = (a rem b) * (b rem a) == 0
// || && 

//Start = div_any 4 16     // True


// 7. sumsq n returns 1*1 + 2*2 + ... + n*n - with a pattern for 0
sumsq :: Int -> Int
sumsq n
| n == 0 = 0
= n ^ 2 + sumsq (n - 1)

//Start = sumsq 3 // 14


// version 2. - without pattern for 0
//sums :: Int -> Int

// Start = sums 3
  

// 8. check if a number is palindrom e.g.12321
//p :: Int -> [Int]

//digits :: Int [Int] -> [Int]

//pali :: Int -> Bool

//Start = pali 12321 // True
 

// 9. Computes the nth Fibonacci number - try more versions
fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2)

// Start = fib 5
fib1 :: Int -> (Int, Int) // (a, b) = tuple
fib1 0 = (1,1)
fib1 1 = (1,1)
fib1 n = (b,a+b)
where
	(a,b) = fib1 (n-1)

// Start = fib1 8
fib2 :: Int Int Int -> Int
fib2 a b 0 = a
fib2 a b c = fib2 b (a+b) (c-1)

// Start = fib2 1 1 10

fib3 :: Int -> Int
fib3 n = fibAux n 1 1

fibAux 0 a b         = a
fibAux i a b | i > 0 = fibAux (i-1) b (a+b)

// Start = fib3 8


// 10. exists x xs checks whether x exists as an element in the list xs (or is ||, and is &&)
exists :: Int [Int] -> Bool
//exists x xs = isMember x xs
exists n [] = False
exists n [x : xs] = (x == n) || (exists n xs)

//Start = exists 5 [1..3]


// 11. write the function duplicates which checks if there are duplicates in the list xs
//duplicates :: [Int] -> Bool


// Start = duplicates [1, 2, 1, 1, 2, 3, 2, 1, 3] // True


// 12. remove x xs removes x from the list xs
//remove :: Int [Int] -> [Int]


// 13. removeDuplicates l returns the list l with all duplicate elements removed
//removeDuplicates :: [Int] -> [Int]

// Start = removeDuplicates [1, 2, 1, 2, 3, 1, 2, 4, 2, 3]


// 14. filter the elements that are satisfying a condition
//filter` :: (Int -> Bool) [Int] -> [Int]


// Start = filter` ((<>) 5) [1, 5, 6, 7, 5, 8, 5]  // [1, 6, 7, 8] 