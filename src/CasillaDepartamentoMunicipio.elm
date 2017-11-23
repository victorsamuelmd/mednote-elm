module CasillaDepartamentoMunicipio exposing (subscriptions, view, update, Msg, Model, init)

--import Html exposing (..)
--import Html.Events exposing (onInput, onClick, onCheck, onFocus, onWithOptions)
--import Json.Decode as Decode
--import Autocomplete

import Autocomplete
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String
import Json.Decode as Json
import Json.Encode as JE
import Dom
import Task
import ListaMunicipios exposing (..)


-- MODEL --


subscriptions : Sub Msg
subscriptions =
    Sub.map SetAutoState Autocomplete.subscription


type alias Model =
    { municipios : List Municipio
    , autoState : Autocomplete.State
    , howManyToShow : Int
    , query : String
    , municipioSeleccionado : Maybe Municipio
    , showMenu : Bool
    }


init : Model
init =
    { municipios = listaMunicipios
    , autoState = Autocomplete.empty
    , howManyToShow = 5
    , query = ""
    , municipioSeleccionado = Nothing
    , showMenu = False
    }


type Msg
    = SetQuery String
    | SetAutoState Autocomplete.Msg
    | Wrap Bool
    | Reset
    | HandleEscape
    | SelectPersonKeyboard String
    | SelectPersonMouse String
    | PreviewPerson String
    | OnFocus
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetQuery newQuery ->
            let
                showMenu =
                    not << List.isEmpty <| (acceptablePeople newQuery model.municipios)
            in
                { model
                    | query = newQuery
                    , showMenu = showMenu
                    , municipioSeleccionado = Nothing
                }
                    ! []

        SetAutoState autoMsg ->
            let
                ( newState, maybeMsg ) =
                    Autocomplete.update
                        updateConfig
                        autoMsg
                        model.howManyToShow
                        model.autoState
                        (acceptablePeople model.query model.municipios)

                newModel =
                    { model | autoState = newState }
            in
                case maybeMsg of
                    Nothing ->
                        newModel ! []

                    Just updateMsg ->
                        update updateMsg newModel

        HandleEscape ->
            let
                validOptions =
                    not <| List.isEmpty (acceptablePeople model.query model.municipios)

                handleEscape =
                    if validOptions then
                        model
                            |> removeSelection
                            |> resetMenu
                    else
                        model
                            |> resetInput

                escapedModel =
                    case model.municipioSeleccionado of
                        Just person ->
                            if model.query == person.codigo then
                                model
                                    |> resetInput
                            else
                                handleEscape

                        Nothing ->
                            handleEscape
            in
                escapedModel ! []

        Wrap toTop ->
            case model.municipioSeleccionado of
                Just person ->
                    update Reset model

                Nothing ->
                    if toTop then
                        { model
                            | autoState =
                                Autocomplete.resetToLastItem
                                    updateConfig
                                    (acceptablePeople model.query model.municipios)
                                    model.howManyToShow
                                    model.autoState
                            , municipioSeleccionado =
                                List.head <|
                                    List.reverse <|
                                        List.take model.howManyToShow <|
                                            (acceptablePeople model.query model.municipios)
                        }
                            ! []
                    else
                        { model
                            | autoState =
                                Autocomplete.resetToFirstItem
                                    updateConfig
                                    (acceptablePeople model.query model.municipios)
                                    model.howManyToShow
                                    model.autoState
                            , municipioSeleccionado =
                                List.head <|
                                    List.take model.howManyToShow <|
                                        (acceptablePeople model.query model.municipios)
                        }
                            ! []

        Reset ->
            { model | autoState = Autocomplete.reset updateConfig model.autoState, municipioSeleccionado = Nothing } ! []

        SelectPersonKeyboard id ->
            let
                newModel =
                    setQuery model id
                        |> resetMenu
            in
                newModel ! []

        SelectPersonMouse id ->
            let
                newModel =
                    setQuery model id
                        |> resetMenu
            in
                ( newModel, Task.attempt (\_ -> NoOp) (Dom.focus "president-input") )

        PreviewPerson id ->
            { model | municipioSeleccionado = Just <| getPersonAtId model.municipios id } ! []

        OnFocus ->
            model ! []

        NoOp ->
            model ! []


