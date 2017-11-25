module App exposing (..)

import Html exposing (..)
import Models exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick, onCheck, onFocus, onWithOptions)
import Http
import Date
import Json.Decode as Decode
import Models exposing (..)
import Navigation
import DatePicker exposing (defaultSettings)


type EstablecerFecha
    = FechaConsulta
    | FechaInicioSintomas
    | FechaHospitalizacion
    | FechaDefuncion


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
    | FijarBusquedaMunicipio String
    | DefinirMunicipioColombiano Municipio
      -- Aucompletado ocupacion
    | FijarBusquedaOcupacion String
    | DefinirOcupacionPaciente Ocupacion
      -- Autocompletado municipio residencia
    | FijarBusquedaMunicipioResidencia String
    | DefinirMunicipioResidencia Municipio
      -- Http
    | Enviar
    | SendDataToServer (Result Http.Error String)
      -- Datepicker
    | HaciaFijarFecha EstablecerFecha DatePicker.Msg



---- UPDATE ----


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
            TarjetaIdentidad

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

        SendDataToServer (Ok key) ->
            ( { model | cuestionarioCompleto = True }, Navigation.load ("/verficha/" ++ key) )

        SendDataToServer (Err err) ->
            ( model, Cmd.none )

        FijarBusquedaOcupacion nuevo ->
            { model | busquedaOcupacion = nuevo, mostrarSugerenciasOcupacion = True } ! []

        FijarBusquedaPais nuevo ->
            { model | busquedaPais = nuevo, mostrarSugerenciasPais = True } ! []

        FijarBusquedaMunicipio nuevo ->
            { model | busquedaMunicipio = nuevo, mostrarSugerenciasMunicipio = True } ! []

        FijarBusquedaMunicipioResidencia nuevo ->
            { model | busquedaMunicipioResidencia = nuevo, mostrarSugerenciasMunicipioResidencia = True } ! []

        DefinirPaisOcurrencia nuevo ->
            { model
                | paisOcurrenciaCaso = Just nuevo
                , mostrarSugerenciasPais = False
                , busquedaPais = nuevo.pais
            }
                ! []

        DefinirOcupacionPaciente nuevo ->
            { model
                | ocupacionPaciente = Just nuevo
                , mostrarSugerenciasOcupacion = False
                , busquedaOcupacion = nuevo.ocupacion
            }
                ! []

        DefinirMunicipioColombiano nuevo ->
            { model
                | municipioColombiano = Just nuevo
                , mostrarSugerenciasMunicipio = False
                , busquedaMunicipio = nuevo.nombre
            }
                ! []

        DefinirMunicipioResidencia nuevo ->
            { model
                | municipioResidencia = Just nuevo
                , mostrarSugerenciasMunicipioResidencia = False
                , busquedaMunicipioResidencia = nuevo.nombre
            }
                ! []

        HaciaFijarFecha id msg ->
            case id of
                FechaConsulta ->
                    let
                        ( newDatePicker, datePickerCmd, dateEvent ) =
                            DatePicker.update someSettings msg model.datePickerConsulta

                        date =
                            case dateEvent of
                                DatePicker.NoChange ->
                                    Just model.fechaConsulta

                                DatePicker.Changed newDate ->
                                    newDate
                    in
                        { model
                            | fechaConsulta = Maybe.withDefault (Date.fromTime 0) date
                            , datePickerConsulta = newDatePicker
                        }
                            ! [ Cmd.map (HaciaFijarFecha FechaConsulta) datePickerCmd ]

                FechaInicioSintomas ->
                    let
                        ( newDatePicker, datePickerCmd, dateEvent ) =
                            DatePicker.update someSettings msg model.datePickerInicioSintomas

                        date =
                            case dateEvent of
                                DatePicker.NoChange ->
                                    Just model.fechaInicioSintomas

                                DatePicker.Changed newDate ->
                                    newDate
                    in
                        { model
                            | fechaInicioSintomas = Maybe.withDefault (Date.fromTime 0) date
                            , datePickerInicioSintomas = newDatePicker
                        }
                            ! [ Cmd.map (HaciaFijarFecha FechaInicioSintomas) datePickerCmd ]

                FechaHospitalizacion ->
                    let
                        ( newDatePicker, datePickerCmd, dateEvent ) =
                            DatePicker.update someSettings msg model.datePickerHospitalizacion

                        date =
                            case dateEvent of
                                DatePicker.NoChange ->
                                    Just model.fechaHospitalizacion

                                DatePicker.Changed newDate ->
                                    newDate
                    in
                        { model
                            | fechaHospitalizacion = Maybe.withDefault (Date.fromTime 0) date
                            , datePickerHospitalizacion = newDatePicker
                        }
                            ! [ Cmd.map (HaciaFijarFecha FechaHospitalizacion) datePickerCmd ]

                FechaDefuncion ->
                    let
                        ( newDatePicker, datePickerCmd, dateEvent ) =
                            DatePicker.update someSettings msg model.datePickerDefuncion

                        date =
                            case dateEvent of
                                DatePicker.NoChange ->
                                    Just model.fechaDefuncion

                                DatePicker.Changed newDate ->
                                    newDate
                    in
                        { model
                            | fechaDefuncion = Maybe.withDefault (Date.fromTime 0) date
                            , datePickerDefuncion = newDatePicker
                        }
                            ! [ Cmd.map (HaciaFijarFecha FechaInicioSintomas) datePickerCmd ]


