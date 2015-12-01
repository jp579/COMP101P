import Data.Char

square::Int->Int
square x = x * x

pyth::Int->Int->Int
pyth x y = square x + square y

isTriple::Int->Int->Int->Bool
isTriple a b c = pyth a b == square c

isTripleAny::Int->Int->Int->Bool
isTripleAny a b c = isTriple a b c || isTriple a c b || isTriple c b a

halfEvens::[Int]->[Int]
halfEvens xs = [if x `mod` 2 == 0 then x `div` 2 else x | x<-xs]

inRange::Int->Int->[Int]->[Int]
inRange a b xs = [x | x<-xs, x `elem` [a..b]]

countPositives::[Int]->Int
countPositives xs = sum[1 | x <- xs, x >= 1] 

capitalise::String->String
capitalise xs = toUpper (head xs) : [toLower x | x<-tail xs]


length' xs = sum [1 | _ <- xs]

title::[String]->[String]
title xxs = capitalise (head xxs) : 
            [if length' xs < 5 then map toLower xs else capitalise xs | xs <- tail xxs, length' xs > 0]