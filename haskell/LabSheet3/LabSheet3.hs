mult :: Num a => [a] -> a
mult xs = foldr (*) 1 xs

posList :: (Num a, Ord a) => [a] -> [a]
posList xs = filter (>0) xs

trueList :: [Bool] -> Bool
trueList xs = foldr1(&&) xs

evenList :: [Int] -> Bool        
evenList xs = foldr1 (&&) (map (even') xs)
            where
                even' x = x `mod` 2 == 0  

maxList :: (Num a, Ord a) => [a] -> a 
maxList xs = foldr1 (\x y -> if x > y then x else y) xs

inRange :: (Num a, Ord a) => a -> a -> [a] -> [a]
inRange min max xs = filter (>=min) $ filter (<=max) xs

countPositives :: (Num a, Ord a) => [a] -> a
countPositives xs = foldr1 (+) $ map (\x -> 1) $ filter (>0) xs

myLength :: [a] -> Int
myLength xs = foldr1 (+) $ map (\x -> 1) xs

myMap :: (a -> b) -> [a] -> [b]
myMap f xs = foldr (\x acc-> f x : acc) [] xs

myLength' :: [a] -> Int
myLength' xs = foldr (\x acc -> acc + 1 ) 0 xs