module ex7
import StdEnv

// 1. Generate 100 even numbers using list comprehensions
l1 :: [Int]
l1 = [x \\ x <- [1..200] | isEven x]

//Start = l1


// 2. Generate teh following list [4, 16, 36, 64, 100, 144, 196, 256, 324, 400]
l2 :: [Int]
l2 = [x * x \\ x <- [1..20] | isEven x]

//Start = l2


// 3. List powers of 2 from 1 to 10.
//hint: use x^y (x at power y)
l3 :: [Int]
l3 = [2 ^ x \\ x <- [1..10]]

//Start = l3


// 4. List the divisors of 90.
l4 :: [Int]
l4 = [x \\ x <- [1..90] | 90 rem x == 0]

//Start = l4


// 5. List “dominoes”: [(0,0),(0,1),(1,1),(0,2),(1,2),(2,2),...,(9,9)]
// Domino (1,0) is not in the list because it is already in it as (0,1).
l5 :: [(Int, Int)]
l5 = [(y, x) \\ x <- [0..9], y <- [0..x]]

//Start = l5


// 6. Construct the list [(1,'a'),(2,'b'),…(…,'z')]
l6 :: [(Int, Char)]
l6 = [(x, y) \\ x <- [1..] & y <- ['a'..'z']]

//Start = l6


// 7. Generate a list of length 10 whose elements are False, True, False, True, … (alternating)
l7 :: [Bool]
l7 = [x rem 2 == 0 \\ x <- [1..10]]

//Start = l7


// 8. Is 123457 a prime number?
l8 :: Bool
l8 = (length [x \\ x <- [2..toInt (sqrt 123457.0)] | 123457 rem x == 0]) == 0

//Start = l8


// 9. Generate the list [(0,10),(1,9),…,(10,0)].
l9 :: [(Int, Int)]
l9 = [(x, 10 - x) \\ x <- [0..10]]

//Start = l9


// 10. Generate a list that contains all (hour, minute) pairs in a day.
l10 :: [(Int, Int)]
l10 = [(x, y) \\ x <- [0..23], y <- [0..59]]

//Start = l10


// 11. (bonus point) Generate a list that contains all (month, day) pairs in a 365-day 
//1 3 5 7 8 10 12
isValid :: (Int, Int) -> Bool
isValid (x, y) 
|y == 31 = isMember x [1, 3, 5, 7, 8, 10, 12] 
|y > 28 = x <> 2
= True

l11 :: [(Int, Int)]
l11 = [(x, y) \\ x <- [1..12], y <- [1.. 31] | isValid (x, y)]

Start = l11