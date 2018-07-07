module Postgres.Pool.Transaction where

import Prelude

import Data.Either (Either(..))
import Effect (Effect)
import Postgres.Client (Client)
import Postgres.Client.Transaction as Client
import Postgres.Error (Error)
import Postgres.Pool (Pool, connect)

withTransaction
    :: forall result
    .  ((Either Error result -> Effect Unit) -> Client -> Effect Unit)
    -> (Either Error result -> Effect Unit)
    -> Pool
    -> Effect Unit
withTransaction callback continue pool =
    pool # connect case _ of
        Left error -> continue $ Left error
        Right { client, releaseClient } ->
            Client.withTransaction
                callback
                (\result -> releaseClient *> continue result)
                client
