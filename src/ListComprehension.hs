-- |
-- Module      :  ListComprehension
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Example of chapter 5: List comprehension
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
--      ghci> hspec ListComprehension.hs
-- @

module ListComprehension (
                         -- * 5.1 Basic concepts, pp. 47,48
                           concat, firsts, length
                         -- *5.2 Guards, pp. 48-50
                         , factors, prime, primes, find
) where

import Prelude hiding (concat, length)

-- |The concatenation of all the elements of a container of lists
--
-- Note: 'concat' hides the "Prelude" function 'Prelude.concat'
concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

-- |Given a list of pairs, returns the @fst(a,b)@ for each @(a,b)@ in the list.
firsts :: [(a,b)] -> [a]
firsts ps = [x | (x,_) <- ps]
first ps = [x | (x,_) <- ps]

-- |Returns the size of a list
--
-- Note:'length' hides the definition of 'Prelude.length' in "Prelude" 
length :: [a] -> Int
length xs = sum [1 | _ <- xs]

-- |Returns a list of factors of a number
factors :: Int -> [Int]
factors n = [x | x <- [1..n], n `mod` x == 0]

-- |Decides if a number is prime
prime :: Int -> Bool
prime n = factors n == [1,n]

-- |Returns a list of all primes up to a given number
primes :: Int -> [Int]
primes n = [x | x <- [2..n], prime x]   -- There is a more efficient algorithm,
                                        -- the sieve of Eratosthenes. In chapter 15.

-- |Return a list of all values that are associated with a given key in a table 
-- of pairs (key, value).
find :: Eq a => a -> [(a,b)] -> [b]
find k t = [v | (k',v) <- t, k == k']
