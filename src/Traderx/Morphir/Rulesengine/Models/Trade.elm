module Traderx.Morphir.Rulesengine.Models.Trade exposing (..)

import Traderx.Morphir.Rulesengine.Models.TradeSide exposing (TradeSide)
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState)


type alias Trade =
    { id : String -- UUID
    , accountId : Int
    , security : String
    , side : TradeSide
    , state : TradeState
    , quantity : Int
    }
