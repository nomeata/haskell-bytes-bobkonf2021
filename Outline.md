Outline
=======

Welcome
-------

Check that setup works. Who has it installed? (Maybe form groups already now.)

Teaser
------

* Play with count-lines.hs:
  ```
  zcat largefile.txt.gz |wc -c
  ghc --make -O -rtsopts count-lines.hs
  zcat largefile.txt.gz | ./count-lines +RTS -t
  ```
  Look for `in use`.
  Maybe run with `-S` instead of `-t`.
  Try also passing `-M3000M` or `-c`.


* Look at `Count.hs` and play with it in GHCI:
  ```
  $ ghci Count.hs
  [1 of 1] Compiling Count            ( Count.hs, interpreted )
  Ok, one module loaded.
  *Count> let x = count 0 [0..100000000]
  *Count> x
  ```

* Play with `count-lines.hs` again, now delete the line with `"I read"`
  ```
  ghc --make -O count-lines.hs
  zcat largefile.txt.gz | ./count-lines +RTS -t
  ```

Brainstorming
-------------

What kind of objects would we expect in memory?

What does the runtime need to know about them?

Hello Heap!
-----------

To be run in
```
ghci Utils
```

Play around with

 * Numbers:
   ```
   let one = 1 :: Int
   viewClosure one
   ```

 * Characters:
   ```
   let zett = 'z'
   viewClosure zett
   ```

 * Data types:
   ```
   let jone = Just one
   viewClosure just
   ```
   Compare with `viewClosure one`!

 * Strings
   ```
   let s = "hello"
   viewListClosures s
   ```
   Now run `System.Mem.perfomGC` to perform garbage collection, and again
   ```
   viewListClosures s
   ```
   what has changed?


Things to try on your own:

* Do all letters refer to static memory after GC? Try ☃!

* What about other data types? Try your own!


A visual tool
-------------

Also, now lets use a visual tool ([ghc-vis](http://felsin9.de/nnis/ghc-vis/)):

 * Initialization:
   ```
   :script ghci
   :vis
   ```
 * Adding a value to the view
   ```
   let s = "some expression"
   :view s
   ```
 * Update (e.g. after evaluation):
   ```
   :update
   ```
 * You can click on `Thunks`!
 * Clearing the view:
   ```
   :clear
   ```

Note: Using ghc-vis runs the GC more often, so it is hard to see effects from the GC.


Infinite lists
--------------

Read `InfLists.hs` and in
```
ghci -O -fobject-code InfLists
```
(with ghc-vis) play around with `l`, `nl`, `l2`, `nl2`.

Things to try on your own:

* How do the standard functions `repeat` and `cycle` look like?

* Are there functions that you can use on these lists that do _not_ break the
  properties of these cycles?

Prime sieve
-----------

Read `Sieve.hs`, and in
```
ghci -O -fobject-code Sieve
```
(with ghc-vis) play around with `primes`.


Bonus material: Function pointers
----------------------------------

To compile modules and then load into GHCI, let’s use:
```
ghci -O -fobject-code
```
and play around with it.

Setup:
```
Prelude> :add Funcs *Utils
Ok, two modules loaded.
Prelude Utils> let s = "hello"
Prelude Utils> s
"hello"
Prelude Utils> let (f,g,h) = Funcs.funcs s
```

Looking at the closures:
```
Prelude Utils> viewClosure f
0x00007fa6ed062438: 0x00007fa6ecd242b8
Prelude Utils> viewClosure g
0x0000004200460870/1: 0x00007fa6e833c808 0x00000042000306b2
Prelude Utils> viewClosure h
0x0000004200460880/1: 0x00007fa6e833c790 0x00000042001ad5d2
Prelude Utils> viewClosure s
0x000000420476c020/2: 0x00007fa6ec610850 0x00007fa6ec24c7c9 0x000000420476c09a
```

Forcing the functions:
```
Prelude Utils> f `seq` g `seq` h `seq` ()
()
```

Running GC:
```
Prelude Utils> System.Mem.performGC
```

Bonus material:
---------------

The other `count` function in `Count.hs`.
What is their difference, and why do they behave differently?
What effect does optimization have?

Bonus material: Strict and unpacked fields
------------------------------------------

Read `UnpackedFields.hs` and play around with it.
How do the closures look like?
What effect does evaluation have?

It is imporant to load things with -O here. Maybe delete the `*.o` files before, to be extra sure.
```
$ ghci -O -fobject-code Utils UnpackedFields
> :m UnpackedFields Utils
```
