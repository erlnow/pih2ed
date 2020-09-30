-- |
-- Module      :  Intro
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
-- Functions defined in /chapter 1: Introduction/. 
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
--      ghci> hspec IntroSpec.spec
-- @

module Intro (
               double
             , sum
             , qsort
             , seqn
) where

-- NOTE:
-- 'Prelude' is imported by default, so is not needed to import it explicitly.
-- But, when we define a function with the same name that an other function
-- declared in 'Prelude' then could throw an error:
--
-- Ambiguous occurrence 'sum'
-- It could refer to either 'Prelude.Sum'
--                          imported from 'Prelude' at src/Intro.hs:21:8-12
--                          (and originally defined in 'Data.Foldable'
--                       or 'Intro.sum', define at src/Intro.hs:40:1
--
-- To prevent this, I import 'Prelude' explicitly and hide definitions
-- defined in this module.
--
-- In the book, the function definition have not type. I add a type
-- for each function for haddock documentation.

import Prelude hiding (sum)

-- |Doubles a number. 
--
-- Examples:
--
-- >>> double 3
-- 6
--
-- >>> double (double 4)
-- 16
--
-- Defined in /1.1 Functions/ p. 3
double :: Num a => a -> a
double x = x + x

-- |Summatory of all elements of a list.
-- 
-- This definition hides the 'Prelude.sum' in "Prelude" definition.
-- Example:
--
-- >>> sum [1,2,3]
-- 6
--
-- Defined in /1.5 A taste of Haskell/ p. 9
sum :: Num a => [a] -> a
sum []       = 0
sum (x:xs)   = x + sum xs


-- |Sorts a list using the /quick sort/ method.
--
-- Example:
--
-- >>> qsort [3,5,1,4,2]
-- [1,2,3,4,5]
--
-- Defined in /1.5 A taste of Haskell/ p. 10
qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
  where
    smaller = [a | a <- xs, a <= x]
    larger  = [a | a <- xs, a > x]

-- |Performs a list of actions in sequence.
--
-- Example:
--
-- >>> seqn [getChar, getChar, getChar]
-- abc"abc"
--
-- Defined in /1.5 A taste of Haskell/, p. 12
seqn :: Monad m => [m a] -> m [a]
seqn []         = return []
seqn (act:acts) = do x  <- act
                     xs <- seqn acts
                     return (x:xs)
