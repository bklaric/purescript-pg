module Postgres.Query
    ( Query(..)
    , QueryParameter(..)
    , RowMode(..)
    , QueryConfig(..)
    , class Querier
    , query
    , query_
    , queryWithConfig
    , defaultQuery
    , defaultQueryWithConfig
    ) where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Postgres.Error (Error)
import Postgres.Result (Result)

newtype Query = Query String

newtype QueryParameter = QueryParameter String

data RowMode = KeyValue | Array

rowModeToNullableString :: RowMode -> Nullable String
rowModeToNullableString Array = toNullable $ Just "array"
rowModeToNullableString KeyValue = toNullable Nothing

newtype QueryConfig = QueryConfig
    { text :: Query
    , values :: Maybe (Array QueryParameter)
    , name :: Maybe String
    , rowMode :: RowMode
    }

newtype QueryConfigImpl = QueryConfigImpl
    { text :: Query
    , values :: Nullable (Array QueryParameter)
    , name :: Nullable String
    , rowMode :: Nullable String
    }

fromQueryConfig :: QueryConfig -> QueryConfigImpl
fromQueryConfig (QueryConfig queryConfig) = QueryConfigImpl
    { text: queryConfig.text
    , values: toNullable queryConfig.values
    , name: toNullable queryConfig.name
    , rowMode: rowModeToNullableString queryConfig.rowMode }

class Querier querier where
    query
        :: Query
        -> Array QueryParameter
        -> (Either Error Result -> Effect Unit)
        -> querier
        -> Effect Unit
    queryWithConfig
        :: QueryConfig
        -> (Either Error Result -> Effect Unit)
        -> querier
        -> Effect Unit

foreign import queryImpl
    :: forall querier
    .  Query
    -> Array QueryParameter
    -> (Error -> Effect Unit)
    -> (Result -> Effect Unit)
    -> querier
    -> Effect Unit

defaultQuery
    :: forall querier
    .  Query
    -> Array QueryParameter
    -> (Either Error Result -> Effect Unit)
    -> querier
    -> Effect Unit
defaultQuery queryString queryParameters callback client =
    queryImpl
        queryString
        queryParameters
        (Left >>> callback)
        (Right >>> callback)
        client

query_ :: forall querier. Querier querier =>
    Query -> (Either Error Result -> Effect Unit) -> querier -> Effect Unit
query_ queryString callback client = query queryString [] callback client

foreign import queryWithConfigImpl
    :: forall querier
    .  QueryConfigImpl
    -> (Error -> Effect Unit)
    -> (Result -> Effect Unit)
    -> querier
    -> Effect Unit

defaultQueryWithConfig
    :: forall querier
    .  QueryConfig
    -> (Either Error Result -> Effect Unit)
    -> querier
    -> Effect Unit
defaultQueryWithConfig queryConfig callback client =
    queryWithConfigImpl
        (fromQueryConfig queryConfig)
        (Left >>> callback)
        (Right >>> callback)
        client
