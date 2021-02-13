“Haskell Bytes“ - a BOB 2021 tutorial
=====================================

Welcome to the Haskell Bytes tutorial. This repository contains setup
instructions.

Setup
-----

These instructions apply to a Debian or Ubuntu-like system. If you know what
you are doing you can of course apply your own preferred methods.

* Install some distribution packages required for GHC:
  ```
  apt install build-essential curl libffi-dev libffi6 libgmp-dev libgmp10 libncurses-dev libncurses5 libtinfo5
  ```

* Install ghcup
  ```
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
  ```
  and follow the instructions. `haskell-language-server` is not needed.

  You may have to re-open your terminal afterwards to have `ghcup` in your
  `PATH`.

* Install GHC 8.8 and cabal-3.2. Other versions might work as well, at your own risk
  ```
  ghcup install ghc 8.8
  ghcup set ghc 8.8
  ghcup install cabal 3.2.0.0
  ghcup set cabal 3.2.0.0
  ```

  Check that the right version of GHC is present by default with
  ```
  ghc --version
  ```

* Install `ghc-heap-view` into the current directory:
  ```
  cabal update
  cabal install --env . --lib ghc-heap-view
  ```

* Install `ghc-vis` into the current directory. This may require installing
  additional `-dev` packages.
  ```
  sudo apt install pkg-config libcairo2-dev librsvg2-dev libgtk-3-dev
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

