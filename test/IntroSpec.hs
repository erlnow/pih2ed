-- |
-- Module      :  IntroSec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Test module @Intro@.

module IntroSpec where

import Test.Hspec
import Intro

spec :: Spec
spec = do
  describe "double" $ do
    it "returns the double of a number" $ do
      double 3 `shouldBe` 6

  describe "sum" $ do
    it "sumatorial of a list of numbers" $ do
      Intro.sum [1,2,3] `shouldBe` 6

  describe "qsort" $ do
    it "sorts a list of sortable elements" $ do
      qsort [3,5,1,4,2] `shouldBe` [1,2,3,4,5]

