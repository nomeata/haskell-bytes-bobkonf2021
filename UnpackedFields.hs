module UnpackedFields where

data PairII = Pair Char Char
    deriving Show
data PairIS = PairIS Char !Char
    deriving Show
data PairSS = PairSS !Char !Char
    deriving Show
data PairUU = PairUU {-# UNPACK #-} !Char {-# UNPACK #-} !Char
    deriving Show
data PairUS = PairUS {-# UNPACK #-} !Char !Char
data PairUP = PairUP {-# UNPACK #-} !(Char,Char)
    deriving Show
newtype PairUPNT = PairUPNT (Char,Char)
    deriving Show
data PairURec = PairURec {-# UNPACK #-} !PairUU {-# UNPACK #-} !PairUU
    deriving Show
