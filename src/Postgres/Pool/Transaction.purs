module Postgres.Pool.Transaction where

import Prelude

import Data.Either (Either(..))
import Effect (Effect)
import Postgres.Client (Client)
import Postgres.Client.Transaction as Client
import Postgres.Error (Error)
import Postgres.Pool (Pool, connect)

withTransaction
    :: forall error result
    .  (Error -> error)
    -> ((Either error result -> Effect Unit) -> Client -> Effect Unit)
    -> (Either error result -> Effect Unit)
    -> Pool
    -> Effect Unit
withTransaction constructError callback continue pool =
    pool # connect case _ of
        Left error -> continue $ Left $ constructError error
        Right { client, releaseClient } ->
            Client.withTransaction
                constructError
                callback
                (\result -> releaseClient *> continue result)
                client
