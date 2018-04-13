module ex8
import StdEnv

// 1. Is x a power of 10?
iprod :: Int -> Bool 
iprod x 
| x == 1 = True
| x rem 10 == 0 = iprod (x / 10)
= False

//Start = iprod 123 // False

// 2. Write a function to compute 1+2+3+4+5+6+...+n
isum :: Int -> Int
isum a = (a * (a + 1)) / 2

//Start = isum 10 // False

// 3. Compute the number of sublists in a list
nrlist :: [[Int]] -> Int
nrlist a = length a

//Start = nrlist [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

// 4. Compute the number of all the elements in a list
nrelist :: [[Int]] -> Int
//nrelist a = foldr (\x y = length x + y) 0 a
nrelist a = length (flatten a)

//Start = nrelist [[1, 2, 3], [3, 4], [5, 7, 8, 9]]

// 5. Keep the first n and the last n elements of a list
cut :: [Int] Int -> [Int]
cut a n 
| y <= n = []
= take n a ++ drop (y - n) a
where y = length a

//Start = cut [1, 2, 3, 4, 5, 6, 7, 8, 9] 3

// 6. Delete the 0 element from a list
delzero :: [Int] -> [Int]
delzero a = filter ((<>)0) a

//Start = delzero [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 7. compute  1*2 + 2*3 + ... + n*n+1 
sums :: Int -> Int
sums n = foldr (+) 0 (map (\x = x * (x + 1)) [1.. n])

//Start = sums 5

// 8. write a function duplicates which checks if there are neighbour duplicates in a list
duplic :: [Int] -> Bool
duplic [] = False
duplic [a] = False
duplic [a, b : f] = (a == b) || duplic [b : f]

//Start = duplic [1, 1]
//duplic [2]
//duplic [1, 2, 3, 4, 5, 6, 7, 8, 9]
//duplic [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 9. write a function that removes neighbour duplicates in a list
duplicrem :: [Int] -> [Int] 
duplicrem [] = []
duplicrem [a] = [a]
duplicrem [a, b : f] 
| (a == b) = duplicrem [b : f]
= [a : duplicrem [b : f]]

//Start = duplicrem [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 10. filter the even elements of a list
g :: [Int] -> [Int]
g a = filter (\x = x rem 2 == 0) a

//Start = g [1, 0, 5, 0, 0, 6, 7, 5, 0, 0, 0, 8, 0, 5, 0, 0, 0] 

// 11. compute the half of the elements of a list using map
halfs :: [Int] -> [Int]
halfs a = map (\x = x / 2) a

//Start = halfs [1, 2, 3, 4, 5, 6, 7, 8, 9]

// 12. transform the sub-sub lists into one list of sublists
f :: [[[Int]]] -> [[Int]]
f x = flatten x

//Start = f [[[1,2,3], [3,4,5]], [[1,2,3], [3,4,5], [7,8,9]]] 
// result : [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]

// 13. delete the last element of the sublists
dellast :: [[Int]] -> [[Int]] 
dellast a = map (init) a

//Start = dellast [[1,2,3],[3,4,5],[1,2,3],[3,4,5],[7,8,9]]

// 14.  generate the following list [(1,1),(2,2),(3,3),(4,4),(5,5)]
l1 :: [(Int, Int)]
l1 = [(x, x) \\ x <- [1..5]]

//Start = l1

// 15. generate [(1,2,3),(2,4,6),(3,6,9),(4,8,12),(5,10,15)]
l2 :: [(Int, Int, Int)]
l2 = [(x, x * 2, x * 3) \\ x <- [1..5]]

Start = l2