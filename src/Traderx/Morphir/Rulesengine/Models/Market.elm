module Traderx.Morphir.Rulesengine.Models.Market exposing (..)


type alias Stock =
    String


type alias Market =
    { security : Stock
    , floatingQty : Int
    , price : Float
    , marketStatus : MarketStatus
    }


type MarketStatus
    = OPEN
    | CLOSED
    | DFD
