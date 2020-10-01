-- |
-- Module      :  TypesAndClassesExercises
-- copyright   :  erlnow 2020 - 2030
-- license     :  BSD3
--
-- maintainer  :  erlestau@gmail.com
-- stability   :  experimental
-- portability :  unknown
--
-- exercises from chapter 3: types and classes
-- 
-- note to run tests:
--
-- @
--      $ cabal new-run spec
-- @
--
-- or in @ghci@:
--
-- @
--      $ cabal new-repl spec
--      ghci> hspec TypesAndClassesExercises.spec
-- @

module TypesAndClassesExercises (
                                -- ** __Exercise 1__, p. 36:

                                -- $ex1
                                  ex1, ex2, ex3, ex4
                                -- ** __Exercise 2__, pp. 36,37:

                                -- $ex2
                                , bools, nums, add, copy, apply
                                -- ** __Exercise 3__, p. 37

                                -- $ex3
                                , second, swap, pair, double
                                , palindrome, twice
) where

-- $ex1
-- What are the types of the following values?
--
-- @
--     [\'a\',\'b\',\'c\']@
--     (\'a\', \'b\', \'c\')@
--     ([False, True], ['0', '1'])@
--     [tail, init, reverse]@
-- @

-- |A list of 'Char'
ex1 :: [Char]
ex1 = ['a','b','c']

-- |A three-tuple of 'Char'
ex2 :: (Char, Char, Char)
ex2 = ('a', 'b', 'c')

-- | A pair of lists: the first is a 'Bool' list and the
-- second a 'Char' list or 'String'
ex3 :: ([Bool],[Char])
ex3 = ([False, True], ['0', '1'])

-- |A list of functions. The functions takes a lists and
-- returns a list of same type.
ex4 :: [([a]->[a])]
ex4 = [tail, init, reverse]

-- $ex2
-- Write down a definition that have the following types; it does
-- not matter what the definition actually do as long as they are
-- type correct.
--
-- @
--      bools :: [Bool]
--      nums :: [[Int]]
--      add :: Int -> Int -> Int -> Int
--      copy :: a -> (a,a)
--      apply :: (a -> b) -> a -> b
-- @

-- |Returns a list with possible value for a 'Bool'.
bools :: [Bool]
bools = [True, False]

-- |Sums three numbers.
add :: Int -> Int -> Int -> Int
add x y z = x + y + z

-- |Given @x@ create the pair @(x,x)@.
copy :: a -> (a, a)
copy a = (a, a)

-- |Applies the function @f@ to the second argument.
apply :: (a -> b) -> a -> b
apply f a = f a

-- |Returns a list of two lists, the odd numbers and
-- pair numbers between 1 and 10.
nums :: [[Int]]
nums = [[1,3,5,7,9],[2,4,6,8,10]]

-- $ex3
--
-- What are the types of the following functions?
-- 
-- @
--      second xs = head (tail xs)
--      swap(x,y) = (y,x)
--      pair x y = (x,y)
--      double x = x*2
--      palindrome xs = reverse xs == xs
--      twice f x = f (f x)
-- @

-- |Returns the second element of a list.
second :: [a] -> a
second xs = head (tail xs)

-- |Swap both element of pair
swap :: (a,b) -> (b,a)
swap (x,y) = (y,x)

-- |Make a pair from two elements
pair :: a -> b -> (a, b)
pair x y = (x,y)

-- |Double a number
double :: Num a => a -> a
double x = x*2

-- |Decides if a lists is a palindrome
palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

-- |Applies @f@ twice
twice :: (a -> a) -> a -> a 
twice f x = f (f x)
