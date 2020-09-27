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
import DefiningFunctions

spec :: Spec
spec = do
  describe "New from old" $ do
    context "even" $ do
      it "even" $ do
        even 3 `shouldBe` False
      it "even" $ do
        even 4 `shouldBe` True

    context "splitAt" $ do
      it "at 0" $ do
        splitAt 0 [1,2,3] `shouldBe` ([], [1,2,3])
      it "at negative number" $ do
        splitAt (-2) [1,3] `shouldBe` ([], [1,3])
      it "at large number" $ do
        splitAt 3 [1,3] `shouldBe` ([1,3], [])

    context "recip" $ do
      -- it "of 0" $ do
      --  recip 0 `shouldBe` (Infinity :: Fractional)
      it "a number" $ do
        recip 10 `shouldBe` 0.1
