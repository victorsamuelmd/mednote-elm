module App exposing (..)

import Html exposing (..)
import Models exposing (..)
import DatosBasicos


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


establecerListaOcupaciones ocupaciones model =
    let
        datosBasicos =
            model.datosBasicos

        nuevoDatosBasicos =
            { datosBasicos | listaOcupaciones = ocupaciones }
    in
        { model | datosBasicos = nuevoDatosBasicos }


establecerListaPaises paises model =
    let
        datosBasicos =
            model.datosBasicos

        nuevoDatosBasicos =
            { datosBasicos | listaPaises = paises }
    in
        { model | datosBasicos = nuevoDatosBasicos }


establecerListaMunicipios municipios model =
    let
        datosBasicos =
            model.datosBasicos

        nuevoDatosBasicos =
            { datosBasicos | listaMunicipios = municipios }
    in
        { model | datosBasicos = nuevoDatosBasicos }



---- VIEW ----


view : Model -> Html Msg
view model =
    Html.map FromDatosBasicos (DatosBasicos.view model.datosBasicos)



---- PROGRAM ----


type alias Flags =
    { municipios : List Municipio
    , ocupaciones : List Models.Ocupacion
    , paises : List Models.Pais
    }


init : Flags -> ( Model, Cmd Msg )
init objeto =
    ( { datosBasicos = initialModel }
        |> establecerListaMunicipios objeto.municipios
        |> establecerListaOcupaciones objeto.ocupaciones
        |> establecerListaPaises objeto.paises
    , Cmd.none
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
