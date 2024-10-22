module Traderx.Morphir.Rulesengine.Validation exposing (..)

import Traderx.Morphir.Rulesengine.Models.ClientOrder exposing (ClientOrder)
import Traderx.Morphir.Rulesengine.Models.Error exposing (..)
import Traderx.Morphir.Rulesengine.Models.Trade exposing (Trade)


validateRequest : ClientOrder -> Trade -> Result Error ClientOrder
validateRequest cOrder trade =
    Ok cOrder



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
--case cOrder.action of
--    New ->
--        Ok cOrder
--
--    -- case getMarketAvailability of
--    --     OPEN ->
--    --         Ok cc
--    --
--    --     CLOSED ->
--    --         Err { id = 2, desc = "Market Is Closed" }
--    Cancel ->
--        case trade of
--            Just trd ->
--                case trd.state of
--                    Processing ->
--                        Ok cc
--
--                    _ ->
--                        Err { id = 2, desc = "Can't Perform Cancel" }
--
--            Nothing ->
--                Err { id = 2, desc = "Need a Trade to Cancel" }
