{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeApplications #-}
module Main where

import Servant (serve, type (:>), Get, JSON, err500, throwError, errBody)
import Network.Wai.Handler.Warp (run)
import Data.Proxy (Proxy(Proxy))
import Data.Text (pack, Text)
import Network.HTTP.Client (newManager, parseRequest, httpLbs, defaultManagerSettings, parseRequest, responseBody)
import Control.Monad.Trans (liftIO)
import Data.Aeson (decode)

type API = "poke" :> Get '[JSON] Text

main :: IO ()
main = run 9000 $ serve @API Proxy $ do
  manager <- liftIO $ newManager defaultManagerSettings
  request <- liftIO $ parseRequest "http://localhost:9001/poke"
  response <- liftIO $ httpLbs request manager
  case decode (responseBody response) of
    Just txt -> pure ("a" <> txt)
    Nothing -> throwError err500
