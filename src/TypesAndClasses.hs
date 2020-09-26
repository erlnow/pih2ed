-- |
-- Module      :  TypesAndClasses
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Examples from /Chapter 3: Types and Classes/.
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
--      gchi> hspec TypesAndClasses.spec
-- @

module TypesAndClasses (
                         add
                       , zeroto
                       , add'
                       , mult
                       ) where

-- Function types

-- |The 'add' function add sum two numbers.
-- The two numbers, @Int@ really, are packed in a tuple.
--
--  This function is defined in /3.5 Function types/, pag. 27.
add :: (Int, Int) -> Int
add (x,y) = x+y

-- |The 'zeroto' function returns a list of @Int@'s, from 0 to @n@.
--
-- This function is defined in /3.5 Function types/, pag. 27.
zeroto :: Int -> [Int]
zeroto n = [0..n]

-- Curried functions
-- Curried functions are based in that a function can return another
-- function: f :: a -> ( b -> c).
-- '->' is associative to the right, and parentheses are redundants.
-- Function application is associative by the left, so we don't need
-- to write '((f a) b) c', only 'f a b c'

-- |The 'add'' function is like 'add' but takes two arguments.
--
-- This function is defined in /3.6 Curried functions/, pag 27.
add' :: Int -> Int -> Int
add' x y = x + y

-- |The 'mult' function multiplies three @Int@. 
--
-- This function is defined in /3.6 Curried functions/, pag 28
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z
