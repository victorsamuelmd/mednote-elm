module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Http
import Time
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


type NumeroDocumento
    = TargetaIdentidad Int
    | RegistroCivil Int
    | CedulaCiudadania Int
    | CedulaExtrangeria Int
    | Pasaporte Int
    | MenorSinIdentifiacion
    | AdultoSinIdentificacion


type AreaOcurrencia
    = CabeceraMunicipal
    | RuralDisperso
    | CentroPoblado


type alias Model =
    { patients : List Patient

    -- Informacion general
    , nombreEvento : String
    , codigoEvento : Int
    , fechaNotificacion :
        Time.Time

    -- Identificacion del paciente
    , numeroDocumento : NumeroDocumento
    , nombresPaciente : String
    , apellidosPaciente : String
    , telefono : String
    , fechaNacimientoPaciente : Time.Time
    , edadPaciente : Int
    , unidadMedidaEdad : UnidadMedidaEdad
    , sexoPaciente : Genero
    , paisOcurrenciaCaso : String
    , departamentoOcurrenciaCaso : String
    , municipitoOcurrenciaCaso : String
    , areaOcurrenciaCaso : AreaOcurrencia
    }


model =
    { nombreEvento = ""
    , codigoEvento = 123
    , fechaNotificacion = 1234
    , numeroDocumento = CedulaCiudadania 1087998004
    , nombresPaciente = ""
    , apellidosPaciente = ""
    , telefono = ""
    , fechaNacimientoPaciente = 0
    , edadPaciente = 0
    , unidadMedidaEdad = NoAplicaEdad
    , sexoPaciente = Indeterminado
    , departamentoOcurrenciaCaso = ""
    , paisOcurrenciaCaso = ""
    , municipitoOcurrenciaCaso = ""
    , areaOcurrenciaCaso = CabeceraMunicipal
    , patients =
        [ Patient "Victor" Masculino "Dolor en el pecho" 3 28
        , Patient "Natalia" Femenino "Dolor pelvico" 3 28
        ]
    }


init : String -> ( Model, Cmd Msg )
init path =
    ( model, Cmd.none )



encondeForm : Model -> Encode.Value
encondeForm model =
    Encode.object
        [ ( "first_name", Encode.string model.nombresPaciente )
        , ( "last_name", Encode.string model.apellidosPaciente )
        , ( "age", Encode.int model.edadPaciente )
        ]

---- UPDATE ----


type Msg
    = DefinirNombres String
    | DefinirApellidos String
    | DefinirEdad String
    | DefinidNombreEvento String
    | SendDataToServer (Result Http.Error String)
    | Click
    | NoOp


sendData : Model -> Cmd Msg
sendData model =
    Http.send SendDataToServer <|
        Http.post "http://localhost:3535" (encondeForm model |> Http.jsonBody) Decode.string


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        DefinirNombres nuevoNombre ->
            ( { model | nombresPaciente = nuevoNombre }, Cmd.none )

        DefinirApellidos nuevoApellido ->
            ( { model | apellidosPaciente = nuevoApellido }, Cmd.none )

        DefinirEdad nuevaEdad ->
            ( { model | edadPaciente = Result.withDefault 0 (String.toInt nuevaEdad) }, Cmd.none )

        Click ->
            ( model, sendData model )

        _ ->
            ( model, Cmd.none )



---- VIEW ----


preguntarDocumento : NumeroDocumento -> Html Msg
preguntarDocumento num =
    case num of
        MenorSinIdentifiacion ->
            text "MenorSinIdentifiacion"

        AdultoSinIdentificacion ->
            text "AdultoSinIdentificacion"

        CedulaCiudadania numero ->
            toString numero |> text

        _ ->
            text ""


view : Model -> Html Msg
view model =
    div []
        [ navbar
        , div [ class "container-fluid" ] [ tabs ]
        , div [ class "container-fluid" ] [ collection model.patients ]
        , div [ class "col-md-4" ] [ basicDataform model ]
        ]


