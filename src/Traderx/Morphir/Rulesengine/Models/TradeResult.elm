module Traderx.Morphir.Rulesengine.Models.TradeResult exposing (..)

import Traderx.Morphir.Rulesengine.Models.Position exposing (Position)
import Traderx.Morphir.Rulesengine.Models.Trade exposing (Trade)


type alias TradeResult =
    { trade : Trade
    , position : Position
    }
