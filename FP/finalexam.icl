module finalexam
import StdEnv


// For the mark 2: ex1 and ex2 and ex3 and ex4 must be done
// For a mark >2 ex.1,2,3,4 + any from ex. 5(1p), 6(1p), 7(1p), 8(1p).

// 1. Insert a given number x at the end of each sublist of a list.
// e.g. x = 100 then [[1,2], [3,4,5], [6,7]] -> [[1,2,100], [3,4,5,100], [6,7,100]]
f1 :: [[Int]] Int -> [[Int]]
f1 a n = map (\x = x ++ [n])  a

//Start = f1 [[1,2], [3,4,5], [6,7]] 100 // [[1,2,100], [3,4,5,100], [6,7,100]]


// 2. Generate elements from 1 to x first in increasing order, 
// then in decreasing order. e.g. if x=5 then the list is [1,2,3,4,5,5,4,3,2,1]
f2 :: Int -> [Int]
f2 n = [1..n] ++ reverse [1..n]

//Start = f2 5 // [1,2,3,4,5,5,4,3,2,1]


// 3. Given a list of lists, generate list of lists of pairs like in the following: 
// e.g. [[1,2,3], [4,5], [6,7,8], [9,11]] -> 
// [[(1,1),(2,2),(3,4)], [(4,1),(5,2)], [(6,1),(7,2),(8,3)], [(9,1),(11,2)]]
f3 :: [[Int]] -> [[(Int, Int)]] 
f3 a = [[(x, y) \\ x <- ai & y <- [1..] ] \\ ai <- a]

//Start = f3 [[1,2,3], [4,5], [6,7,8], [9,11]]


// 4. Arrange the elements of the sublists in increased order. 
// e.g. [[3,1,2], [0,7,5], [7,8,2], [9,3,1,11]] -> [[1,2,3],[0,5,7],[2,7,8],[1,3,9,11]]
f4 :: [[Int]] -> [[Int]]
f4 a = map sort a

//Start = f4 [[3,1,2], [0,7,5], [7,8,2], [9,3,1,11]] 


// 5. Remove the duplicates of a list that are in a sequence, i.e. one after the other
// e.g. [1,2,2,2,2,3,6,4,2,2,1,1,1,3,3,5,4,4,4,4,6] -> [1,2,3,6,4,2,1,3,5,4] 
f5 :: [Int] -> [Int]
f5 [] = []
f5 [x] = [x]
f5 [x,y : xs] 
| x == y = f5 [y:xs]
= [x : f5[y:xs]]

//Start = f5 [1,2,2,2,2,3,6,4,2,2,1,1,1,3,3,5,4,4,4,4,6]


// 6. Delete from a list the elements that are squares 
// e.g. [1,3,4,2,1,6,9,1,2,16,3] -> [3,2,6,2,3]
f6 :: [Int] -> [Int]
f6 a = filter (\x = toInt(sqrt(toReal(x))) ^ 2 <> x) a

//Start = f6 [1,3,4,2,1,6,9,1,2,16,3]


// 7. Define a type Tree for representing binary trees.
// Write a function that returns the maximum value of all the values stored 
// in a binary tree. Assume all values are positive; return -1 if the tree is empty.
:: Tree a = Node a (Tree a) (Tree a)
			| Leaf
f7 :: (Tree Int) -> Int
f7 Leaf = -1
f7 (Node x l r) = max x (max (f7 l) (f7 r))

//Start = f7 (Node 3 (Node 2 (Node 1 Leaf Leaf) Leaf) (Node 6 (Node 4 Leaf (Node 5 Leaf Leaf)) (Node 1 Leaf Leaf)))

// 8. Define a type for rational numbers, and 
// write a function to test the equality of rational numbers.
:: Q = {nom :: Int, denom :: Int}

f8 :: Q Q -> Bool
f8 a b = (a.nom * b.denom == a.denom * b.nom)

Start = f8 {nom = 12, denom = 6} {nom = 39, denom = 18}
