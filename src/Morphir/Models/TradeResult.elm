module Morphir.Models.TradeResult exposing (..)

import Morphir.Models.Position exposing (..)
import Morphir.Models.Trade exposing (..)


type alias TradeResult =
    { trade : Trade
    , position : Position
    }
