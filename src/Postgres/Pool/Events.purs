module Postgres.Pool.Events where

import Prelude

import Effect (Effect)
import Node.Events.Event (Event(..))
import Postgres.Client (Client)
import Postgres.Error (Error)
import Postgres.Pool (Pool)

connect :: Event Pool (Client -> Effect Unit)
connect = Event "connect"

acquire :: Event Pool (Client -> Effect Unit)
acquire = Event "acquire"

error :: Event Pool (Error -> Client -> Effect Unit)
error = Event "error"

remove :: Event Pool (Client -> Effect Unit)
remove = Event "remove"
