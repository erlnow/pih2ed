-- |
-- Module      :  Caesar
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- /Example from 5.5. __The Caesar cipher__/
-- The /Caesar cipher/, named after its use by /Julius Caesar/
-- more than 2,000 years ago, is a encoding method. To encode
-- a string, each letter of the string is replaced by other 
-- three letters further down in the alfabet, wrapping around
-- at the end of alphabet. This method can be improve changing
-- the shift factor by any number between one and twentyfive.
--
-- For simplicity, only encode the lower-case letters.
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
--      ghci> hspec Caesar.hs
-- @

module Caesar (
              -- ** Encoding and decoding with /Caesar cipher/
               let2int
              , int2let
              , shift
              , encode
              -- ** Frequency tables
              , table
              , percent
              , freqs
              -- ** Cracking the /Caesar cipher/
              , chisqr
              , rotate
              , crack
) where

import Data.Char
import ListComprehension (count, lowers, positions)

-- |Maps a letter with her position in alphabet.
-- Returns a number between cero and twentyfive.
let2int :: Char -> Int
let2int c = ord c - ord 'a'

-- |Returns the character with the given position
-- in the alphabet. The position is a number between
-- cero and twentyfive.
int2let :: Int -> Char
int2let n = chr (ord 'a' + n) 

-- |Applies a shift factor to a lower-case letter,
-- wrapping around at the end of the alphabet.
shift :: Int -> Char -> Char
shift n c 
  | isAsciiLower c = int2let ((let2int c + n) `mod` 26)
  | otherwise      = c

-- |Encode a string using /Caesar Cipher/.
--
-- To decode a string apply encode with a negative shift.
encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]

-- |Frequencies of twentysix letters of alphabet
table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0,
         0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0,
         6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

-- |Calculate the percentage of one integer respect to 
-- another
percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100

-- |Returns a frequency table for any given string
freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
              where n = lowers xs

-- |Calculates the /chi-square/ for @os@, an /observed/
-- frequency and @es@, an /spected frequency/. Smaller
-- values implies better match between @os@ and @es@.
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2)/e | (o,e) <- zip os es]

-- |Rotates the elements of a list @n@ places to the left,
-- wrapping around at the start of the list.
--
-- Asumes that @n@ is between 0 and @length xs@
rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

-- |Decodes most strings produced using the /Caesar cipher/
-- without knowing the shift factor used to encode it.
crack :: String -> String 
crack xs = encode (-factor) xs
  where factor = head (positions (minimum chitab) chitab)
        chitab = [chisqr (rotate n table') table | n <- [0..25]]
        table' = freqs xs

