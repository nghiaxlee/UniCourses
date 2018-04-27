module ex9
import StdEnv


qsort :: [a] -> [a] | Ord a
qsort [] = []
qsort [c : xs] = qsort [x \\ x <- xs | x <  c] ++ [c] ++
                 qsort [x \\ x <- xs | x >= c]

// Start = qsort [2,1,5,3,6,9,0,1] // [0,1,1,2,3,5,6,9]

// sort is the built in operation for sorting

// Start = sort [3,1,4,2,0] // [0,1,2,3,4]

// inserting in already sorted list
Insert :: a [a] -> [a] | Ord a
Insert e [] = [e]
Insert e [x : xs]
| e <= x = [e , x : xs]
| otherwise = [x : Insert e xs]

// Start = Insert 5 [2, 4 .. 10] // [2,4,5,6,8,10]

mysort :: [a] -> [a] | Ord a
mysort [] = []
mysort [a:x] = Insert a (mysort x)

// Start = mysort [3,1,4,2,0] // [0,1,2,3,4]

// Start = Insert 3 (Insert 1 (Insert 4 (Insert 2 (Insert 0 [] ))))

merge1 :: [a] [a] -> [a] | Ord a
merge1 [] ys = ys
merge1 xs [] = xs
merge1 [x : xs] [y : ys]
| x <= y = [x : merge1 xs [y : ys]]
| otherwise = [y : merge1 [x : xs] ys]

// Start = merge1 [2,5,7] [1,5,6,8] // [1,2,5,5,6,7,8]
// Start = merge1 [] [1,2,3] // [1,2,3]
// Start = merge1 [1,2,10] [] // [1,2,10]
// Start = merge1 [2,1] [4,1] // [2,1,4,1]
// Start = merge1 [1,2] [1,4] // [1,1,2,4]

msort :: [a] -> [a] | Ord a
msort xs
| len <= 1 = xs
| otherwise = merge (msort ys) (msort zs)
where
   ys = take half xs
   zs = drop half xs
   half = len / 2
   len = length xs

// Start = msort [2,9,5,1,3,8] // [1,2,3,5,8,9]

:: Person = { name :: String
            , birthdate :: (Int,Int,Int)
            , fpprogramer :: Bool
            }

IsfpUser :: Person -> String
IsfpUser {fpprogramer = True} = "Yes"
IsfpUser _                    = "No"

// Start = IsfpUser { name = "Me"
//                 , birthdate = (1,1,1999)
//                 , fpprogramer = True}    // "Yes"

MyArray :: {Int}
MyArray = {1,3,5,7,9}

// Start = MyArray.[2] // 5

MapArray1 f a = {f e \\ e <-: a}

// Start :: {Int}
// Start = MapArray1 inc MyArray

:: Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

:: Tree a = Node a (Tree a) (Tree a)
          | Leaf

sizeT :: (Tree a) -> Int
sizeT Leaf = 0
sizeT (Node x l r) = 1 + sizeT l + sizeT r

aTree :: Tree Int

aTree = Node 4 (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) Leaf

//Start = aTree

// Start = sizeT aTree     // 4


// Define a function CountOccurrences that counts the number of times a given element is
// occurring in a given list.

CountOccurrences :: a [a] -> Int | == a
CountOccurrences a [x : xs] = f a [x : xs] 0
where
      f a [] i = i
      f a [x : xs] i
        | a == x = f a xs i+1
                 = f a xs i

// Start = CountOccurrences 2 [2, 3, 4, 2, 2, 4, 2, 1] // 4


// Exercises

// 1. Create arrays using comprehensions for the followings:

// - powers of 10 from 1st to the 10th

//Start :: {Int}
//Start = {10^x \\ x <- [1..10]}

// - {(0,0),(1,1),..., (10,10)}

//Start :: {(Int, Int)}
//Start = {(x, x) \\ x <- [0..10]}

// - one number at its halfs until is 0 e.g. {100, 50, 25, 12, 6, 3, 1, 0} 
F :: Int -> {Int}
F x = {x / (2 ^ a) \\ a <- [0..lg1 x]}
where
	lg x = toInt(ln (toReal x) / ln 2.0)
	lg1 x
	| 2 ^ (lg x) <= x = (lg x) + 1
	= lg x

//Start = F 255


// 2. Create a tree and write the elements of it in 3 ways: inorder, preorder, postorder
BST :: Tree Int
BST = Node 8 (Node 5 (Node 3 (Node 1 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 6 Leaf (Node 7 Leaf Leaf))) (Node 10 (Node 9 Leaf Leaf) (Node 1999 Leaf Leaf))

//Start = BST

// 3. Write another sort algorithm for sorting a list
Process :: [Int] -> [Int]
Process [] = []
Process [x] = [x]
Process [x, y : xs]
| x > y = [y : Process [x : xs]]
= [x : Process [y : xs]]

Bsort :: [Int] Int -> [Int]
Bsort a i
| i == length a = a
= Bsort (Process a) (i + 1)

BBsort :: [Int] -> [Int]
BBsort a = Bsort a 0
//Start = BBsort [1, 10, 2, 9, 3, 8, 4, 7, 6, 5]
