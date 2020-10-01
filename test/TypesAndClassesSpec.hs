-- |
-- Module      :  TypesAndClassesSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests of module @TypesAndClasses@ from chapter 3
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
--      ghci> hspec TypesAndClassesSpec.spec
-- @

module TypesAndClassesSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import TypesAndClasses

spec :: Spec
spec = do
  describe "No curried and curried functions" $ do
    it "no curried version" $ do
      add (3,5) `shouldBe` 8
    it "curried version" $ do
      add' 7 1 `shouldBe` 8
    it "both functions should return the same" $ property $
      \x -> (\y -> add (x,y) == add' x y)

  describe "function with more than two arguments" $ do
    it "mult x y z" $ do
      mult 3 7 1 `shouldBe` 21
