{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Servant (serve, type (:>), Get, JSON)
import Network.Wai.Handler.Warp (run)
import Data.Proxy (Proxy(Proxy))
import Data.Text (pack, Text)
import Network.HTTP.Client (newManager, parseRequest, httpLbs, defaultManagerSettings, parseRequest)
import Control.Monad.Trans (liftIO)

type API = "poke" :> Get '[JSON] Text

main :: IO ()
main = run 9000 $ serve @API Proxy $ liftIO pokeServiceB
  where
    pokeServiceB :: IO Text
    pokeServiceB = do
      manager <- newManager defaultManagerSettings
      request <- parseRequest "http://localhost:9001/poke"
      response <- httpLbs request manager
      pure (pack $ show response)
      
