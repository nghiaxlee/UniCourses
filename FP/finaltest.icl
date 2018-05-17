module finaltest
import StdEnv

// For the mark 2 you must solve 4 exercises, 
// for the mark 3 you must solve 6 exercises, 
// for the mark 4 you must solve 8 exercises, 
// for the mark 5 you must solve 10 exercises.

// 1. Compute the factorial of a number x using foldr.

f1 :: Int -> Int
f1 n = foldr (*) 1 [1..n]

//Start = f1 5


// 2. Delete from a list all the numbers that are prime.

f2 :: [Int] -> [Int]
f2 a = filter (not o isPrime) a
where 
	isPrime :: Int -> Bool
	isPrime n = n <> 1 && length [x \\ x <- [2..toInt(sqrt(toReal n))] | n rem x == 0] == 0

//Start = f2 [1..30]
// 3. Given a list of sublists inverse every sublist, and the original list as well.

f3 :: [[Int]] -> [[Int]]
f3 a = reverse (map (reverse) a)

//Start = f3 [[1,2,3],[],[4,5],[6,7,8,9]]


// 4. Delete from a list all the numbers that multiples of 2 or multiples of 3.

f4 :: [Int] -> [Int]
f4 l = [ x \\ x <- l | (x rem 2 <> 0) && (x rem 3 <> 0)]

//Start = f4 [100,10,12,4,5,200,20,3,1000,10000]


// 5. Insert x after each element of a list.

f5 :: Int [Int] -> [Int]
f5 n [] = []
f5 n [x:xs] = [x, n : f5 n xs]

//Start = f5 10 [1..5]


// 6. For a given n generate a list of triple pairs with numbers for 1 to n, their cubes and triples.

f6 :: Int -> [(Int,Int,Int)] 
f6 n = [(x, x ^ 3, x * 3) \\ x <- [1..5]]

//Start = f6 5
 
::Point = {x :: Real, y :: Real, visible :: Bool}
::Vector = {dx :: Real, dy :: Real}

// 7. Given 4 points of type Point (with the real fields x and y), check if they form a rectangle.

PointEqual :: Point Point -> Bool
PointEqual a b = (a.x == b.x) && (a.y == b.y)

Midpoint :: Point Point -> Point
Midpoint a b = {x = a.x + b.x, y = a.y + b.y, visible = True}

VecEqual :: Vector Vector -> Bool
VecEqual a b = (a.dx * a.dx + a.dy * a.dy) == (b.dx * b.dx + b.dy * b.dy)

PtoV :: Point Point -> Vector
PtoV a b = {dx = b.x - a.x, dy = b.y - a.y}

CheckRec :: [Point] -> Bool
CheckRec [a, b, c, d] = (VecEqual (PtoV a b) (PtoV c d)) && (PointEqual (Midpoint a b) (Midpoint c d))

f7 :: [Point] -> Bool
f7 [a, b, c, d] = CheckRec [a, b, c, d] || CheckRec [a, c, b, d] || CheckRec [a, d, b, c]

Start = f7 [{x = 1.0, y = 1.0, visible = True}, {x = 5.0, y = 5.0, visible = True}, {x = 1.0, y = 5.0, visible = True}, {x = 5.0, y = 1.0, visible = True}]

::Tree a = Node a (Tree a) (Tree a) | Leaf

// 8. Build a search tree form a list then insert a number in the tree.

f81 :: [Int] -> Tree Int
f81 [] = Leaf
f81 [x : xs] = f82 x (f81 xs) 

f82 :: Int (Tree Int) -> Tree Int
f82 n Leaf = Node n Leaf Leaf
f82 n (Node x l r)
|n <= x = Node x (f82 n l) r
= Node x l (f82 n r)

//Start = f81 [1..10]

// 9. Is x a power of 2? 

f9 :: Int -> Bool
f9 x = 2 ^ toInt (ln(toReal x) / ln(2.0)) == x

//Start = f9 10


// 10. Add the last number of a list to every element before that.

//f10 :: [Int] -> [Int]


// 11. Generate an array that has as elements 1,2,2,3,3,3,4,4,4,4,...,10,..,10.

f11 :: {Int}
f11 = {x \\ x <- [1..10], y <- [1..x]}

//Start = f11