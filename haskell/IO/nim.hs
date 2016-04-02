import Data.Char
import Control.Monad

--http://www.cdf.toronto.edu/~ajr/270/probsess/03/strategy.html
--TODO: just allow each player to take away 1,3, or 4 stones
--TODO: write brute force algorithm for AI

main = do
    game 0 [0..5]

-- Player -> Gamefield -> IO ()
game :: Int -> [Int] -> IO ()
game p xs = do
            let p'  | p == 0    = 1
                    | otherwise = 0
            if (gameNotFinished xs) then do
                print $ "Player " ++ (show (p+1)) ++ "'s turn"
                putStrLn " "
                printGameField xs
                putStrLn "Row: "
                row <- getLine
                --putChar row
                putStrLn "num of stones: "
                stones <- getLine
                let r = digitToInt (row!!0)
                    s = digitToInt (stones!!0)
                -- check whether the move is a valid one
                -- r is beteen rows 1 and 5 and if there are enough
                -- stones left in the row
                if (movePossible xs r s) then
                    game p' $ updateGameField r s xs
                else do
                    putStrLn ""
                    print "not valid input"
                    game p xs

            else print $ "finished : Player " ++ (show (p'+1)) ++ " lost"

gameNotFinished :: [Int] -> Bool
gameNotFinished xs = foldr1 (||) $ map (/=0) xs

-- takes a gamefield, row, and how may stones should be removed
updateGameField::Int -> Int -> [Int] -> [Int]
updateGameField r s xs = fst (splitAt (r) xs) ++  [(xs!!r) - s] ++  snd (splitAt (r+1) xs)

printGameField :: [Int] -> IO ()
printGameField xs = printGameField' [5,4..0] xs
-- helper function
printGameField' :: [Int] ->[Int] -> IO ()
printGameField' num (x:[]) = return ()
printGameField' (n:num) xs = do  putStrLn $ unwords $ [show n] ++ replicate x "*"
                                 printGameField' num (init xs)
    where
        x = last xs

-- change any number to Binary
toBinary :: Int -> [Int]
toBinary 0 = [0]
toBinary 1 = [1]
toBinary x = (toBinary (div x 2)) ++ [(mod x 2)]

fromBinary :: [Int] -> Int
fromBinary (x:[])  =  x * 1
fromBinary (x:xs)  =  (+) (fromBinary xs) $ (*) x $ (^) 2 $ length xs

-- complete a Binary to a specific length by appending 0 to the front
completeBinary :: Int -> [Int] -> [Int]
completeBinary l b  | length b == l = b
                    | otherwise     = completeBinary l $ 0:b

findCompleteLength :: [[Int]] -> Int
findCompleteLength xss = maximum $ map (length) xss


-- take the parity: iterate through each col and return 0 if number of 1's even, 0 otherwise
-- returns True, if state is a kernel, False otherwise
-- e.g. [[0,0,1,1], [0,1,1,1], [0,1,0,0]] -> True
parity :: [[Int]] -> Bool
parity xss = (==) 0 $ sum $ parity' xss $ length $ (xss!!0)

parity' :: [[Int]] -> Int -> [Int]
parity' xss 0 = [(sum[(xs!!0) | xs <- xss]) `mod` 2]
parity' xss y = [(sum[(xs!!(y-1)) | xs <- xss]) `mod` 2] ++ parity' xss (y-1)

-- check whether AI is in kernel, if yes -> make intelligent move
-- else make random move
-- return a tuple, with a (row, stones)
checkKernel :: [[Int]] -> (Int, Int)
checkKernel xss | parity xss    = randomMove xss
                | otherwise     = findMove xss

findMove :: [[Int]] -> (Int, Int)
findMove xss = findMove' xss 1 $ (+) (-1) $ length xss
    where
        findMove' xss s r | s > (fromBinary (xss!!r))    = findMove' xss 1 (r-1)
                          | parity (updateGameFieldBinary xss s r)      = (r, s)
                          | otherwise                    = findMove' xss (s+1) r

updateGameFieldBinary :: [[Int]] -> Int -> Int -> [[Int]]
updateGameFieldBinary xss s r = map (completeBinary l') $ newBinField xss s r
    where
        l' = maximum $ map (length) $ newBinField xss s r

newBinField :: [[Int]] -> Int -> Int -> [[Int]]
newBinField xss s r =  map (toBinary) $ updateGameField r s $ map (fromBinary) xss


randomMove :: [[Int]] -> (Int, Int)
randomMove xss = (2,1)

movePossible :: [Int] -> Int -> Int -> Bool
movePossible xs r s | r < (length xs) = (<=) s $ xs!!r
                    | otherwise       = False
