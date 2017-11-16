module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Http
import Date
import Json.Encode as Encode
import Json.Decode as Decode
import Models exposing (..)
import DatosBasicos


type alias Model =
    { datosBasicos : Models.Model }


type Msg
    = FromDatosBasicos DatosBasicos.Msg



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        FromDatosBasicos m ->
            let
                ( datos1, cmd1 ) =
                    DatosBasicos.update m model.datosBasicos
            in
                ( { model | datosBasicos = datos1 }, Cmd.map FromDatosBasicos cmd1 )



---- VIEW ----


view : Model -> Html Msg
view model =
    Html.map FromDatosBasicos (DatosBasicos.view model.datosBasicos)



---- PROGRAM ----


init : String -> ( Model, Cmd Msg )
init path =
    ( { datosBasicos = initialModel }, Cmd.none )


main : Program String Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
