module Morphir.Models.Trade exposing (..)

import Morphir.Models.TradeSide exposing (..)
import Morphir.Models.TradeState exposing (..)


type alias Trade =
    { id : String
    , accountId : Int
    , security : String
    , side : TradeSide
    , state : TradeState
    , quantity : Int
    , updated : String
    , created : String
    }
