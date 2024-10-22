module Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (..)

import Traderx.Morphir.Rulesengine.Models.Market exposing (Stock)
import Traderx.Morphir.Rulesengine.Models.TradeSide exposing (TradeSide)


type AccountType
    = CASH
    | MARGIN
    | FIRM_ACCOUNT


type alias ClientStock =
    { stock : Stock
    , quantity : Int
    }


type alias AccountInfo =
    { accountType : AccountType
    , stocks : Maybe (List ClientStock)
    , cashBalance : Float
    }


type alias ClientOrder =
    { orderId : String
    , security : String
    , side : TradeSide
    , quantity : Int
    , accountInfo : AccountInfo
    }
