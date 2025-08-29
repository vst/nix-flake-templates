{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE OverloadedStrings #-}

import qualified Autodocodec as ADC
import qualified Data.Aeson as Aeson
import qualified Data.ByteString.Lazy.Char8 as BLC
import qualified Data.Text as T


main :: IO ()
main = do
  BLC.putStrLn $ Aeson.encode (MkVersion "0.0.1")


newtype Version = MkVersion
  { versionValue :: T.Text
  }
  deriving (Eq, Ord, Show)
  deriving (Aeson.ToJSON, Aeson.FromJSON) via (ADC.Autodocodec Version)


instance ADC.HasCodec Version where
  codec =
    ADC.object "Version" $
      MkVersion
        <$> ADC.requiredField "value" "The version of application" ADC..= versionValue
