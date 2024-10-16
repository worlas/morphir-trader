module Morphir.Models.Trade exposing (..)

import Morphir.Models.TradeSide exposing (..)
import Morphir.Models.TradeState exposing (..)


type alias Trade =
    { id : String -- 1
    , accountId : Int -- 001
    , security : String -- NSF
    , side : TradeSide -- Buy
    , state : TradeState -- New
    , quantity : Int -- 100
    , updated : String
    , created : String
    }
