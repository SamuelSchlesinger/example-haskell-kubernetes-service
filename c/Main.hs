{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Control.Exception (try, SomeException)
import Control.Monad.Trans (liftIO)
import Data.Proxy (Proxy(Proxy))
import Data.Text (pack, Text)
import Network.HTTP.Client (newManager, parseRequest, httpLbs, defaultManagerSettings, parseRequest, ManagerSettings(managerResponseTimeout), responseTimeoutMicro, responseBody)
import Network.Wai.Handler.Warp (run)
import Servant (serve, type (:>), Get, JSON, err500, errBody, throwError)
import Data.Aeson (decode)

type API = "poke" :> Get '[JSON] Text

main :: IO ()
main = run 9000 $ serve @API Proxy $ do
  manager <- liftIO $ newManager defaultManagerSettings
  request <- liftIO $ parseRequest "http://x-service.sgs.svc.cluster.local:9003/poke"
  liftIO (try @SomeException $ httpLbs request manager) >>= \case
    Right response ->
      case decode (responseBody response) of
        Just txt -> pure ("c" <> txt)
        Nothing -> throwError err500
    Left err -> throwError err500
