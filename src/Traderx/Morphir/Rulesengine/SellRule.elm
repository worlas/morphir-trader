module Traderx.Morphir.Rulesengine.SellRule exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder, ClientStock)
import Traderx.Morphir.Rulesengine.Models.Error exposing (Errors(..))
import Traderx.Morphir.Rulesengine.Models.Market exposing (Market, Stock)


type alias SellOrder =
    { stock : Stock
    , quantity : Int
    }


sellStock : ClientOrder -> SellOrder -> Result Errors Bool
sellStock clientOrder sellOrder =
    let
        clientHasSellStock : SellOrder -> List ClientStock -> Maybe ClientStock
        clientHasSellStock sOrder stockLst =
            stockLst
                |> List.filter (\clientStock -> clientStock.stock == sOrder.stock)
                |> List.head
    in
    case clientOrder.accountInfo.stocks of
        Just stockLst ->
            case stockLst |> clientHasSellStock sellOrder of
                Just clientSellStock ->
                    if clientSellStock.quantity > sellOrder.quantity then
                        Ok True

                    else
                        Err INSUFFICIENT_SELL_POWER

                Nothing ->
                    Err INVALID_CLIENT_STOCK

        Nothing ->
            Err EMPTY_CLIENT_STOCK
