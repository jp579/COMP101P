ins :: Integer -> [Integer] -> [Integer]
ins x [] = [x]
ins x (y:ys) | x <= y    = x : (y:ys)
             | otherwise = y : ins x ys

iSort :: [Integer] -> [Integer]
iSort [] = []
iSort (x:xs) = ins x (iSort xs)

xor :: Bool -> Bool -> Bool
xor True True = False
xor False False = False
xor a b = True

combi :: (Num a, Ord a) => [(a, a)] -> [a]
combi xs = [sum[ fst x | x <- xs , (fst x) > (snd x)]] ++ [sum[ snd x | x <- xs, (fst x) > (snd x)]]
