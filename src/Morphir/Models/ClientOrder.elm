module Morphir.Models.ClientOrder exposing (..)

import Morphir.Models.Trade exposing (Trade)
import Morphir.Models.TradeSide exposing (TradeSide)


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
    , trade : Trade -- to be able to cancel
    }
