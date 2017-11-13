module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Http
import Date
import Json.Encode as Encode
import Json.Decode as Decode


---- MODEL ----


type Genero
    = Masculino
    | Femenino
    | Indeterminado


type alias Patient =
    { name : String, gender : Genero, consultWhy : String, priority : Int, age : Int }


type UnidadMedidaEdad
    = Anos
    | Meses
    | Dias
    | Horas
    | Minutos
    | NoAplicaEdad


type TipoIdentificacion
    = TargetaIdentidad
    | RegistroCivil
    | CedulaCiudadania
    | CedulaExtrangeria
    | Pasaporte
    | MenorSinIdentifiacion
    | AdultoSinIdentificacion


type AreaOcurrencia
    = CabeceraMunicipal
    | RuralDisperso
    | CentroPoblado


type AdministradoraSalud
    = Subsidiado
    | Contributivo
    | Vinculado
    | NoAsegurado


type PertenenciaEtnica
    = Indigena
    | RomGitano
    | Raizal
    | Palenquero
    | NegroMulatoAfrocolombiano
    | Otro


type ClasificacionCaso
    = CasoProbable
    | CasoSospechoso
    | ConfirmacionClinica
    | ConfirmacionEpidemiologia
    | ConfrimacionLaboratorio


type CondicionFinal
    = Vivo
    | Muerto
    | NoSabeCondicionFinal


type alias Model =
    { -- Informacion general
      nombreEvento : String
    , codigoEvento : Int
    , fechaNotificacion : Date.Date

    -- Identificacion del paciente
    , numeroIdentificacion : Int
    , tipoIdentificacion : TipoIdentificacion
    , nombresPaciente : String
    , apellidosPaciente : String
    , telefono : String
    , fechaNacimientoPaciente : Date.Date
    , edadPaciente : Int
    , unidadMedidaEdad : UnidadMedidaEdad
    , sexoPaciente : Genero

    -- Ocurrencia del evento
    , paisOcurrenciaCaso : String
    , departamentoOcurrenciaCaso : String
    , municipitoOcurrenciaCaso : String
    , localidadOcurrenciaCaso : String
    , barrioOcurrenciaCaso : String
    , cabeceraCentroRuralOcurrenciaCaso : String
    , veredaZonaOcurrenciaCaso : String
    , areaOcurrenciaCaso : AreaOcurrencia

    -- Demograficos
    , ocupacionPaciente : String
    , tipoRegimenSalud : AdministradoraSalud
    , nombreAdministradoraSalud : String
    , pertenenciaEtnica : PertenenciaEtnica

    -- Grupos poblacionales
    , discapacitados : Bool
    , migrantes : Bool
    , gestantes : Bool
    , infantilCargoIcbf : Bool
    , desmovilizados : Bool
    , victimasViolenciaArmada : Bool
    , desplazados : Bool
    , carcelarios : Bool
    , indigentes : Bool
    , madresComunitarias : Bool
    , centrosPsiquiatricos : Bool
    , otrosGruposPoblacionales : Bool

    -- Residencia del paciente
    , departamentoResidencia : String
    , municipioResidencia : String
    , direccionResidencia : String

    -- Fechas de relevancia
    , fechaInicioSintomas : Date.Date
    , fechaConsulta : Date.Date
    , clasificacionInicialCaso : ClasificacionCaso
    , hospitalizado : Bool
    , fechaHospitalizacion : Date.Date
    , condicionFinal : CondicionFinal
    , fechaDefuncion : Date.Date
    , numeroCertificadoDefuncion : Int
    , causaBasicaMuerte : String
    }


model =
    { nombreEvento = ""
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
    , paisOcurrenciaCaso = ""
    , municipitoOcurrenciaCaso = ""
    , localidadOcurrenciaCaso = ""
    , barrioOcurrenciaCaso = ""
    , cabeceraCentroRuralOcurrenciaCaso = ""
    , veredaZonaOcurrenciaCaso = ""
    , areaOcurrenciaCaso = CabeceraMunicipal
    , ocupacionPaciente = ""
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
    , departamentoResidencia = ""
    , municipioResidencia = ""
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
    }


init : String -> ( Model, Cmd Msg )
init path =
    ( model, Cmd.none )


