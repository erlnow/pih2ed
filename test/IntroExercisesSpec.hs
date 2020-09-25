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

  describe "qsort mofied" $ do
    it "elminate duplicated" $ do
      qsort [2,2,3,1,1] `shouldBe` [1,2,3]
