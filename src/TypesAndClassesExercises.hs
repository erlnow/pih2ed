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
-- Type of ['a','b','c']
ex1 :: [Char]
ex1 = ['a','b','c']

-- | Type of ('a', 'b', 'c')
ex2 :: (Char, Char, Char)
ex2 = ('a', 'b', 'c')

-- | Type of ([False, True], ['0', '1'])
ex3 :: ([Bool],[Char])
ex3 = ([False, True], ['0', '1'])

-- | Type of [tail, init, reverse]
ex4 :: [([a]->[a])]
ex4 = [tail, init, reverse]

-- |*Esercise 2:
-- Write down a definition for bools :: [Bool]
bools :: [Bool]
bools = [True, False]

-- | Write down a definition for nums :: [[Int]]
nums :: [[Int]]
nums = [[1,3,5,7,9],[2,4,6,8,10]]

-- | Write down a definition for add :: Int -> Int -> Int -> Int
add :: Int -> Int -> Int -> Int
add x y z = x + y + z

-- | Write down a definition for copy :: a -> (a, a)
copy :: a -> (a, a)
copy a = (a, a)

-- | Write down a definition for apply :: (a -> b) -> a -> b
apply :: (a -> b) -> a -> b
apply f a = f a

-- |*Exercise 3:
-- What is the type of second xs = head (tail xs)
second :: [a] -> a
second xs = head (tail xs)

-- | What is the type of swap (x,y) = (y,x)
swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)

-- | What is the type of pair x y = (x,y)
pair :: a -> b -> (a, b)
pair x y = (x,y)

-- | What is the type of double x = x*2
double :: Num a => a -> a
double x = x*2

-- | What is the type of palindrome xs = reverse xs == xs
palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

-- | What is the type of twice f x = f (f x)
twice :: (a -> a) -> a -> a 
twice f x = f (f x)
