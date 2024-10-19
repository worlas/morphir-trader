module Traderx.Morphir.Rulesengine.CancelTrade exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder)
import Traderx.Morphir.Rulesengine.Models.Error exposing (..)
import Traderx.Morphir.Rulesengine.Models.TradeResult exposing (TradeResult)
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState(..))


cancelTrade : ClientOrder -> Result Error TradeResult
cancelTrade ccc =
    case ccc.trade of
        Just trdd ->
            case trdd.state of
                Processing ->
                    Ok
                        { trade =
                            { id = ccc.id
                            , accountId = ccc.accountId
                            , security = ccc.security
                            , side = ccc.side
                            , state = Cancelled
                            , quantity = ccc.quantity
                            , updated = "date"
                            , created = ""
                            }
                        , position =
                            { accountId = ccc.accountId
                            , security = ccc.security
                            , quantity = 0
                            , updated = "sfsf"
                            }
                        }

                _ ->
                    Err { id = 2, desc = "sfs" }

        Nothing ->
            Err { id = 2, desc = "Need a Trade to Cancel" }
