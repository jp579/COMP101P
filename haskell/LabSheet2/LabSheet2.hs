import Data.Char

inRange :: Int -> Int -> [Int] -> [Int]
inRange a b [] = []
inRange a b (x:xs)  | x <  a    = inRange a b xs
                    | x <= b    = [x] ++ inRange a b xs
                    | otherwise = []

countPositives :: [Int] -> Int
countPositives []       = 0
countPositives (x:xs)     | x > 0       = 1 + countPositives xs
                          | otherwise   = 0 + countPositives xs   

length' :: [a] -> Int
length' xs = sum[ 1 | _ <- xs]

capitalised :: String -> String
capitalised (x:xs) = [toUpper x] ++ toLower' xs

toLower' :: String -> String
toLower' [] = []
toLower' (x:xs) = [toLower x] ++ toLower' xs

title :: [String] -> [String]
title (xs:xxs) = capitalised xs : (title' xxs)

title' :: [String] -> [String]
title' [] = []
title' (xs:xxs) | length' xs > 3 =  capitalised xs : (title' xxs)
                | otherwise      =  xs : (title' xxs)

isort :: Ord a => [a] -> [a]
isort [] = []
isort (y:xs) = [x | x <- (isort xs), x <= y] ++ [y] ++ [x | x <- (isort xs), x > y] 

merge :: Ord a => [a] -> [a] -> [a]
merge [] [] = []
merge a [] = a
merge [] a = a
merge xs ys | head xs < head ys = (head xs) : merge (tail xs) ys
            | otherwise         = (head ys) : merge xs (tail ys)   

msort :: Ord a => [a] -> [a]
msort [] = []
msort [a]= [a]
msort xs =  merge
                (msort(take (length' xs `div` 2) xs))
                (msort(drop (length' xs `div` 2) xs))
            
rotor :: Int -> [a] -> [a]
rotor 0 xs = xs
rotor 26 xs = xs
rotor r xs  | r < 0             = error "smaller than 0"
            | r >= (length' xs) = error ">= than length' xs"
            | otherwise         = rotor (r - 1) (tail xs ++ [head xs]) 

makeKey :: Int -> [(Char, Char)]
makeKey x = zip ['A'..'Z'] (rotor x ['A'..'Z'])

lookUp :: Char -> [(Char, Char)] -> Char
lookUp c xs | c `elem` ['A'..'Z']   = snd (head [x | x <- xs, fst x == c])
            | otherwise             = c

encipher :: Int -> Char -> Char
encipher x c = lookUp c (makeKey x)

normalise :: String -> String
normalise [] = []
normalise (x:xs)    | x `elem` ['A'..'Z']   = x : normalise xs
                    | x `elem` ['0'..'9']   = x : normalise xs
                    | x `elem` ['a'..'z']   = toUpper x : normalise xs
                    | otherwise             = normalise xs

normalise' :: String -> String
normalise' xs = [if x `elem` ['a'..'z'] then toUpper x
                 else x | x <- xs, x `elem` dx]
        where dx = ['0'..'9'] ++ ['a'..'z'] ++ ['A'..'Z'] 

prop_normalize :: String -> Bool
prop_normalize xs = normalise xs == normalise' xs

encipherStr :: Int -> String -> String
encipherStr a str = [encipher a x | x <- (normalise str)]

decipher_lookUp :: Char -> [(Char, Char)] -> Char
decipher_lookUp c xs| c `elem` ['A'..'Z']   = fst (head [x | x <- xs, snd x == c])
                    | otherwise             = c

decipher :: Int -> Char -> Char
decipher x c =  decipher_lookUp c (makeKey x)

decipherStr :: Int -> String -> String
decipherStr a str = [decipher a x | x <- str] 

bruteforce :: String -> [String]
bruteforce str = [decipherStr a str | a <- [1..25]]





