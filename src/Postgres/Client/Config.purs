module Postgres.Client.Config where

import Data.Options (Option, opt)

data ClientConfig

user :: Option ClientConfig String
user = opt "user"

password :: Option ClientConfig String
password = opt "password"

host :: Option ClientConfig String
host = opt "host"

port :: Option ClientConfig Int
port = opt "port"

database :: Option ClientConfig String
database = opt "database"

connectionString :: Option ClientConfig String
connectionString = opt "connectionString"

statementTimeout :: Option ClientConfig Int
statementTimeout = opt "statement_timeout"
