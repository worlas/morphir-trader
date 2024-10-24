module Traderx.Morphir.Rulesengine.CancelTradeRule exposing (..)

import Traderx.Morphir.Rulesengine.Models.Error exposing (Errors(..))
import Traderx.Morphir.Rulesengine.Models.Market exposing (Market, MarketStatus(..))
import Traderx.Morphir.Rulesengine.Models.Trade exposing (Trade)
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState(..))


cancelTrade : Trade -> Market -> Result Errors Bool
cancelTrade trade market =
    if market.security == trade.security then
        case trade.state of
            Processing ->
                case market.marketStatus of
                    OPEN ->
                        Ok True

                    CLOSED ->
                        Err MARKET_CLOSED

                    DFD ->
                        Err MARKET_DFD

            _ ->
                Err TRADE_CANCEL_ERROR

    else
        Err STOCK_NOT_FOUND
