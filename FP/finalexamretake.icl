module finalexamretake
import StdEnv


// For the mark 2: ex1 and ex2 and ex3 and ex4 must be done
// For a mark >2 ex.1,2,3,4 + any from ex. 5(1p), 6(1p), 7(1p), 8(1p).

// 1. Sum the pairs into a list
// e.g. [(1,2), (3,4), (5,6)]] -> [3,7,11]
f1 :: [(Int,Int)] -> [Int]
f1 a = [fst x + snd x \\ x <- a] 

//Start = f1 [(1,2), (3,4), (5,6)]


// 2. Generate the first 10 multiples of a number.
// e.g. x=5 then the list is [5,10,15,20,25,30,35,40,45,50]
f2 :: Int -> [Int]
f2 n = [x * n \\ x <- [1..10]]

//Start = f2 5


// 3. Given a list of lists, generate list of lists of pairs like in the following: 
// e.g. [[1,2,3], [4,5], [6,7,8], [9,11,1,1,1]] -> 
// [[(1,1),(2,1),(3,1)], [(4,2),(5,2)], [(6,3),(7,3),(8,3)], [(9,4),(11,4),(1,4),(1,4),(1,4)]]
f3 :: [[Int]] -> [[(Int, Int)]] 
f3 a = [[(x, y) \\ x <- ai] \\ ai <- a & y <- [1..length a]]

//Start = f3 [[1,2,3], [4,5], [6,7,8], [9,11,1,1,1]]


// 4. Sum up the elements of the sublists and arrange them im decreased order. 
// e.g. [[1,1,2], [10,7,5], [3,1,2], [9,3,1,1]] -> [22,14,6,4]
f4 :: [[Int]] -> [Int]
f4 a = reverse (sort [sum x \\ x <- a])

//Start = f4 [[1,1,2], [10,7,5], [3,1,2], [9,3,1,1]]


// 5. Remove the duplicates of a list that are in a sequence and replace it with 0.
// e.g. [1,2,2,2,2,3,6,4,2,2,1,1,1,3,3,5,4,4,4,4,6] -> [1,0,3,6,4,0,0,0,5,0,6] 
elim :: Int [Int] -> [Int]
elim x [] = []
elim x [ai : a] 
| x == ai = elim x a
= [ai : a]

f5 :: [Int] -> [Int]
f5 [] = []
f5 [x] = [x]
f5 [x,y:xs]
| x == y = [0: f5 (elim x xs)]
= [x : f5 [y:xs]]

Start = f5 [1,2,2,2,2,3,6,4,2,2,1,1,1,3,3,5,4,4,4,4,6]


// 6. Delete from a list the elements that are not squares.
// e.g. [1,30,4,25,6,36,2,3,16] -> [1,4,25,36,16]
f6 :: [Int] -> [Int]
f6 a = [x \\ x <- a | toInt(sqrt(toReal(x))) ^ 2 == x]

//Start = f6 [1,30,4,25,6,36,2,3,16]

::Tree a = Node a (Tree a) (Tree a) | Leaf
::Q = {nom :: Int, denom :: Int}

// 7. Compute the sum of the numbers placed in the nodes of a tree.
sumtree :: (Tree Int) -> Int
sumtree Leaf = 0
sumtree (Node x l r) = x + sumtree l + sumtree r

//Start = sumtree (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 6 (Node 4 Leaf (Node 5 Leaf Leaf)) (Node 1 Leaf Leaf)))

// 8. Define a record type for rational numbers, and add two rational numbers.
sumq :: Q Q -> Q
sumq a b = {nom = a.nom * b.denom + a.denom * b.nom, denom = a.denom * b.denom}

simplify :: Q -> Q
simplify a
| a.denom == 0 = abort "denominator is 0"
| a.denom < 0 = {nom = ~a.nom / g, denom = ~a.denom / g}
= {nom = a.nom / g, denom = a.denom / g}
where
	g = gcd a.nom a.denom

//Start = simplify (sumq {nom = 3, denom = 4} {nom = 3, denom = -3})
