module Traderx.Morphir.Rulesengine.Main exposing (..)

import Traderx.Morphir.Rulesengine.Buy exposing (buy)
import Traderx.Morphir.Rulesengine.CancelTrade exposing (cancelTrade)
import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder, ClientOrderAction(..))
import Traderx.Morphir.Rulesengine.Models.Error exposing (..)
import Traderx.Morphir.Rulesengine.Models.Market exposing (Market(..))
import Traderx.Morphir.Rulesengine.Models.TradeResult exposing (TradeResult)
import Traderx.Morphir.Rulesengine.Models.TradeSide exposing (TradeSide(..))
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState(..))
import Traderx.Morphir.Rulesengine.Sell exposing (sell)
import Traderx.Morphir.Rulesengine.ValidateAction exposing (validateRequest)


processTrade : ClientOrder -> Result Error ClientOrder
processTrade clientOrder =
    -- let
    --     performClientAction : Result Error TradeResult
    --     performClientAction =
    --         case clientOrder.action of
    --             New ->
    --                 case clientOrder.side of
    --                     BUY ->
    --                         clientOrder |> buy
    --
    --                     SELL ->
    --                         clientOrder |> sell
    --
    --             Cancel ->
    --                 clientOrder |> cancelTrade
    -- in
    -- case clientOrder |> validateRequest of
    --     Ok _ ->
    --         performClientAction
    --
    --     Err error ->
    --         Err error
    clientOrder |> validateRequest
