module Traderx.Morphir.Rulesengine.Simple exposing (..)


add : Int -> Int -> Result String Int
add a b =
    if a > b then
        Ok
            (a
                + b
            )

    else
        Err " error "
