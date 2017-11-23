module DatosBasicos exposing (Msg, view, update, requestData, subscriptions)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick, onCheck, onFocus, onWithOptions)
import Http
import Date
import Json.Decode as Decode
import Models exposing (..)
import Autocomplete
import Navigation
import CasillaDepartamentoMunicipio exposing (..)


---- UPDATE ----


type Msg
    = DefinirNombresPaciente String
    | DefinirApellidosPaciente String
    | DefinirNumeroIdentificacion String
    | DefinirTipoIdentificacion String
    | DefinirTelefono String
    | DefinirSexoPaciente Genero
    | DefinirFechaNacimientoPaciente String
    | DefinirDepartamentoOcurrenciaCaso String
    | DefinirMunicipitoOcurrenciaCaso String
    | DefinirLocalidadOcurrenciaCaso String
    | DefinirBarrioOcurrenciaCaso String
    | DefinirCabeceraCentroRuralOcurrenciaCaso String
    | DefinirVeredaZonaOcurrenciaCaso String
    | DefinirAreaOcurrenciaCaso AreaOcurrencia
    | DefinirOcupacionPaciente String
    | DefinirTipoRegimenSalud AdministradoraSalud
    | DefinirNombreAdministradoraSalud String
    | DefinirPertenenciaEtnica PertenenciaEtnica
      -- Grupos Poblacionales
    | DefinirDiscapacitados
    | DefinirMigrantes
    | DefinirGestantes
    | DefinirInfantilCargoIcbf
    | DefinirDesmovilizados
    | DefinirVictimasViolenciaArmada
    | DefinirDesplazados
    | DefinirCarcelarios
    | DefinirIndigentes
    | DefinirMadresComunitarias
    | DefinirCentrosPsiquiatricos
    | DefinirOtrosGruposPoblacionales
    | DefinirDepartamentoResidencia String
    | DefinirMunicipioResidencia String
    | DefinirDireccionResidencia String
    | DefinirFechaConsulta String
    | DefinirFechaInicioSintomas String
    | DefinirClasificacionInicial ClasificacionCaso
    | DefinirHospitalizado
    | DefinirFechaHospitalizacion String
    | DefinirCondicionFinal CondicionFinal
    | DefinirFechaDefuncion String
    | DefinirNumeroCertificadoDefuncion String
    | DefinirCausaBasicaMuerte String
      -- Mensajes provenientes de la casilla de autocompletado de pais
    | SetAutocompleteState Autocomplete.Msg
    | SetQuery String
    | SeleccionarPaisRaton String
    | SeleccionarPaisTeclado String
    | PrevisualizarPais String
    | Wrap Bool
    | Reset
    | HandleEscape
      --| OnFocus
      -- Autocompletado municipios
    | SendToMunicipios CasillaDepartamentoMunicipio.Msg
      -- Http
    | Enviar
    | SendDataToServer (Result Http.Error String)
    | GetCoutryList (Result Http.Error (List ( String, String )))
    | NoOp



-- Autocomplete Logic


acceptableCountry : String -> List ( String, String ) -> List ( String, String )
acceptableCountry query country =
    let
        lowerQuery =
            String.toLower query
    in
        List.filter (String.contains lowerQuery << String.toLower << Tuple.second) country



-- Set up what will happen with your menu updates


updateConfig : Autocomplete.UpdateConfig Msg Pais
updateConfig =
    Autocomplete.updateConfig
        { toId = Tuple.second
        , onKeyDown =
            \code maybeId ->
                if code == 13 then
                    Maybe.map SeleccionarPaisTeclado maybeId
                    --else if code == 27 then
                    --Just HandleEscape
                else if code == 38 || code == 40 then
                    Maybe.map PrevisualizarPais maybeId
                else
                    Just NoOp
        , onTooLow = Wrap False |> Just
        , onTooHigh = Wrap True |> Just
        , onMouseEnter = \id -> PrevisualizarPais id |> Just
        , onMouseLeave = \_ -> Nothing
        , onMouseClick = \id -> Just <| SeleccionarPaisRaton id
        , separateSelections = False
        }



