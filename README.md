# pih2e

Examples and exercises from the book:

  *Programming in Haskell* second edition  
  by *Graham Hutton*, University of Nottingham  
  Cambridge University Press, 1st September 2016
  Paperback: ISBN 978-1316626221; Kindle: ASIN B01JGMEA3U

This book doesn't require a programming experience. For more information visit its
[web](http://www.cs.nott.ac.uk/~pszgmh/pih.html).

## Install

~~~
$ git clone 
...
$ cd pih2e 
$ cabal repl
...
~~~

## Contents

### Chapter 1: Introduction
In this chapter the author introduce the concept of functional programming.
In *give a taste* of Haskell, the author presents three small programs.

Code:
* Intro.hs - chapter examples
* IntroExercises.hs - chapter exercises
* test/IntroSpec.hs - test of Intro.hs
* test/IntroExercisesSpec.hs - test of IntroExercises.hs

All functions are documented using [Haddoc](https://www.haskell.org/haddock/)
and his use and properties are tested by [Hspec](https://hspec.github.io) and
[QuickCheck](https://hackage.haskell.org/package/QuickCheck] tests.

To run the tests:

~~~
$ cabal new-run spec
Up to date

IntroExercises
  sum of singleton
    sum [x] == x
      +++ OK, passed 100 tests.
  qsortRev
    qsort reverse order
  qsort mofied
    elminate duplicated
Intro
  double
    returns the double of a number
  sum
    sumatorial of a list of numbers
  qsort
    sorts a list of sortable elements

Finished in 0.0186 seconds
6 examples, 0 failures
~~~

###Chapte 2: First Steps
