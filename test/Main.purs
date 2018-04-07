module Test.Main where

import Prelude

import Control.Monad.Effect (Effect)
import Data.Options (Options, (:=))
import Postgres.Pool (Query(..), create, query)
import Postgres.Pool.Config (PoolConfig, database, host, password, port, user)

poolConfig :: Options PoolConfig
poolConfig =
    user := "postgres"
    <> password := "postgres"
    <> host := "localhost"
    <> port := 5432
    <> database := "hue"

foreign import log :: forall a. a -> Effect Unit

main :: Effect Unit
main = do
    pool <- create poolConfig
    -- pool # query (Query "insert into test_table(some_text, foreign_column) values ('some text', 10)") [] log log
    pool # query (Query "select * from test_table") [] log log
