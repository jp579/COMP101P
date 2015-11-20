import Data.Char

square::Int->Int
square x = x * x

pyth::Int->Int->Int
pyth x y = square x + square y

isTriple::Int->Int->Int->Bool
isTriple a b c = pyth a b == square c

isTripleAny::Int->Int->Int->Bool
isTripleAny a b c = if a > b && a > c then isTriple b c a
               else if b > a  && b > c then isTriple a c b 
               else isTriple a b c

halfEvens::[Int]->[Int]
halfEvens xs = [if x `mod` 2 == 0 then x `div` 2 else x | x<-xs]

inRange::Int->Int->[Int]->[Int]
inRange a b xs = [x | x<-xs, x `elem` [a..b]]

countPositives::[Int]->Int
countPositives xs = sum[1 | x <- xs, x >= 1] 

capitalise::String->String
capitalise xs = toUpper (head xs) : [toLower x | x<-tail xs]


length' xs = sum [1 | _ <- xs]

toLower'::String->String
toLower' xs = [toLower x | x <- xs, length' xs > 0]

title::[String]->[String]
title xxs = capitalise (head xxs) : [if length' xs < 5 then toLower' xs else capitalise xs | xs <- tail xxs]