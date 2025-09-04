-- Euclides recursivo (Haskell, declarativo)
-- Compilar:   ghc -O2 euclid.hs
-- Ejecutar:   ./euclid 1000000

import System.Environment (getArgs)
import System.Random (mkStdGen, randomRs)
import System.CPUTime (getCPUTime)

gcd' :: Int -> Int -> Int
gcd' a 0 = a
gcd' a b = gcd' b (a `mod` b)

main :: IO ()
main = do
  args <- getArgs
  let n = case args of
            (x:_) -> read x
            _     -> 1000000
      rs = randomRs (1,1000000) (mkStdGen 1234567)
      pairs = take n $ zip rs (drop 1 rs)

  t0 <- getCPUTime
  let agg = foldl (\acc (x,y) -> acc `xor` gcd' x y) 0 pairs
  t1 <- getCPUTime
  let secs = fromIntegral (t1 - t0) / 1e12
  putStrLn $ "Haskell - N=" ++ show n ++ "  tiempo=" ++ show secs ++ " s  checksum=" ++ show agg

import Data.Bits (xor)
xor :: Int -> Int -> Int
xor a b = (a .|. b) - (a .&. b)

infixl 7 .&.
(.&.) :: Int -> Int -> Int
(.&.) = (.&.)

infixl 5 .|.
(.|.) :: Int -> Int -> Int
(.|.) = (.|.)