navbar : Html Msg
navbar =
    nav [ class "navbar navbar-default" ]
        [ div [ class "container-fluid" ]
            [ a [ href "#", class "navbar-brand" ] [ text "MedNote" ]
            , div [ class "collapse navbar-collapse" ]
                [ ul [ class "nav navbar-nav" ]
                    [ li [ class "active", onClick Click ] [ a [ href "#" ] [ text "Hola" ] ]
                    ]
                ]
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


checkBox : String -> Html Msg
checkBox label_ =
    div [ class "checkbox" ]
        [ label [] [ input [ type_ "checkbox" ] [], text label_ ]
        ]


basicDataform : Model -> Html Msg
basicDataform model =
    let
        casilla etiqueta accion =
            div [ class "form-group" ]
                [ label [] [ text etiqueta ]
                , input [ class "form-control", type_ "text", onInput accion ] []
                ]
    in
        Html.form []
            [ div [ class "columns" ]
                [ casilla "Nombres" DefinirNombres
                , casilla "Apellidos" DefinirApellidos
                , preguntarDocumento model.numeroDocumento
                ]
            , div [ class "columns" ]
                [ casilla "Teléfono" DefinirEdad
                , casilla "Fecha Nacimiento" DefinirEdad
                , casilla "Edad" DefinirEdad
                , casilla "Unidad Medida de Edad" DefinirEdad
                , casilla "Sexo" DefinirEdad
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Pais" DefinirEdad ]
                , div [ class "column" ] [ casilla "Departamento" DefinirEdad ]
                , div [ class "column" ] [ casilla "Municipio" DefinirEdad ]
                , div [ class "column" ] [ casilla "Area de Ocurrencia" DefinirEdad ]
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Localidad" DefinirEdad ]
                , div [ class "column" ] [ casilla "Barrio" DefinirEdad ]
                , div [ class "column" ] [ casilla "Cabecera Municipal/Centro Poblado/Rural Disperso" DefinirEdad ]
                , div [ class "column" ] [ casilla "Vereda/Zona" DefinirEdad ]
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Ocupación del Paciente" DefinirEdad ]
                , div [ class "column" ] [ casilla "Tipo Régimen de Salud" DefinirEdad ]
                , div [ class "column" ] [ casilla "Nombre de la Administradora" DefinirEdad ]
                ]
            , div [ class "columns" ]
                [ div [ class "column" ]
                    [ div [ class "field" ]
                        [ p [ class "control" ]
                            [ text "Pertenecia Étnica"
                            , label [ class "radio" ] [ input [ type_ "radio", name "raza" ] [], text "Indígena" ]
                            , label [ class "radio" ] [ input [ type_ "radio", name "raza" ] [], text "Rom, Gitano" ]
                            , label [ class "radio" ] [ input [ type_ "radio", name "raza" ] [], text "Raizal" ]
                            , label [ class "radio" ] [ input [ type_ "radio", name "raza" ] [], text "Palenquero" ]
                            , label [ class "radio" ] [ input [ type_ "radio", name "raza" ] [], text "Negro, Mulato, Afrocolombiano" ]
                            , label [ class "radio" ] [ input [ type_ "radio", name "raza" ] [], text "Otro" ]
                            ]
                        ]
                    ]
                ]
            , div [ class "columns" ] gruposPoblacionales
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Departamento residencia Paciente" DefinirEdad ]
                , div [ class "column" ] [ casilla "Municipio residencia Paciente" DefinirEdad ]
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Dirección de Residencia" DefinirEdad ]
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Fecha Inicio de los Síntomas" DefinirEdad ]
                , div [ class "column" ] [ casilla "Fecha de Consulta" DefinirEdad ]
                , div [ class "column" ] [ casilla "Clasificación Inicial del Caso" DefinirEdad ]
                , div [ class "column" ] [ casilla "Hospitalizado" DefinirEdad ]
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Fecha de Hospitalización" DefinirEdad ]
                , div [ class "column" ] [ casilla "Condición Final" DefinirEdad ]
                , div [ class "column" ] [ casilla "Fecha de Defunción" DefinirEdad ]
                , div [ class "column" ] [ casilla "Número de certificado de defunción" DefinirEdad ]
                ]
            , div [ class "columns" ] [ text model.nombresPaciente ]
            ]


gruposPoblacionales =
    List.map checkBox
        [ "Discapacitados"
        , "Migrantes"
        , "Gestantes"
        , "Infantil a cargo del ICBF"
        , "Desmovilizados"
        , "Víctimas de violencia armada"
        , "Desplazados"
        , "Carcelarios"
        , "Indigentes"
        , "Madres Comunitarias"
        , "Centros Psiquiátricos"
        , "Otros Grupos Poblacionales"
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