someSettings : DatePicker.Settings
someSettings =
    { defaultSettings
        | inputClassList = [ ( "form-control", True ) ]
        , inputId = Just "datepicker"
        , inputAttributes = [ (readonly True) ]
    }



---- VIEW ----


view : Models.Model -> Html Msg
view model =
    if model.cuestionarioCompleto then
        div [] [ h2 [] [ text "Datos alamacenados exitosamente" ] ]
    else
        basicDataform model


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
        , option [ value "ti" ] [ text "Tarjeta de Identidad" ]
        , option [ value "ps" ] [ text "Pasaporte" ]
        , option [ value "ms" ] [ text "Menor sin Identificacion" ]
        , option [ value "as" ] [ text "Adulto sin Identificacion" ]
        ]


preguntarRegimenSalud : List (Html Msg)
preguntarRegimenSalud =
    [ ( DefinirTipoRegimenSalud Subsidiado, "Subsidiado" )
    , ( DefinirTipoRegimenSalud Contributivo, "Contributivo" )
    , ( DefinirTipoRegimenSalud Especial, "Especial" )
    , ( DefinirTipoRegimenSalud Excepcion, "Excepcion" )
    , ( DefinirTipoRegimenSalud NoAsegurado, "No Asegurado" )
    , ( DefinirTipoRegimenSalud RegimenIndeterminado, "Indeterminado / Pendiente" )
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


mensajeAyuda : String -> Html msg
mensajeAyuda a =
    span [ class "pure-form-message" ] [ text a ]


basicDataform : Models.Model -> Html Msg
basicDataform model =
    Html.form [ class "pure-form pure-form-stacked", autocomplete False ]
        [ h2 [] [ text "Datos Basicos SIVIGILA" ]
        , casilla "Nombres" DefinirNombresPaciente
        , casilla "Apellidos" DefinirApellidosPaciente
        , label [] [ text "Tipo de Identificacion" ]
        , preguntarTipoIdentificacion
        , casilla "Numero de Indentificacion" DefinirNumeroIdentificacion
        , casilla "Teléfono" DefinirTelefono
        , casilla "Fecha Nacimiento" DefinirFechaNacimientoPaciente
        , mensajeAyuda "Formato AAAA/MM/DD"
        , div [] ((text "Genero") :: preguntarGeneroPaciente)
        , label [] [ text "Pais de Ocurrencia" ]
        , preguntarPaisOcurrencia model
        , if model.paisOcurrenciaCaso == Just (Pais "CO" "Colombia") then
            div []
                [ label [] [ text "Municipio y Departamento de Ocurrencia" ]
                , preguntarMunicipioOcurrencia model
                ]
          else
            div []
                [ casilla "Departamento" DefinirDepartamentoOcurrenciaCaso
                , casilla "Municipio" DefinirMunicipitoOcurrenciaCaso
                ]
        , preguntarAreaOcurrencia
        , casilla "Localidad" DefinirLocalidadOcurrenciaCaso
        , casilla "Barrio" DefinirBarrioOcurrenciaCaso
        , casilla "Cabecera Municipal/Centro Poblado/Rural Disperso" DefinirCabeceraCentroRuralOcurrenciaCaso
        , if model.areaOcurrenciaCaso == RuralDisperso || model.areaOcurrenciaCaso == CentroPoblado then
            casilla "Vereda/Zona" DefinirVeredaZonaOcurrenciaCaso
          else
            text ""
        , label [] [ text "Ocupacion" ]
        , autocompleteInput model "trabajo" model.busquedaOcupacion model.listaOcupaciones
        , label [] [ text "Tipo de regimen en Salud" ]
        , div [] <| preguntarRegimenSalud
        , casilla "Nombre de la Administradora de Planes de Beneficios" DefinirNombreAdministradoraSalud
        , label [] [ text "Pertenencia Etnica" ]
        , div [] preguntarPertenenciaEtnica
        , fieldset [ class "form-group" ]
            [ div [] <|
                ((legend [] [ text "Grupos poblacionales a los que pertenece" ])
                    :: preguntarGruposPoblacionales
                )
            ]
        , label [] [ text "Municipio y Departamento de Residencia" ]
        , preguntarMunicipioResidencia model
        , casilla "Dirección de Residencia" DefinirDireccionResidencia
        , label [] [ text "Fecha de Inicio de los Sintomas" ]
        , vistaFijarFecha
            model.fechaInicioSintomas
            model.datePickerInicioSintomas
            (HaciaFijarFecha FechaInicioSintomas)
        , label [] [ text "Fecha de Consulta" ]
        , vistaFijarFecha
            model.fechaConsulta
            model.datePickerConsulta
            (HaciaFijarFecha FechaConsulta)
        , label [] [ text "Clasificacion Inicial" ]
        , div [] preguntarClasificacionInicial
        , checkBox ( "Hospitalizado", DefinirHospitalizado )
        , if model.hospitalizado then
            div []
                [ label []
                    [ text "Fecha de Hospitalizacion"
                    ]
                , vistaFijarFecha
                    model.fechaHospitalizacion
                    model.datePickerHospitalizacion
                    (HaciaFijarFecha FechaHospitalizacion)
                ]
          else
            text ""
        , label [] [ text "Condicion final" ]
        , div [] preguntarCondicionFinal
        , if model.condicionFinal == Muerto then
            div []
                [ label [] [ text "Fecha de Defuncion" ]
                , vistaFijarFecha
                    model.fechaDefuncion
                    model.datePickerDefuncion
                    (HaciaFijarFecha FechaDefuncion)
                , casilla "Número de certificado de defunción" DefinirNumeroCertificadoDefuncion
                , casilla "Causa Basica de Muerte" DefinirCausaBasicaMuerte
                ]
          else
            text ""
        , button
            [ class "pure-button"
            , onWithOptions "click"
                { stopPropagation = True, preventDefault = True }
                (Decode.succeed Enviar)
            ]
            [ text "Enviar" ]
        ]


vistaFijarFecha fecha picker msg =
    div []
        [ DatePicker.view
            (Just fecha)
            someSettings
            picker
            |> Html.map msg
        ]



-- Autocompletado


vistaSugerencias : List (Html msg) -> Html msg
vistaSugerencias =
    ul [ class "pure-menu custom-restricted-width" ]


autocompleteInput : Models.Model -> String -> String -> List Ocupacion -> Html Msg
autocompleteInput model name_ str lst =
    div []
        [ input [ name name_, type_ "text", onInput FijarBusquedaOcupacion, value model.busquedaOcupacion ] []
        , if model.mostrarSugerenciasOcupacion then
            listaSugerenciasOcupaciones model str
                |> vistaSugerencias
          else
            text ""
        ]



--listItem : msg -> (a -> String) -> a -> Html msg


listItem mensaje funcion dato =
    li [ class "pure-menu-item" ]
        [ a
            [ onClick (mensaje dato)
            , class "pure-menu-link"
            ]
            [ text (funcion dato) ]
        ]


listaSugerenciasOcupaciones : Model -> String -> List (Html Msg)
listaSugerenciasOcupaciones model str =
    let
        vista =
            listItem DefinirOcupacionPaciente .ocupacion

        lista =
            filtroSugerencias model.listaOcupaciones str .ocupacion
    in
        List.map vista lista


filtroSugerencias : List a -> String -> (a -> String) -> List a
filtroSugerencias lista busqueda funcion =
    let
        enMinusculas =
            String.toLower busqueda

        filtro =
            String.contains enMinusculas << String.toLower << funcion
    in
        List.filter filtro lista
            |> List.take 5


preguntarPaisOcurrencia : Model -> Html Msg
preguntarPaisOcurrencia model =
    let
        vista =
            listItem DefinirPaisOcurrencia .pais

        listaSugerencias =
            filtroSugerencias model.listaPaises model.busquedaPais .pais
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
                List.map vista listaSugerencias
                    |> vistaSugerencias
              else
                text ""
            ]