encondeForm : Model -> Encode.Value
encondeForm model =
    Encode.object
        [ ( "nombres_paciente", Encode.string model.nombresPaciente )
        , ( "apellidos_paciente", Encode.string model.apellidosPaciente )
        , ( "tipo_identificacion", Encode.string <| toString model.tipoIdentificacion )
        , ( "numero_identificacion", Encode.int model.numeroIdentificacion )
        , ( "telefono", Encode.string model.telefono )
        , ( "sexo_paciente", Encode.string <| toString model.sexoPaciente )
        , ( "pais_ocurrencia", Encode.string model.paisOcurrenciaCaso )
        , ( "municipio_ocurrencia", Encode.string model.municipitoOcurrenciaCaso )
        , ( "fecha_nacimiento_paciente"
          , Date.toTime model.fechaNacimientoPaciente
                |> Encode.float
          )
        , ( "departamento_ocurrencia_caso", Encode.string model.departamentoOcurrenciaCaso )
        , ( "localidad_ocurrencia_caso", Encode.string model.localidadOcurrenciaCaso )
        , ( "barrio_ocurrencia_caso", Encode.string model.barrioOcurrenciaCaso )
        , ( "cabecera_centro_rural_ocurrencia_caso"
          , Encode.string model.cabeceraCentroRuralOcurrenciaCaso
          )
        , ( "vereda_zona_ocurrencia_caso", Encode.string model.veredaZonaOcurrenciaCaso )
        , ( "area_ocurrencia_caso", Encode.string <| toString model.areaOcurrenciaCaso )
        , ( "ocupacion_paciente", Encode.string model.ocupacionPaciente )
        , ( "tipo_regimen_salud", Encode.string <| toString model.tipoRegimenSalud )
        , ( "nombre_administradora_salud", Encode.string model.nombreAdministradoraSalud )
        , ( "pertenencia_etnica", Encode.string <| toString model.pertenenciaEtnica )
        , ( "discapacitados", Encode.bool model.discapacitados )
        , ( "migrantes", Encode.bool model.migrantes )
        , ( "gestantes", Encode.bool model.gestantes )
        , ( "infantil_cargo_icbf", Encode.bool model.infantilCargoIcbf )
        , ( "desmovilizados", Encode.bool model.desmovilizados )
        , ( "victimas_violencia_armada", Encode.bool model.victimasViolenciaArmada )
        , ( "desplazados", Encode.bool model.desplazados )
        , ( "carcelarios", Encode.bool model.carcelarios )
        , ( "indigentes", Encode.bool model.indigentes )
        , ( "madres_comunitarias", Encode.bool model.madresComunitarias )
        , ( "centros_psiquiatricos", Encode.bool model.centrosPsiquiatricos )
        , ( "otros_grupos_poblacionales", Encode.bool model.otrosGruposPoblacionales )
        , ( "departamento_residencia", Encode.string model.departamentoResidencia )
        , ( "municipio_residencia", Encode.string model.municipioResidencia )
        , ( "direccion_residencia", Encode.string model.direccionResidencia )

        -- Fechas relevancia
        , ( "fecha_inicio_sintomas", Encode.float <| Date.toTime model.fechaInicioSintomas )
        , ( "fecha_consulta", Encode.float <| Date.toTime model.fechaConsulta )
        , ( "clasificacion_inicial_caso", Encode.string <| toString model.clasificacionInicialCaso )
        , ( "hospitalizado", Encode.bool model.hospitalizado )
        , ( "fecha_hospitalizacion", Encode.float <| Date.toTime model.fechaHospitalizacion )
        , ( "condicion_final", Encode.string <| toString model.condicionFinal )
        , ( "fecha_defuncion", Encode.float <| Date.toTime model.fechaDefuncion )
        , ( "numero_certificado_defuncion"
          , Encode.int model.numeroCertificadoDefuncion
          )
        , ( "causa_basica_muerte", Encode.string <| toString model.causaBasicaMuerte )
        ]



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
    | DefinirPaisOcurrenciaCaso String
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
    | SendDataToServer (Result Http.Error String)
    | Click
    | NoOp String


sendData : Model -> Cmd Msg
sendData model =
    let
        server =
            "http://localhost:3030"
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


update : Msg -> Model -> ( Model, Cmd Msg )
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

        DefinirPaisOcurrenciaCaso nuevo ->
            ( { model | paisOcurrenciaCaso = nuevo }, Cmd.none )

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

        Click ->
            ( model, sendData model )

        SendDataToServer _ ->
            ( model, Cmd.none )

        NoOp _ ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ navbar
        , div [ class "container" ] [ basicDataform model ]
        ]


navbar : Html Msg
navbar =
    nav [ class "navbar navbar-dark bg-dark navbar-expand-sm" ]
        [ a [ href "#", class "navbar-brand" ] [ text "MedNote" ]
        , div [ class "navbar-nav" ]
            [ a [ class "nav-item nav-link", href "#", onClick Click ] [ text "Hola" ]
            , a [ class "nav-item nav-link", href "#", onClick Click ] [ text "Otro" ]
            ]
        ]


tabs : Html Msg
tabs =
    ul [ class "nav nav-tabs" ]
        [ li [ class "active" ] [ a [ href "#" ] [ text "Sala de espera" ] ]
        , li [] [ a [ href "#" ] [ text "Sala de Procedimientos" ] ]
        ]


collection : List Patient -> Html Msg
collection patients =
    let
        item patient =
            tr []
                [ td [] [ text patient.name ]
                , td [] [ toString patient.gender |> text ]
                , td [] [ toString patient.age |> text ]
                , td [] [ text patient.consultWhy ]
                ]
    in
        table [ class "table table-hover" ] <|
            [ thead []
                [ tr []
                    [ th [] [ text "Nombre" ]
                    , th [] [ text "Género" ]
                    , th [] [ text "Edad" ]
                    , th [] [ text "Motivo de Consulta" ]
                    ]
                ]
            , tbody [] <| List.map item patients
            ]


