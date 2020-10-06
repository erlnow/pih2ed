-- |
-- Module      :  RecursionExercises
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Exercises from chapter 6: Recursive functions.
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
--      ghci> hspec RecursionExercises.hs
-- @

module RecursionExercises (
                          -- **Exercise 1, p. 71
                          -- $ex1
                            fac
                          -- **Exercise 2, p. 71
                          -- $ex2
                          , sumdown
                          -- **Exercise 3, p. 71
                          -- $ex3
                          , op
                          -- **Exercise 4, p. 71
                          -- $ex4
                          , euclid
                          -- **Exercise 6, p. 72
                          -- $ex6
                          , and, concat, replicate, op2, elem
                          -- **Exercise 7, p. 72
                          -- $ex7
                          , merge
                          -- **Exercise 8, p. 72
                          -- $ex8
                          , msort
                          -- **Exercise 9, p. 72
                          -- $ex9
                          , sum, take, last
) where

import Prelude hiding (and, concat, replicate, elem, sum, take, last)
import qualified DefiningFunctionsExercises (halve)

-- $ex1
-- How does the recursive version of factorial function behave if applied to a
-- negative argument, such as @(-1)@? Modify the definition to prohibit
-- negative arguments by adding a guard to recursive case.
--
-- Answer: The recursive function never end.

-- | factorial of @n@. @n@ can be negative.
fac :: Int -> Int
fac 0 = 1
fac n | n > 0 = n * fac (n-1)
      | n < 0 = n * fac (n+1)

-- $ex2
-- Define a recursive function @sumdown :: Int -> Int@ that returns the sum
-- of the non-negative integers from a given value down to 0. For example,
-- @sumdown 3@ should return the result \(3+2+1+0 = 6\).

-- |Returns the sum of the non-negative integers from a given value down to
-- \(0\)
sumdown :: Int -> Int
sumdown 0 = 0
sumdown n = n + sumdown (n-1)

-- $ex3
-- Define the exponentiation operator @^@ for non-negative integers using
-- the same pattern of recursion as the multiplication operator @*@, and
-- show how the expression @2 ^ 3@ is evaluated using your definition.
--
-- Answer:
-- > 2 `op` 3
--      == op 2 3
--      == 2 * op 2 2 
--      == 2 * 2 * op 2 1
--      == 2 * 2 * 2 * op 2 0
--      == 2 * 2 * 2 * 1
--      == 8

-- |Like exponentiation operator @^@ for positive 'Int's exponent
op :: Int -> Int -> Int
op _ 0 = 1
op x n = x * op  x (n-1)

-- $ex4
-- Define a recursive function @euclid: Int -> Int -> Int@ that implements
-- /Euclid's algorithm/ for calculating the greatest common divisor of two
-- non-negative integers: if the two numbers are equal, this number is the 
-- result; otherwise the smaller is subtracted from the larger, and the
-- same process is repeated. For example:
--
-- > euclid 6 27
-- 3

-- | Calculates the greatest common divisor of two non-negative integers
-- using the /Euclid's algorithm/
euclid :: Integral n => n -> n -> n
euclid n m | n == m = n
           | n > m = euclid (n-m) m
           | otherwise = euclid n (m-n)

-- $ex6
-- Without looking at the definitions from the standard prelude, defines the
-- following library functions on lists using recursion.
--
--      1. Decide if all logical values in a list are @True@:
--
--              @and :: [Bool] -> Bool@
--
--      2. Concatenate a list of lists:
--
--              @concat :: [[a]] -> [a]@
--
--      3. Produce a list with @n@ identical elements:
--
--              @replicate :: Int -> a -> [a]@
--
--      4. Select the @n@th element of a list:
--
--              @(!!) :: [a] -> Int -> a@
--
--      5. Decide if a value is an element of a list:
--
--              @elem :: Eq a => a -> [a] -> Bool@
--
-- Note: most of these functions are defined in the "Prelude" using other
-- library functions rather than using explicit recursion, and are generic
-- functions rather than being specific to the type of lists.

-- |Decides if all logical values in a list are @True@
and :: [Bool] -> Bool
and []     = True
and (x:xs) = x && and xs

-- |Concatenate a list of list
concat :: [[a]] -> [a]
concat []       = []
concat (xs:xss) = xs ++ concat xss

-- |Produce a list with @n@ identical elements
replicate :: Int -> a -> [a]
replicate 0 _ = []
replicate n x = x : replicate (n-1) x

-- |select the @n@th element of a list.
--
-- Note: called @op2@ instead of @(!!)@
op2 :: [a] -> Int -> a
[] `op2` _ = error "Index is too large"
(x:xs) `op2` 0 = x 
(x:xs) `op2` n | n >= length (x:xs) = error "index too large"
               | otherwise = xs `op2` (n-1)

-- |Decide if a value is an element of a list
elem :: Eq a => a -> [a] -> Bool
elem _ [] = False
elem e (x:xs) | e == x = True
              | otherwise = e `elem` xs

-- $ex7
-- Define a recursive function @merge :: Ord a => [a] -> [a] -> [a]@ that
-- merges two sorted list to give a single sorted list. For example:
--
-- > merge [2,5,6] [1,3,4]
-- [1,2,3,4,5,6]

-- | merges two sorted list to give a single sorted list
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = if x <= y then x : merge xs (y:ys)
                                else y : merge (x:xs) ys

-- $ex8
-- Using __@'merge'@__, define a function @msort :: Ord a => [a] -> [a]@ that
-- implements /merge sort/, in which the empty list and singleton lists are
-- already sorted, and any other list is sorted by merging together the two
-- lists that result from sorting the two halves of the list separately.
--
-- Hint: first define a function @halve :: [a] -> ([a], [a])@ that splits a
-- list into two halves whose length differ by at most one

-- |We have already a function @halve@ from

-- |We have already a function @halve@ from "DefiningFunctionsExercises"
halve = DefiningFunctionsExercises.halve

-- |Sorts a list using /merge sort/ algorithm
msort :: Ord a => [a] -> [a]
msort []  = []
msort [a] = [a]
msort xs  = merge (msort fhalf) (msort shalf)
  where fhalf = fst (halve xs)
        shalf = snd (halve xs)

-- $ex9
-- Using five-step process, construct the library functions that:
--
-- 1.   calculate @'Prelude.sum'@ of a list of numbers;
-- 2.   @'Prelude.take'@ a given number of elements from the start of a list;
-- 3.   select the @'Prelude.last'@ element of non-empty list.

-- | sum of a list of number
sum :: Num a => [a] -> a
-- sum []      = 0
-- sum (x:xs)  = x + sum (xs)
sum = foldr (+) 0

-- |take a given number of element from the start of a list
take :: Integral a => a -> [b] -> [b]
take 0 _  = []
take _ [] = []
take n (x:xs) = x : (take (n-1) xs)

-- |last element of non-empty list
last :: [a] -> a
last []     = error "Empty list"
last [x]    = x
last (_:xs) = last xs
