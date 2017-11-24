module Models exposing (..)

---- MODEL ----

import Date
import Json.Encode as Encode


type Genero
    = Masculino
    | Femenino
    | Indeterminado


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


type alias Pais =
    { codigo : String, pais : String }


type alias Ocupacion =
    { codigo : String, ocupacion : String }


type alias Municipio =
    { codigo : String, departamento : String, nombre : String }


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
    , departamentoOcurrenciaCaso : String
    , municipitoOcurrenciaCaso : String
    , localidadOcurrenciaCaso : String
    , barrioOcurrenciaCaso : String
    , cabeceraCentroRuralOcurrenciaCaso : String
    , veredaZonaOcurrenciaCaso : String
    , areaOcurrenciaCaso : AreaOcurrencia

    -- Demograficos
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

    -- Autocompletado casilla pais
    , listaPaises : List Pais
    , busquedaPais : String
    , mostrarSugerenciasPais : Bool
    , paisOcurrenciaCaso : Maybe Pais

    -- Autocompletado casilla municipios
    , listaMunicipios : List Municipio
    , busquedaMunicipio : String
    , mostrarSugerenciasMunicipio : Bool
    , municipioColombiano : Maybe Municipio

    -- Autocompletado ocupacion
    , listaOcupaciones : List Ocupacion
    , busquedaOcupacion : String
    , mostrarSugerenciasOcupacion : Bool
    , ocupacionPaciente : Maybe Ocupacion
    }


initialModel : Model
initialModel =
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

    -- Autocompletado de la casilla de paises
    , listaPaises = []
    , busquedaPais = ""
    , mostrarSugerenciasPais = False

    -- Autocompletado municipios
    , listaMunicipios = []
    , busquedaMunicipio = ""
    , mostrarSugerenciasMunicipio = False
    , municipioColombiano = Nothing

    -- Autocompletado trabjo
    , listaOcupaciones = []
    , busquedaOcupacion = ""
    , mostrarSugerenciasOcupacion = False
    }



-- Serializing


encondeForm : Model -> Encode.Value
encondeForm model =
    Encode.object
        [ ( "nombres_paciente", Encode.string model.nombresPaciente )
        , ( "apellidos_paciente", Encode.string model.apellidosPaciente )
        , ( "tipo_identificacion", Encode.string <| toString model.tipoIdentificacion )
        , ( "numero_identificacion", Encode.int model.numeroIdentificacion )
        , ( "telefono", Encode.string model.telefono )
        , ( "sexo_paciente", Encode.string <| toString model.sexoPaciente )
        , ( "pais_ocurrencia"
          , model.paisOcurrenciaCaso
                |> Maybe.withDefault (Pais "CO" "Colombia")
                |> .codigo
                |> Encode.string
          )
        , ( "municipio_ocurrencia"
          , model.municipitoOcurrenciaCaso
                |> Encode.string
          )
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
        , ( "ocupacion_paciente"
          , model.ocupacionPaciente
                |> Maybe.withDefault (Ocupacion "9629" "Ocupaciones elementales no clasificadas bajo otros epígrafes")
                |> .codigo
                |> Encode.string
          )
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
