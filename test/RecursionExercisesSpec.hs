-- |
-- Module      :  RecursionExercisesSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests and uses of functions on module 'RecursionExercisesSpec'
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
--      ghci> hspec RecursionExercisesSpec.hs
-- @

module RecursionExercisesSpec (spec) where

import Test.Hspec
import RecursionExercises as R

spec :: Spec
spec = do
  describe "Exercise 1" $ do
    it "fac 0" $ do
      fac 0 `shouldBe` 1
    it "fac positive" $ do
      fac 3 `shouldBe` 6
    it "fac negative and even" $ do
      fac (-4) `shouldBe` 24
    it "fac negative and odd" $ do
      fac (-3) `shouldBe` (-6)

  describe "Exercise 2" $ do
    it "sumdown" $ do
      sumdown 3 `shouldBe` 6
  
  describe "Exercise 3" $ do
    it "exponentiation" $ do
      2 `op` 10 `shouldBe` 1024

  describe "Exercise 4" $ do
    it "euclid" $ do
      euclid 6 27 `shouldBe` 3

  describe "Exercise 6" $ do
    it "and" $ do
      R.and [True, True, False, True] `shouldBe` Prelude.and [True, True, False, True]
    it "concat" $ do
      R.concat [[1,2,3],[4,5]] `shouldBe` Prelude.concat [[1,2,3],[4,5]]
    it "!!" $ do
      [1,2,3,4] `op2` 2 `shouldBe` [1,2,3,4] !! 2
    it "elem" $ do
      'c' `R.elem` "aeiou" `shouldBe` 'c' `Prelude.elem` "aeiou"

  describe "Exercise 7" $ do
    it "merge" $ do
      R.merge [2,5,6] [1,3,4] `shouldBe` [1,2,3,4,5,6]

  describe "Exerxise 8" $ do
    it "msort" $ do
      R.msort [3, 5, 1, 4, 2] `shouldBe` [1, 2, 3, 4, 5]

  describe "Exercise 9" $ do
    it "sum" $ do
      R.sum [1,2,3,4,5] `shouldBe` Prelude.sum [1,2,3,4,5]
    it "take" $ do
      R.take 3 ['a'..'z'] `shouldBe` Prelude.take 3 ['a'..'z']
    it "last" $ do
      R.last [1,2,3,4,5] `shouldBe` Prelude.last [1,2,3,4,5]
