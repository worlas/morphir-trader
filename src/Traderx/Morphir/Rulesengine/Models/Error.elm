module Traderx.Morphir.Rulesengine.Models.Error exposing (..)


type alias Error =
    { code : Int
    , msg : String
    }


type Errors
    = MARKET_CLOSED
    | MARKET_DFD
    | STOCK_NOT_FOUND
    | LOW_CLIENT_BALANCE
    | TRADE_CANCEL_ERROR


marketClosedError : Error
marketClosedError =
    { code = 600, msg = "Market is Closed" }


marketDFDError : Error
marketDFDError =
    { code = 550, msg = "Market is Done-For-Day" }


stockNotFoundError : Error
stockNotFoundError =
    { code = 404, msg = "Stock Not Found In Market" }


lowClientBalanceError : Error
lowClientBalanceError =
    { code = 404, msg = "InSufficient Client Balance" }


tradeStatusCancelError : Error
tradeStatusCancelError =
    { code = 402, msg = "Trade State Prohibits Cancellation" }
