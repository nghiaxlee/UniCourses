module ex21

import StdEnv


// 1. Reverse every sublist of a list
revsub :: [[Int]] ->  [[Int]]
revsub [] = []
revsub [x : rest] = [reverse x : revsub rest]

//Start = revsub [[1,2,3],[5,6],[],[7,8,9,10]]


// 2. Generate a list with every fifth element form 0 to 500.


//Start = [0, 5..500]


// 3. Delete the first and the last element of a list.
del_firstlast :: [Int] -> [Int]
del_firstlast a = tl (init a)

//Start = del_firstlast [1..10]
//Start = del_firstlast []
//Start = del_firstlast [1]


// 4. Compute for a given positive n the sum of 2i(2i+1), for i from 1 to n. E.g. for n=3 the sum is 68.
f :: Int -> Int
f n 
| n < 0 = abort "n should be positive"
| n == 0 = 0
= 2 * n * (2 * n + 1) + f (n - 1)

//Start = f 3


// 5. Cut a list in two parts at the middle. E.g. cut [1..10] -> [[1,2,3,4,5],[6,7,8,9,10]]
// and for cut [1..11] the result is [[1,2,3,4,5],[6,7,8,9,10,11]].
cut :: [Int] -> [[Int]]
cut [x] = [[x],[]]
cut a = [take (length a / 2) a] ++ [drop (length a / 2) a]

//Start = cut [1..10]
//Start = cut [1..11]
//Start = cut []
//Start = cut [1]


// 6. Generate a list with every 500th element form -10000 to 10000.


//Start = [-10000,-9500..100000]


// 7. Keep the last elements of the sublists of a list in one list (the sublists are not empty).
// [[1,2,3],[5,6],[1],[7,8,9,10]] -> [3,6,1,10]
lasts :: [[Int]] -> [Int]
lasts [] = []
lasts [x : rest] = [last x] ++ lasts rest

//Start = lasts [[1,2,3],[5,6],[1],[7,8,9,10]]


// 8. Extract the middle element of a non-empty list. E.g. for [1..5] is 3, for [1..4] is 3.
middle :: [Int] -> Int
//middle a = hd (drop (length a / 2) a)
middle a = a !! half
where half = (length a) / 2

//Start = middle [1..5] 
//Start = middle [1, 3, 4, 5, 6, 7] 
//Start = middle [1]


// 9. Instert 0 in front of every sublist of a list.
// E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is [[0,1,2,3],[0,5,6],[0],[0,7,8,9,10]]
ins0 :: [[Int]] -> [[Int]]
ins0 [] = []
//ins0 [x : rest] = [[0] ++ x] ++ ins0 rest
//<=> 
//ins0 [x : rest] = [[0] ++ x : ins 0 rest]
//<=>
//ins0 [x : rest] = [flatten [[0],x] : rest]
//<=>
ins0 [x : rest] = [ [0:x] : ins0 rest]

//Start = ins0 [[1,2,3],[5,6],[],[7,8,9,10]]


// 10. Delete the last element of each sublist of a list.
// E.g. for [[1,2,3],[5,6],[],[7,8,9,10]] the result is [[1,2],[5],[],[7,8,9]]
lastdel :: [[Int]] -> [[Int]]
lastdel [] = []
lastdel [x : rest] = [init x] ++ lastdel rest

//Start = lastdel [[1,2,3],[5,6],[],[7,8,9,10]]


// 11. Compute the sum 1+ 2*2+ 3*3*3+ 4*4*4*4+ 5*5*5*5*5+ ...+n*n*n*...*n 
// where n is a positive number.
my_pow :: Int Int -> Int // a ^ k
my_pow a k 
| k == 1 = a
= my_pow a (k - 1) * a

sumpowers :: Int -> Int
sumpowers n 
| n < 0 = abort "n should be positive"
| n == 0 = 0
= my_pow n n + sumpowers (n - 1)

//Start = sumpowers 3
//Start = sumpowers 5
//Start = sumpowers 0