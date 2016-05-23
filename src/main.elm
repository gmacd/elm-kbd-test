import Html exposing (Html, ul, li, text)
import Html.App as App

import Ports as Ports


main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model = List String


init : (Model, Cmd Msg)
init =
  ([], Cmd.none)


-- UPDATE

type Msg
  = KeyDownEvent Int
  | KeyPressEvent Int
  | KeyUpEvent Int

update : Msg -> Model -> (Model, Cmd Msg)
update action model =
  case action of
    KeyDownEvent evt ->
      (("Down: " ++ toString(evt)) :: model, Cmd.none)
    KeyPressEvent evt ->
      (("Press: " ++ toString(evt)) :: model, Cmd.none)
    KeyUpEvent evt ->
      (("Up: " ++ toString(evt)) :: model, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  [ Ports.keyDownEvents KeyDownEvent
  , Ports.keyPressEvents KeyPressEvent
  , Ports.keyUpEvents KeyUpEvent
  ] |> Sub.batch


-- VIEW

view : Model -> Html Msg
view model =
  ul [] (List.map (\str -> li [] [text str]) model)
