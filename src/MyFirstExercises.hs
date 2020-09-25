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
--      gchi> hspec MyFirstSpecExercises.spec
-- @
--
-- or in @ghci@:
--
-- @
--      $ cabal new-repl spec
--      gchi> hspec MyFirstExercisesSpec.spec
-- @

module MyFirstExercises (
                          n
                        , last
                        , last'
                        , init
                        , init'
                        ) where

import Prelude hiding (last, init)

-- | *Exercise 3:
-- fix definition of N
n = a `div` length xs
  where
    a = 10
    xs = [1,2,3,4,5]

-- | *Exercise 4
-- define my own version of 'Prelude.last'
last [] = error "last: empty list"
last xs = head (reverse xs)

-- | Another version of 'Prelude.last'
last' [] = error "last: empty list"
last' xs = xs !! (length xs - 1)

-- | *Exercise 5
-- define my own version of 'Prelude.init'
init [] = error "last: empty list"
init xs = reverse (drop 1 (reverse xs)) 

-- | another definition of 'Prelude.init'
init' [] = error "last: empty list"
init' xs  = take (length xs -1) xs
