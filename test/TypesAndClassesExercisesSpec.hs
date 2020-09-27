-- |
-- Module      :  TypesAndClassesExercisesSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Test for module @TypesAndClassesExercises@ from chapter 3
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
--      gchi> hspec TypesAndClassesExercisesSpec.spec
-- @

module TypesAndClassesExercisesSpec (spec) where

import Test.Hspec

import TypesAndClassesExercises

spec :: Spec
spec = do
  describe "Exercise 1" $ do
    it "ex1" $ do
      ex1 `shouldBe` "abc"
    it "ex2" $ do
      ex2 `shouldBe` ('a','b','c')
    it "ex3" $ do
      ex3 `shouldBe` ([False,True],"01")
    it "ex4" $ do
      (head ex4) [1,2,3] `shouldBe` [2,3]

  describe "Exercise 2" $ do
    it "bools" $ do
      bools `shouldBe` [True, False]
    it "nums" $ do
      nums `shouldBe` [[1,3,5,7,9], [2,4,6,8,10]]
    it "add" $ do
      add 1 2 3 `shouldBe` 6
    it "copy" $ do
      copy 1 `shouldBe` (1,1)
    it "apply" $ do
      apply (*10) 1 `shouldBe` 10

  describe "Exercises 3" $ do
    it "second" $ do
      second [1,2] `shouldBe` 2
    it "swap" $ do
      swap (1, 'a') `shouldBe` ('a', 1)
    it "pair" $ do 
      pair 2 'b' `shouldBe` (2, 'b') 
    it "double" $ do
      double (-4) `shouldBe` (-8)
    it "palindrome" $ do
      palindrome "aibofobia" `shouldBe` True
    it "twice" $ do
      twice double 2 `shouldBe` 8