casilla : String -> (String -> Msg) -> Html Msg
casilla etiqueta accion =
    div [ class "form-group" ]
        [ label [] [ text etiqueta ]
        , input [ class "form-control", type_ "text", onInput accion ] []
        ]


checkBox : ( String, Msg ) -> Html Msg
checkBox ( label_, msg ) =
    div [ class "form-check" ]
        [ label [ class "form-check-label" ]
            [ input [ type_ "checkbox", onClick msg, class "form-check-input" ] []
            , text label_
            ]
        ]


radioButton : String -> ( Msg, String ) -> Html Msg
radioButton name_ ( msg, label_ ) =
    div [ class "form-check" ]
        [ label [ class "form-check-label" ]
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
    select [ onInput DefinirTipoIdentificacion ]
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


basicDataform : Model -> Html Msg
basicDataform model =
    Html.form []
        [ div [ class "columns" ]
            [ casilla "Nombres" DefinirNombresPaciente
            , casilla "Apellidos" DefinirApellidosPaciente
            , casilla "Numero de Indentificacion" DefinirNumeroIdentificacion
            , preguntarTipoIdentificacion
            ]
        , div [ class "columns" ]
            [ casilla "Teléfono" DefinirTelefono
            , casilla "Fecha Nacimiento" DefinirFechaNacimientoPaciente
            , div [] ((text "Genero") :: preguntarGeneroPaciente)
            ]
        , div [ class "columns" ]
            [ div [ class "column" ] [ casilla "Pais" DefinirPaisOcurrenciaCaso ]
            , div [ class "column" ]
                [ casilla "Departamento"
                    DefinirDepartamentoOcurrenciaCaso
                ]
            , div [ class "column" ] [ casilla "Municipio" DefinirMunicipitoOcurrenciaCaso ]
            , div [ class "column" ] [ preguntarAreaOcurrencia ]
            ]
        , div [ class "columns" ]
            [ div [ class "column" ] [ casilla "Localidad" DefinirLocalidadOcurrenciaCaso ]
            , div [ class "column" ] [ casilla "Barrio" DefinirBarrioOcurrenciaCaso ]
            , div [ class "column" ]
                [ casilla "Cabecera Municipal/Centro Poblado/Rural Disperso"
                    DefinirCabeceraCentroRuralOcurrenciaCaso
                ]
            , div [ class "column" ] [ casilla "Vereda/Zona" DefinirVeredaZonaOcurrenciaCaso ]
            ]
        , div [ class "columns" ]
            [ div [ class "column" ]
                [ casilla "Ocupación del Paciente"
                    DefinirOcupacionPaciente
                ]
            , div [ class "column" ] <| (text "Regimen del Paciente") :: preguntarRegimenSalud
            , div [ class "column" ]
                [ casilla "Nombre de la Administradora"
                    DefinirNombreAdministradoraSalud
                ]
            ]
        , div [ class "columns" ]
            [ div [ class "column" ]
                [ div [ class "field" ]
                    [ p [ class "control" ] preguntarPertenenciaEtnica
                    ]
                ]
            ]
        , fieldset [ class "form-group" ]
            [ div [] <|
                ((legend [] [ text "Grupo poblacional" ])
                    :: preguntarGruposPoblacionales
                )
            ]
        , div [ class "columns" ]
            [ div [ class "column" ]
                [ casilla "Departamento residencia Paciente"
                    DefinirDepartamentoResidencia
                ]
            , div [ class "column" ]
                [ casilla "Municipio residencia Paciente"
                    DefinirMunicipioResidencia
                ]
            ]
        , div [ class "columns" ]
            [ div [ class "column" ]
                [ casilla "Dirección de Residencia"
                    DefinirDireccionResidencia
                ]
            ]
        , div [ class "columns" ]
            [ div [ class "column" ]
                [ casilla "Fecha Inicio de los Síntomas"
                    DefinirFechaInicioSintomas
                ]
            , div [ class "column" ] [ casilla "Fecha de Consulta" DefinirFechaConsulta ]
            , preguntarClasificacionInicial |> div [ class "column" ]
            , div [ class "column" ]
                [ checkBox ( "Hospitalizado", DefinirHospitalizado )
                ]
            ]
        , div [ class "columns" ]
            [ div [ class "column" ]
                [ casilla "Fecha de Hospitalización"
                    DefinirFechaHospitalizacion
                ]
            , div [ class "column" ] preguntarCondicionFinal
            , div [ class "column" ] [ casilla "Fecha de Defunción" DefinirFechaDefuncion ]
            , div [ class "column" ]
                [ casilla "Número de certificado de defunción"
                    DefinirNumeroCertificadoDefuncion
                ]
            ]
        , div [ class "columns" ] [ text model.nombresPaciente ]
        ]



---- PROGRAM ----


main : Program String Model Msg
main =
    Html.programWithFlags
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
