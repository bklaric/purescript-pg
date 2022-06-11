module Postgres.Query
    ( Query(..)
    , QueryParameter(..)
    , cons
    , (:)
    , finalCons
    , (:|)
    , RowMode(..)
    , QueryConfig(..)
    , class Querier
    , query
    , query_
    , queryWithConfig
    , defaultQuery
    , defaultQueryWithConfig
    , execute
    , execute_
    ) where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Postgres.Error (Error)
import Postgres.Result (Result)
import Unsafe.Coerce (unsafeCoerce)

newtype Query = Query String

derive newtype instance Semigroup Query

foreign import data QueryParameter :: Type

cons :: forall parameter.
    parameter -> Array QueryParameter -> Array QueryParameter
cons parameter parameters = Array.cons (unsafeCoerce parameter) parameters

infixr 6 cons as :

finalCons :: forall leftParameter rightParameter.
    leftParameter -> rightParameter -> Array QueryParameter
finalCons left right = left : [unsafeCoerce right]

infixr 6 finalCons as :|

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

execute
    :: forall querier
    .  Querier querier
    => Query
    -> Array QueryParameter
    -> (Either Error Unit -> Effect Unit)
    -> querier
    -> Effect Unit
execute query' parameters callback querier =
    query query' parameters (void >>> callback) querier

execute_
    :: forall querier
    .  Querier querier
    => Query
    -> (Either Error Unit -> Effect Unit)
    -> querier
    -> Effect Unit
execute_ query' callback querier =
    query_ query' (void >>> callback) querier
