module Morphir.Models.ClientOrder exposing (..)

import Model.TradeSide exposing (..)


type alias ClientOrder =
    { id : String
    , state : String
    , security : String
    , quantity : Int
    , accountId : Int
    , side : TradeSide
    }
