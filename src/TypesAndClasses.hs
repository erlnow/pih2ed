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
--      ghci> hspec TypesAndClasses.spec
-- @

module TypesAndClasses (
                         add
                       , zeroto
                       , add'
                       , mult
                       ) where

-- Function types

-- |Sums two numbers. The two numbers are expect as a /pair/.
--
--  This function is defined in /3.5 Function types/, p. 27.
add :: (Int, Int) -> Int
add (x,y) = x+y

-- |Returns the list of numbers from @0@ to @n@, where @n@ is
-- given as argument.
--
-- This function is defined in /3.5 Function types/, p. 27.
zeroto :: Int -> [Int]
zeroto n = [0..n]

-- Curried functions
-- Curried functions are based in that a function can return another
-- function: f :: a -> ( b -> c).
-- '->' is associative to the right, and parentheses are redundant.
-- Function application is associative by the left, so we don't need
-- to write '((f a) b) c', only 'f a b c'.

-- |The sum of two numbers.
--
-- @add'@ function take the two numbers as arguments of the function,
-- whilst 'add' function take one argument that is a pair of numbers.
--
-- This function is defined in /3.6 Curried functions/, p. 27.
add' :: Int -> Int -> Int
add' x y = x + y

-- |Multiplies three numbers.
--
-- This function is defined in /3.6 Curried functions/, p. 28.
mult :: Int -> Int -> Int -> Int
mult x y z = x * y * z
