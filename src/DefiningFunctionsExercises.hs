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
--      gchi> hspec DefiningFunctionsExercises.spec
-- @

module DefiningFunctionsExercises (
                                    halve
                                  , thirdA, thirdB, thirdC
                                  , safetailA, safetailB, safetailC
                                  , disjunctionA, disjunctionB
                                  , disjunctionC, disjunctionD
                                  , op, op2, mult
                                  , luhn, luhnDouble
) where

-- |/Exercise 1/, pag 45:
-- Using library functions, define a function @halve :: [a] -> ([a],[a]) that
-- splits an even-lengthed list into two halves. For example
--
-- @
--      > halve [1, 2, 3, 4, 5, 6]
--      ([1,2,3],[4,5,6])
-- @
halve :: [a] -> ([a],[a])
halve xs = (take n xs, drop n xs) 
              where n = length xs `div` 2

-- |/Exercise 2/, pag 45:
-- Define a function @third :: [a] -> a@ that returns the third element in a list
-- that contains a least this many elements using:
-- a. 'Prelude.head' and 'Prelude.tail';
-- b. list indexing '!!';
-- c. pattern matching
--
-- Note: the functions will be called thirdA thirdB thirdC

-- | case a. with 'head' and 'tail'
thirdA :: [a] -> a
thirdA xs = head (tail (tail xs))

-- | case b. with list indexing '!!'
thirdB :: [a] -> a
thirdB xs = xs !! 2     -- index starting in 0 

-- | case c. pattern matching
thirdC :: [a] -> a
thirdC (_:_:x:_) = x 

-- |/Exercise 3/, pag 45:
-- Consider a function @safetail :: [a] -> [a]@ that behaves in the same way
-- as 'tail' except tha it maps the empty list to itself rather than producing an
-- error. Using 'tail' and the function 'null'@ :: [a] -> Bool@ that decides if a
-- list is empty or not, define @safetail@ using:
-- a. a conditional expression;
-- b. guarded equations;
-- c. pattern matching.
--
-- Note: the functions will be called safetailA, safetailB, safetailC

-- | @safetail@ using a conditional expression 
safetailA :: [a] -> [a]
safetailA xs = if null xs
                  then []
                  else tail xs

-- | @safetail@ using guarded equations
safetailB :: [a] -> [a]
safetailB xs
  | null xs   = []
  | otherwise = tail xs

-- | @safetail@ using pattern matching
safetailC :: [a] -> [a]
safetailC []     = []
safetailC (x:xs) = xs

-- |/Exercise 4/, pag. 45:
-- In a similar way to '&&' in section 4.4, show how the disjunction operarator '||'
-- can be defined in four differentes ways using patter natching.
--
-- Note: I do no redefine ||. I cannot create versions of it. Instead, I create a
-- function @disjunction@ with 4 version 'disjunctionA', 'disjunctionB', 'disjunctionC'
-- and 'disjunctionD'.

-- |'disjuctionA' is the first version on my own '||' operator.
disjunctionA :: Bool -> Bool -> Bool
True  `disjunctionA` True  = True 
True  `disjunctionA` False = True 
False `disjunctionA` True  = True 
False `disjunctionA` False = False 

-- |'disjuctionB' is the second version on my own '||' operator.
disjunctionB :: Bool -> Bool -> Bool
False `disjunctionB` False = False 
_     `disjunctionB` _     = True 

-- |'disjuctionC' is the third version on my own '||' operator.
disjunctionC :: Bool -> Bool -> Bool
False `disjunctionC` a = a 
True  `disjunctionC` _ = True 


-- |'disjuctionD' is the fourth version on my own '||' operator.
disjunctionD :: Bool -> Bool -> Bool
b `disjunctionD` c | b == c = b
                   | otherwise = True

-- |/Exercise 5/, pag 45:
-- Without using any other library functions or operators, show how the meaning
-- of the following pattern matching definition for logical conjuction '&&' can be
-- formalised using conditional expression:
-- @
--      True && True = True
--      _    && _    = False
-- @
--
-- Hint: use two nested conditional expressions.
-- Note: Instead of redefine '&&' operator I prefer create a new function 'op',
-- 'and' is defined in Prelude.
op :: Bool -> Bool -> Bool
op a b = if a
            then if b 
                    then True
                    else False
            else False

-- |/Exercise 6/, pag. 46:
-- Do the same for the following alternative definition, and note the difference
-- in the number of conditional expressions that are required:
-- @
--      True && b  = b
--      False && _ = False
-- @
--
-- Note: In this exercise I called the operator op2.
op2 :: Bool -> Bool -> Bool
op2 a b = if a 
             then b
             else False

-- |/Exercise 7/, pag. 46:
-- Show how the meaning of the following curried function definition can be
-- formalised in terms of lambda expressions:
-- @
--      mult :: Int -> Int -> Int -> Int
--      mult x y z = x*y*z
-- @
mult :: Int -> (Int -> (Int -> Int))
mult = \x -> (\y -> (\z -> x*y*z))

-- |/Exercise 8/, pag. 46:
-- The /Luhn algorithm/ is used to check bank card numbers for simple errors
-- such as mistyping a digit, and proceeds as follows:
-- * consider each digit as a separate number;
-- * moving left, double every other number from the second last;
-- * substract 9 from each number that is now greater than 9;
-- * add all the resulting numbers together;
-- * if the total is divisible by 10, the card is valid
--
-- Define a functio @luhnDouble :: Int -> Int that doubles a digit and substract
-- 9 if the result is greater than 9. For example:
-- @
--      > luhnDouble 3
--      6
--      > luhnDouble 6
--      3
-- @
--
-- Using @luhnDouble@ and the integer remainder function 'mod', define a function
-- @luhn :: Int -> Int -> Int -> Int -> Bool that decides if a four-digit
-- bank card number is valid. For example:
-- @
--      > luhn 1 7 8 4
--      True
--      > luhn 4 7 8 3
--      False
-- @
--
-- In the exercises for chapter 7 we will consider a more general version of this
-- function that accepts card numbers of any length.

-- |Double a digit and if the result is greater than 9, substract 9.
luhnDouble :: Int -> Int
luhnDouble d = (2 * d) `mod` 9
{-
luhnDouble d = if ld > 10 
                  then ld - 9
                  else ld
                    where ld = 2*d
-}

-- | Decides if a 4 digit bank number is valid using the /Luhn Algorith/.
luhn :: Int -> Int -> Int -> Int -> Bool
luhn x y w z = sum [xx,y,ww,z] `mod` 10 == 0
  where ww = luhnDouble w
        xx = luhnDouble x
        
        
