-- |
-- Module      :  MyFirst
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Functions defined in /Chapter 2: First steps/.
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
--      gchi> hspec MyFirstSpec.spec
-- @

  
  
module MyFirst (
                 double
               , quadruple
               , factorial
               , average
               ) where

-- |The function 'double' 
double x = x + x

-- |The function 'quadruple'
quadruple x = double (double x)

-- |The function 'factorial'
factorial n = product [1..n]

-- |The function 'average'
average ns = sum ns `div` length ns
