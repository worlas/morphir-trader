module Traderx.Morphir.Rulesengine.Models.Market exposing (..)

import Dict exposing (Dict)


type alias Stock =
    String


type alias StockDetails =
    { floatingQty : Int
    , price : Float
    , marketStatus : MarketStatus
    }


type alias Market =
    Dict Stock StockDetails


type MarketStatus
    = OPEN
    | CLOSED
    | DFD
