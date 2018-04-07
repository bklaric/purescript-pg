module Postgres.Pool.Events where

import Prelude

import Control.Monad.Effect (Effect)
import Control.Monad.Effect.Exception (Error)
import Node.Events (Event(..))
import Postgres.Client (Client)
import Postgres.Pool (Pool)

connect :: Event Pool (Client -> Effect Unit)
connect = Event "connect"

acquire :: Event Pool (Client -> Effect Unit)
acquire = Event "acquire"

error :: Event Pool (Error -> Client -> Effect Unit)
error = Event "error"

remove :: Event Pool (Client -> Effect Unit)
remove = Event "remove"
