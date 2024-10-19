module Traderx.Morphir.Rulesengine.Buy exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder, ClientOrderAction(..))
import Traderx.Morphir.Rulesengine.Models.Error exposing (..)
import Traderx.Morphir.Rulesengine.Models.Position exposing (Position)
import Traderx.Morphir.Rulesengine.Models.Trade exposing (Trade)
import Traderx.Morphir.Rulesengine.Models.TradeResult exposing (TradeResult)
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState(..))


buy : ClientOrder -> Result Error TradeResult
buy cOrder =
    let
        setTradeProperties : Trade
        setTradeProperties =
            { id = cOrder.id
            , accountId = cOrder.accountId
            , security = cOrder.security
            , side = cOrder.side
            , state = Settled
            , quantity = cOrder.quantity
            , updated = "ssd"
            , created = "fsfs"
            }

        createPosition : Position
        createPosition =
            { accountId = cOrder.accountId
            , security = cOrder.security
            , quantity = 80
            , updated = "sfsf"
            }
    in
    Ok { trade = setTradeProperties, position = createPosition }
