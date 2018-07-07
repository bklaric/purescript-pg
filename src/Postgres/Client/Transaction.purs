module Postgres.Client.Transaction where

import Prelude

import Data.Either (Either(..))
import Effect (Effect)
import Postgres.Client (Client)
import Postgres.Error (Error)
import Postgres.Query (Query(..), execute_)

begin :: (Either Error Unit -> Effect Unit) -> Client -> Effect Unit
begin = execute_ (Query "begin")

commit :: (Either Error Unit -> Effect Unit) -> Client -> Effect Unit
commit = execute_ (Query "commit")

rollback :: (Either Error Unit -> Effect Unit) -> Client -> Effect Unit
rollback = execute_ (Query "rollback")

withTransaction
    :: forall error result
    .  (Error -> error)
    -> ((Either error result -> Effect Unit) -> Client -> Effect Unit)
    -> (Either error result -> Effect Unit)
    -> Client
    -> Effect Unit
withTransaction constructError callback continue client =
    client # begin case _ of
        Left error -> continue $ Left $ constructError error
        Right _ -> client # callback case _ of
            Left error' ->
                client # rollback \_ -> continue $ Left error'
            Right result -> client # commit case _ of
                Left error'' -> continue $ Left $ constructError error''
                Right _ -> continue $ Right result
