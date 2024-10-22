module Traderx.Morphir.Rulesengine.Main exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder)
import Traderx.Morphir.Rulesengine.Models.Error exposing (..)
import Traderx.Morphir.Rulesengine.Validation exposing (validateRequest)


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
    Ok clientOrder
