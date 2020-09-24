  -- |
  -- Module      :  Intro
  -- Copyright   :  erlestau 2020 - 2030
  -- License     :  BSD3
  --
  -- Maintainer  :  erlestau@gmail.com
  -- Stability   :  experimental
  -- Portability :  unknown
  --
  -- From the book:
  -- /Programming in Haskell/
  -- Second Edition
  --
  -- Graham Hutton
  -- University of Nottingham
  -- 
  -- Cambridge University Press
  --
  -- Functions defined in /chapter 1: Introduction/. 
  
module Intro (
) where

-- |The 'double' function doubles a @x@ value.
--
-- Examples:
-- > double 3
-- 6
-- > double (double 4)
-- 16
--
-- Defined in /1.1 Functions/ pag. 3
double x = x + x
