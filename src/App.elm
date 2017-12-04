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
    = DefinirNombreEvento String
    | DefinirCodigoEvento String
    | DefinirNombresPaciente String
    | DefinirApellidosPaciente String
    | DefinirNumeroIdentificacion String
    | DefinirTipoIdentificacion String
    | DefinirTelefono String
    | DefinirSexoPaciente Genero
    | DefinirFechaNacimientoPaciente String
    | DefinirDepartamentoOcurrenciaCaso String
    | DefinirMunicipioOcurrenciaCaso String
    | DefinirLocalidadOcurrenciaCaso String
    | DefinirBarrioOcurrenciaCaso String
    | DefinirCabeceraCentroRuralOcurrenciaCaso String
    | DefinirVeredaZonaOcurrenciaCaso String
    | DefinirAreaOcurrenciaCaso AreaOcurrencia
    | DefinirTipoRegimenSalud AdministradoraSalud
    | DefinirNombreAdministradoraSalud String
    | DefinirPertenenciaEtnica PertenenciaEtnica
      -- Grupos Poblacionales
    | DefinirDiscapacitados Bool
    | DefinirMigrantes Bool
    | DefinirGestantes Bool
    | DefinirInfantilCargoIcbf Bool
    | DefinirDesmovilizados Bool
    | DefinirVictimasViolenciaArmada Bool
    | DefinirDesplazados Bool
    | DefinirCarcelarios Bool
    | DefinirIndigentes Bool
    | DefinirMadresComunitarias Bool
    | DefinirCentrosPsiquiatricos Bool
    | DefinirOtrosGruposPoblacionales Bool
      -- Direccion
    | DefinirDireccionResidencia String
    | DefinirFechaConsulta String
    | DefinirFechaInicioSintomas String
    | DefinirClasificacionInicial ClasificacionCaso
    | DefinirHospitalizado Bool
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
            "/datosbasicos"
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


cleanWhiteSpace : String -> String
cleanWhiteSpace =
    String.words >> String.join " "


parseDateWithDefault : String -> Date.Date
parseDateWithDefault =
    Date.fromString >> Result.withDefault (Date.fromTime 0)


