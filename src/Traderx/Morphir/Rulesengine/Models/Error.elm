module Traderx.Morphir.Rulesengine.Models.Error exposing (..)


type alias Error =
    { id : Int
    , desc : String
    }


marketClosedError : { code : number, msg : String }
marketClosedError =
    { code = 600, msg = "Market is Closed" }


marketDFDError : { code : number, msg : String }
marketDFDError =
    { code = 550, msg = "Market is Done-For-Day" }


stockNotFoundError : { code : number, msg : String }
stockNotFoundError =
    { code = 404, msg = "Stock Not Found In Market" }


lowClientBalanceError : { code : number, msg : String }
lowClientBalanceError =
    { code = 404, msg = "Stock Not Found In Market" }
