module Traderx.Morphir.Rulesengine.Main exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder, ClientOrderAction(..))
import Traderx.Morphir.Rulesengine.Models.Market exposing (Market(..))
import Traderx.Morphir.Rulesengine.Models.Position exposing (Position)
import Traderx.Morphir.Rulesengine.Models.Trade exposing (Trade)
import Traderx.Morphir.Rulesengine.Models.TradeResult exposing (TradeResult)
import Traderx.Morphir.Rulesengine.Models.TradeSide exposing (TradeSide(..))
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState(..))


type alias Error =
    { id : Int
    , desc : String
    }


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


sell : ClientOrder -> Result Error TradeResult
sell cOrder =
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
            , quantity = 0
            , updated = "sfsf"
            }
    in
    Ok { trade = setTradeProperties, position = createPosition }


processTrade : ClientOrder -> Result Error TradeResult
processTrade clientOrder =
    let
        performClientAction : Result Error TradeResult
        performClientAction =
            case clientOrder.action of
                New ->
                    case clientOrder.side of
                        BUY ->
                            clientOrder |> buy

                        SELL ->
                            clientOrder |> sell

                Cancel ->
                    clientOrder |> cancelTrade
    in
    case clientOrder |> validateRequest of
        Ok _ ->
            performClientAction

        Err error ->
            Err error


validateRequest : ClientOrder -> Result Error ClientOrder
validateRequest c =
    let
        validateAction : ClientOrder -> Result Error ClientOrder
        validateAction cc =
            let
                getMarketAvailability : Market
                getMarketAvailability =
                    OPEN
            in
            case cc.action of
                New ->
                    case getMarketAvailability of
                        OPEN ->
                            Ok cc

                        CLOSED ->
                            Err { id = 2, desc = "Market Is Closed" }

                Cancel ->
                    case cc.trade of
                        Just trd ->
                            case trd.state of
                                Processing ->
                                    Ok cc

                                _ ->
                                    Err { id = 2, desc = "Can't Perform Cancel" }

                        Nothing ->
                            Err { id = 2, desc = "Need a Trade to Cancel" }
    in
    c |> validateAction
