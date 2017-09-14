module App exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import Time


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


type TipoDocumento
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


type alias Model =
    { value : Int
    , dilatation :
        ( Int, Int )
    , patients : List Patient

    -- Informacion general
    , nombre_evento : String
    , codigo_evento : Int
    , fecha_notificacion :
        Time.Time

    -- Identificacion del paciente
    , tipo_documento : TipoDocumento
    , numero_identificacion : Int
    , nombres_paciente : String
    , apellitos_paciente : String
    , telefono : String
    , fecha_nacimiento_paciente : Time.Time
    , edadPaciente : Int
    , unidadMedidaEdad : UnidadMedidaEdad
    , sexoPaciente : Genero
    , paisOcurrenciaCaso : String
    , departamentoOcurrenciaCaso : String
    , municipitoOcurrenciaCaso : String
    , areaOcurrenciaCaso : AreaOcurrencia
    }


model =
    { value = 100
    , dilatation = ( 0, 0 )
    , nombre_evento = ""
    , codigo_evento = 123
    , fecha_notificacion = 1234
    , tipo_documento = AdultoSinIdentificacion
    , numero_identificacion = 0
    , nombres_paciente = ""
    , apellitos_paciente = ""
    , telefono = ""
    , fecha_nacimiento_paciente = 0
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



---- UPDATE ----


type Msg
    = IncreaseBox Int
    | DefinirNombres String
    | DefinirApellidos String
    | DefinirEdad String
    | DefinidNombreEvento String
    | NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        IncreaseBox increases ->
            ( { model | value = model.value + 10 }, Cmd.none )

        DefinirNombres nuevoNombre ->
            ( { model | nombres_paciente = nuevoNombre }, Cmd.none )

        DefinirApellidos nuevoApellido ->
            ( { model | apellitos_paciente = nuevoApellido }, Cmd.none )

        _ ->
            ( model, Cmd.none )



---- VIEW ----


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
                    [ li [ class "active" ] [ a [ href "#" ] [ text "Hola" ] ]
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


basicDataform : Model -> Html Msg
basicDataform model =
    let
        checkBox label_ =
            div [ class "checkbox" ]
                [ label [] [ input [ type_ "checkbox" ] [], text label_ ]
                ]

        casilla etiqueta accion =
            div [ class "form-group" ]
                [ label [] [ text etiqueta ]
                , input [ class "form-control", type_ "text", onInput accion ] []
                ]
    in
        Html.form []
            [ div [ class "columns" ] [ h1 [ Html.Attributes.class "title" ] [ Html.text "Notificación Eventos en Salud Pública" ] ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Nombres" DefinirNombres ]
                , div [ class "column" ] [ casilla "Apellidos" DefinirApellidos ]
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ casilla "Teléfono" DefinirEdad ]
                , div [ class "column" ] [ casilla "Fecha Nacimiento" DefinirEdad ]
                , div [ class "column" ] [ casilla "Edad" DefinirEdad ]
                , div [ class "column" ] [ casilla "Unidad Medida de Edad" DefinirEdad ]
                , div [ class "column" ] [ casilla "Sexo" DefinirEdad ]
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
            , div [ class "columns" ]
                [ checkBox "Discapacitados"
                , checkBox "Migrantes"
                , checkBox "Gestantes"
                , checkBox "Infantil a cargo del ICBF"
                , checkBox "Desmovilizados"
                , checkBox "Víctimas de violencia armada"
                ]
            , div [ class "columns" ]
                [ div [ class "column" ] [ div [ class "field" ] [ p [ class "control" ] [ label [ class "checkbox" ] [ input [ type_ "checkbox" ] [], text "Desplazados" ] ] ] ]
                , div [ class "column" ] [ div [ class "field" ] [ p [ class "control" ] [ label [ class "checkbox" ] [ input [ type_ "checkbox" ] [], text "Carcelarios" ] ] ] ]
                , div [ class "column" ] [ div [ class "field" ] [ p [ class "control" ] [ label [ class "checkbox" ] [ input [ type_ "checkbox" ] [], text "Indigentes" ] ] ] ]
                , div [ class "column" ] [ div [ class "field" ] [ p [ class "control" ] [ label [ class "checkbox" ] [ input [ type_ "checkbox" ] [], text "Madres Comunitarias" ] ] ] ]
                , div [ class "column" ] [ div [ class "field" ] [ p [ class "control" ] [ label [ class "checkbox" ] [ input [ type_ "checkbox" ] [], text "Centros Psiquiátricos" ] ] ] ]
                , div [ class "column" ] [ div [ class "field" ] [ p [ class "control" ] [ label [ class "checkbox" ] [ input [ type_ "checkbox" ] [], text "Otros grupos poblacionales" ] ] ] ]
                ]
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
            , div [ class "columns" ] [ text model.nombres_paciente ]
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
