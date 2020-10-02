-- |
-- Module      :  CaesarSpec
-- Copyright   :  erlnow 2020 - 2030
-- License     :  BSD3
--
-- Maintainer  :  erlestau@gmail.com
-- Stability   :  experimental
-- Portability :  unknown
--
-- Tests of 'Caesar' module.
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
--      ghci> hspec CaesarSpec.hs
-- @

module CaesarSpec (spec) where

import Test.Hspec
import Test.QuickCheck

import Data.Char
import Caesar

spec :: Spec
spec = do

  describe "Caesar Cipher" $ do
    describe "let2int and int2let" $ do
      -- 'let2int' and 'int2let' assume values
      -- between 'a'..'z' and 0..25.
      -- Probabily I should use generators but
      -- I don't know how.
      it "returns a number between 0 and 25" $ property $ do
        \c -> if isAsciiLower c
                 then let2int c >= 0 && let2int c <= 25 
                 else True 
      it "returns a character between a and z" $ property $ do
        \n -> if n >= (0 :: Int) && n <= (25 :: Int)
                 then int2let n >= 'a' && int2let n <= 'z' 
                 else True
      it "for any char" $ property $ do
        \c -> if isAsciiLower c 
                 then int2let (let2int c) == c
                 else True
      it "let2int a" $ do
        let2int 'a' `shouldBe` (0 :: Int)
      it "int2let 0" $ do
        int2let 0 `shouldBe` 'a'

    describe "shift" $ do
      it "shift 3 'a' == d" $ do
        shift 3 'a' `shouldBe` 'd'
      it "shift 3 'z' == 'c'" $ do
        shift 3 'z' `shouldBe` 'c'
      it "shift (-3) 'c' == 'z'" $ do
        shift (-3) 'c' `shouldBe` 'z'
      it "shift 3 ' '" $ do
        shift 3 ' ' `shouldBe` ' '

    describe "encode" $ do
      it "encode" $ do
        encode 3 "haskell is fun" `shouldBe` "kdvnhoo lv ixq"
      it "to decode apply a negative shift" $ do
        encode (-3) "kdvnhoo lv ixq" `shouldBe` "haskell is fun"

  describe "Frequencies table" $ do
    context "table" $ do
      it "length of table" $ do
        length table `shouldBe` 26
      it "maximum of table is the freq of e" $ do
        table !! (let2int 'e') `shouldBe` maximum table
    it "percent 5 15" $ do
      percent 5 15 `shouldBe` 33.333336
    it "freqs" $ do
      take 4 (freqs "abbcccddddeeeee") `shouldBe` [6.666667, 13.333334, 20.0, 26.666668]

  describe "cracking the cipher" $ do
      it "chisqr" $ do
        pending
      it "rotate" $ do
        rotate 3 [1,2,3,4,5] `shouldBe` [4,5,1,2,3]
      context "crack" $ do
        it "kdvnhoo lv ixq" $ do
          crack "kdvnhoo lv ixq" `shouldBe` "haskell is fun"
        it "vscd mywzboroxcsyxc kbo ecopev" $ do
          crack "vscd mywzboroxcsyxc kbo ecopev" `shouldBe` "list comprehensions are useful"


