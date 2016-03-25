import Data.Char
import Control.Monad



main = do
    game $ zip [0..4] [5,4..1]

game :: [(Int, Int)] -> IO ()
game xs = when (gameNotFinished (unzipGame xs)) $ do
            printGameField $ unzipGame xs
            putStrLn "Row: "
            row <- getChar
            putChar row
            putStrLn "num of stones: "
            stones <- getChar
            putChar stones
            game xs

gameNotFinished :: [Int] -> Bool
gameNotFinished xs = foldr1 (||) $ map (/=0) xs

unzipGame :: [(Int, Int)] -> [Int]
unzipGame xs = snd $ unzip xs

printGameField :: [Int] -> IO ()
printGameField [] = return ()
printGameField (x:xs) = do  putStrLn $ unwords $ [show x] ++ replicate x "*"
                            printGameField xs
