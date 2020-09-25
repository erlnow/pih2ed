-- |
-- Module      :  MyFirstSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Test @MyFirst@ module from Chapter 2: First steps

module MyFirstSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import MyFirst

spec :: Spec
spec = do
  describe "double" $ do
    it "double 2 is 4" $ do
      double 2 `shouldBe` 4
    it "used as arg to another function" $ do
      take (double 2) [1,2,3,4,5] `shouldBe` [1,2,3,4]

  describe "quadruple" $ do
    it "quadrule 10 is 40" $ do
      quadruple 10 `shouldBe` 40

  describe "factorial" $ do
    it "factorial 10 is 3628800" $ do
      factorial 10 `shouldBe` 3628800

  describe "average" $ do
    it "average of [1..5] is 3" $ do
      average [1..5] `shouldBe` 3
