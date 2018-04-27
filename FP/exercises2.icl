module exercises2
import StdEnv

:: Tree a = Node a (Tree a) (Tree a)
          | Leaf
          
BST = Node 8 (Node 5 (Node 3 (Node 1 Leaf Leaf) (Node 4 Leaf Leaf)) (Node 6 Leaf (Node 7 Leaf Leaf))) (Node 10 (Node 9 Leaf Leaf) (Node 1999 Leaf Leaf))
atree = Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)

:: Point = {  x       ::  Real
            , y       ::  Real
            , visible ::  Bool
            }

:: Vector = { dx       ::  Real
            , dy       ::  Real
            }

:: Q = { nom :: Int
       , den :: Int
       } 
       
QZero :: Q       
QZero = { nom = 0, den = 1 }    
QOne :: Q
QOne = { nom = 1, den = 1 }

//////////////

// 1. Given a list of tiple tuples compute for each tuple (x,y,z) the 
// value (2x,y/2,2z+1)


// 2. Generate the first 10 element of list like: [[0],[1,1],[0,1,2,2,1,0],[0,1,2,3,3,2,1,0] ...]


// 3. Generate the first 10 powers of 2 [1,2,4,8,16 ,...]


// 4. Extract the midle digit of a number e.g.1234 -> 2, 56789 -> 7


// 5. Find the first 4 perfect numbers. The result will be: [6,28,496,8128]
//   (perfect number = the number is equal to the sum of its divisors)


// 6. Generate pairs of x and x/2 where x is even number of the [1..100] inetrval.


// 7. Given a list of sublists add the head element of a sublist to each element of
// the tail of the same sublist (MAP MUST Be USED!)


// 8. Delete the odd numbers of a given list.


// 9. Sum up the even numbers of a list (FOLDR MUST Be USED!)


// 10. Given a number n make triple tuples: 
// for n = 5 the list is [(1,5,25),(2,10,100),(3,15,225),(4,20,400),(5,625)]


//  11. Given a list of points (the type is taken from the slides)
//  keep only the points that are on one of the axis (x or y)


//  12. Filter the points of list that are visible. 


//  13. Multiply two rational numbers of type Q (defined on the slides)


//  14. Given two rational numbers return the biggest of them.


//  15. Build a search tree for sorting a list in decreased order,
//  then travers inorder the tree.
//  (numbers bigger then the root are going to left child, 
//   numbers smaller then the root are going to right child).
treesort :: ([a]-> [a]) | Eq, Ord a
treesort = collect o listtoTree

listtoTree :: [a] -> Tree a | Ord, Eq a
listtoTree [] = Leaf
listtoTree [x:xs] = insertTree x (listtoTree xs)

insertTree :: a (Tree a) -> Tree a | Ord a
insertTree e Leaf = Node e Leaf Leaf
insertTree e (Node x le ri)
   | e>x = Node x (insertTree e le) ri
   | e<=x  = Node x le (insertTree e ri)

collect :: (Tree a) -> [a] // InOrder
collect Leaf = []
collect (Node x le ri) = collect le ++ [x] ++ collect ri

Start = treesort [3, 1, 5, 9, 2, 7, 0]