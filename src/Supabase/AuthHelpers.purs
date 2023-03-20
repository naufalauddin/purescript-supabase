module Supabase.AuthHelpers
  ( ClientOptions
  , CookieOptions
  , Options
  , UseUser
  , createBrowserClient
  , createBrowserClientWithOptions
  , useUser
  ) where

import Prelude

import Data.Maybe (Maybe)
import Data.Nullable (Nullable)
import Data.Nullable as Nullable
import Effect (Effect)
import Foreign (Foreign)
import React.Basic.Hooks (Hook, unsafeHook)
import Record.Studio (mapRecordKind)
import Supabase.Supabase as Supabase
import Supabase.Types (Client)
import Yoga.JSON as YogaJSON

foreign import useUserImpl :: Effect { user :: Nullable Supabase.User }

useUser :: Hook (UseUser) { user :: Maybe Supabase.User }
useUser = unsafeHook useUserImpl <#> mapRecordKind Nullable.toMaybe

foreign import data UseUser :: Type -> Type

foreign import createBrowserClient :: Effect Client

type CookieOptions =
  { domain :: Maybe String
  , maxAge :: Maybe Int
  , name :: Maybe Int
  , path :: Maybe String
  , sameSite :: Maybe String
  , secure :: Maybe Boolean
  }

type Options =
  { db :: Maybe String
  }

type ClientOptions =
  { cookieOptions :: Maybe CookieOptions
  , options :: Maybe Options
  , supabaseKey :: Maybe String
  , supabaseUrl :: Maybe String
  }

foreign import createBrowserClientWithOptionsInternal :: Foreign -> Effect Client

createBrowserClientWithOptions ∷ ClientOptions → Effect Client
createBrowserClientWithOptions = YogaJSON.write >>> createBrowserClientWithOptionsInternal