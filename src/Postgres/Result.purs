module Postgres.Result where

import Prelude

import Control.Alt ((<|>))
import Control.Monad.Except (runExcept)
import Data.Array (head)
import Data.Either (hush)
import Data.Maybe (Maybe)
import Foreign (Foreign, readArray, readString)
import Foreign.Class (class Decode, decode)
import Foreign.Index (readProp)

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

decode' :: forall value. Decode value => Foreign -> Maybe value
decode' = decode >>> runExcept >>> hush

readString' :: Foreign -> Maybe String
readString' = readString >>> runExcept >>> hush

readArray' :: Foreign -> Maybe (Array Foreign)
readArray' = readArray >>> runExcept >>> hush

readProp' :: String -> Foreign -> Maybe Foreign
readProp' property = readProp property >>> runExcept >>> hush

readScalarArray :: forall scalar. Decode scalar => Result -> Maybe scalar
readScalarArray result =
    result # rows # head >>= readArray' >>= head >>= decode'

readScalarObject :: forall scalar. Decode scalar => Result -> Maybe scalar
readScalarObject result = do
    property <- result # fields # head <#> name
    result # rows # head >>= readProp' property >>= decode'

readScalar :: forall scalar. Decode scalar => Result -> Maybe scalar
readScalar result =
    readScalarArray result <|> readScalarObject result
