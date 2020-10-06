-- |
-- Module      :  Recursion
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Examples from chapter 6: Recursive functions
-- 
-- Note to run tests:
--
-- @
--      $ cabal new-run spec
-- @
--
-- or in @ghci@:
--
-- @
--      $ cabal new-repl spec
--      ghci> hspec Recursion.hs
-- @

module Recursion (
                 -- *6.1 Basic concepts, pp. 59, 60
                   fac, op
                 -- *6.2 Recursion on lists, pp. 61-63
                 , product, length, reverse, op2, insert, isort
                 -- *6.3 Multiple arguments, pp. 63, 64
                 , zip, drop
                 -- *6.4 Multiple recursion, pp. 64, 65
                 , fib, qsort
                 -- *6.5 Mutual recursion, pp. 65, 66
                 , even, odd, evens, odds
                 -- *6.6 Advice on recursion, pp. 66-71
                 -- $p6
                 , product', drop', init
) where


import Prelude hiding (product, length, reverse, zip, drop, even, odd, init)

-- | factorial of @n@
fac :: Int -> Int
fac 0 = 1
fac n = n * fac (n-1)

-- |op function represent the operator '(*)'. Although it could
-- be defined, it is not convenient to do it.
op :: Int -> Int -> Int 
m `op` 0 = 0
m `op` n = m + (m `op` (n-1))

-- |Return the product of each elements on a list
product :: Num a => [a] -> a
product [] = 1
product (n:ns) = n * product ns

-- |`length` function defined recursively. Returns the length
-- of a list.
length :: [a] -> Int
length []     = 0
length (_:xs) = 1 + length xs

-- |Return the list in reverse order
reverse :: [a] -> [a]
reverse []     = []
reverse (x:xs) = reverse xs ++ [x]

-- |op2 is the same as '++' operator. Concatenates two list
op2 :: [a] -> [a] -> [a]
[]     `op2` ys = ys
(x:xs) `op2` ys = x : (xs `op2` ys)

-- |Insert a new element into a sorted list to give another sorted list
insert :: Ord a => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
  | x <= y    = x : y : ys
  | otherwise = y : insert x ys

-- |Returns a sorted list
isort :: Ord a => [a] -> [a]
isort []       = []
isort (x:xs)   = insert x (isort xs)

-- |Take two lists and return a list mixing elements of one list and another
zip :: [a] -> [b] -> [(a,b)]
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x,y) : zip xs ys

-- |Return the suffix of @xs@ after removing the first @n@ elements,
-- or @[]@ if @n > length xs@
drop :: Integral b => b -> [a] -> [a]
drop 0 xs = xs
drop _ [] = []
drop n (_:xs) = drop (n-1) xs

-- |Return the @n@th element of /Fibonacci/ sequence
fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-2) + fib (n-1)

-- |Sort a list using /quick sort/ method
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a <= x]
    larger  = [b | b <- xs, b > x]

-- |Decides if a number is even
even :: Int -> Bool
even 0 = True
even n = odd (n-1)

-- |Decides if a number is odd
odd :: Int -> Bool
odd 0 = False
odd n = even (n-1)

-- |Select the elements with position even in a list
evens :: [a] -> [a]
evens     [] = []
evens (x:xs) = x : odds xs

-- |Select the elements with position odd in a list
odds :: [a] -> [a]
odds []     = []
odds (_:xs) = evens xs

-- $p6
-- In the book, the author uses a method with five
-- steps. I only saw the final step.

-- |Calculates the product of all elements in a list.
product' :: Num a => [a] -> a
product' = foldr (*) 1

-- |Return the suffix of a list after remove
-- the @n@ first elements.
drop' :: Integral n => n -> [b] -> [b] 
drop' 0 xs     = xs
drop' _ []     = []
drop' n (x:xs) = drop' (n-1) xs

-- |Return all element of a list except the last one.
init :: [a] -> [a]
init [_]    = []
init (x:xs) = x : init xs
