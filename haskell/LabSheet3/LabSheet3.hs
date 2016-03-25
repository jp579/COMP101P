--create the product of a list of numbers
mult :: Num a => [a] -> a
mult xs = foldr1 (*) xs

--return only the positive integers in a list
posList :: (Num a, Ord a) => [a] -> [a]
posList xs = filter (>0) xs

--determines whether all the Booleans in a list of Booleans are true
trueList :: [Bool] -> Bool
trueList xs = foldr1 (&&) xs

--determines whether all the numbers in a list of numbers are even.
evenList :: [Int] -> Bool        
evenList xs = foldr1 (&&) (map (even') xs)
            where
                even' x = x `mod` 2 == 0 

--determines whether all the numbers in a list of numbers are even.
evenList' :: [Int] -> Bool        
evenList' xs = foldr1 (&&) $ map (\x -> x `mod` 2 == 0) xs

--polymorphic function that returns the maximum of a list of items that can be ordered.
maxList :: (Num a, Ord a) => [a] -> a 
maxList xs = foldr1 (\x y -> if x > y then x else y) xs

--return all numbers in the input list within the range given by the first two arguments (inclusive)
inRange :: (Num a, Ord a) => a -> a -> [a] -> [a]
inRange min max xs = filter (>=min) $ filter (<=max) xs

--count the positive numbers in a list (the ones strictly greater than 0)
countPositives :: (Num a, Ord a) => [a] -> a
countPositives xs = foldr1 (+) $ map (\x -> 1) $ filter (>0) xs

--own version of the library function length using folder and map
myLength :: [a] -> Int
myLength xs = foldr1 (+) $ map (\x -> 1) xs

--map using foldr
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = foldr (\x acc-> f x : acc) [] xs

--length using foldr only
myLength' :: [a] -> Int
myLength' xs = foldr (\x acc -> acc + 1 ) 0 xs





