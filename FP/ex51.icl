module ex51
import StdEnv

// Exercises

// 1. Write a recursive function that computes the n-th multiple of an x.
f1 :: Int Int -> Int
f1 x 0 = 0
f1 x n = x + f1 x (n - 1)

//Start = f1 10 11

// 2. Add 2 to every odd number of a list, and subtract 2 from every even number.
f2 :: [Int] -> [[Int]]
f2 a = [l1, l2]
where 
	l1 = map (\x = x + 2) (filter isOdd a)
	l2 = map (\x = x - 2) (filter isEven a)

//Start = f2 [1..10]

// 3. Compute the triple of the negative elements of a list up to the first positive number.
f3 :: [Int] -> [Int]
f3 a = map ((*)3) (takeWhile ((>)0) a)

//Start = f3 ([-5, -4..0] ++ [1..5] ++ [-5, -4..0])

// 4. Write a function that keeps the non-zero elements of a list and then multiply by 2 every element.
f4 :: [Int] -> [Int]
f4 a = map ((*)2) (filter ((<>)0) a)

//Start = f4 [10, 9.. -10]


// 5. Write a function for the square, the cube, and so on up to the n-th power of a number,
// so that increasing powers of a number are obtained in a list.
f5 :: Int Int -> [Int]
f5 0 x = [1]
f5 n x = (f5 (n - 1) x) ++ [x ^ n]

//Start = f5 10 3

// 6. Replicate n>0 times a list.
f6 :: Int [Int] -> [[Int]]
f6 0 a = []
f6 n a = [a : f6 (n - 1) a]

//Start = f6 3 [1..5]

// 7. Insert 0 at the middle of each sublist.
Insert0 :: [Int] -> [Int]
Insert0 a = (take (length a / 2) a) ++ [0] ++ (drop (length a / 2) a)

f7 :: [[Int]] -> [[Int]]
f7 a = map (Insert0) a

//Start = f7 [[1..10], [1..5], [-10..1], [], [1]]

// 8. Extract the elements smaller then the head element of a list.
f8 :: [Int] -> [Int]
f8 a = filter ((>)(hd a)) a

//Start = f8 [5,5,5,4,3,2,1,10]

// 9. Eliminate in a list the sublists that are longer then 10.
f9 :: [[Int]] -> [[Int]]
f9 a = filter (\x = length x <= 10) a

//Start = f9 [[1..10], [1..20], [1..3], [1..30], [1..100]]

// 10. Compute the greatest common divisor in a recursive function.
f10 :: Int Int -> Int
f10 a b
| a < 0 = f10 (~a) b
| b < 0 = f10 a (~b)
| b == 0 = a
= f10 b (a rem b)

//Start = f10 -4 -16

// 11. Compute the Euler number aproximation in n steps: e = 1/0! + 1/1! + 1/2! + 1/3! + ... 
F :: Real Int Int -> Real
F prev i n 
| i == n = 0.0
= prev / toReal(i) + F (prev / toReal(i)) (i + 1) n

f11 :: Int -> Real
f11 n = 1.0 + F 1.0 1 n

Start = f11 1000