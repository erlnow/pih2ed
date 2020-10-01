-- |
-- Module      :  DefiningFunctions
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Examples from chapter 4: Defining Functions.
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
--      ghci> hspec DefiningFunctions.spec
-- @

module DefiningFunctions (
                         -- *4.1 New from old, p. 38
                           even , splitAt , recip
                         -- *4.2 Conditional examples, pp. 38,39
                         , abs , signum
                         -- *4.3 Guarded equations, p. 39
                         , abs', signum'
                         -- *4.4 Pattern matching, pp. 40-42
                         , not, (&&) 
                         -- **Tuple patterns
                         , fst, snd
                         -- **List patterns
                         , test, head, tail
                         -- *4.5 Lambda expressions, pp. 42,43
                         , add, const, odds
                         -- *4.6 Operator sections
                         , sum
) where

import Prelude hiding (even, splitAt, recip, abs, signum
                      , not, (&&), fst, snd, head, tail
                      , const, sum)

-- |The 'even' function decides if a integer is even
even :: Integral a => a -> Bool
even n = n `mod` 2 == 0

-- |The 'splitAt' function splits at the @n@th element
splitAt :: Int -> [a] -> ([a],[a])
splitAt n xs = (take n xs, drop n xs)

-- |The 'recip' function returns the reciprocate of a fraction
recip :: Fractional a => a -> a
recip n = 1/n

-- | 'abs' absolute value
abs :: Int -> Int
abs n = if n > 0 then n else -n

-- | Sign of a number.
signum :: Int -> Int
signum n = if n < 0 then -1 else
              if n == 0 then 0 else 1 

-- | 'abs'' absolute value
abs' :: Int -> Int
abs' n
  | n >= 0    =  n
  | otherwise = -n

-- | Sign of a number
signum' :: Int -> Int
signum' n
  | n < 0     = -1
  | n == 0    =  0
  | otherwise =  1

-- *4.4 Pattern matching, pp. 40-42

-- | Boolean not
not :: Bool -> Bool
not False = True
not True = False

-- (&&) example of more than one argument
-- |Boolean conjunction
(&&) :: Bool -> Bool -> Bool
-- True  && True  = True
-- True  && False = False
-- False && True  = False
-- False && False = False
--
-- Can be simplified, as:
-- True && True = True
-- _    && _    = False
--
-- Or, using only first argument:
True  && b = b
False && _ = False

-- |Extract the first component of a pair
fst :: (a, b) -> a
fst (x,_) = x

-- |Extract the second component of a pair
snd :: (a, b) -> b
snd (_,y) = y 

-- | Test if a list of three chars beginning with @\'a\'@
test :: [Char] -> Bool
test ['a',_,_] = True
test _         = False

-- | Extract the first element of a list
head :: [a] -> a
head (x:_) = x

-- | Extract the element after the head of a list
tail :: [a] -> [a]
tail (_:xs) = xs

-- |add two numbers
add :: Int -> (Int -> Int)              -- take an int and return a function
add = \x -> (\y -> x + y)               -- formalized the meaning of curried function

-- |const evaluate to x
const :: a -> (b -> a)
const x = \_ -> x

-- |only odds numbers
odds :: Int -> [Int]
odds n = map (\x -> x*2 + 1) [0..n-1] 

-- |sum of all elements
sum :: [Int] -> Int
sum = foldl (+) 0
