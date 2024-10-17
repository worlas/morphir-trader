module Traderx.Morphir.Rulesengine.Models.Trade exposing (..)

import Traderx.Morphir.Rulesengine.Models.TradeSide exposing (TradeSide)
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState)


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
