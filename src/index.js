import './main.css'
import './css/style.css'
import { municipios } from './municipios_colombia.js'
import { ocupaciones } from './ocupaciones.js'
import { paises } from './paises.js'

const logoPath = require('./logo.svg')
const Elm = require('./App.elm')

const root = document.getElementById('root')

Elm.App.embed(root, { municipios : municipios,
                      ocupaciones: ocupaciones,
                      paises: paises })
