-- |
-- Module      :  ListComprehensionExercisesSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests and uses of module 'ListComprehensionExercises'
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
--      ghci> hspec ListComprehensionExercisesSpec.hs
-- @

module ListComprehensionExercisesSpec (spec) where

import Test.Hspec
import ListComprehensionExercises as L

spec :: Spec
spec = do
  describe "Exercises" $ do
    it "exercise 1" $ do
      sumsqr100 `shouldBe` 338350
    it "exercise 2" $ do
      grid 1 2 `shouldBe` [(0,0),(0,1),(0,2),(1,0),(1,1),(1,2)]
    it "exercise 3" $ do
      square 2 `shouldBe` [(0,1),(0,2),(1,0),(1,2),(2,0),(2,1)]
    it "exercise 4" $ do
      L.replicate 3 True `shouldBe` [True,True,True]
    it "exercise 5" $ do
      pyths 10 `shouldBe` [(3,4,5),(4,3,5),(6,8,10),(8,6,10)]
    it "exercise 6" $ do
      perfects 500 `shouldBe` [6,28,496]
    it "exercise 7" $ do
      list1 == list2 `shouldBe` True 
    it "exercise 8" $ do
      positions False [True, False, True, False] `shouldBe` [1,3]
    it "exercise 9" $ do
      scalarproduct [1,2,3] [4,5,6] `shouldBe` 32
    it "exercise 10" $ do
      caesar 3 "Haskell is fun" `shouldBe` "kdvnhoo lv ixq"
