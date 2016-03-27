import Data.Char
import Control.Monad



main = do
    game $ [0..5]

game :: [Int] -> IO ()
game xs = when (gameNotFinished xs) $ do
            putStrLn " "
            printGameField xs
            putStrLn "Row: "
            row <- getLine
            --putChar row
            putStrLn "num of stones: "
            stones <- getLine
            let r = digitToInt (row!!0)
                s = digitToInt (stones!!0)
            --putChar stones
            game $ updateGameField r s xs

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
