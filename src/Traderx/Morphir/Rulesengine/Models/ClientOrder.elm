module Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (..)

import Traderx.Morphir.Rulesengine.Models.Trade exposing (Trade)
import Traderx.Morphir.Rulesengine.Models.TradeSide exposing (TradeSide)


type ClientOrderAction
    = New
    | Cancel


type alias ClientOrder =
    { id : String
    , accountId : Int
    , security : String
    , quantity : Int
    , side : TradeSide
    , action : ClientOrderAction
    , trade : Maybe Trade -- to be able to cancel
    }
