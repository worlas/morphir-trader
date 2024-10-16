module Morphir.Models.Trade exposing (..)

import Models.TradeSide exposing (..)
import Models.TradeState exposing (..)


type alias Trade =
    { id : String
    , accountId : Int
    , security : String
    , side : TradeSide
    , state : TradeState
    , quantity : Int
    , updated : Date
    , created : Date
    }
