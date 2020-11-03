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


fetchData : Task Never NetworkData
fetchData =
    Process.sleep 2000
        |> Task.map
            (always
                { nodes = nodeData
                , edges = edgeData
                }
            )


port sendData : NetworkData -> Cmd msg


type alias Node =
    { id : Int
    , label : String
    , group : Int
    }


type alias Nodes =
    List Node


type alias Edge =
    { from : Int
    , arrows : String
    , to : Int
    }


type alias Edges =
    List Edge


type alias NetworkData =
    { nodes : Nodes
    , edges : Edges
    }


nodeData : Nodes
nodeData =
    [ { id = 1, label = "A", group = 1 }
    , { id = 2, label = "B", group = 1 }
    , { id = 3, label = "C", group = 1 }
    , { id = 4, label = "D", group = 1 }
    , { id = 5, label = "E", group = 2 }
    , { id = 6, label = "F", group = 2 }
    , { id = 7, label = "G", group = 2 }
    , { id = 8, label = "H", group = 2 }
    ]


edgeData : Edges
edgeData =
    [ { from = 1, to = 2, arrows = "to" }
    , { from = 1, to = 3, arrows = "to" }
    , { from = 3, to = 4, arrows = "to" }
    , { from = 6, to = 1, arrows = "to" }
    , { from = 7, to = 8, arrows = "to" }
    , { from = 8, to = 7, arrows = "to" }
    ]



---- UPDATE ----


type Msg
    = DataFetched NetworkData


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
