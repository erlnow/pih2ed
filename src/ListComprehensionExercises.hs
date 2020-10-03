-- |
-- Module      :  ListComprehensionExercises
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Exercises from Chapter 5: List Comprehensions
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
--      ghci> hspec ListComprehensionExercises.hs
-- @

module ListComprehensionExercises (
                                  -- ** Exercise 1, p. 57
                                  -- $ex1
                                    sumsqr100
                                  -- ** Exercise 2, p. 57
                                  -- $ex2
                                  , grid
                                  -- ** Exercise 3, p. 57
                                  -- $ex3
                                  , square
                                  -- ** Exercise 4, p. 57
                                  -- $ex4
                                  , replicate
                                  -- ** Exercise 5, p. 57
                                  -- $ex5
                                  , pyths
                                  -- ** Exercise 6, p. 57
                                  -- $ex6
                                  , perfects
                                  -- ** Exercise 7, pp. 57,58
                                  -- $ex7
                                  , list1, list2
                                  -- ** Exercise 8, p. 58
                                  -- $ex8
                                  , positions
                                  -- ** Exercise 9, p. 58
                                  -- $ex9
                                  , scalarproduct
                                  -- ** Exercise 10, p. 58
                                  -- $ex10
                                  , caesar
) where

import Prelude hiding (replicate)
import ListComprehension ( 
                           factors      -- used in exercise 6
                         , find         -- used in exercise 8
                         )
-- $ex1
-- Using a list comprehension, five an expression that calculates the sum of
-- \(1^2 + 2^2 + ... 100^2\) of the first one hundred integer squares.

-- |Sum of first one hundred squares
sumsqr100 :: Int
sumsqr100 = sum [x^2 | x <- [1..100]]

-- $ex2
-- Suppose that a /coordinate grid/ of size \(m\,\times\,n\) if given by the
-- list of all pairs \((x,y)\) of integers such that \(0 <= x <= m\) and \(0 <=
-- y <= n\). Using a list comprehension, define a function @'grid' :: Int ->
-- Int -> [(Int,Int)]@ that returns a coordinate grid of a given size. For
-- example:
--
-- > grid 1 2
-- [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]

-- |Creates a /coordinate grid/ given @m@ and @n@.
grid :: Int -> Int -> [(Int, Int)]
grid m n = [(x,y) | x <- [0..m], y <- [0..n]] 

-- $ex3
-- Using a list comprehension and the function @'grid'@ above, define a
-- function @'square' :: Int -> [(Int,Int)]@ that returns a coordinate square of
-- size \(n\), excluding the diagonal from \((0,0)\) to \((n,n)\). For example:
--
-- > square 2
-- [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]

-- |Returns a /coordinate grid/ excluding the diagonal from \((0,0)\) to \((n,n)\).
square :: Int -> [(Int,Int)] 
square n = [(x,y) | (x,y) <- grid n n, x /= y]

-- $ex4
-- In a similar way to the function @'length'@, show how the library function
-- @'replicate' :: Int -> a -> [a]@ that produces a list of identical elements
-- can be defined using a list comprehension. For example:
--
-- > replicate 3 True
-- [True, True, True]

-- |Produces a list of identical elements of size @n@.
--
-- Note: the function 'replicate' hides the function 'Prelude.replicate' in
-- "Prelude" with same name and behavior.
replicate :: Int -> a -> [a]
replicate n x = [x | _ <- [1..n]]

-- $ex5
-- A triple \((x,y,z)\) of positive integers is /Pythagorean/ if it satisfies
-- the equation \(x^2 + y^2 = z^2\). Using a list comprehension with three
-- generators, define a function @'pyths' :: Int -> [(Int, Int, Int)]@ that
-- returns the list of all such triples whose components are at most a given
-- limit. For example:
--
-- > pyths 10
-- [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]

-- |Returns /pythagorean/ numbers at most a given limit.
pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x,y,z) | x <- [1..n], y <-[1..n], z <- [x+1..n], x^2 + y^2 == z^2]

-- $ex6
-- A positive integer is /perfect/ if it equals the sum of all its factors,
-- excluding the number itself. Using a list comprehension and the function
-- 'ListComprehension.factors', define a function @'perfects' :: Int -> [Int]@
-- that returns the list of all perfect numbers up to a given limit. For
-- example:
--
-- > perfects 500
-- [6,28,496]

-- |List of /perfect/ numbers up to a given limit.
perfects :: Int -> [Int]
perfects n = [ x | x <- [1..n], sum (init (factors x)) == x]

-- $ex7
-- Show how the list comprehension @[(x,y) | x <- [1,2], y <- [3,4]]@
-- with two generators can be re-expressed using two comprehension
-- with single generators. Hint: nest one comprehension within the 
-- other and make use of the library function @'concat' :: [[a]] -> [a]@.

-- | List comprehension of the enunciate @[(x,y) | x <- [1,2], y <- [3,4]]@
list1 = [(x,y) | x <- [1,2], y <- [3,4]]

-- | List comprehension equivalent to the comprehension list on enunciate, this
-- one using two list comprehension nested.
list2 = concat [[(x,y) | y <- [3,4]] | x <- [1,2]]

-- $ex8
-- Redefine the function 'ListComprehension.position' using the function
-- 'ListComprehension.find'.

-- |positions
positions :: Eq a => a -> [a] -> [Int]
positions n xs = find n (zip xs [0..])

-- $ex9
-- The /scalar product/ of two lists of integers \(xs\) and \(ys\) of length
-- \(n\) is given by the sum of the products of corresponding integers:
-- 
-- \[
-- \sum _{i=0}^{n-1} (xs_i * ys_i)
-- \]
--
-- In a similar manner to 'Caesar.chisqr', show how a list comprehension can be
-- used to define @'scalarproduct' :: [Int] -> [Int] -> Int@ that returns the
-- scalar product of two list. For example:
--
-- > scalarproduct [1,2,3] [4,5,6]
-- 32

-- |Calculate the /scalar product/ of two list of integers
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [ x*y | (x,y) <- zip xs ys]

-- $ex10

-- |caesar
caesar :: a
caesar = undefined
