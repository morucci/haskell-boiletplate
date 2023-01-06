module Tui.Cli where

import Data.Text (unpack)
import Engine.Main (greeting)
import Prelude

main :: IO ()
main = putStrLn $ unpack greeting