resetInput model =
    { model | query = "" }
        |> removeSelection
        |> resetMenu


removeSelection model =
    { model | municipioSeleccionado = Nothing }


getPersonAtId municipios id =
    List.filter (\municipio -> municipio.codigo == id) municipios
        |> List.head
        |> Maybe.withDefault (Municipio "" "" "")


setQuery model id =
    { model
        | query = .codigo <| getPersonAtId model.municipios id
        , municipioSeleccionado = Just <| getPersonAtId model.municipios id
    }


resetMenu model =
    { model
        | autoState = Autocomplete.empty
        , showMenu = False
    }


view : Model -> Html Msg
view model =
    let
        options =
            { preventDefault = True, stopPropagation = False }

        dec =
            (Json.map
                (\code ->
                    if code == 38 || code == 40 then
                        Ok NoOp
                    else if code == 27 then
                        Ok HandleEscape
                    else
                        Err "not handling that key"
                )
                keyCode
            )
                |> Json.andThen
                    fromResult

        fromResult : Result String a -> Json.Decoder a
        fromResult result =
            case result of
                Ok val ->
                    Json.succeed val

                Err reason ->
                    Json.fail reason

        menu =
            if model.showMenu then
                [ viewMenu model ]
            else
                []

        query =
            case model.municipioSeleccionado of
                Just person ->
                    person.codigo

                Nothing ->
                    model.query

        activeDescendant attributes =
            case model.municipioSeleccionado of
                Just person ->
                    (attribute "aria-activedescendant"
                        person.codigo
                    )
                        :: attributes

                Nothing ->
                    attributes
    in
        div []
            (List.append
                [ input
                    (activeDescendant
                        [ onInput SetQuery
                        , onFocus OnFocus
                        , onWithOptions "keydown" options dec
                        , value query
                        , id "president-input"
                        , class "autocomplete-input"
                        , autocomplete False
                        , attribute "aria-owns" "list-of-presidents"
                        , attribute "aria-expanded" <| String.toLower <| toString model.showMenu
                        , attribute "aria-haspopup" <| String.toLower <| toString model.showMenu
                        , attribute "role" "combobox"
                        , attribute "aria-autocomplete" "list"
                        ]
                    )
                    []
                ]
                menu
            )


acceptablePeople : String -> List Municipio -> List Municipio
acceptablePeople query municipios =
    let
        lowerQuery =
            String.toLower query
    in
        List.filter (String.contains lowerQuery << String.toLower << .nombre) municipios


viewMenu : Model -> Html Msg
viewMenu model =
    div [ class "autocomplete-menu" ]
        [ Html.map SetAutoState
            (Autocomplete.view
                viewConfig
                model.howManyToShow
                model.autoState
                (acceptablePeople model.query model.municipios)
            )
        ]


updateConfig : Autocomplete.UpdateConfig Msg Municipio
updateConfig =
    Autocomplete.updateConfig
        { toId = .codigo
        , onKeyDown =
            \code maybeId ->
                if code == 38 || code == 40 then
                    Maybe.map PreviewPerson maybeId
                else if code == 13 then
                    Maybe.map SelectPersonKeyboard maybeId
                else
                    Just <| Reset
        , onTooLow = Just <| Wrap False
        , onTooHigh = Just <| Wrap True
        , onMouseEnter = \id -> Just <| PreviewPerson id
        , onMouseLeave = \_ -> Nothing
        , onMouseClick = \id -> Just <| SelectPersonMouse id
        , separateSelections = False
        }


viewConfig : Autocomplete.ViewConfig Municipio
viewConfig =
    let
        customizedLi keySelected mouseSelected municipio =
            { attributes =
                [ classList
                    [ ( "pure-menu-item", True )
                    , ( "item-selected", keySelected || mouseSelected )
                    ]
                , id municipio.codigo
                ]
            , children = [ a [ class "pure-menu-link" ] [ Html.text (municipio.nombre ++ ", " ++ municipio.departamento) ] ]
            }
    in
        Autocomplete.viewConfig
            { toId = .codigo
            , ul = [ class "pure-menu custom-restricted-width" ]
            , li = customizedLi
            }
