module Traderx.Morphir.Rulesengine.Models.Error exposing (..)


type alias Error =
    { code : Int
    , msg : String
    }


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
    { code = 404, msg = "Stock Not Found In Market" }
