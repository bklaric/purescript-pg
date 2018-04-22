module Test.Main where

import Prelude

import Data.Monoid (mempty)
import Data.Options (Options, (:=))
import Effect (Effect)
import Postgres.Client.Config (ClientConfig, database, host, password, port, user)
import Postgres.Pool (create)
import Postgres.Query (Query(..), query)

clientConfig :: Options ClientConfig
clientConfig =
    user := "postgres"
    <> password := "postgres"
    <> host := "localhost"
    <> port := 5432
    <> database := "hue"

foreign import log :: forall a. a -> Effect Unit

main :: Effect Unit
main = do
    pool <- create mempty clientConfig
    -- pool # query (Query "insert into test_table(some_text, foreign_column) values ('some text', 10)") [] log log
    pool # query (Query "select * from test_table") [] log