-- setup for your autocomplete view


viewConfig : Autocomplete.ViewConfig ( String, String )
viewConfig =
    let
        customizedLi keySelected mouseSelected pais =
            { attributes =
                [ classList
                    [ ( "pure-menu-item", True )
                    , ( "item-selected", keySelected || mouseSelected )
                    ]
                ]
            , children = [ a [ class "pure-menu-link" ] [ Html.text (Tuple.second pais) ] ]
            }
    in
        Autocomplete.viewConfig
            { toId = Tuple.second
            , ul = [ class "pure-menu custom-restricted-width" ] -- set classes for your list
            , li = customizedLi -- given selection states and a person, create some Html!
            }



-- and let's show it! (See an example for the full code snippet)


sendData : Models.Model -> Cmd Msg
sendData model =
    let
        server =
            "/save"
    in
        Http.send SendDataToServer <|
            Http.post server (encondeForm model |> Http.jsonBody) Decode.string


requestData : Cmd Msg
requestData =
    let
        server =
            "/country.json"
    in
        Http.send GetCoutryList <|
            Http.get server (Decode.keyValuePairs Decode.string)


convertirTipoIdentificacion : String -> TipoIdentificacion
convertirTipoIdentificacion tipo =
    case tipo of
        "cc" ->
            CedulaCiudadania

        "ce" ->
            CedulaExtrangeria

        "rc" ->
            RegistroCivil

        "ti" ->
            TargetaIdentidad

        "ps" ->
            Pasaporte

        "ms" ->
            MenorSinIdentifiacion

        "as" ->
            AdultoSinIdentificacion

        _ ->
            CedulaCiudadania


removeSelection : Models.Model -> Models.Model
removeSelection model =
    { model | paisOcurrenciaCaso = Nothing }


resetMenu : Models.Model -> Models.Model
resetMenu model =
    { model
        | autoState = Autocomplete.empty
        , verSugerenciasPais = False
    }


resetInput : Models.Model -> Models.Model
resetInput model =
    { model | query = "" }
        |> removeSelection
        |> resetMenu


setQuery : String -> Models.Model -> Models.Model
setQuery id model =
    let
        pais =
            getCoutryAtId model.countryList id
    in
        { model
            | query = Tuple.second <| pais
            , paisOcurrenciaCaso = Just <| pais
        }


getCoutryAtId : List ( String, String ) -> String -> ( String, String )
getCoutryAtId paises id =
    List.filter (\pais -> (Tuple.second pais) == id) paises
        |> List.head
        |> Maybe.withDefault ( "CO", "Colombia" )


