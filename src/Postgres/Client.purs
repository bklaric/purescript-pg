module Postgres.Client (Client, create, connect, end) where

import Prelude

import Foreign (Foreign)
import Data.Maybe (Maybe)
import Data.Nullable (Nullable, toMaybe)
import Data.Options (Options, options)
import Effect (Effect)
import Node.Events.EventEmitter as EventEmitter
import Postgres.Client.Config (ClientConfig)
import Postgres.Error (Error)
import Postgres.Query (class Querier, defaultQuery, defaultQueryWithConfig)

foreign import data Client :: Type

instance EventEmitter.EventEmitter Client where
    on                  = EventEmitter.defaultOn
    once                = EventEmitter.defaultOnce
    prependListener     = EventEmitter.defaultPrependListener
    prependOnceListener = EventEmitter.defaultPrependOnceListener
    removeListener      = EventEmitter.defaultRemoveListener
    removeAllListeners  = EventEmitter.defaultRemoveAllListeners
    emit                = EventEmitter.defaultEmit
    listeners           = EventEmitter.defaultListeners
    listenerCount       = EventEmitter.defaultListenerCount
    getMaxListeners     = EventEmitter.defaultGetMaxListeners
    setMaxListeners     = EventEmitter.defaultSetMaxListeners
    eventNames          = EventEmitter.defaultEventNames

instance Querier Client where
    query           = defaultQuery
    queryWithConfig = defaultQueryWithConfig

foreign import createImpl :: Foreign -> Effect Client

create :: Options ClientConfig -> Effect Client
create clientConfig = clientConfig # options # createImpl

foreign import connectImpl ::
    (Nullable Error -> Effect Unit) -> Client -> Effect Unit

connect :: (Maybe Error -> Effect Unit) -> Client -> Effect Unit
connect callback client = connectImpl (toMaybe >>> callback) client

foreign import endImpl ::
    (Nullable Error -> Effect Unit) -> Client -> Effect Unit

end :: (Maybe Error -> Effect Unit) -> Client -> Effect Unit
end callback client = endImpl (toMaybe >>> callback) client
