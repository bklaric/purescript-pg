module Postgres.Result where

import Data.Foreign (Foreign)

foreign import data Result :: Type

foreign import data Field :: Type

foreign import rows :: Result -> Array Foreign

foreign import fields :: Result -> Array Field

foreign import rowCount :: Result -> Int

foreign import command :: Result -> String

foreign import name :: Field -> String

foreign import tableID :: Field -> Int

foreign import columnID :: Field -> Int

foreign import dataTypeID :: Field -> Int

foreign import dataTypeSize :: Field -> Int

foreign import dataTypeModifier :: Field -> Int

foreign import format :: Field -> String
