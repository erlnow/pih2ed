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
) where

import Prelude hiding (even, splitAt, recip)
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
