module hw1
import StdEnv

Calc :: Int -> Int
Calc n 
| n <= 0 = 0
= (n * n) + Calc(n - 1)

Start = Calc 2