preguntarMunicipioOcurrencia : Model -> Html Msg
preguntarMunicipioOcurrencia model =
    let
        vista =
            listItem DefinirMunicipioColombiano (\mun -> (.nombre mun ++ ", " ++ .departamento mun))

        listaSugerencias =
            filtroSugerencias model.listaMunicipios model.busquedaMunicipio .nombre
    in
        div []
            [ input
                [ type_ "text"
                , onInput FijarBusquedaMunicipio
                , name "preguntar-municipio-ocurrencia"
                , value model.busquedaMunicipio
                ]
                []
            , if model.mostrarSugerenciasMunicipio then
                List.map vista listaSugerencias
                    |> vistaSugerencias
              else
                text ""
            ]


preguntarMunicipioResidencia : Model -> Html Msg
preguntarMunicipioResidencia model =
    let
        vista =
            listItem DefinirMunicipioResidencia (\mun -> (.nombre mun ++ ", " ++ .departamento mun))

        listaSugerencias =
            filtroSugerencias model.listaMunicipios model.busquedaMunicipioResidencia .nombre
    in
        div []
            [ input
                [ type_ "text"
                , onInput FijarBusquedaMunicipioResidencia
                , name "preguntar-municipio-residencia"
                , value model.busquedaMunicipioResidencia
                ]
                []
            , if model.mostrarSugerenciasMunicipioResidencia then
                List.map vista listaSugerencias
                    |> vistaSugerencias
              else
                text ""
            ]



