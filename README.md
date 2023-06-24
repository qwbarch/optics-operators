# optics-operators

[![build](https://github.com/qwbarch/optics-operators/actions/workflows/build.yml/badge.svg)](https://github.com/qwbarch/optics-operators/actions/workflows/build.yml) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

A tiny package containing operators missing from the official package.

## Why does this package exist?

The [optics](https://hackage.haskell.org/package/optics) library is missing convenient operators that the [lens](https://hackage.haskell.org/package/lens-5.2.2/docs/Control-Lens-Operators.html)
library provides.  
I've only added the operators I need for now. Feel free to open an issue or pull request to add new ones.

## Quick start

This is a literate haskell file. You can run this example via the following:
```
nix develop --command cabal run
```

Necessary language extensions and imports for the example:
```haskell
{-# LANGUAGE DeriveGeneric, OverloadedLabels #-}
import GHC.Generics (Generic)
import Control.Monad.State (StateT, execStateT)
import Data.Optics.Operators ((+=), (-=), (*=))
import Control.Monad ((<=<))
```

Basic example using state operators:
```haskell
newtype Person = Person
  { age :: Int
  } deriving (Show, Generic)

addAge :: Int -> StateT Person IO ()
addAge age = #age += age

subtractAge :: Int -> StateT Person IO ()
subtractAge age = #age -= age
```

Running the example:
```haskell
person :: Person
person = Person 50

main :: IO ()
main = print <=< flip execStateT person $ do
  addAge 10
  subtractAge 20
  #age *= 2

-- Output: Person {age = 80}
```
