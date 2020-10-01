-- |
-- Module      :  DefiningFunctionsExercises
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Description
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
--      ghci> hspec DefiningFunctionsExercises.spec
-- @

module DefiningFunctionsExercises (
                                  -- *Exercise 1, p. 45
                                  -- 
                                  -- $ex1
                                    halve
                                  -- *Exercise 2, p. 45
                                  -- 
                                  -- $ex2
                                  , thirdA, thirdB, thirdC
                                  -- *Exercise 3, p. 45
                                  --
                                  -- $ex3
                                  , safetailA, safetailB, safetailC
                                  -- *Exercise 4, p. 45:
                                  --
                                  -- $ex4
                                  , disjunctionA, disjunctionB
                                  , disjunctionC, disjunctionD
                                  -- *Exercise 5, p.45:
                                  --
                                  -- $ex5
                                  , op,
                                  -- *Exercise 6, p. 46:
                                  --
                                  -- $ex6
                                  op2,
                                  -- *Exercise 7, p. 46:
                                  -- 
                                  -- $ex7
                                  mult
                                  -- *Exercise 8, p. 46:
                                  -- 
                                  -- $ex8
                                  , luhnDouble, luhn
) where

-- $ex1
-- Using library functions, define a function @halve :: [a] -> ([a],[a])@ that
-- splits an even-lengthed list into two halves.
--
-- For example
--
-- >>>halve [1, 2, 3, 4, 5, 6]
-- ([1,2,3],[4,5,6])

-- |Split a list on two halves.
halve :: [a] -> ([a],[a])
halve xs = (take n xs, drop n xs) 
              where n = length xs `div` 2

-- $ex2
-- Define a function @third :: [a] -> a@ that returns the third element in a list
-- that contains a least this many elements using:
--
-- * 'Prelude.head' and 'Prelude.tail';
-- * list indexing '!!';
-- * pattern matching
--
-- Note: the functions will be called thirdA thirdB thirdC

-- |Returns the third element in a list.
--
-- Version using 'Prelude.head' and 'Prelude.Tail'
thirdA :: [a] -> a
thirdA xs = head (tail (tail xs))

-- |Returns the third element in a list.
--
-- Note: Version using list indexing '!!'
thirdB :: [a] -> a
thirdB xs = xs !! 2     -- index starting in 0 

-- |Returns the third element in a list.
--
-- Note: Version using /pattern matching/
thirdC :: [a] -> a
thirdC (_:_:x:_) = x 

-- $ex3
-- Consider a function @safetail :: [a] -> [a]@ that behaves in the same way
-- as 'tail' except that it maps the empty list to itself rather than producing an
-- error. Using 'tail' and the function @'null' :: [a] -> Bool@ that decides if a
-- list is empty or not, define @safetail@ using:
--
-- * a conditional expression;
-- * guarded equations;
-- * pattern matching.
--
-- Note: the functions will be called safetailA, safetailB, safetailC

-- |Like 'tail' return last element in a list. If the list is empty
-- returns the empty list.
--
-- Note: version using a /conditional expression/
safetailA :: [a] -> [a]
safetailA xs = if null xs
                  then []
                  else tail xs

-- |Like 'tail' return last element in a list. If the list is empty
-- returns the empty list.
--
-- Note: version using /guarded equations/
safetailB :: [a] -> [a]
safetailB xs
  | null xs   = []
  | otherwise = tail xs

-- |Like 'tail' return last element in a list. If the list is empty
-- returns the empty list.
--
-- Note: version using /pattern matching/
safetailC :: [a] -> [a]
safetailC []     = []
safetailC (x:xs) = xs

-- $ex4
-- In a similar way to '&&' in section 4.4, show how the disjunction operator '||'
-- can be defined in four different ways using pattern matching.
--
-- Note: I do no redefine '||'. I cannot create versions of it. Instead, I create a
-- function @disjunction@ with 4 version 'disjunctionA', 'disjunctionB', 'disjunctionC'
-- and 'disjunctionD'.

