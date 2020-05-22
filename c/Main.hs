{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Control.Exception
import Control.Monad.Trans (liftIO)
import Data.Proxy (Proxy(Proxy))
import Data.Text (pack, Text)
import Network.HTTP.Client (newManager, parseRequest, httpLbs, defaultManagerSettings, parseRequest, ManagerSettings(managerResponseTimeout), responseTimeoutMicro)
import Network.Wai.Handler.Warp (run)
import Servant (serve, type (:>), Get, JSON)

type API = "poke" :> Get '[JSON] Text

main :: IO ()
main = run 9000 $ serve @API Proxy $ liftIO pokeServiceB
  where
    pokeServiceB :: IO Text
    pokeServiceB = do
      manager <- newManager defaultManagerSettings { managerResponseTimeout =responseTimeoutMicro 1000000 }
      request <- parseRequest "http://x-service.sgs.svc.cluster.local:9003/poke"
      response <- try @SomeException $ httpLbs request manager
      pure (pack $ show response)
      
