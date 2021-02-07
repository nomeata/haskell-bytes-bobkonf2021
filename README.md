“Haskell Bytes“ - a BOB 2021 tutorial
=====================================

Welcome to the Haskell Bytes tutorial. This repository contains setup
instructions.

Setup
-----

* Install GHC 8.8 and cabal-3.2. Other versions should work as well, at your own risk
  ```
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
  ghcup set ghc 8.8
  ghcup set cabal 3.2
  ```

* Install `ghc-heap-view` into the current directory:
  ```
  cabal update
  cabal install --env . --lib ghc-heap-view
  ```

* Install `ghc-vis` into the current directory. This may require installing
  additional `-dev` packages.
  ```
  cabal update
  cabal install --env . --lib ghc-vis
  ```

* Check that it works:

  Run
  ```
  ghci
  ```
  and check that it says something like
  ```
  Loaded package environment from /home/…/.ghc.environment.x86_64-linux-8.8.4
  ```

  Enter
  ```
  GHC.Vis.vis
  ```
  into the ghci prompt and it should open an window.

  Enter
  ```
  GHC.Vis.view "Hallo" "Hallo"
  ```
  into the ghci prompt and the window should update in weird ways.

