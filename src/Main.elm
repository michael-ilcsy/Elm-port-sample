port module Main exposing (..)

import Browser
import Html exposing (Html, div)
import Html.Attributes exposing (id)
import Process
import Task exposing (Task)



---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Task.perform DataFetched fetchData )


fetchData : Task Never String
fetchData =
    Process.sleep 2000 |> Task.map (always "test")


port sendData : String -> Cmd msg



---- UPDATE ----


type Msg
    = DataFetched String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        DataFetched data ->
            ( model, sendData data )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ div [ id "network" ] [] ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
