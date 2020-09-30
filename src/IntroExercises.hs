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
--      ghci> hspec IntroExercisesSpec.spec
-- @

module IntroExercises (
                        testSumOfSingleton
                      , product
                      , qsortRev
                      , qsort
) where

import Prelude hiding (sum, product)
import Intro (sum) 

-- |__Exercise 2__, p. 13:
--
-- Show that @sum [x] == x@ for any number @x@.
--
-- The 'testSumOfSingleton' function probes that
--
-- >prop testSumOfSingleton [x] == True
testSumOfSingleton :: (Eq a, Num a) => [a] -> Bool
testSumOfSingleton (x:[]) = sum [x] == x
testSumOfSingleton   _    = error "It isn't a Singleton"

-- |__Exercise 3__, p. 13:
--
-- Define a function __@product@__ that produces the product of a 
-- list of numbers and show your definition that @product [2,3,4] = 24@.
--
-- The 'product' function takes a list of number and
-- calculates their product.
--
-- This definition hides 'Prelude.product' definition in "Prelude".
product :: Num p => [p] -> p
product (x:xs) = x * product(xs)
 
-- |__Exercise 4__, p. 13:
--
-- How should the definition of the function @qsort@ be modified so that 
-- it produces a /reverse/ sorted version of a list?
--
-- Sorts a list in /reverse/ order. 'qsortRev' uses the /quick sort/ method.
qsortRev :: (Ord a, Num a) => [a] -> [a]
qsortRev []     = []
qsortRev (x:xs) = qsortRev larger ++ [x] ++ qsortRev smaller
  where larger  = [x' | x' <- xs, x' > x]
        smaller = [x' | x' <- xs, x' <= x]

-- |__Exercise 5__, p. 13
--
-- What would be the effect of replacing @<=@ by @<@ in the
-- original 'Intro.qsort'? Hint: consider the example of
-- @qsort [2,2,3,1,1]
--
-- This 'qsort' definition sort a list and replace all
-- repeated elements but one.
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a < x]
    larger  = [a | a <- xs, a > x]