---- PROGRAM ----


type alias Flags =
    { municipios : List Municipio
    , ocupaciones : List Models.Ocupacion
    , paises : List Models.Pais
    }


init : Flags -> ( Model, Cmd Msg )
init objeto =
    let
        ( datePicker, datePickerCmd ) =
            DatePicker.init
    in
        ( { cuestionarioCompleto = False
          , nombreEvento = ""
          , codigoEvento = 123
          , fechaNotificacion = Date.fromTime 0
          , numeroIdentificacion = 0
          , tipoIdentificacion = CedulaCiudadania
          , nombresPaciente = ""
          , apellidosPaciente = ""
          , telefono = ""
          , fechaNacimientoPaciente = Date.fromTime 0
          , edadPaciente = 0
          , unidadMedidaEdad = NoAplicaEdad
          , sexoPaciente = Indeterminado
          , departamentoOcurrenciaCaso = ""
          , paisOcurrenciaCaso = Nothing
          , municipitoOcurrenciaCaso = ""
          , localidadOcurrenciaCaso = ""
          , barrioOcurrenciaCaso = ""
          , cabeceraCentroRuralOcurrenciaCaso = ""
          , veredaZonaOcurrenciaCaso = ""
          , areaOcurrenciaCaso = CabeceraMunicipal
          , ocupacionPaciente = Nothing
          , tipoRegimenSalud = NoAsegurado
          , nombreAdministradoraSalud = ""
          , pertenenciaEtnica = Otro
          , discapacitados = False
          , migrantes = False
          , gestantes = False
          , infantilCargoIcbf = False
          , desmovilizados = False
          , victimasViolenciaArmada = False
          , desplazados = False
          , carcelarios = False
          , indigentes = False
          , madresComunitarias = False
          , centrosPsiquiatricos = False
          , otrosGruposPoblacionales = False
          , direccionResidencia = ""

          -- Fechas de relevancia
          , fechaInicioSintomas = Date.fromTime 0
          , fechaConsulta = Date.fromTime 0
          , clasificacionInicialCaso = CasoSospechoso
          , hospitalizado = False
          , fechaHospitalizacion = Date.fromTime 0
          , condicionFinal = NoSabeCondicionFinal
          , fechaDefuncion = Date.fromTime 0
          , numeroCertificadoDefuncion = 0
          , causaBasicaMuerte = ""

          -- Autocompletado de la casilla de paises
          , listaPaises = objeto.paises
          , busquedaPais = ""
          , mostrarSugerenciasPais = False

          -- Autocompletado municipios
          , listaMunicipios = objeto.municipios
          , busquedaMunicipio = ""
          , mostrarSugerenciasMunicipio = False
          , municipioColombiano = Nothing

          -- Autocompletado trabjo
          , listaOcupaciones = objeto.ocupaciones
          , busquedaOcupacion = ""
          , mostrarSugerenciasOcupacion = False

          -- Autocompletado municipio residencia
          , busquedaMunicipioResidencia = ""
          , mostrarSugerenciasMunicipioResidencia = False
          , municipioResidencia = Nothing
          , datePickerConsulta = datePicker
          , datePickerInicioSintomas = datePicker
          , datePickerHospitalizacion = datePicker
          , datePickerDefuncion = datePicker
          }
        , Cmd.batch
            [ Cmd.map (HaciaFijarFecha FechaConsulta) datePickerCmd
            , Cmd.map (HaciaFijarFecha FechaInicioSintomas) datePickerCmd
            , Cmd.map (HaciaFijarFecha FechaHospitalizacion) datePickerCmd
            , Cmd.map (HaciaFijarFecha FechaDefuncion) datePickerCmd
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
        []
