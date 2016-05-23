port module Ports exposing (..)

port keyDownEvents : (Int -> msg) -> Sub msg
port keyPressEvents : (Int -> msg) -> Sub msg
port keyUpEvents : (Int -> msg) -> Sub msg
