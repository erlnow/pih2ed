-- |
-- Module      :  TypesAndClassesExercises
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Exercises from Chapter 3: Types and classes
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
--      gchi> hspec TypesAndClassesExercises.spec
-- @

module TypesAndClassesExercises (
                                  ex1, ex2, ex3, ex4 
                                , bools, nums, add, copy, apply
                                , second, swap, pair, double
                                , palindrome, twice
) where

-- |* Exercise 1
ex1 :: [Char]
ex1 = ['a','b','c']

ex2 :: (Char, Char, Char)
ex2 = ('a', 'b', 'c')

ex3 :: ([Bool],[Char])
ex3 = ([False, True], ['0', '1'])

ex4 :: [([a]->[a])]
ex4 = [tail, init, reverse]

-- |*Esercise 2:
bools :: [Bool]
bools = [True, False]

nums :: [[Int]]
nums = [[1,3,5,7,9],[2,4,6,8,10]]

add :: Int -> Int -> Int -> Int
add x y z = x + y + z

copy :: a -> (a, a)
copy a = (a, a)

apply :: (a -> b) -> a -> b
apply f a = f a

-- |*Exercise 3:
second :: [a] -> a
second xs = head (tail xs)

swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)

pair :: a -> b -> (a, b)
pair x y = (x,y)

double :: Num a => a -> a
double x = x*2

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a 
twice f x = f (f x)