-- |Disjunction operator
--
-- First version, express all patterns
disjunctionA :: Bool -> Bool -> Bool
True  `disjunctionA` True  = True 
True  `disjunctionA` False = True 
False `disjunctionA` True  = True 
False `disjunctionA` False = False 

-- |Disjunction operator
--
-- Note: A pattern for @False || False@ and a catch all pattern
--
disjunctionB :: Bool -> Bool -> Bool
False `disjunctionB` False = False 
_     `disjunctionB` _     = True 

-- |Disjunction operator
--
-- Note: Two patterns with the first argument
disjunctionC :: Bool -> Bool -> Bool
False `disjunctionC` a = a 
True  `disjunctionC` _ = True 


-- |Disjunction operator
--
-- Note: Using pattern matching and guarded equations
disjunctionD :: Bool -> Bool -> Bool
b `disjunctionD` c | b == c = b
                   | otherwise = True

-- $ex5
-- Without using any other library functions or operators, show how the meaning
-- of the following pattern matching definition for logical conjunction '&&' can be
-- formalised using conditional expression:
--
-- @
--      True && True = True
--      _    && _    = False
-- @
--
-- Hint: use two nested conditional expressions.
-- 
-- Note: Instead of redefine '&&' operator I prefer create a new function 'op'.
-- 'and' is defined in "Prelude".

-- | 'op' is like conjunction operator. 
--
-- prop> a `op` b == a && b
op :: Bool -> Bool -> Bool
op a b = if a
            then if b 
                    then True
                    else False
            else False

-- $ex6
-- Do the same for the following alternative definition, and note the difference
-- in the number of conditional expressions that are required:
--
-- @
--      True && b  = b
--      False && _ = False
-- @
--
-- Note: In this exercise I called the operator op2.

-- | 'op' is like conjunction operator. 
--
-- prop> a `op` b == a && b
op2 :: Bool -> Bool -> Bool
op2 a b = if a 
             then b
             else False

-- $ex7
-- Show how the meaning of the following curried function definition can be
-- formalised in terms of lambda expressions:
--
-- @
--      mult :: Int -> Int -> Int -> Int
--      mult x y z = x*y*z
-- @

-- |Multiplication of three numbers
mult :: Int -> (Int -> (Int -> Int))
mult = \x -> (\y -> (\z -> x*y*z))

-- $ex8
-- The /Luhn algorithm/ is used to check bank card numbers for simple errors
-- such as mistyping a digit, and proceeds as follows:
--
-- * consider each digit as a separate number;
-- * moving left, double every other number from the second last;
-- * subtract 9 from each number that is now greater than 9;
-- * add all the resulting numbers together;
-- * if the total is divisible by 10, the card is valid
--
-- Define a function @luhnDouble :: Int -> Int@ that doubles a digit and subtract
-- 9 if the result is greater than 9. For example:
--
-- @
--      > luhnDouble 3
--      6
--      > luhnDouble 6
--      3
-- @
--
-- Using @luhnDouble@ and the integer remainder function 'mod', define a function
-- @luhn :: Int -> Int -> Int -> Int -> Bool@ that decides if a four-digit
-- bank card number is valid. For example:
--
-- @
--      > luhn 1 7 8 4
--      True
--      > luhn 4 7 8 3
--      False
-- @
--
-- In the exercises for chapter 7 we will consider a more general version of this
-- function that accepts card numbers of any length.

-- |Double a digit and if the result is greater than 9, subtract 9.
luhnDouble :: Int -> Int
luhnDouble d = (2 * d) `mod` 9
{-
luhnDouble d = if d > 10 
                  then d - 9
                  else d
                    where d = 2*d
-}

-- | Decides if a 4 digit bank number is valid using the /Luhn Algorithm/.
luhn :: Int -> Int -> Int -> Int -> Bool
luhn x y w z = sum [xx,y,ww,z] `mod` 10 == 0
  where ww = luhnDouble w
        xx = luhnDouble x
