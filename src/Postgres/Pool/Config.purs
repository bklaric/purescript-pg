module Postgres.Pool.Config where

import Data.Options (Option, opt)

data PoolConfig

connectionTimeout :: Option PoolConfig Int
connectionTimeout = opt "connectionTimeoutMillis"

idleTimeout :: Option PoolConfig Int
idleTimeout = opt "idleTimeoutMillis"

maxClientCount :: Option PoolConfig Int
maxClientCount = opt "max"
