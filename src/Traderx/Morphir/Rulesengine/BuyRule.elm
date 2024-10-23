module Traderx.Morphir.Rulesengine.BuyRule exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (AccountType(..), ClientOrder)
import Traderx.Morphir.Rulesengine.Models.Error exposing (Error, lowClientBalanceError, marketClosedError, marketDFDError, stockNotFoundError)
import Traderx.Morphir.Rulesengine.Models.Market exposing (Market, MarketStatus(..))


buyStock : ClientOrder -> Market -> Result Error Bool
buyStock clientOrder market =
    let
        -- Total cost of the order (stock price * quantity)
        orderCost : Float
        orderCost =
            if market.security == clientOrder.security then
                market.price * toFloat clientOrder.quantity

            else
                0.0

        -- client buy power
        clientAvailableBalance : Float
        clientAvailableBalance =
            case clientOrder.accountInfo.accountType of
                -- For a margin account, the buying power may be higher. Let's assume margin allows 2x leverage
                MARGIN ->
                    clientOrder.accountInfo.cashBalance * 2

                _ ->
                    clientOrder.accountInfo.cashBalance
    in
    if market.security == clientOrder.security then
        case market.marketStatus of
            OPEN ->
                if orderCost <= clientAvailableBalance then
                    Ok True

                else
                    Err lowClientBalanceError

            CLOSED ->
                Err marketClosedError

            DFD ->
                Err marketDFDError

    else
        Err stockNotFoundError
