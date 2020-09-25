-- |
-- Module      :  IntroExercises
-- Copyright   :  erlestau 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- From the book:
-- /Programming in Haskell/
-- Second Edition
--
-- Graham Hutton
-- University of Nottingham
-- 
-- Cambridge University Press
--
-- Exercises from /chapter 1: Introduction/. 
--
-- Note: to run test (and see results)
--
-- @
--      $ cabal new-run spec
-- @
--
-- or in @ghci@:
--
-- @
--      $ cabal new-repl spec
--      gchi> hspec IntroExercisesSpec.spec
-- @

module IntroExercises (
                        testSumOfSingleton
                      , product
                      , qsortRev
                      , qsort
) where

import Prelude hiding (sum, product)
import Intro (sum) 

-- |*Exercise 2
-- The 'testSumOfSingleton' probes that
-- @
--      sum [x] == x
-- @ 
--
-- >prop testSumOfSingleton [x] == True
testSumOfSingleton :: (Eq a, Num a) => [a] -> Bool
testSumOfSingleton (x:[]) = sum [x] == x
testSumOfSingleton   _    = error "It isn't a Singleton"

-- |*Exercise 3
-- The 'product' function takes a list of number and
-- calculates their product.
--
-- Note: 'product' is a function defined in 'Prelude'
-- I must to hide the 'Prelude.product'.
product :: Num p => [p] -> p
product (x:xs) = x * product(xs)
 
-- | *Exercise 4.
-- The function 'qsortRev' is like 'Intro.qsort' but 
-- in reverse order, from larger to smaller.
--
-- @
--      > qsortRev [2,4,1,3,5]
--      [5,4,3,2,1]
-- @
qsortRev :: (Ord a, Num a) => [a] -> [a]
qsortRev []     = []
qsortRev (x:xs) = qsortRev larger ++ [x] ++ qsortRev smaller
  where larger  = [x' | x' <- xs, x' > x]
        smaller = [x' | x' <- xs, x' <= x]

-- | *Exercise 5.
-- The 'qsort' function is like 'Intro.qsort' but
-- instead of use @<=@, use @<@ in smaller list 
-- comprehension. 
--
-- This change have the effect of discard equals
-- numbers to the /pivot/ @x@. As result of that, all
-- repeated numbers are discarded but one. So, by
-- example:
--
-- @
--      > qsort [2,2,3,1,1]
--      [1,2,3]
--      > qsort [1,1,3,4,5,3,5,2,2,2,2]
--      [1,2,3,4,5]
-- @
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a < x]
    larger  = [a | a <- xs, a > x]