update : Msg -> Models.Model -> ( Models.Model, Cmd Msg )
update action model =
    case action of
        DefinirNombreEvento nuevo ->
            ( { model | nombreEvento = nuevo }, Cmd.none )

        DefinirCodigoEvento nuevo ->
            ( { model | codigoEvento = nuevo }, Cmd.none )

        DefinirNombresPaciente nuevo ->
            ( { model | nombresPaciente = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirApellidosPaciente nuevo ->
            ( { model | apellidosPaciente = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirNumeroIdentificacion nuevo ->
            let
                number =
                    String.trim nuevo
            in
                case (String.toInt number) of
                    Ok value_ ->
                        { model | numeroIdentificacion = value_, numeroIdValido = Valid } ! []

                    Err _ ->
                        { model | numeroIdentificacion = 0, numeroIdValido = Invalid } ! []

        DefinirTipoIdentificacion nuevo ->
            ( { model | tipoIdentificacion = convertirTipoIdentificacion nuevo }, Cmd.none )

        DefinirTelefono nuevo ->
            let
                number =
                    String.trim nuevo
            in
                case (String.toInt number) of
                    Ok value_ ->
                        { model | telefono = value_, numeroTelValido = Valid } ! []

                    Err _ ->
                        { model | telefono = 0, numeroTelValido = Invalid } ! []

        DefinirFechaNacimientoPaciente nuevo ->
            { model
                | fechaNacimientoPaciente =
                    nuevo
                        |> Date.fromString
                        |> Result.withDefault (Date.fromTime 0)
            }
                ! []

        DefinirSexoPaciente nuevo ->
            ( { model | sexoPaciente = nuevo }, Cmd.none )

        DefinirDepartamentoOcurrenciaCaso nuevo ->
            { model | departamentoOcurrenciaCaso = cleanWhiteSpace nuevo } ! []

        DefinirMunicipioOcurrenciaCaso nuevo ->
            ( { model | municipioOcurrenciaCaso = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirLocalidadOcurrenciaCaso nuevo ->
            ( { model | localidadOcurrenciaCaso = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirBarrioOcurrenciaCaso nuevo ->
            ( { model | barrioOcurrenciaCaso = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirVeredaZonaOcurrenciaCaso nuevo ->
            ( { model | veredaZonaOcurrenciaCaso = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirCabeceraCentroRuralOcurrenciaCaso nuevo ->
            ( { model | cabeceraCentroRuralOcurrenciaCaso = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirAreaOcurrenciaCaso nuevo ->
            ( { model | areaOcurrenciaCaso = nuevo }, Cmd.none )

        DefinirTipoRegimenSalud nuevo ->
            ( { model | tipoRegimenSalud = nuevo }, Cmd.none )

        DefinirNombreAdministradoraSalud nuevo ->
            ( { model | nombreAdministradoraSalud = cleanWhiteSpace nuevo }, Cmd.none )

        DefinirPertenenciaEtnica nuevo ->
            ( { model | pertenenciaEtnica = nuevo }, Cmd.none )

        -- Grupos Poblacionales
        DefinirDiscapacitados bool ->
            ( { model | discapacitados = bool }, Cmd.none )

        DefinirMigrantes bool ->
            ( { model | migrantes = bool }, Cmd.none )

        DefinirGestantes bool ->
            ( { model | gestantes = bool }, Cmd.none )

        DefinirInfantilCargoIcbf bool ->
            ( { model | infantilCargoIcbf = bool }, Cmd.none )

        DefinirDesmovilizados bool ->
            ( { model | desmovilizados = bool }, Cmd.none )

        DefinirVictimasViolenciaArmada bool ->
            ( { model | victimasViolenciaArmada = bool }, Cmd.none )

        DefinirDesplazados bool ->
            ( { model | desplazados = bool }, Cmd.none )

        DefinirCarcelarios bool ->
            ( { model | carcelarios = bool }, Cmd.none )

        DefinirIndigentes bool ->
            ( { model | indigentes = bool }, Cmd.none )

        DefinirMadresComunitarias bool ->
            ( { model | madresComunitarias = bool }, Cmd.none )

        DefinirCentrosPsiquiatricos bool ->
            ( { model | centrosPsiquiatricos = bool }, Cmd.none )

        DefinirOtrosGruposPoblacionales bool ->
            ( { model | otrosGruposPoblacionales = bool }, Cmd.none )

        -- Direccion
        DefinirDireccionResidencia nuevo ->
            ( { model | direccionResidencia = nuevo }, Cmd.none )

        DefinirFechaConsulta nuevo ->
            { model | fechaConsulta = parseDateWithDefault nuevo } ! []

        DefinirFechaInicioSintomas nuevo ->
            { model | fechaInicioSintomas = parseDateWithDefault nuevo } ! []

        DefinirClasificacionInicial nuevo ->
            ( { model | clasificacionInicialCaso = nuevo }, Cmd.none )

        DefinirHospitalizado bool ->
            ( { model | hospitalizado = bool }, Cmd.none )

        DefinirFechaHospitalizacion nuevo ->
            { model | fechaHospitalizacion = parseDateWithDefault nuevo } ! []

        DefinirCondicionFinal nuevo ->
            ( { model | condicionFinal = nuevo }, Cmd.none )

        DefinirFechaDefuncion nuevo ->
            { model | fechaDefuncion = parseDateWithDefault nuevo } ! []

        DefinirNumeroCertificadoDefuncion nuevo ->
            ( { model
                | numeroCertificadoDefuncion =
                    nuevo
                        |> String.toInt
                        |> Result.withDefault 0
              }
            , Cmd.none
            )

        DefinirCausaBasicaMuerte nuevo ->
            ( { model | causaBasicaMuerte = nuevo }, Cmd.none )

        Enviar ->
            ( model, sendData model )

        SendDataToServer (Ok key) ->
            ( { model | cuestionarioCompleto = True }, Navigation.load ("/verficha/" ++ key) )

        SendDataToServer (Err err) ->
            ( model, Cmd.none )
                |> Debug.log (toString err)

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
    div [ class "form-group" ]
        [ label [] [ text etiqueta ]
        , input [ type_ "text", onInput accion, class "form-control" ] []
        ]


casillaConAyuda : String -> String -> (String -> Msg) -> Html Msg
casillaConAyuda mensaje etiqueta accion =
    div [ class "form-group" ]
        [ label [] [ text etiqueta ]
        , input [ type_ "text", onInput accion, class "form-control" ] []
        , small [ class "form-text text-muted" ] [ text mensaje ]
        ]


casillaConValidacion : InputState -> String -> String -> (String -> Msg) -> Html Msg
casillaConValidacion state msjError etiqueta msg =
    let
        inputClass =
            case state of
                Valid ->
                    "form-control alert-success"

                Invalid ->
                    "form-control alert-danger"

                Pristine ->
                    "form-control"
    in
        div [ class "form-group" ]
            [ label [] [ text etiqueta ]
            , input [ type_ "text", onInput msg, class inputClass ] []
            , if state == Invalid then
                small [ class "form-text text-danger" ] [ text msjError ]
              else
                text ""
            ]


checkBox : ( String, Bool -> Msg ) -> Html Msg
checkBox ( label_, msg ) =
    div [ class "form-check" ]
        [ label [ class "form-check-label" ]
            [ input [ type_ "checkbox", class "form-check-input", onCheck msg ] []
            , text label_
            ]
        ]


radioButton : String -> ( Msg, String ) -> Html Msg
radioButton name_ ( msg, label_ ) =
    div [ class "form-check" ]
        [ label
            [ class "form-check-label" ]
            [ input [ onClick msg, type_ "radio", name name_, class "form-check-input" ] []
            , text label_
            ]
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
    div [ class "form-group" ]
        [ label [] [ text "Tipo de indentificacion" ]
        , select [ onInput DefinirTipoIdentificacion, class "form-control custom-select" ]
            [ option [ value "cc", selected True ] [ text "Cédula de Ciudadanía" ]
            , option [ value "ce" ] [ text "Cédula de Extrangería" ]
            , option [ value "rc" ] [ text "Registro Civil" ]
            , option [ value "ti" ] [ text "Tarjeta de Identidad" ]
            , option [ value "ps" ] [ text "Pasaporte" ]
            , option [ value "ms" ] [ text "Menor sin Identificación" ]
            , option [ value "as" ] [ text "Adulto sin Identificación" ]
            ]
        ]


preguntarRegimenSalud : List (Html Msg)
preguntarRegimenSalud =
    [ ( DefinirTipoRegimenSalud Subsidiado, "Subsidiado" )
    , ( DefinirTipoRegimenSalud Contributivo, "Contributivo" )
    , ( DefinirTipoRegimenSalud Especial, "Especial" )
    , ( DefinirTipoRegimenSalud Excepcion, "Excepción" )
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
      , "Confirmado por Clínica"
      )
    , ( DefinirClasificacionInicial ConfirmacionEpidemiologia
      , "Confirmado por Nexo Epidemiológico"
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
    small [ class "form-text text-muted" ] [ text a ]


basicDataform : Models.Model -> Html Msg
basicDataform model =
    Html.form [ class "", autocomplete False ]
        [ h2 [] [ text "Datos Basicos SIVIGILA" ]
        , casilla "Nombre del Evento" DefinirNombreEvento
        , casilla "Codigo del Evento" DefinirCodigoEvento
        , casilla "Nombres" DefinirNombresPaciente
        , casilla "Apellidos" DefinirApellidosPaciente
        , preguntarTipoIdentificacion
        , casillaConValidacion model.numeroIdValido
            "No parece un numero de documento"
            "Numero de Indentificacion"
            DefinirNumeroIdentificacion
        , casillaConValidacion model.numeroTelValido "Usa solo numeros y un unico telefono" "Teléfono" DefinirTelefono
        , casillaConAyuda "Formato AAAA/MM/DD" "Fecha Nacimiento" DefinirFechaNacimientoPaciente
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
                , casilla "Municipio" DefinirMunicipioOcurrenciaCaso
                ]
        , div [ class "form-check" ] [ preguntarAreaOcurrencia ]
        , casilla "Localidad" DefinirLocalidadOcurrenciaCaso
        , casilla "Barrio" DefinirBarrioOcurrenciaCaso
        , casilla "Cabecera Municipal/Centro Poblado/Rural Disperso" DefinirCabeceraCentroRuralOcurrenciaCaso
        , if model.areaOcurrenciaCaso == RuralDisperso || model.areaOcurrenciaCaso == CentroPoblado then
            casilla "Vereda/Zona" DefinirVeredaZonaOcurrenciaCaso
          else
            text ""
        , autocompleteInput model "trabajo" model.busquedaOcupacion model.listaOcupaciones "Ocupacion"
        , label [] [ text "Tipo de regimen en Salud" ]
        , div [] <| preguntarRegimenSalud
        , casilla "Nombre de la Administradora de Planes de Beneficios" DefinirNombreAdministradoraSalud
        , label [] [ text "Pertenencia Etnica" ]
        , div [] preguntarPertenenciaEtnica
        , fieldset [ class "form-group" ]
            [ label [] [ text "Grupos poblacionales a los que pertenece" ]
            , div [] preguntarGruposPoblacionales
            ]
        , label [] [ text "Municipio y Departamento de Residencia" ]
        , preguntarMunicipioResidencia model
        , casilla "Dirección de Residencia" DefinirDireccionResidencia
        , div [ class "form-group" ]
            [ label [] [ text "Fecha de Inicio de los Sintomas" ]
            , vistaFijarFecha
                model.fechaInicioSintomas
                model.datePickerInicioSintomas
                (HaciaFijarFecha FechaInicioSintomas)
            ]
        , div [ class "form-group" ]
            [ label [] [ text "Fecha de Consulta" ]
            , vistaFijarFecha
                model.fechaConsulta
                model.datePickerConsulta
                (HaciaFijarFecha FechaConsulta)
            ]
        , fieldset [ class "form-group" ]
            [ legend [] [ text "Clasificacion Inicial" ]
            , div [] preguntarClasificacionInicial
            ]
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
            [ class "btn btn-success btn-lg"
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
    div [ class "vsmd-menu" ]


autocompleteInput : Models.Model -> String -> String -> List Ocupacion -> String -> Html Msg
autocompleteInput model name_ str lst label_ =
    div [ class "form-group" ]
        [ label [] [ text label_ ]
        , input
            [ name name_
            , class "form-control"
            , type_ "text"
            , onInput FijarBusquedaOcupacion
            , value model.busquedaOcupacion
            ]
            []
        , if model.mostrarSugerenciasOcupacion then
            listaSugerenciasOcupaciones model str
                |> vistaSugerencias
          else
            text ""
        ]



--listItem : msg -> (a -> String) -> a -> Html msg


listItem mensaje funcion dato =
    a
        [ onClick (mensaje dato)
        , class "dropdown-item"
        ]
        [ text (funcion dato) ]


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
                , class "form-control"
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
                , class "form-control"
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
                , class "form-control"
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
        ( { numeroIdValido = Pristine
          , numeroTelValido = Pristine
          , cuestionarioCompleto = False
          , nombreEvento = ""
          , codigoEvento = ""
          , fechaNotificacion = Date.fromTime 0
          , numeroIdentificacion = 0
          , tipoIdentificacion = CedulaCiudadania
          , nombresPaciente = ""
          , apellidosPaciente = ""
          , telefono = 0
          , fechaNacimientoPaciente = Date.fromTime 0
          , edadPaciente = 0
          , unidadMedidaEdad = NoAplicaEdad
          , sexoPaciente = Indeterminado
          , departamentoOcurrenciaCaso = ""
          , paisOcurrenciaCaso = Nothing
          , municipioOcurrenciaCaso = ""
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
