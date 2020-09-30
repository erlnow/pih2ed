-- |
-- Module      :  IntroExercisesSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Test and uses of module IntroExercises.
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
--      ghci> hspec IntroExercisesSpec.spec
-- @

module IntroExercisesSpec where

import Test.Hspec
import Test.QuickCheck

import IntroExercises

spec :: Spec
spec = do
  describe "sum of singleton" $ do
    it "sum [x] == x" $ property $ do
      \x -> sum [x] == (x :: Int)

  describe "qsortRev" $ do
    it "qsort reverse order" $ do
      qsortRev [2,4,1,3,5] `shouldBe` [5,4,3,2,1]

  describe "qsort modified" $ do
    it "eliminate duplicated" $ do
      qsort [2,2,3,1,1] `shouldBe` [1,2,3]
