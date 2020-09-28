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
--      gchi> hspec DefiningFunctions.spec
-- @

module DefiningFunctions (
                           even , splitAt , recip
                         , abs , signum
                         , abs', signum'
                         , not, (&&) 
                         , fst, snd
) where

import Prelude hiding (even, splitAt, recip, abs, signum
                      , not, (&&), fst, snd)
--
-- 4.1 New from old
--

-- |The 'even' function dedice if a integer is even
even :: Integral a => a -> Bool
even n = n `mod` 2 == 0

-- |The 'splitAt' function splits at the @n@th element
splitAt :: Int -> [a] -> ([a],[a])
splitAt n xs = (take n xs, drop n xs)

-- |The 'recip' function returns the reciprocate
recip :: Fractional a => a -> a
recip n = 1/n

--
-- 4.2 Conditional examples
--

-- | 'abs' absolute value
abs :: Int -> Int
abs n = if n > 0 then n else -n

-- | Sign of a number.
signum :: Int -> Int
signum n = if n < 0 then -1 else
              if n == 0 then 0 else 1 

--
-- 4.3 Guarded equations
--

-- | 'abs'' absolute value
abs' :: Int -> Int
abs' n
  | n >= 0    =  n
  | otherwise = -n

-- | Sign of a number.
signum' :: Int -> Int
signum' n
  | n < 0     = -1
  | n == 0    =  0
  | otherwise =  1

--
-- 4.4 Pattern matching
--

-- | Boolean not
not :: Bool -> Bool
not False = True
not True = False

-- (&&) example of more than one argument
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

-- tuple patterns

-- |Extract the first component of a pair
fst :: (a, b) -> a
fst (x,_) = x

-- |Extract the second component of a pair
snd :: (a, b) -> b
snd (_,y) = y 
