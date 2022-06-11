module Postgres.Pool
    ( Pool
    , create
    , totalCount
    , idleCount
    , waitingCount
    , connect
    , end) where

import Prelude

import Data.Either (Either(..))
import Foreign (Foreign)
import Data.Options (Options, options)
import Effect (Effect)
import Node.Events.EventEmitter as EventEmitter
import Postgres.Client (Client)
import Postgres.Client.Config (ClientConfig)
import Postgres.Error (Error)
import Postgres.Pool.Config (PoolConfig)
import Postgres.Query (class Querier, defaultQuery, defaultQueryWithConfig)
import Unsafe.Coerce (unsafeCoerce)

foreign import data Pool :: Type

instance EventEmitter.EventEmitter Pool where
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

instance Querier Pool where
    query           = defaultQuery
    queryWithConfig = defaultQueryWithConfig

foreign import createImpl :: Foreign -> Effect Pool

create :: Options PoolConfig -> Options ClientConfig -> Effect Pool
create poolConfig clientConfig =
    poolConfig <> unsafeCoerce clientConfig # options # createImpl

foreign import totalCount :: Pool -> Effect Int

foreign import idleCount :: Pool -> Effect Int

foreign import waitingCount :: Pool -> Effect Int

foreign import connectImpl
    :: (Error -> Effect Unit)
    -> (Client -> Effect Unit -> Effect Unit)
    -> Pool
    -> Effect Unit

type ClientWithRelease = { client :: Client, releaseClient :: Effect Unit}

connect ::
    (Either Error ClientWithRelease -> Effect Unit) -> Pool -> Effect Unit
connect callback pool =
    connectImpl
        (Left >>> callback)
        (\client releaseClient -> { client, releaseClient } # Right # callback)
        pool

foreign import end :: Effect Unit -> Pool -> Effect Unit
