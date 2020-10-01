-- |
-- Module      :  ListComprehensionSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests and uses of module 'ListComprehension'
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
--      ghci> hspec ListComprehensionSpec.hs
-- @

module ListComprehensionSpec (spec) where

import Test.Hspec
import ListComprehension as L

spec :: Spec
spec = do
  describe "examples of 5.1 Basic concepts" $ do
    it "concat" $ do
      L.concat ["abc","def","gh"] `shouldBe` "abcdefgh"
    it "firsts" $ do
      firsts [(0,1),(1,2),(2,3)] `shouldBe` [0,1,2]
    it "length" $ do
      L.length "abcdefgh" `shouldBe` 8

  describe "examples of 5.2 Guards" $ do
    it "factors" $ do
      factors 15 `shouldBe` [1,3,5,15]
    it "prime 15 is False" $ do
      prime 15 `shouldBe` False
    it "prime 7 is True" $ do
      prime  7 `shouldBe` True
    it "prime" $ do
      primes 40 `shouldBe` [2,3,5,7,11,13,17,19,23,29,31,37]
    it "find" $ do
      find 'b' [('a',1),('b',2),('c',3),('b',4)] `shouldBe` [2,4]

  describe "The zip function" $ do
    it "pairs" $ do
      pairs [1,2,3,4] `shouldBe` [(1,2),(2,3),(3,4)]
    context "sorted" $do
      it "sorted" $ do
        sorted [1,2,3,4] `shouldBe` True
      it "not sorted" $ do
        sorted [1,3,2,4] `shouldBe` False
    it "positions" $ do
      positions False [True, False, True, False] `shouldBe` [1,3]
