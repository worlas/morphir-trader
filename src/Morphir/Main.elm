module Morphir.Main exposing (..)

-- Flow Control
--  TradeOrder Request
--         |
--         v
--   Validation of Action(state) --> Failed Step --> Failed Action
--         |
--         v
--    BUY --> check if client has enough                                                                                      SELL
--         |
--         v
--    Full Purchase         Partial Purchase -
--         |                     |
--         v                     v
--    Return Settled        Insert to Queue and repeat process
