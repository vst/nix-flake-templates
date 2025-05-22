import qualified Data.Aeson as Aeson
import qualified Data.ByteString.Lazy.Char8 as BLC
import System.Exit (die)

main :: IO ()
main = do
  jsonData <- BLC.getContents
  case Aeson.decode jsonData of
    Just value -> tellJsonType value
    Nothing -> die "Invalid JSON!"

tellJsonType :: Aeson.Value -> IO ()
tellJsonType (Aeson.Object _) = putStrLn "JSON value is an object."
tellJsonType (Aeson.Array _) = putStrLn "JSON value is an array."
tellJsonType (Aeson.String _) = putStrLn "JSON value is a string."
tellJsonType (Aeson.Number _) = putStrLn "JSON value is a number."
tellJsonType (Aeson.Bool _) = putStrLn "JSON value is a boolean."
tellJsonType Aeson.Null = putStrLn "JSON value is null."