update : Msg -> Models.Model -> ( Models.Model, Cmd Msg )
update action model =
    case action of
        DefinirNombresPaciente nuevo ->
            ( { model | nombresPaciente = nuevo }, Cmd.none )

        DefinirApellidosPaciente nuevo ->
            ( { model | apellidosPaciente = nuevo }, Cmd.none )

        DefinirNumeroIdentificacion nuevo ->
            ( { model
                | numeroIdentificacion =
                    String.toInt nuevo
                        |> Result.withDefault 0
              }
            , Cmd.none
            )

        DefinirTipoIdentificacion nuevo ->
            ( { model | tipoIdentificacion = convertirTipoIdentificacion nuevo }, Cmd.none )

        DefinirTelefono nuevo ->
            ( { model | telefono = nuevo }, Cmd.none )

        DefinirFechaNacimientoPaciente nuevo ->
            ( { model
                | fechaNacimientoPaciente =
                    Result.withDefault (Date.fromTime 0) <|
                        Date.fromString nuevo
              }
            , Cmd.none
            )

        DefinirSexoPaciente nuevo ->
            ( { model | sexoPaciente = nuevo }, Cmd.none )

        DefinirDepartamentoOcurrenciaCaso nuevo ->
            ( { model | departamentoOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirMunicipitoOcurrenciaCaso nuevo ->
            ( { model | municipitoOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirLocalidadOcurrenciaCaso nuevo ->
            ( { model | localidadOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirBarrioOcurrenciaCaso nuevo ->
            ( { model | barrioOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirVeredaZonaOcurrenciaCaso nuevo ->
            ( { model | veredaZonaOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirCabeceraCentroRuralOcurrenciaCaso nuevo ->
            ( { model | cabeceraCentroRuralOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirAreaOcurrenciaCaso nuevo ->
            ( { model | areaOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirOcupacionPaciente nuevo ->
            ( { model | ocupacionPaciente = nuevo }, Cmd.none )

        DefinirTipoRegimenSalud nuevo ->
            ( { model | tipoRegimenSalud = nuevo }, Cmd.none )

        DefinirNombreAdministradoraSalud nuevo ->
            ( { model | nombreAdministradoraSalud = nuevo }, Cmd.none )

        DefinirPertenenciaEtnica nuevo ->
            ( { model | pertenenciaEtnica = nuevo }, Cmd.none )

        -- Grupos Poblacionales
        DefinirDiscapacitados ->
            ( { model | discapacitados = not model.discapacitados }, Cmd.none )

        DefinirMigrantes ->
            ( { model | migrantes = not model.migrantes }, Cmd.none )

        DefinirGestantes ->
            ( { model | gestantes = not model.gestantes }, Cmd.none )

        DefinirInfantilCargoIcbf ->
            ( { model | infantilCargoIcbf = not model.infantilCargoIcbf }, Cmd.none )

        DefinirDesmovilizados ->
            ( { model | desmovilizados = not model.desmovilizados }, Cmd.none )

        DefinirVictimasViolenciaArmada ->
            ( { model | victimasViolenciaArmada = not model.victimasViolenciaArmada }, Cmd.none )

        DefinirDesplazados ->
            ( { model | desplazados = not model.desplazados }, Cmd.none )

        DefinirCarcelarios ->
            ( { model | carcelarios = not model.carcelarios }, Cmd.none )

        DefinirIndigentes ->
            ( { model | indigentes = not model.indigentes }, Cmd.none )

        DefinirMadresComunitarias ->
            ( { model | madresComunitarias = not model.madresComunitarias }, Cmd.none )

        DefinirCentrosPsiquiatricos ->
            ( { model | centrosPsiquiatricos = not model.centrosPsiquiatricos }, Cmd.none )

        DefinirOtrosGruposPoblacionales ->
            ( { model | otrosGruposPoblacionales = not model.otrosGruposPoblacionales }, Cmd.none )

        -- Datos de recidencia del paciente
        DefinirDepartamentoResidencia nuevo ->
            ( { model | departamentoResidencia = nuevo }, Cmd.none )

        DefinirMunicipioResidencia nuevo ->
            ( { model | municipioResidencia = nuevo }, Cmd.none )

        DefinirDireccionResidencia nuevo ->
            ( { model | direccionResidencia = nuevo }, Cmd.none )

        DefinirFechaConsulta nuevo ->
            ( { model
                | fechaConsulta =
                    Result.withDefault (Date.fromTime 0) <|
                        Date.fromString nuevo
              }
            , Cmd.none
            )

        DefinirFechaInicioSintomas nuevo ->
            ( { model
                | fechaInicioSintomas =
                    Date.fromString nuevo
                        |> Result.withDefault (Date.fromTime 0)
              }
            , Cmd.none
            )

        DefinirClasificacionInicial nuevo ->
            ( { model | clasificacionInicialCaso = nuevo }, Cmd.none )

        DefinirHospitalizado ->
            ( { model | hospitalizado = not model.hospitalizado }, Cmd.none )

        DefinirFechaHospitalizacion nuevo ->
            ( { model
                | fechaHospitalizacion =
                    Result.withDefault (Date.fromTime 0) <|
                        Date.fromString nuevo
              }
            , Cmd.none
            )

        DefinirCondicionFinal nuevo ->
            ( { model | condicionFinal = nuevo }, Cmd.none )

        DefinirFechaDefuncion nuevo ->
            ( { model
                | fechaDefuncion =
                    Result.withDefault (Date.fromTime 0) <|
                        Date.fromString nuevo
              }
            , Cmd.none
            )

        DefinirNumeroCertificadoDefuncion nuevo ->
            ( { model | numeroCertificadoDefuncion = 0 }, Cmd.none )

        DefinirCausaBasicaMuerte nuevo ->
            ( { model | causaBasicaMuerte = nuevo }, Cmd.none )

        Enviar ->
            ( model, sendData model )

        SendDataToServer (Ok _) ->
            ( model, Navigation.load "/datos" )

        SendDataToServer (Err _) ->
            ( model, Cmd.none )

        SetAutocompleteState autoMsg ->
            let
                ( newState, maybeMsg ) =
                    Autocomplete.update updateConfig
                        autoMsg
                        model.numeroSugerencias
                        model.autoState
                        (acceptableCountry model.query model.countryList)

                newModel =
                    { model | autoState = newState }
            in
                case maybeMsg of
                    Nothing ->
                        ( newModel, Cmd.none )

                    Just updateMsg ->
                        update updateMsg newModel

        HandleEscape ->
            let
                validOptions =
                    not <| List.isEmpty (acceptableCountry model.query model.countryList)

                handleEscape =
                    if validOptions then
                        model
                            |> removeSelection
                            |> resetMenu
                    else
                        model
                            |> resetInput

                escapedModel =
                    case model.paisOcurrenciaCaso of
                        Just pais ->
                            if model.query == Tuple.second pais then
                                model
                                    |> resetInput
                            else
                                handleEscape

                        Nothing ->
                            handleEscape
            in
                ( escapedModel, Cmd.none )

        SetQuery nuevo ->
            let
                showMenu =
                    not << List.isEmpty <| (acceptableCountry nuevo model.countryList)
            in
                ( { model
                    | query = nuevo
                    , verSugerenciasPais = showMenu
                    , paisOcurrenciaCaso = Nothing
                  }
                , Cmd.none
                )

        SeleccionarPaisRaton nuevo ->
            ( model
                |> setQuery nuevo
                |> resetMenu
            , Cmd.none
            )

        SeleccionarPaisTeclado nuevo ->
            ( model
                |> setQuery nuevo
                |> resetMenu
            , Cmd.none
            )

        Reset ->
            ( { model
                | autoState = Autocomplete.reset updateConfig model.autoState
                , paisOcurrenciaCaso = Nothing
              }
            , Cmd.none
            )

        PrevisualizarPais id ->
            ( { model
                | paisOcurrenciaCaso =
                    getCoutryAtId model.countryList id
                        |> Just
              }
            , Cmd.none
            )

        Wrap toTop ->
            case model.paisOcurrenciaCaso of
                Just pais ->
                    update Reset model

                Nothing ->
                    if toTop then
                        ( { model
                            | autoState =
                                Autocomplete.resetToLastItem updateConfig
                                    (acceptableCountry model.query model.countryList)
                                    5
                                    model.autoState
                            , paisOcurrenciaCaso =
                                (acceptableCountry model.query model.countryList)
                                    |> List.take model.numeroSugerencias
                                    |> List.reverse
                                    |> List.head
                          }
                        , Cmd.none
                        )
                    else
                        ( { model
                            | autoState =
                                Autocomplete.resetToFirstItem updateConfig
                                    (acceptableCountry model.query model.countryList)
                                    model.numeroSugerencias
                                    model.autoState
                            , paisOcurrenciaCaso =
                                (acceptableCountry model.query model.countryList)
                                    |> List.take model.numeroSugerencias
                                    |> List.head
                          }
                        , Cmd.none
                        )

        GetCoutryList (Ok clist) ->
            ( { model | countryList = clist }, Cmd.none )

        GetCoutryList (Err _) ->
            ( model, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        SendToMunicipios msg ->
            let
                ( estado, _ ) =
                    CasillaDepartamentoMunicipio.update msg model.municipiosEstado
            in
                ( { model | municipiosEstado = estado }, Cmd.none )


maybeTuple : Maybe ( a, b ) -> Maybe b
maybeTuple a =
    case a of
        Nothing ->
            Nothing

        Just ( b1, c1 ) ->
            Just c1



---- VIEW ----


view : Models.Model -> Html Msg
view model =
    div []
        [ div [ class "container" ] [ basicDataform model ]
        ]


preguntarPaisOcurrencia : Models.Model -> Html Msg
preguntarPaisOcurrencia { autoState, query, countryList, verSugerenciasPais, paisOcurrenciaCaso, numeroSugerencias } =
    let
        options =
            { preventDefault = True, stopPropagation = False }

        dec =
            (Decode.map
                (\code ->
                    if code == 38 || code == 40 then
                        Ok NoOp
                    else if code == 27 then
                        Ok HandleEscape
                    else
                        Err "not handling that key"
                )
                Html.Events.keyCode
            )
                |> Decode.andThen
                    fromResult

        fromResult : Result String a -> Decode.Decoder a
        fromResult result =
            case result of
                Ok val ->
                    Decode.succeed val

                Err reason ->
                    Decode.fail reason

        menu =
            if verSugerenciasPais then
                [ Html.map SetAutocompleteState
                    (Autocomplete.view viewConfig numeroSugerencias autoState (acceptableCountry query countryList))
                ]
            else
                []

        query1 =
            case paisOcurrenciaCaso of
                Just pais ->
                    Tuple.second pais

                Nothing ->
                    query

        activeDescendant attributes =
            case paisOcurrenciaCaso of
                Just pais ->
                    (attribute "aria-activedescendant"
                        (Tuple.second pais)
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
                        , onFocus NoOp
                        , onWithOptions "keydown" options dec
                        , value query1
                        , id "pais-ocurrencia-input"
                        , class "autocomplete-input"
                        , autocomplete False
                        , attribute "aria-owns" "list-of-presidents"
                        , attribute "aria-expanded" <| String.toLower <| toString verSugerenciasPais
                        , attribute "aria-haspopup" <| String.toLower <| toString verSugerenciasPais
                        , attribute "role" "combobox"
                        , attribute "aria-autocomplete" "list"
                        ]
                    )
                    []
                ]
                menu
            )


tabs : Html Msg
tabs =
    ul [ class "nav nav-tabs" ]
        [ li [ class "active" ] [ a [ href "#" ] [ text "Sala de espera" ] ]
        , li [] [ a [ href "#" ] [ text "Sala de Procedimientos" ] ]
        ]


casilla : String -> (String -> Msg) -> Html Msg
casilla etiqueta accion =
    div []
        [ label [] [ text etiqueta ]
        , input [ type_ "text", onInput accion ] []
        ]


checkBox : ( String, Msg ) -> Html Msg
checkBox ( label_, msg ) =
    label [ class "pure-checkbox" ]
        [ input [ type_ "checkbox", onClick msg ] []
        , text label_
        ]


radioButton : String -> ( Msg, String ) -> Html Msg
radioButton name_ ( msg, label_ ) =
    label [ class "pure-radio" ]
        [ input [ onClick msg, type_ "radio", name name_ ] []
        , text label_
        ]


preguntarGeneroPaciente : List (Html Msg)
preguntarGeneroPaciente =
    [ ( DefinirSexoPaciente Masculino, "Masculino" )
    , ( DefinirSexoPaciente Femenino, "Femenino" )
    , ( DefinirSexoPaciente Indeterminado, "Indeterminado" )
    ]
        |> List.map (radioButton "sexo")


preguntarAreaOcurrencia : Html Msg
preguntarAreaOcurrencia =
    [ ( DefinirAreaOcurrenciaCaso CabeceraMunicipal, "Cabecera Municipal" )
    , ( DefinirAreaOcurrenciaCaso RuralDisperso, "Rural Disperso" )
    , ( DefinirAreaOcurrenciaCaso CentroPoblado, "Centro Poblado" )
    ]
        |> List.map (radioButton "area")
        |> div []


preguntarTipoIdentificacion : Html Msg
preguntarTipoIdentificacion =
    select [ onInput DefinirTipoIdentificacion, class "custom-select" ]
        [ option [ value "cc", selected True ] [ text "Cedula de Ciudadania" ]
        , option [ value "ce" ] [ text "CedulaExtrangeria" ]
        , option [ value "rc" ] [ text "Registro Civil" ]
        , option [ value "ti" ] [ text "Targeta de Identidad" ]
        , option [ value "ps" ] [ text "Pasaporte" ]
        , option [ value "ms" ] [ text "Menor sin Identificacion" ]
        , option [ value "as" ] [ text "Adulto sin Identificacion" ]
        ]


preguntarRegimenSalud : List (Html Msg)
preguntarRegimenSalud =
    [ ( DefinirTipoRegimenSalud Subsidiado, "Subsidiado" )
    , ( DefinirTipoRegimenSalud Contributivo, "Contributivo" )
    , ( DefinirTipoRegimenSalud Vinculado, "Vinculado" )
    , ( DefinirTipoRegimenSalud NoAsegurado, "No Asegurado" )
    ]
        |> List.map (radioButton "regimen")


preguntarPertenenciaEtnica : List (Html Msg)
preguntarPertenenciaEtnica =
    [ ( DefinirPertenenciaEtnica Indigena, "Indígena" )
    , ( DefinirPertenenciaEtnica RomGitano, "Rom, Gitano" )
    , ( DefinirPertenenciaEtnica Raizal, "Raizal" )
    , ( DefinirPertenenciaEtnica Palenquero, "Palenquero" )
    , ( DefinirPertenenciaEtnica NegroMulatoAfrocolombiano, "Negro, Mulato, Afrocolombiano" )
    , ( DefinirPertenenciaEtnica Otro, "Otro" )
    ]
        |> List.map (radioButton "etnica")


preguntarGruposPoblacionales : List (Html Msg)
preguntarGruposPoblacionales =
    List.map checkBox
        [ ( "Discapacitados", DefinirDiscapacitados )
        , ( "Migrantes", DefinirMigrantes )
        , ( "Gestantes", DefinirGestantes )
        , ( "Infantil a cargo del ICBF", DefinirInfantilCargoIcbf )
        , ( "Desmovilizados", DefinirDesmovilizados )
        , ( "Víctimas de violencia armada", DefinirVictimasViolenciaArmada )
        , ( "Desplazados", DefinirDesplazados )
        , ( "Carcelarios", DefinirCarcelarios )
        , ( "Indigentes", DefinirIndigentes )
        , ( "Madres Comunitarias", DefinirMadresComunitarias )
        , ( "Centros Psiquiátricos", DefinirCentrosPsiquiatricos )
        , ( "Otros Grupos Poblacionales", DefinirOtrosGruposPoblacionales )
        ]


preguntarClasificacionInicial : List (Html Msg)
preguntarClasificacionInicial =
    [ ( DefinirClasificacionInicial CasoSospechoso, "Sospechoso" )
    , ( DefinirClasificacionInicial CasoProbable, "Probable" )
    , ( DefinirClasificacionInicial ConfirmacionClinica
      , "Confirmado por Clinica"
      )
    , ( DefinirClasificacionInicial ConfirmacionEpidemiologia
      , "Confirmado por Nexo Epidemiologico"
      )
    , ( DefinirClasificacionInicial ConfrimacionLaboratorio
      , "Confirmado por Laboratorio"
      )
    ]
        |> List.map (radioButton "clasificacion_caso")


preguntarCondicionFinal : List (Html Msg)
preguntarCondicionFinal =
    [ ( DefinirCondicionFinal Vivo, "Vivo" )
    , ( DefinirCondicionFinal Muerto, "Muerto" )
    , ( DefinirCondicionFinal NoSabeCondicionFinal, "Desconocido" )
    ]
        |> List.map (radioButton "condicion_final")


basicDataform : Models.Model -> Html Msg
basicDataform model =
    div []
        [ Html.form [ class "pure-form pure-form-stacked" ]
            [ casilla "Nombres" DefinirNombresPaciente
            , casilla "Apellidos" DefinirApellidosPaciente
            , label [] [ text "Tipo de Identificacion" ]
            , preguntarTipoIdentificacion
            , casilla "Numero de Indentificacion" DefinirNumeroIdentificacion
            , casilla "Teléfono" DefinirTelefono
            , casilla "Fecha Nacimiento" DefinirFechaNacimientoPaciente
            , div [] ((text "Genero") :: preguntarGeneroPaciente)
            , label [] [ text "Pais de Ocurrencia" ]
            , preguntarPaisOcurrencia model
            , (if model.paisOcurrenciaCaso == Just ( "CO", "Colombia" ) then
                Html.map SendToMunicipios (CasillaDepartamentoMunicipio.view model.municipiosEstado)
               else
                div []
                    [ casilla "Departamento" DefinirDepartamentoOcurrenciaCaso
                    , casilla "Municipio" DefinirMunicipitoOcurrenciaCaso
                    ]
              )
            , preguntarAreaOcurrencia
            , casilla "Localidad" DefinirLocalidadOcurrenciaCaso
            , casilla "Barrio" DefinirBarrioOcurrenciaCaso
            , casilla "Cabecera Municipal/Centro Poblado/Rural Disperso" DefinirCabeceraCentroRuralOcurrenciaCaso
            , casilla "Vereda/Zona" DefinirVeredaZonaOcurrenciaCaso
            , casilla "Ocupación del Paciente" DefinirOcupacionPaciente
            , div [ class "col" ] <| (text "Regimen del Paciente") :: preguntarRegimenSalud
            , casilla "Nombre de la Administradora" DefinirNombreAdministradoraSalud
            , div [ class "col" ]
                [ div [ class "field" ]
                    [ p [ class "control" ] preguntarPertenenciaEtnica
                    ]
                ]
            , fieldset [ class "form-group" ]
                [ div [] <|
                    ((legend [] [ text "Grupo poblacional" ])
                        :: preguntarGruposPoblacionales
                    )
                ]
            , casilla "Departamento residencia Paciente" DefinirDepartamentoResidencia
            , casilla "Municipio residencia Paciente" DefinirMunicipioResidencia
            , casilla "Dirección de Residencia" DefinirDireccionResidencia
            , casilla "Fecha Inicio de los Síntomas" DefinirFechaInicioSintomas
            , casilla "Fecha de Consulta" DefinirFechaConsulta
            , label [] [ text "Clasificacion Inicial" ]
            , div [] preguntarClasificacionInicial
            , checkBox ( "Hospitalizado", DefinirHospitalizado )
            , casilla "Fecha de Hospitalización" DefinirFechaHospitalizacion
            , label [] [ text "Condicion final" ]
            , div [] preguntarCondicionFinal
            , casilla "Fecha de Defunción" DefinirFechaDefuncion
            , casilla "Número de certificado de defunción" DefinirNumeroCertificadoDefuncion
            ]
        , div [ class "col" ] [ button [ class "pure-button", onClick Enviar ] [ text "Enviar" ] ]
        ]



-- Subscriptions


subscriptions : Sub Msg
subscriptions =
    Sub.batch
        [ Sub.map SetAutocompleteState Autocomplete.subscription
        , Sub.map SendToMunicipios CasillaDepartamentoMunicipio.subscriptions
        ]
