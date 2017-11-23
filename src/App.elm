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
import CasillaDepartamentoMunicipio


type alias Model =
    { datosBasicos : Models.Model
    }


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


establecerListaMunicipios model listaMunicipios =
    let
        municipiosEstado =
            model.datosBasicos.municipiosEstado

        datosBasicos =
            model.datosBasicos

        newModel =
            { municipiosEstado | municipios = listaMunicipios }

        newDatosBasicos =
            { datosBasicos | municipiosEstado = newModel }
    in
        { model | datosBasicos = newDatosBasicos }



---- VIEW ----


view : Model -> Html Msg
view model =
    Html.map FromDatosBasicos (DatosBasicos.view model.datosBasicos)



---- PROGRAM ----


init : List { departamento : String, codigo : String, nombre : String } -> ( Model, Cmd Msg )
init listaMunicipios =
    ( establecerListaMunicipios { datosBasicos = initialModel } listaMunicipios
    , Cmd.batch
        [ Cmd.map FromDatosBasicos DatosBasicos.requestData
        ]
    )


main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }


subscriptions model =
    Sub.batch
        [ Sub.map FromDatosBasicos DatosBasicos.subscriptions
        ]
