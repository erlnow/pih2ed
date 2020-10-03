# pih2e

Examples and exercises from the book:

  *Programming in Haskell* second edition  
  by *Graham Hutton*, University of Nottingham  
  Cambridge University Press, 1st September 2016
  Paperback: ISBN 978-1316626221; Kindle: ASIN B01JGMEA3U

This book doesn't require a programming experience. For more information visit its
[web book][1]

[1]: (http://www.cs.nott.ac.uk/~pszgmh/pih.html).

## Install

~~~
$ git clone 
...
$ cd pih2e 
$ cabal new-repl  # load all modules
...
~~~

## How to code

In chapter 2, the author recommends to install **[Haskell Platform][1]**,
use any editor and play with the code with `ghci` a *REPL* for Haskell
that [Haskell Platform][1] provides.

To install [Haskell Platform][1] in [Debian][2], you must type in command line:

~~~
  $ sudo apt-get install haskell-platform
~~~

But, many coders, doesn't follow that. For example, [Chris Allen][3] in [How
to learn Haskell][4], article I try to follow, says to get [Stack][5].
And links to a [comprehensive Stack video tutorial][6] and point to [mail list
with reasons to not install][7] [Haskell Platform][1].

For this project I use [Cabal][8], to create and modify `.cabal` file I
modify `package.yaml` and run `hpack`. [Hpack][9] is a format for Haskell
packages. Although there isn't a official reference, these [slides][10]
are a good introduction to [Hpack][9].

My editor of choice is [NeoVim][11]. For [LSP][12], I use the plugin
[coc.nvim][13]. For Haskell I installed the language server configuration
[Haskell Language Server][14].

Normally I open many buffers and splits and tabs in [NeoVim][11]. One 
split is a [nvim terminal emulator][15] for running `cabal new-repl` 
that runs `ghci` and loads libraries and executable of the package.

Another plugin that I recommend is [vim-fugitive][16] a plugin for `Git`.

I try to document my code with [Haddock][17] and for test the code I use
[Hspec][18] and [QuickCheck][19].

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
  qsort modified
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

[3]: https://github.com/bitemyapp
[4]: https://github.com/bitemyapp/learnhaskell
[5]: https://docs.haskellstack.org/en/stable/README/
[6]: https://youtu.be/sRonIB8ZStw
[7]: https://mail.haskell.org/pipermail/haskell-community/2015-September/000014.html
[8]: <https://www.haskell.org/cabal/> "Cabal: Common Architecture for Building Application and Libraries"
[9]: https://github.com/sol/hpack#readme
[10]: http://typeful.net/talks/hpack "Haskell Singapore meetup" 
[11]: https://neovim.io
[12]: https://langserver.org
[13]: https://github.com/neoclide/coc.nvim
[14]: https://github.com/haskell/haskell-language-server
[15]: https://neovim.io/doc/user/nvim_terminal_emulator.html
[16]: https://github.com/tpope/vim-fugitive
[17]: https://www.haskell.org/haddock/
[18]: https://hspec.github.io/
[17]: https://hackage.haskell.org/package/QuickCheck


## Contents

### Chapter 1: Introduction

In this chapter the author introduce the concept of functional programming.
In *give a taste* of Haskell, the author presents three small programs.

Code:
* `Intro.hs` - chapter examples
* `IntroExercises.hs` - chapter exercises
* `test/IntroSpec.hs` - test of `Intro.hs`
* `test/IntroExercisesSpec.hs` - test of `IntroExercises.hs`

### Chapter 2: First Steps

First steps to code in Haskell. The book introduces GHC system, edit code and
play with `ghci`.

Code:
* `MyFirstExercises.hs` - exercises
* `test\MyFirstSpec.hs` - tests of `MyFirst.hs`.
* `test\MyFirstExercisesSpec` - tests of `MyFirstSpecExercises.hs`

### Chapter 3: Types and classes

A type is a collection of related values. In this chapter explain
what is a type, basic types of Haskell and two compound types: lists
and tuples. Functions have a type too. Concepts as curried functions.
Many functions can apply to values of any type, there is something
called *class constrains*, with this concept explains *Overload Types
and operators*.  Presents some *Basic classes* an its overload
operators.

Code:
* TypesAndClasses.hs chapter's examples.
* test/TypesAndClassesSpec.hs test and uses of module `TypesAndClasses`.
* TypesAndClassesExercises.hs chapter's exercises.
* test/TypesAndClassesExercisesSpec.hs test and uses of module 'TypesAndClassesExercises'.

### Chapter 4: Defining functions

Concepts like make functions combining other functions,
using conditional expression, guards o pattern matching and lambda
expression are introduced in this chapter.

Code:
* DefiningFunctions.hs
* DefiningFunctionsExercises.hs
* test/DefiningFunctionsSpec.hs
* test/DefiningFunctionsExercisesSpec.hs

### Chapter 5: List Comprehensions

List comprehensions is similar to comprehension notation in mathematics.
In this chapter is explained what is list comprehension, how can be used
to define functions with list and strings. Finally the concept is used
in a example like code, decode and crack the *Caesar cipher*.

Code:
* src/ListComprehension.hs - examples from the chapter
* test/ListComprehensionSpec.hs - test and uses of `ListComprehension`.
* src/Caesar.hs - Caesar cipher example.
* test/CaesarSpec.hs - tests and uses of module `Caesar`
* src/ListComprehensionExercises.hs
* test/ListComprehensionExercisesSpec.hs

### Chapter 6: Recursive functions

Most of programming language have statements for looping or iterate.
In Haskell, the basic mechanism for looping is __recursion__.

Code:
* src/Recursion.hs
* src/RecursionExercises.hs
* test/RecursionSpec.hs
* test/RecursionExercisesSpec.hs

