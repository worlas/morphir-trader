module Morphir.Main exposing (..)

import Morphir.Models.ClientOrder exposing (ClientOrder, ClientOrderAction(..))
import Morphir.Models.Market exposing (Market(..))
import Morphir.Models.Position exposing (Position)
import Morphir.Models.Trade exposing (Trade)
import Morphir.Models.TradeResult exposing (TradeResult)
import Morphir.Models.TradeSide exposing (TradeSide(..))
import Morphir.Models.TradeState exposing (TradeState(..))


type alias Error =
    { id : Int
    , desc : String
    }


validateRequest : ClientOrder -> Result Error ClientOrder
validateRequest c =
    let
        validateAction : ClientOrder -> Result Error ClientOrder
        validateAction cc =
            let
                getMarketAvailability : Market
                getMarketAvailability =
                    -- api call
                    Debug.log "ToDo"
            in
            case cc.action of
                New ->
                    case getMarketAvailability of
                        OPEN ->
                            Ok cc

                        CLOSED ->
                            Err Error

                -- Market is Closed
                Cancel ->
                    case cc.trade.state of
                        Processing ->
                            Ok cc

                        _ ->
                            Err Error
    in
    c |> validateAction


cancelTrade : ClientOrder -> Result Error ClientOrder
cancelTrade ccc =
    let
        clientTrade =
            ccc.trade

        cancelClientTrade =
            { ccc
                | trade =
                    { clientTrade
                        | state = Cancelled
                    }
            }
    in
    case ccc.trade.state of
        Processing ->
            cancelClientTrade

        _ ->
            Err Error


buy : ClientOrder -> TradeResult
buy co =
    let
        createTrade : Trade
        createTrade =
            { id = "dfg" -- 1
            , accountId = 1 -- 001
            , security = "df" -- NSF
            , side = BUY -- Buy
            , state = Settled -- New
            , quantity = 100 -- 100
            , updated = "dfdf"
            , created = "fsfs"
            }

        createPosition : Position
        createPosition =
            { accountId = 1 -- 001
            , security = "sds" -- NSF
            , quantity = 80 -- 80
            , updated = "sfsf"
            }
    in
    { trade = createTrade
    , position = createPosition
    }


processTrade : ClientOrder -> Result Error TradeResult
processTrade clientOrder =
    let
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
    clientOrder
        |> validateRequest
        |> Result.andThen performClientAction
