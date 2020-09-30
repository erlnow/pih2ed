-- |
-- Module      :  DefiningFunctionsExercisesSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests and uses of module DefiningFunctionsExercises.
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
--      gchi> hspec DefiningFunctionsExercisesSpec.spec
-- @

module DefiningFunctionsExercisesSpec (spec) where

import Test.Hspec
import DefiningFunctionsExercises

spec :: Spec
spec = do
  describe "Exercise 1" $ do
    it "halve [1,2,3,4,5,6] == ([1,2,3],[4,5,6])" $ do
      halve [1,2,3,4,5,6] `shouldBe` ([1,2,3],[4,5,6])

  describe "Exercise 2" $ do
    context "case a. with head and tail" $ do
      it "third [1,2,3,4,5] == 3" $ do
        thirdA [1,2,3,4,5] `shouldBe` 3
    context "case b. with !!" $ do
      it "third [1,2,3,4,5] == 3" $ do
        thirdB [1,2,3,4,5] `shouldBe` 3
    context "case c. with pattern matching" $ do
      it "third [1,2,3,4,5] == 3" $ do
        thirdC [1,2,3,4,5] `shouldBe` 3

  describe "Exercise 3" $ do
    context "case a with conditional expression" $ do
      it "safetail [] == []" $ do
        safetailA [] `shouldBe` ([] :: [Int])
      it "safetail [1,2,3] == [2,3]" $ do
        safetailA [1,2,3] `shouldBe` [2,3]
    context "case b with guarded equations" $ do
      it "safetail [] == []" $ do
        safetailB [] `shouldBe` ([] :: [Int])
      it "safetail [1,2,3] == [2,3]" $ do
        safetailB [1,2,3] `shouldBe` [2,3]
    context "case c with pattern matching" $ do
      it "safetail [] == []" $ do
        safetailC [] `shouldBe` ([] :: [Int])
      it "safetail [1,2,3] == [2,3]" $ do
        safetailC [1,2,3] `shouldBe` [2,3]

  describe "Exercise 4" $ do
    context "Caso 1" $ do
      it "True || True == True" $ do
        True `disjunctionA` True `shouldBe` True
      it "True || False == True" $ do
        True `disjunctionA` False `shouldBe` True
      it "False || True == True" $ do
        False `disjunctionA` True `shouldBe` True
      it "False || False == False" $ do
        False `disjunctionA` False `shouldBe` False
    context "Caso 2" $ do
      it "True || True == True" $ do
        True `disjunctionB` True `shouldBe` True
      it "True || False == True" $ do
        True `disjunctionB` False `shouldBe` True
      it "False || True == True" $ do
        False `disjunctionB` True `shouldBe` True
      it "False || False == False" $ do
        False `disjunctionB` False `shouldBe` False
    context "Caso 3" $ do
      it "True || True == True" $ do
        True `disjunctionC` True `shouldBe` True
      it "True || False == True" $ do
        True `disjunctionC` False `shouldBe` True
      it "False || True == True" $ do
        False `disjunctionC` True `shouldBe` True
      it "False || False == False" $ do
        False `disjunctionC` False `shouldBe` False
    context "Caso 4" $ do
      it "True || True == True" $ do
        True `disjunctionD` True `shouldBe` True
      it "True || False == True" $ do
        True `disjunctionD` False `shouldBe` True
      it "False || True == True" $ do
        False `disjunctionD` True `shouldBe` True
      it "False || False == False" $ do
        False `disjunctionD` False `shouldBe` False

  describe "Exercise 5" $ do
    it "True && True == True" $ do
      True `op` True `shouldBe` True
    it "True && False == False" $ do
      True `op` False `shouldBe` False
    it "False && True == False" $ do
      False `op` True `shouldBe` False
    it "False && False == False" $ do
      False `op` False `shouldBe` False

  describe "Exercise 6" $ do
    it "True && True == True" $ do
      True `op2` True `shouldBe` True
    it "True && False == False" $ do
      True `op2` False `shouldBe` False
    it "False && True == False" $ do
      False `op2` True `shouldBe` False
    it "False && False == False" $ do
      False `op2` False `shouldBe` False

  describe "Exercise 7" $ do
    it "mult 3 4 5 == 60" $ do
      mult 3 4 5 `shouldBe` 60


  describe "Exercise 8" $ do
    it "luhnDouble 3 == 6" $ do
      luhnDouble 3 `shouldBe` 6
    it "luhnDouble 6 == 3" $ do
      luhnDouble 6 `shouldBe` 3
    it "luhn 1 7 8 4 == True" $ do
      luhn 1 7 8 4 `shouldBe` True
    it "luhn 4 7 8 3 == False" $ do
      luhn 4 7 8 3 `shouldBe` False
