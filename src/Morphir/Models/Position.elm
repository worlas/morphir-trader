module Morphir.Models.Position exposing (..)


type alias Position =
    { accountId : Int
    , security : String
    , quantity : Int
    , updated : Date
    }
