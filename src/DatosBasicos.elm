module DatosBasicos exposing (Msg, view, update, subscriptions)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick, onCheck, onFocus, onWithOptions)
import Http
import Date
import Json.Decode as Decode
import Models exposing (..)
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
      -- Autocompletado Paises
    | FijarBusquedaPais String
    | DefinirPaisOcurrencia Pais
      -- Autocompletado municipios
    | SendToMunicipios CasillaDepartamentoMunicipio.Msg
      -- Aucompletado ocupacion
    | FijarBusquedaOcupacion String
    | DefinirOcupacionPaciente Ocupacion
      -- Http
    | Enviar
    | SendDataToServer (Result Http.Error String)



-- Set up what will happen with your menu updates


sendData : Models.Model -> Cmd Msg
sendData model =
    let
        server =
            "/save"
    in
        Http.send SendDataToServer <|
            Http.post server (encondeForm model |> Http.jsonBody) Decode.string


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
            ( { model
                | ocupacionPaciente = Just nuevo
                , mostrarSugerenciasOcupacion = False
                , busquedaOcupacion = nuevo.ocupacion
              }
            , Cmd.none
            )

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

        SendToMunicipios msg ->
            let
                ( estado, _ ) =
                    CasillaDepartamentoMunicipio.update msg model.municipiosEstado
            in
                ( { model | municipiosEstado = estado }, Cmd.none )

        FijarBusquedaOcupacion nuevo ->
            ( { model | busquedaOcupacion = nuevo, mostrarSugerenciasOcupacion = True }, Cmd.none )

        FijarBusquedaPais nuevo ->
            { model | busquedaPais = nuevo, mostrarSugerenciasPais = True } ! []

        DefinirPaisOcurrencia nuevo ->
            ( { model
                | paisOcurrenciaCaso = Just nuevo
                , mostrarSugerenciasPais = False
                , busquedaPais = nuevo.pais
              }
            , Cmd.none
            )


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
            , (if model.paisOcurrenciaCaso == Just (Pais "CO" "Colombia") then
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
            , label [] [ text "Ocupacion" ]
            , autocompleteInput model "trabajo" model.busquedaOcupacion model.listaOcupaciones
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
        [ Sub.map SendToMunicipios CasillaDepartamentoMunicipio.subscriptions
        ]


autocompleteInput : Models.Model -> String -> String -> List Ocupacion -> Html Msg
autocompleteInput model name_ str lst =
    div []
        [ input [ name name_, type_ "text", onInput FijarBusquedaOcupacion, value model.busquedaOcupacion ] []
        , if model.mostrarSugerenciasOcupacion then
            ul [ class "pure-menu custom-restricted-width" ]
                (listaSugerenciasOcupaciones model str)
          else
            text ""
        ]


listaSugerenciasOcupaciones model str =
    let
        listItem ocupacion =
            li [ class "pure-menu-item" ]
                [ a
                    [ onClick (DefinirOcupacionPaciente ocupacion)
                    , class "pure-menu-link"
                    ]
                    [ text ocupacion.ocupacion ]
                ]
    in
        List.map listItem (filtroOcupaciones model.listaOcupaciones str)


filtroOcupaciones : List Ocupacion -> String -> List Ocupacion
filtroOcupaciones ocupaciones str =
    let
        enMinusculas =
            String.toLower str

        filtro =
            String.contains enMinusculas << String.toLower << .ocupacion
    in
        List.filter filtro ocupaciones
            |> List.take 5


preguntarPaisOcurrencia model =
    let
        listItem pais =
            li [ class "pure-menu-item" ]
                [ a
                    [ class "pure-menu-link"
                    , onClick (DefinirPaisOcurrencia pais)
                    ]
                    [ text pais.pais ]
                ]

        listaSugerencias =
            filtroPaises model.listaPaises model.busquedaPais
    in
        div []
            [ input
                [ type_ "text"
                , onInput FijarBusquedaPais
                , name "preguntar-pais-ocurrencia"
                , value model.busquedaPais
                ]
                []
            , if model.mostrarSugerenciasPais then
                List.map listItem listaSugerencias |> ul [ class "pure-menui custom-restricted-width" ]
              else
                text ""
            ]


filtroPaises : List Pais -> String -> List Pais
filtroPaises paises str =
    let
        enMinusculas =
            String.toLower str

        filtro =
            String.contains enMinusculas << String.toLower << .pais
    in
        List.filter filtro paises
            |> List.take 5
