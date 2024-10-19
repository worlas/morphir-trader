module Traderx.Morphir.Rulesengine.ValidateAction exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder, ClientOrderAction(..))
import Traderx.Morphir.Rulesengine.Models.Error exposing (..)
import Traderx.Morphir.Rulesengine.Models.Market exposing (Market(..))
import Traderx.Morphir.Rulesengine.Models.TradeState exposing (TradeState(..))


validateRequest : ClientOrder -> Result Error ClientOrder
validateRequest cc =
    -- let
    --     validateAction : ClientOrder -> Result Error ClientOrder
    --     validateAction cc =
    --         let
    --             getMarketAvailability : Market
    --             getMarketAvailability =
    --                 OPEN
    --         in
    --         case cc.action of
    --             New ->
    --                 case getMarketAvailability of
    --                     OPEN ->
    --                         Ok cc
    --
    --                     CLOSED ->
    --                         Err { id = 2, desc = "Market Is Closed" }
    --
    --             Cancel ->
    --                 case cc.trade of
    --                     Just trd ->
    --                         case trd.state of
    --                             Processing ->
    --                                 Ok cc
    --
    --                             _ ->
    --                                 Err { id = 2, desc = "Can't Perform Cancel" }
    --
    --                     Nothing ->
    --                         Err { id = 2, desc = "Need a Trade to Cancel" }
    -- in
    -- c |> validateAction
    case cc.action of
        New ->
            Ok cc

        -- case getMarketAvailability of
        --     OPEN ->
        --         Ok cc
        --
        --     CLOSED ->
        --         Err { id = 2, desc = "Market Is Closed" }
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
