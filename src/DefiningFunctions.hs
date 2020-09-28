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

) where

import Prelude hiding (even, splitAt, recip, abs, signum)
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
