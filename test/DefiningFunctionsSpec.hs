-- |
-- Module      :  DefiningFunctionsSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests and uses from 'DefiningFunctionsSpec'
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
--      gchi> hspec DefiningFunctionsSpec.spec
-- @

module DefiningFunctionsSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import DefiningFunctions as M

import Prelude hiding (not,(&&), head, tail, const, sum)

spec :: Spec
spec = do
  describe "New from old" $ do
    context "even" $ do
      it "even" $ do
        M.even 3 `shouldBe` False
      it "even" $ do
        M.even 4 `shouldBe` True

    context "splitAt" $ do
      it "at 0" $ do
        M.splitAt 0 [1,2,3] `shouldBe` ([], [1,2,3])
      it "at negative number" $ do
        M.splitAt (-2) [1,3] `shouldBe` ([], [1,3])
      it "at large number" $ do
        M.splitAt 3 [1,3] `shouldBe` ([1,3], [])

    context "recip" $ do
      -- it "of 0" $ do
      --  recip 0 `shouldBe` (Infinity :: Fractional)
      it "a number" $ do
        M.recip 10 `shouldBe` 0.1

  describe "Conditional expression" $ do
    context "abs" $ do
      it "positive" $
        M.abs 3 `shouldBe` 3
      it "negative" $ do
        M.abs (-3) `shouldBe` 3
    context "signum" $ do
      it "cero" $ do
        M.signum 0 `shouldBe` 0
      it "positive" $ do
        M.signum 3 `shouldBe` 1
      it "negative" $ do
        M.signum (-3) `shouldBe` -1
    context "laws" $ do
      it "abs is cero o positive" $ property $ do
        \x -> M.abs x >= 0
      it "signum x abs of a number is this number" $ property $ do
        \x -> (M.abs x) * (M.signum x) == x

  describe "Guarded equations" $ do
    it " abs == abs'" $ property $ do
      \x -> M.abs x == abs' x
    it " signum == signum'" $ property $ do
      \x -> M.signum x == signum' x

  describe "Pattern matching" $ do
    context "simply arguments" $ do
      it "not" $ do
        not True `shouldBe` False
      it "&&" $ do
        True && False `shouldBe` False
    context "tuple patterns" $ do
      it "fst" $ do
        M.fst (0, 1) `shouldBe` 0
      it "snd" $ do
        M.snd (0,1) `shouldBe` 1
    context "list patterns" $ do
      it "test" $ do
        test "abc" `shouldBe` True
      it "head" $ do
        head [1,2,3] `shouldBe` 1
      it "tail" $ do
        tail [1,2,3] `shouldBe` [2,3]
      it "head with []" $ do
        evaluate (head []) `shouldThrow` anyException
      it "tail with []" $ do
        evaluate (tail []) `shouldThrow` anyException 

  describe "lambda expressions" $ do
    it "add" $ do
      add 1 2 `shouldBe` 3
    it "const" $ do
      const 42 "hello" `shouldBe` 42 
    it "odds" $ do
      odds 5 `shouldBe` [1, 3, 5, 7, 9]

  describe "operator sections" $ do
    it "sum" $ do
      sum [0..10] `shouldBe` 55
