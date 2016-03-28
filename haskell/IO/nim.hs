import Data.Char
import Control.Monad

--http://www.cdf.toronto.edu/~ajr/270/probsess/03/strategy.html
--TODO: just allow each player to take away 1,3, or 4 stones
--TODO: implement robot algorithm

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
                if (elem r [1..5]) && (elem s [1..(xs!!r)]) then
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
