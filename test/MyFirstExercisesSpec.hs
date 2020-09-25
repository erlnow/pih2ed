-- |
-- Module      :  MyFirstExercisesSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests of MyFirstExerces

module MyFirstExercisesSpec (spec) where
  
import Test.Hspec
import Test.QuickCheck

import qualified MyFirstExercises as M

spec :: Spec
spec = do
  describe "n" $ do
    it "n is 2" $ do
      M.n `shouldBe` 2

  describe "last" $ do
    it "last of [1,2,3,4,5] is 5" $ do
      M.last [1,2,3,4,5] `shouldBe` 5
    it "last' of [1,2,3,4,5] is 5" $ do
      M.last' [1,2,3,4,5] `shouldBe` 5

  describe "init" $ do
    it "init of [1,2,3,4,5] is [1,2,3,4]" $ do
      M.init [1,2,3,4,5] `shouldBe` [1,2,3,4]
    it "init' of [1,2,3,4,5] is [1,2,3,4]" $ do
      M.init' [1,2,3,4,5] `shouldBe` [1,2,3,4]

