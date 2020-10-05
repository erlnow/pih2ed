-- |
-- Module      :  RecursionSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests and uses for 'Recursion' module
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
--      ghci> hspec RecursionSpec.hs
-- @

module RecursionSpec (spec) where

import Test.Hspec

import Data.List (insert)
import qualified Recursion as R

spec :: Spec
spec = do
  describe "6.1 Basic concepts" $ do
    it "fac" $ do
      R.fac 3 `shouldBe` 6
    it "op (*)" $ do
      4 `R.op` 3 `shouldBe` 12
    
  describe "6.2 Recursion on lists" $ do
    it "product" $ do
      R.product [2,3,4] `shouldBe` product [2,3,4]
    it "length" $ do
      R.length [2,3,4] `shouldBe` length [2,3,4]
    it "reverse" $ do
      R.reverse [2,3,4] `shouldBe` reverse [2,3,4]
    it "op2 (++)" $ do
      [1,2,3] `R.op2` [4,5] `shouldBe` [1,2,3] ++ [4,5]
    it "insert" $ do
      R.insert 3 [1,2,4,5] `shouldBe` insert 3 [1,2,4,5]
    it "isort" $ do
      R.isort [3,2,1,4] `shouldBe` [1,2,3,4]

  describe "6.3 Multiple arguments" $ do
    it "zip" $ do
      R.zip ['a','b','c'] [1,2,3,4] `shouldBe` zip "abc" [1,2,3,4]
    it "drop" $ do
      R.drop 2 [1,2,3,4,5] `shouldBe` drop 2 [1,2,3,4,5]

  describe "6.4 Multiple recursion" $ do
    it "fib" $ do
      R.fib 7 `shouldBe` 13
    it "qsort" $ do
      R.qsort [2,3,1,5,4] `shouldBe` [1,2,3,4,5]

  describe "6.5 Mutual recursion" $ do
    it "even" $ do
      R.even 4 `shouldBe` True
    it "odd" $ do
      R.odd 4 `shouldBe` False
    it "evens" $ do
      R.evens "abcde" `shouldBe` "ace"
    it "odds" $ do
      R.odds "abcde" `shouldBe` "bd"

  describe "6.6 Advice on recursion" $ do
    it "product" $ do
      R.product' (map (R.fib) [1..10]) `shouldBe` R.product (map (R.fib) [1..10])
    it "drop'" $ do
      R.drop' 3 [1,2,3,4,5] `shouldBe` drop 3 [1,2,3,4,5]
    it "init" $ do
      R.init [1,2,3,4,5] `shouldBe` init [1,2,3,4,5]

