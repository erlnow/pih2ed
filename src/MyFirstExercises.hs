-- |
-- Module      :  MyFirstExercises
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Exercises of Chapter 2: First steps
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
--      ghci> hspec MyFirstExercisesSpec.hs
-- @
--
-- or in @ghci@:
--
-- @
--      $ cabal new-repl spec
--      ghci> hspec MyFirstExercisesSpec.spec
-- @

module MyFirstExercises (
                          n
                        , last
                        , last'
                        , init
                        , init'
                        ) where

import Prelude hiding (last, init)

-- |__Exercise 3__, p. 21:
--
-- The script below contains three syntactic errors. Correct these
-- errors and then check that your script works properly using GHCi.
--
-- @
-- N = a \'div\' length xs
--     where
--         a = 10
--        xs = [1,2,3,4,5]
-- @
n = a `div` length xs
  where
    a = 10
    xs = [1,2,3,4,5]

-- |__Exercise 4__, p. 21:
--
-- The library function __@last@__ selects the last element of a 
-- non-empty list; for example, @last [1,2,3,4,5] = 5@. Show how
-- the function __@last@__ could be defined in terms of the other
-- library functions introduced in this chapter. Can you think
-- of another possible definition?
--
-- This function hides 'Prelude.last' defined in "Prelude".
last [] = error "last: empty list"
last xs = head (reverse xs)

-- |Another definition of @last@.
last' [] = error "last: empty list"
last' xs = xs !! (length xs - 1)

-- |__Exercise 5__, p. 21
--
-- The library function __@init@__ removes the last element from a
-- non-empty list; for example @init [1,2,3,4,5] = [2,3,4,5]@. Show
-- how __@init@__ could similarly be defined in two ways.
--
-- This definition hides 'Prelude.init' defined in "Prelude".
init [] = error "last: empty list"
init xs = reverse (drop 1 (reverse xs)) 

-- |Another definition of @init@.
init' [] = error "last: empty list"
init' xs  = take (length xs -1) xs
