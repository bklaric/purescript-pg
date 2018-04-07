module Postgres.Client.Events where

import Prelude

import Control.Monad.Effect (Effect)
import Data.Nullable (Nullable)
import Node.Events (Event(..))
import Postgres.Client (Client)

type Notification =
    { processId :: Int
    , channel :: String
    , payload :: Nullable String
    }

notification :: Event Client (Notification -> Effect Unit)
notification = Event "notification"

end :: Event Client (Effect Unit)
end = Event "end"

notice :: Event Client (String -> Effect Unit)
notice = Event "notice"
