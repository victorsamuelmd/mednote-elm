const municipios = [
    { departamento: "Amazonas", codigo: "91001", nombre: "LETICIA"}
    , { departamento: "Amazonas", codigo: "91263", nombre: "EL ENCANTO"}
    , { departamento: "Amazonas", codigo: "91405", nombre: "LA CHORRERA"}
    , { departamento: "Amazonas", codigo: "91407", nombre: "LA PEDRERA"}
    , { departamento: "Amazonas", codigo: "91430", nombre: "LA VICTORIA"}
    , { departamento: "Amazonas", codigo: "91460", nombre: "MIRITI - PARANÁ"}
    , { departamento: "Amazonas", codigo: "91530", nombre: "PUERTO ALEGRÍA"}
    , { departamento: "Amazonas", codigo: "91536", nombre: "PUERTO ARICA"}
    , { departamento: "Amazonas", codigo: "91540", nombre: "PUERTO NARIÑO"}
    , { departamento: "Amazonas", codigo: "91669", nombre: "PUERTO SANTANDER"}
    , { departamento: "Amazonas", codigo: "91798", nombre: "TARAPACÁ"}
    , { departamento: "Antioquia", codigo: "05001", nombre: "MEDELLÍN"}
    , { departamento: "Antioquia", codigo: "05002", nombre: "ABEJORRAL"}
    , { departamento: "Antioquia", codigo: "05004", nombre: "ABRIAQUÍ"}
    , { departamento: "Antioquia", codigo: "05021", nombre: "ALEJANDRÍA"}
    , { departamento: "Antioquia", codigo: "05030", nombre: "AMAGÁ"}
    , { departamento: "Antioquia", codigo: "05031", nombre: "AMALFI"}
    , { departamento: "Antioquia", codigo: "05034", nombre: "ANDES"}
    , { departamento: "Antioquia", codigo: "05036", nombre: "ANGELÓPOLIS"}
    , { departamento: "Antioquia", codigo: "05038", nombre: "ANGOSTURA"}
    , { departamento: "Antioquia", codigo: "05040", nombre: "ANORÍ"}
    , { departamento: "Antioquia", codigo: "05042", nombre: "SANTAFÉ DE ANTIOQUIA"}
    , { departamento: "Antioquia", codigo: "05044", nombre: "ANZA"}
    , { departamento: "Antioquia", codigo: "05045", nombre: "APARTADÓ"}
    , { departamento: "Antioquia", codigo: "05051", nombre: "ARBOLETES"}
    , { departamento: "Antioquia", codigo: "05055", nombre: "ARGELIA"}
    , { departamento: "Antioquia", codigo: "05059", nombre: "ARMENIA"}
    , { departamento: "Antioquia", codigo: "05079", nombre: "BARBOSA"}
    , { departamento: "Antioquia", codigo: "05086", nombre: "BELMIRA"}
    , { departamento: "Antioquia", codigo: "05088", nombre: "BELLO"}
    , { departamento: "Antioquia", codigo: "05091", nombre: "BETANIA"}
    , { departamento: "Antioquia", codigo: "05093", nombre: "BETULIA"}
    , { departamento: "Antioquia", codigo: "05101", nombre: "CIUDAD BOLÍVAR"}
    , { departamento: "Antioquia", codigo: "05107", nombre: "BRICEÑO"}
    , { departamento: "Antioquia", codigo: "05113", nombre: "BURITICÁ"}
    , { departamento: "Antioquia", codigo: "05120", nombre: "CÁCERES"}
    , { departamento: "Antioquia", codigo: "05125", nombre: "CAICEDO"}
    , { departamento: "Antioquia", codigo: "05129", nombre: "CALDAS"}
    , { departamento: "Antioquia", codigo: "05134", nombre: "CAMPAMENTO"}
    , { departamento: "Antioquia", codigo: "05138", nombre: "CAÑASGORDAS"}
    , { departamento: "Antioquia", codigo: "05142", nombre: "CARACOLÍ"}
    , { departamento: "Antioquia", codigo: "05145", nombre: "CARAMANTA"}
    , { departamento: "Antioquia", codigo: "05147", nombre: "CAREPA"}
    , { departamento: "Antioquia", codigo: "05148", nombre: "EL CARMEN DE VIBORAL"}
    , { departamento: "Antioquia", codigo: "05150", nombre: "CAROLINA"}
    , { departamento: "Antioquia", codigo: "05154", nombre: "CAUCASIA"}
    , { departamento: "Antioquia", codigo: "05172", nombre: "CHIGORODÓ"}
    , { departamento: "Antioquia", codigo: "05190", nombre: "CISNEROS"}
    , { departamento: "Antioquia", codigo: "05197", nombre: "COCORNÁ"}
    , { departamento: "Antioquia", codigo: "05206", nombre: "CONCEPCIÓN"}
    , { departamento: "Antioquia", codigo: "05209", nombre: "CONCORDIA"}
    , { departamento: "Antioquia", codigo: "05212", nombre: "COPACABANA"}
    , { departamento: "Antioquia", codigo: "05234", nombre: "DABEIBA"}
    , { departamento: "Antioquia", codigo: "05237", nombre: "DONMATÍAS"}
    , { departamento: "Antioquia", codigo: "05240", nombre: "EBÉJICO"}
    , { departamento: "Antioquia", codigo: "05250", nombre: "EL BAGRE"}
    , { departamento: "Antioquia", codigo: "05264", nombre: "ENTRERRIOS"}
    , { departamento: "Antioquia", codigo: "05266", nombre: "ENVIGADO"}
    , { departamento: "Antioquia", codigo: "05282", nombre: "FREDONIA"}
    , { departamento: "Antioquia", codigo: "05284", nombre: "FRONTINO"}
    , { departamento: "Antioquia", codigo: "05306", nombre: "GIRALDO"}
    , { departamento: "Antioquia", codigo: "05308", nombre: "GIRARDOTA"}
    , { departamento: "Antioquia", codigo: "05310", nombre: "GÓMEZ PLATA"}
    , { departamento: "Antioquia", codigo: "05313", nombre: "GRANADA"}
    , { departamento: "Antioquia", codigo: "05315", nombre: "GUADALUPE"}
    , { departamento: "Antioquia", codigo: "05318", nombre: "GUARNE"}
    , { departamento: "Antioquia", codigo: "05321", nombre: "GUATAPE"}
    , { departamento: "Antioquia", codigo: "05347", nombre: "HELICONIA"}
    , { departamento: "Antioquia", codigo: "05353", nombre: "HISPANIA"}
    , { departamento: "Antioquia", codigo: "05360", nombre: "ITAGUI"}
    , { departamento: "Antioquia", codigo: "05361", nombre: "ITUANGO"}
    , { departamento: "Antioquia", codigo: "05364", nombre: "JARDÍN"}
    , { departamento: "Antioquia", codigo: "05368", nombre: "JERICÓ"}
    , { departamento: "Antioquia", codigo: "05376", nombre: "LA CEJA"}
    , { departamento: "Antioquia", codigo: "05380", nombre: "LA ESTRELLA"}
    , { departamento: "Antioquia", codigo: "05390", nombre: "LA PINTADA"}
    , { departamento: "Antioquia", codigo: "05400", nombre: "LA UNIÓN"}
    , { departamento: "Antioquia", codigo: "05411", nombre: "LIBORINA"}
    , { departamento: "Antioquia", codigo: "05425", nombre: "MACEO"}
    , { departamento: "Antioquia", codigo: "05440", nombre: "MARINILLA"}
    , { departamento: "Antioquia", codigo: "05467", nombre: "MONTEBELLO"}
    , { departamento: "Antioquia", codigo: "05475", nombre: "MURINDÓ"}
    , { departamento: "Antioquia", codigo: "05480", nombre: "MUTATÁ"}
    , { departamento: "Antioquia", codigo: "05483", nombre: "NARIÑO"}
    , { departamento: "Antioquia", codigo: "05490", nombre: "NECOCLÍ"}
    , { departamento: "Antioquia", codigo: "05495", nombre: "NECHÍ"}
    , { departamento: "Antioquia", codigo: "05501", nombre: "OLAYA"}
    , { departamento: "Antioquia", codigo: "05541", nombre: "PEÑOL"}
    , { departamento: "Antioquia", codigo: "05543", nombre: "PEQUE"}
    , { departamento: "Antioquia", codigo: "05576", nombre: "PUEBLORRICO"}
    , { departamento: "Antioquia", codigo: "05579", nombre: "PUERTO BERRÍO"}
    , { departamento: "Antioquia", codigo: "05585", nombre: "PUERTO NARE"}
    , { departamento: "Antioquia", codigo: "05591", nombre: "PUERTO TRIUNFO"}
    , { departamento: "Antioquia", codigo: "05604", nombre: "REMEDIOS"}
    , { departamento: "Antioquia", codigo: "05607", nombre: "RETIRO"}
    , { departamento: "Antioquia", codigo: "05615", nombre: "RIONEGRO"}
    , { departamento: "Antioquia", codigo: "05628", nombre: "SABANALARGA"}
    , { departamento: "Antioquia", codigo: "05631", nombre: "SABANETA"}
    , { departamento: "Antioquia", codigo: "05642", nombre: "SALGAR"}
    , { departamento: "Antioquia", codigo: "05647", nombre: "SAN ANDRÉS DE CUERQUÍA"}
    , { departamento: "Antioquia", codigo: "05649", nombre: "SAN CARLOS"}
    , { departamento: "Antioquia", codigo: "05652", nombre: "SAN FRANCISCO"}
    , { departamento: "Antioquia", codigo: "05656", nombre: "SAN JERÓNIMO"}
    , { departamento: "Antioquia", codigo: "05658", nombre: "SAN JOSÉ DE LA MONTAÑA"}
    , { departamento: "Antioquia", codigo: "05659", nombre: "SAN JUAN DE URABÁ"}
    , { departamento: "Antioquia", codigo: "05660", nombre: "SAN LUIS"}
    , { departamento: "Antioquia", codigo: "05664", nombre: "SAN PEDRO DE LOS MILAGROS"}
    , { departamento: "Antioquia", codigo: "05665", nombre: "SAN PEDRO DE URABA"}
    , { departamento: "Antioquia", codigo: "05667", nombre: "SAN RAFAEL"}
    , { departamento: "Antioquia", codigo: "05670", nombre: "SAN ROQUE"}
    , { departamento: "Antioquia", codigo: "05674", nombre: "SAN VICENTE"}
    , { departamento: "Antioquia", codigo: "05679", nombre: "SANTA BÁRBARA"}
    , { departamento: "Antioquia", codigo: "05686", nombre: "SANTA ROSA DE OSOS"}
    , { departamento: "Antioquia", codigo: "05690", nombre: "SANTO DOMINGO"}
    , { departamento: "Antioquia", codigo: "05697", nombre: "EL SANTUARIO"}
    , { departamento: "Antioquia", codigo: "05736", nombre: "SEGOVIA"}
    , { departamento: "Antioquia", codigo: "05756", nombre: "SONSON"}
    , { departamento: "Antioquia", codigo: "05761", nombre: "SOPETRÁN"}
    , { departamento: "Antioquia", codigo: "05789", nombre: "TÁMESIS"}
    , { departamento: "Antioquia", codigo: "05790", nombre: "TARAZÁ"}
    , { departamento: "Antioquia", codigo: "05792", nombre: "TARSO"}
    , { departamento: "Antioquia", codigo: "05809", nombre: "TITIRIBÍ"}
    , { departamento: "Antioquia", codigo: "05819", nombre: "TOLEDO"}
    , { departamento: "Antioquia", codigo: "05837", nombre: "TURBO"}
    , { departamento: "Antioquia", codigo: "05842", nombre: "URAMITA"}
    , { departamento: "Antioquia", codigo: "05847", nombre: "URRAO"}
    , { departamento: "Antioquia", codigo: "05854", nombre: "VALDIVIA"}
    , { departamento: "Antioquia", codigo: "05856", nombre: "VALPARAÍSO"}
    , { departamento: "Antioquia", codigo: "05858", nombre: "VEGACHÍ"}
    , { departamento: "Antioquia", codigo: "05861", nombre: "VENECIA"}
    , { departamento: "Antioquia", codigo: "05873", nombre: "VIGÍA DEL FUERTE"}
    , { departamento: "Antioquia", codigo: "05885", nombre: "YALÍ"}
    , { departamento: "Antioquia", codigo: "05887", nombre: "YARUMAL"}
    , { departamento: "Antioquia", codigo: "05890", nombre: "YOLOMBÓ"}
    , { departamento: "Antioquia", codigo: "05893", nombre: "YONDÓ"}
    , { departamento: "Antioquia", codigo: "05895", nombre: "ZARAGOZA"}
    , { departamento: "Arauca", codigo: "81001", nombre: "ARAUCA"}
    , { departamento: "Arauca", codigo: "81065", nombre: "ARAUQUITA"}
    , { departamento: "Arauca", codigo: "81220", nombre: "CRAVO NORTE"}
    , { departamento: "Arauca", codigo: "81300", nombre: "FORTUL"}
    , { departamento: "Arauca", codigo: "81591", nombre: "PUERTO RONDÓN"}
    , { departamento: "Arauca", codigo: "81736", nombre: "SARAVENA"}
    , { departamento: "Arauca", codigo: "81794", nombre: "TAME"}
    , { departamento: "Atlantico", codigo: "08001", nombre: "BARRANQUILLA"}
    , { departamento: "Atlantico", codigo: "08078", nombre: "BARANOA"}
    , { departamento: "Atlantico", codigo: "08137", nombre: "CAMPO DE LA CRUZ"}
    , { departamento: "Atlantico", codigo: "08141", nombre: "CANDELARIA"}
    , { departamento: "Atlantico", codigo: "08296", nombre: "GALAPA"}
    , { departamento: "Atlantico", codigo: "08372", nombre: "JUAN DE ACOSTA"}
    , { departamento: "Atlantico", codigo: "08421", nombre: "LURUACO"}
    , { departamento: "Atlantico", codigo: "08433", nombre: "MALAMBO"}
    , { departamento: "Atlantico", codigo: "08436", nombre: "MANATÍ"}
    , { departamento: "Atlantico", codigo: "08520", nombre: "PALMAR DE VARELA"}
    , { departamento: "Atlantico", codigo: "08549", nombre: "PIOJÓ"}
    , { departamento: "Atlantico", codigo: "08558", nombre: "POLONUEVO"}
    , { departamento: "Atlantico", codigo: "08560", nombre: "PONEDERA"}
    , { departamento: "Atlantico", codigo: "08573", nombre: "PUERTO COLOMBIA"}
    , { departamento: "Atlantico", codigo: "08606", nombre: "REPELÓN"}
    , { departamento: "Atlantico", codigo: "08634", nombre: "SABANAGRANDE"}
    , { departamento: "Atlantico", codigo: "08638", nombre: "SABANALARGA"}
    , { departamento: "Atlantico", codigo: "08675", nombre: "SANTA LUCÍA"}
    , { departamento: "Atlantico", codigo: "08685", nombre: "SANTO TOMÁS"}
    , { departamento: "Atlantico", codigo: "08758", nombre: "SOLEDAD"}
    , { departamento: "Atlantico", codigo: "08770", nombre: "SUAN"}
    , { departamento: "Atlantico", codigo: "08832", nombre: "TUBARÁ"}
    , { departamento: "Atlantico", codigo: "08849", nombre: "USIACURÍ"}
    , { departamento: "Bogotá", codigo: "11001", nombre: "BOGOTÁ, D.C."}
    , { departamento: "Bolivar", codigo: "13001", nombre: "CARTAGENA"}
    , { departamento: "Bolivar", codigo: "13006", nombre: "ACHÍ"}
    , { departamento: "Bolivar", codigo: "13030", nombre: "ALTOS DEL ROSARIO"}
    , { departamento: "Bolivar", codigo: "13042", nombre: "ARENAL"}
    , { departamento: "Bolivar", codigo: "13052", nombre: "ARJONA"}
    , { departamento: "Bolivar", codigo: "13062", nombre: "ARROYOHONDO"}
    , { departamento: "Bolivar", codigo: "13074", nombre: "BARRANCO DE LOBA"}
    , { departamento: "Bolivar", codigo: "13140", nombre: "CALAMAR"}
    , { departamento: "Bolivar", codigo: "13160", nombre: "CANTAGALLO"}
    , { departamento: "Bolivar", codigo: "13188", nombre: "CICUCO"}
    , { departamento: "Bolivar", codigo: "13212", nombre: "CÓRDOBA"}
    , { departamento: "Bolivar", codigo: "13222", nombre: "CLEMENCIA"}
    , { departamento: "Bolivar", codigo: "13244", nombre: "EL CARMEN DE BOLÍVAR"}
    , { departamento: "Bolivar", codigo: "13248", nombre: "EL GUAMO"}
    , { departamento: "Bolivar", codigo: "13268", nombre: "EL PEÑÓN"}
    , { departamento: "Bolivar", codigo: "13300", nombre: "HATILLO DE LOBA"}
    , { departamento: "Bolivar", codigo: "13430", nombre: "MAGANGUÉ"}
    , { departamento: "Bolivar", codigo: "13433", nombre: "MAHATES"}
    , { departamento: "Bolivar", codigo: "13440", nombre: "MARGARITA"}
    , { departamento: "Bolivar", codigo: "13442", nombre: "MARÍA LA BAJA"}
    , { departamento: "Bolivar", codigo: "13458", nombre: "MONTECRISTO"}
    , { departamento: "Bolivar", codigo: "13468", nombre: "MOMPÓS"}
    , { departamento: "Bolivar", codigo: "13473", nombre: "MORALES"}
    , { departamento: "Bolivar", codigo: "13490", nombre: "NOROSÍ"}
    , { departamento: "Bolivar", codigo: "13549", nombre: "PINILLOS"}
    , { departamento: "Bolivar", codigo: "13580", nombre: "REGIDOR"}
    , { departamento: "Bolivar", codigo: "13600", nombre: "RÍO VIEJO"}
    , { departamento: "Bolivar", codigo: "13620", nombre: "SAN CRISTÓBAL"}
    , { departamento: "Bolivar", codigo: "13647", nombre: "SAN ESTANISLAO"}
    , { departamento: "Bolivar", codigo: "13650", nombre: "SAN FERNANDO"}
    , { departamento: "Bolivar", codigo: "13654", nombre: "SAN JACINTO"}
    , { departamento: "Bolivar", codigo: "13655", nombre: "SAN JACINTO DEL CAUCA"}
    , { departamento: "Bolivar", codigo: "13657", nombre: "SAN JUAN NEPOMUCENO"}
    , { departamento: "Bolivar", codigo: "13667", nombre: "SAN MARTÍN DE LOBA"}
    , { departamento: "Bolivar", codigo: "13670", nombre: "SAN PABLO"}
    , { departamento: "Bolivar", codigo: "13673", nombre: "SANTA CATALINA"}
    , { departamento: "Bolivar", codigo: "13683", nombre: "SANTA ROSA"}
    , { departamento: "Bolivar", codigo: "13688", nombre: "SANTA ROSA DEL SUR"}
    , { departamento: "Bolivar", codigo: "13744", nombre: "SIMITÍ"}
    , { departamento: "Bolivar", codigo: "13760", nombre: "SOPLAVIENTO"}
    , { departamento: "Bolivar", codigo: "13780", nombre: "TALAIGUA NUEVO"}
    , { departamento: "Bolivar", codigo: "13810", nombre: "TIQUISIO"}
    , { departamento: "Bolivar", codigo: "13836", nombre: "TURBACO"}
    , { departamento: "Bolivar", codigo: "13838", nombre: "TURBANÁ"}
    , { departamento: "Bolivar", codigo: "13873", nombre: "VILLANUEVA"}
    , { departamento: "Bolivar", codigo: "13894", nombre: "ZAMBRANO"}
    , { departamento: "Boyaca", codigo: "15001", nombre: "TUNJA"}
    , { departamento: "Boyaca", codigo: "15022", nombre: "ALMEIDA"}
    , { departamento: "Boyaca", codigo: "15047", nombre: "AQUITANIA"}
    , { departamento: "Boyaca", codigo: "15051", nombre: "ARCABUCO"}
    , { departamento: "Boyaca", codigo: "15087", nombre: "BELÉN"}
    , { departamento: "Boyaca", codigo: "15090", nombre: "BERBEO"}
    , { departamento: "Boyaca", codigo: "15092", nombre: "BETÉITIVA"}
    , { departamento: "Boyaca", codigo: "15097", nombre: "BOAVITA"}
    , { departamento: "Boyaca", codigo: "15104", nombre: "BOYACÁ"}
    , { departamento: "Boyaca", codigo: "15106", nombre: "BRICEÑO"}
    , { departamento: "Boyaca", codigo: "15109", nombre: "BUENAVISTA"}
    , { departamento: "Boyaca", codigo: "15114", nombre: "BUSBANZÁ"}
    , { departamento: "Boyaca", codigo: "15131", nombre: "CALDAS"}
    , { departamento: "Boyaca", codigo: "15135", nombre: "CAMPOHERMOSO"}
    , { departamento: "Boyaca", codigo: "15162", nombre: "CERINZA"}
    , { departamento: "Boyaca", codigo: "15172", nombre: "CHINAVITA"}
    , { departamento: "Boyaca", codigo: "15176", nombre: "CHIQUINQUIRÁ"}
    , { departamento: "Boyaca", codigo: "15180", nombre: "CHISCAS"}
    , { departamento: "Boyaca", codigo: "15183", nombre: "CHITA"}
    , { departamento: "Boyaca", codigo: "15185", nombre: "CHITARAQUE"}
    , { departamento: "Boyaca", codigo: "15187", nombre: "CHIVATÁ"}
    , { departamento: "Boyaca", codigo: "15189", nombre: "CIÉNEGA"}
    , { departamento: "Boyaca", codigo: "15204", nombre: "CÓMBITA"}
    , { departamento: "Boyaca", codigo: "15212", nombre: "COPER"}
    , { departamento: "Boyaca", codigo: "15215", nombre: "CORRALES"}
    , { departamento: "Boyaca", codigo: "15218", nombre: "COVARACHÍA"}
    , { departamento: "Boyaca", codigo: "15223", nombre: "CUBARÁ"}
    , { departamento: "Boyaca", codigo: "15224", nombre: "CUCAITA"}
    , { departamento: "Boyaca", codigo: "15226", nombre: "CUÍTIVA"}
    , { departamento: "Boyaca", codigo: "15232", nombre: "CHÍQUIZA"}
    , { departamento: "Boyaca", codigo: "15236", nombre: "CHIVOR"}
    , { departamento: "Boyaca", codigo: "15238", nombre: "DUITAMA"}
    , { departamento: "Boyaca", codigo: "15244", nombre: "EL COCUY"}
    , { departamento: "Boyaca", codigo: "15248", nombre: "EL ESPINO"}
    , { departamento: "Boyaca", codigo: "15272", nombre: "FIRAVITOBA"}
    , { departamento: "Boyaca", codigo: "15276", nombre: "FLORESTA"}
    , { departamento: "Boyaca", codigo: "15293", nombre: "GACHANTIVÁ"}
    , { departamento: "Boyaca", codigo: "15296", nombre: "GAMEZA"}
    , { departamento: "Boyaca", codigo: "15299", nombre: "GARAGOA"}
    , { departamento: "Boyaca", codigo: "15317", nombre: "GUACAMAYAS"}
    , { departamento: "Boyaca", codigo: "15322", nombre: "GUATEQUE"}
    , { departamento: "Boyaca", codigo: "15325", nombre: "GUAYATÁ"}
    , { departamento: "Boyaca", codigo: "15332", nombre: "GÜICÁN"}
    , { departamento: "Boyaca", codigo: "15362", nombre: "IZA"}
    , { departamento: "Boyaca", codigo: "15367", nombre: "JENESANO"}
    , { departamento: "Boyaca", codigo: "15368", nombre: "JERICÓ"}
    , { departamento: "Boyaca", codigo: "15377", nombre: "LABRANZAGRANDE"}
    , { departamento: "Boyaca", codigo: "15380", nombre: "LA CAPILLA"}
    , { departamento: "Boyaca", codigo: "15401", nombre: "LA VICTORIA"}
    , { departamento: "Boyaca", codigo: "15403", nombre: "LA UVITA"}
    , { departamento: "Boyaca", codigo: "15407", nombre: "VILLA DE LEYVA"}
    , { departamento: "Boyaca", codigo: "15425", nombre: "MACANAL"}
    , { departamento: "Boyaca", codigo: "15442", nombre: "MARIPÍ"}
    , { departamento: "Boyaca", codigo: "15455", nombre: "MIRAFLORES"}
    , { departamento: "Boyaca", codigo: "15464", nombre: "MONGUA"}
    , { departamento: "Boyaca", codigo: "15466", nombre: "MONGUÍ"}
    , { departamento: "Boyaca", codigo: "15469", nombre: "MONIQUIRÁ"}
    , { departamento: "Boyaca", codigo: "15476", nombre: "MOTAVITA"}
    , { departamento: "Boyaca", codigo: "15480", nombre: "MUZO"}
    , { departamento: "Boyaca", codigo: "15491", nombre: "NOBSA"}
    , { departamento: "Boyaca", codigo: "15494", nombre: "NUEVO COLÓN"}
    , { departamento: "Boyaca", codigo: "15500", nombre: "OICATÁ"}
    , { departamento: "Boyaca", codigo: "15507", nombre: "OTANCHE"}
    , { departamento: "Boyaca", codigo: "15511", nombre: "PACHAVITA"}
    , { departamento: "Boyaca", codigo: "15514", nombre: "PÁEZ"}
    , { departamento: "Boyaca", codigo: "15516", nombre: "PAIPA"}
    , { departamento: "Boyaca", codigo: "15518", nombre: "PAJARITO"}
    , { departamento: "Boyaca", codigo: "15522", nombre: "PANQUEBA"}
    , { departamento: "Boyaca", codigo: "15531", nombre: "PAUNA"}
    , { departamento: "Boyaca", codigo: "15533", nombre: "PAYA"}
    , { departamento: "Boyaca", codigo: "15537", nombre: "PAZ DE RÍO"}
    , { departamento: "Boyaca", codigo: "15542", nombre: "PESCA"}
    , { departamento: "Boyaca", codigo: "15550", nombre: "PISBA"}
    , { departamento: "Boyaca", codigo: "15572", nombre: "PUERTO BOYACÁ"}
    , { departamento: "Boyaca", codigo: "15580", nombre: "QUÍPAMA"}
    , { departamento: "Boyaca", codigo: "15599", nombre: "RAMIRIQUÍ"}
    , { departamento: "Boyaca", codigo: "15600", nombre: "RÁQUIRA"}
    , { departamento: "Boyaca", codigo: "15621", nombre: "RONDÓN"}
    , { departamento: "Boyaca", codigo: "15632", nombre: "SABOYÁ"}
    , { departamento: "Boyaca", codigo: "15638", nombre: "SÁCHICA"}
    , { departamento: "Boyaca", codigo: "15646", nombre: "SAMACÁ"}
    , { departamento: "Boyaca", codigo: "15660", nombre: "SAN EDUARDO"}
    , { departamento: "Boyaca", codigo: "15664", nombre: "SAN JOSÉ DE PARE"}
    , { departamento: "Boyaca", codigo: "15667", nombre: "SAN LUIS DE GACENO"}
    , { departamento: "Boyaca", codigo: "15673", nombre: "SAN MATEO"}
    , { departamento: "Boyaca", codigo: "15676", nombre: "SAN MIGUEL DE SEMA"}
    , { departamento: "Boyaca", codigo: "15681", nombre: "SAN PABLO DE BORBUR"}
    , { departamento: "Boyaca", codigo: "15686", nombre: "SANTANA"}
    , { departamento: "Boyaca", codigo: "15690", nombre: "SANTA MARÍA"}
    , { departamento: "Boyaca", codigo: "15693", nombre: "SANTA ROSA DE VITERBO"}
    , { departamento: "Boyaca", codigo: "15696", nombre: "SANTA SOFÍA"}
    , { departamento: "Boyaca", codigo: "15720", nombre: "SATIVANORTE"}
    , { departamento: "Boyaca", codigo: "15723", nombre: "SATIVASUR"}
    , { departamento: "Boyaca", codigo: "15740", nombre: "SIACHOQUE"}
    , { departamento: "Boyaca", codigo: "15753", nombre: "SOATÁ"}
    , { departamento: "Boyaca", codigo: "15755", nombre: "SOCOTÁ"}
    , { departamento: "Boyaca", codigo: "15757", nombre: "SOCHA"}
    , { departamento: "Boyaca", codigo: "15759", nombre: "SOGAMOSO"}
    , { departamento: "Boyaca", codigo: "15761", nombre: "SOMONDOCO"}
    , { departamento: "Boyaca", codigo: "15762", nombre: "SORA"}
    , { departamento: "Boyaca", codigo: "15763", nombre: "SOTAQUIRÁ"}
    , { departamento: "Boyaca", codigo: "15764", nombre: "SORACÁ"}
    , { departamento: "Boyaca", codigo: "15774", nombre: "SUSACÓN"}
    , { departamento: "Boyaca", codigo: "15776", nombre: "SUTAMARCHÁN"}
    , { departamento: "Boyaca", codigo: "15778", nombre: "SUTATENZA"}
    , { departamento: "Boyaca", codigo: "15790", nombre: "TASCO"}
    , { departamento: "Boyaca", codigo: "15798", nombre: "TENZA"}
    , { departamento: "Boyaca", codigo: "15804", nombre: "TIBANÁ"}
    , { departamento: "Boyaca", codigo: "15806", nombre: "TIBASOSA"}
    , { departamento: "Boyaca", codigo: "15808", nombre: "TINJACÁ"}
    , { departamento: "Boyaca", codigo: "15810", nombre: "TIPACOQUE"}
    , { departamento: "Boyaca", codigo: "15814", nombre: "TOCA"}
    , { departamento: "Boyaca", codigo: "15816", nombre: "TOGÜÍ"}
    , { departamento: "Boyaca", codigo: "15820", nombre: "TÓPAGA"}
    , { departamento: "Boyaca", codigo: "15822", nombre: "TOTA"}
    , { departamento: "Boyaca", codigo: "15832", nombre: "TUNUNGUÁ"}
    , { departamento: "Boyaca", codigo: "15835", nombre: "TURMEQUÉ"}
    , { departamento: "Boyaca", codigo: "15837", nombre: "TUTA"}
    , { departamento: "Boyaca", codigo: "15839", nombre: "TUTAZÁ"}
    , { departamento: "Boyaca", codigo: "15842", nombre: "UMBITA"}
    , { departamento: "Boyaca", codigo: "15861", nombre: "VENTAQUEMADA"}
    , { departamento: "Boyaca", codigo: "15879", nombre: "VIRACACHÁ"}
    , { departamento: "Boyaca", codigo: "15897", nombre: "ZETAQUIRA"}
    , { departamento: "Caldas", codigo: "17001", nombre: "MANIZALES"}
    , { departamento: "Caldas", codigo: "17013", nombre: "AGUADAS"}
    , { departamento: "Caldas", codigo: "17042", nombre: "ANSERMA"}
    , { departamento: "Caldas", codigo: "17050", nombre: "ARANZAZU"}
    , { departamento: "Caldas", codigo: "17088", nombre: "BELALCÁZAR"}
    , { departamento: "Caldas", codigo: "17174", nombre: "CHINCHINÁ"}
    , { departamento: "Caldas", codigo: "17272", nombre: "FILADELFIA"}
    , { departamento: "Caldas", codigo: "17380", nombre: "LA DORADA"}
    , { departamento: "Caldas", codigo: "17388", nombre: "LA MERCED"}
    , { departamento: "Caldas", codigo: "17433", nombre: "MANZANARES"}
    , { departamento: "Caldas", codigo: "17442", nombre: "MARMATO"}
    , { departamento: "Caldas", codigo: "17444", nombre: "MARQUETALIA"}
    , { departamento: "Caldas", codigo: "17446", nombre: "MARULANDA"}
    , { departamento: "Caldas", codigo: "17486", nombre: "NEIRA"}
    , { departamento: "Caldas", codigo: "17495", nombre: "NORCASIA"}
    , { departamento: "Caldas", codigo: "17513", nombre: "PÁCORA"}
    , { departamento: "Caldas", codigo: "17524", nombre: "PALESTINA"}
    , { departamento: "Caldas", codigo: "17541", nombre: "PENSILVANIA"}
    , { departamento: "Caldas", codigo: "17614", nombre: "RIOSUCIO"}
    , { departamento: "Caldas", codigo: "17616", nombre: "RISARALDA"}
    , { departamento: "Caldas", codigo: "17653", nombre: "SALAMINA"}
    , { departamento: "Caldas", codigo: "17662", nombre: "SAMANÁ"}
    , { departamento: "Caldas", codigo: "17665", nombre: "SAN JOSÉ"}
    , { departamento: "Caldas", codigo: "17777", nombre: "SUPÍA"}
    , { departamento: "Caldas", codigo: "17867", nombre: "VICTORIA"}
    , { departamento: "Caldas", codigo: "17873", nombre: "VILLAMARÍA"}
    , { departamento: "Caldas", codigo: "17877", nombre: "VITERBO"}
    , { departamento: "Caqueta", codigo: "18001", nombre: "FLORENCIA"}
    , { departamento: "Caqueta", codigo: "18029", nombre: "ALBANIA"}
    , { departamento: "Caqueta", codigo: "18094", nombre: "BELÉN DE LOS ANDAQUÍES"}
    , { departamento: "Caqueta", codigo: "18150", nombre: "CARTAGENA DEL CHAIRÁ"}
    , { departamento: "Caqueta", codigo: "18205", nombre: "CURILLO"}
    , { departamento: "Caqueta", codigo: "18247", nombre: "EL DONCELLO"}
    , { departamento: "Caqueta", codigo: "18256", nombre: "EL PAUJIL"}
    , { departamento: "Caqueta", codigo: "18410", nombre: "LA MONTAÑITA"}
    , { departamento: "Caqueta", codigo: "18460", nombre: "MILÁN"}
    , { departamento: "Caqueta", codigo: "18479", nombre: "MORELIA"}
    , { departamento: "Caqueta", codigo: "18592", nombre: "PUERTO RICO"}
    , { departamento: "Caqueta", codigo: "18610", nombre: "SAN JOSÉ DEL FRAGUA"}
    , { departamento: "Caqueta", codigo: "18753", nombre: "SAN VICENTE DEL CAGUÁN"}
    , { departamento: "Caqueta", codigo: "18756", nombre: "SOLANO"}
    , { departamento: "Caqueta", codigo: "18785", nombre: "SOLITA"}
    , { departamento: "Caqueta", codigo: "18860", nombre: "VALPARAÍSO"}
    , { departamento: "Casanare", codigo: "85001", nombre: "YOPAL"}
    , { departamento: "Casanare", codigo: "85010", nombre: "AGUAZUL"}
    , { departamento: "Casanare", codigo: "85015", nombre: "CHAMEZA"}
    , { departamento: "Casanare", codigo: "85125", nombre: "HATO COROZAL"}
    , { departamento: "Casanare", codigo: "85136", nombre: "LA SALINA"}
    , { departamento: "Casanare", codigo: "85139", nombre: "MANÍ"}
    , { departamento: "Casanare", codigo: "85162", nombre: "MONTERREY"}
    , { departamento: "Casanare", codigo: "85225", nombre: "NUNCHÍA"}
    , { departamento: "Casanare", codigo: "85230", nombre: "OROCUÉ"}
    , { departamento: "Casanare", codigo: "85250", nombre: "PAZ DE ARIPORO"}
    , { departamento: "Casanare", codigo: "85263", nombre: "PORE"}
    , { departamento: "Casanare", codigo: "85279", nombre: "RECETOR"}
    , { departamento: "Casanare", codigo: "85300", nombre: "SABANALARGA"}
    , { departamento: "Casanare", codigo: "85315", nombre: "SÁCAMA"}
    , { departamento: "Casanare", codigo: "85325", nombre: "SAN LUIS DE PALENQUE"}
    , { departamento: "Casanare", codigo: "85400", nombre: "TÁMARA"}
    , { departamento: "Casanare", codigo: "85410", nombre: "TAURAMENA"}
    , { departamento: "Casanare", codigo: "85430", nombre: "TRINIDAD"}
    , { departamento: "Casanare", codigo: "85440", nombre: "VILLANUEVA"}
    , { departamento: "Cauca", codigo: "19001", nombre: "POPAYÁN"}
    , { departamento: "Cauca", codigo: "19022", nombre: "ALMAGUER"}
    , { departamento: "Cauca", codigo: "19050", nombre: "ARGELIA"}
    , { departamento: "Cauca", codigo: "19075", nombre: "BALBOA"}
    , { departamento: "Cauca", codigo: "19100", nombre: "BOLÍVAR"}
    , { departamento: "Cauca", codigo: "19110", nombre: "BUENOS AIRES"}
    , { departamento: "Cauca", codigo: "19130", nombre: "CAJIBÍO"}
    , { departamento: "Cauca", codigo: "19137", nombre: "CALDONO"}
    , { departamento: "Cauca", codigo: "19142", nombre: "CALOTO"}
    , { departamento: "Cauca", codigo: "19212", nombre: "CORINTO"}
    , { departamento: "Cauca", codigo: "19256", nombre: "EL TAMBO"}
    , { departamento: "Cauca", codigo: "19290", nombre: "FLORENCIA"}
    , { departamento: "Cauca", codigo: "19300", nombre: "GUACHENÉ"}
    , { departamento: "Cauca", codigo: "19318", nombre: "GUAPI"}
    , { departamento: "Cauca", codigo: "19355", nombre: "INZÁ"}
    , { departamento: "Cauca", codigo: "19364", nombre: "JAMBALÓ"}
    , { departamento: "Cauca", codigo: "19392", nombre: "LA SIERRA"}
    , { departamento: "Cauca", codigo: "19397", nombre: "LA VEGA"}
    , { departamento: "Cauca", codigo: "19418", nombre: "LÓPEZ"}
    , { departamento: "Cauca", codigo: "19450", nombre: "MERCADERES"}
    , { departamento: "Cauca", codigo: "19455", nombre: "MIRANDA"}
    , { departamento: "Cauca", codigo: "19473", nombre: "MORALES"}
    , { departamento: "Cauca", codigo: "19513", nombre: "PADILLA"}
    , { departamento: "Cauca", codigo: "19517", nombre: "PAEZ"}
    , { departamento: "Cauca", codigo: "19532", nombre: "PATÍA"}
    , { departamento: "Cauca", codigo: "19533", nombre: "PIAMONTE"}
    , { departamento: "Cauca", codigo: "19548", nombre: "PIENDAMÓ"}
    , { departamento: "Cauca", codigo: "19573", nombre: "PUERTO TEJADA"}
    , { departamento: "Cauca", codigo: "19585", nombre: "PURACÉ"}
    , { departamento: "Cauca", codigo: "19622", nombre: "ROSAS"}
    , { departamento: "Cauca", codigo: "19693", nombre: "SAN SEBASTIÁN"}
    , { departamento: "Cauca", codigo: "19698", nombre: "SANTANDER DE QUILICHAO"}
    , { departamento: "Cauca", codigo: "19701", nombre: "SANTA ROSA"}
    , { departamento: "Cauca", codigo: "19743", nombre: "SILVIA"}
    , { departamento: "Cauca", codigo: "19760", nombre: "SOTARA"}
    , { departamento: "Cauca", codigo: "19780", nombre: "SUÁREZ"}
    , { departamento: "Cauca", codigo: "19785", nombre: "SUCRE"}
    , { departamento: "Cauca", codigo: "19807", nombre: "TIMBÍO"}
    , { departamento: "Cauca", codigo: "19809", nombre: "TIMBIQUÍ"}
    , { departamento: "Cauca", codigo: "19821", nombre: "TORIBIO"}
    , { departamento: "Cauca", codigo: "19824", nombre: "TOTORÓ"}
    , { departamento: "Cauca", codigo: "19845", nombre: "VILLA RICA"}
    , { departamento: "Cesar", codigo: "20001", nombre: "VALLEDUPAR"}
    , { departamento: "Cesar", codigo: "20011", nombre: "AGUACHICA"}
    , { departamento: "Cesar", codigo: "20013", nombre: "AGUSTÍN CODAZZI"}
    , { departamento: "Cesar", codigo: "20032", nombre: "ASTREA"}
    , { departamento: "Cesar", codigo: "20045", nombre: "BECERRIL"}
    , { departamento: "Cesar", codigo: "20060", nombre: "BOSCONIA"}
    , { departamento: "Cesar", codigo: "20175", nombre: "CHIMICHAGUA"}
    , { departamento: "Cesar", codigo: "20178", nombre: "CHIRIGUANÁ"}
    , { departamento: "Cesar", codigo: "20228", nombre: "CURUMANÍ"}
    , { departamento: "Cesar", codigo: "20238", nombre: "EL COPEY"}
    , { departamento: "Cesar", codigo: "20250", nombre: "EL PASO"}
    , { departamento: "Cesar", codigo: "20295", nombre: "GAMARRA"}
    , { departamento: "Cesar", codigo: "20310", nombre: "GONZÁLEZ"}
    , { departamento: "Cesar", codigo: "20383", nombre: "LA GLORIA"}
    , { departamento: "Cesar", codigo: "20400", nombre: "LA JAGUA DE IBIRICO"}
    , { departamento: "Cesar", codigo: "20443", nombre: "MANAURE"}
    , { departamento: "Cesar", codigo: "20517", nombre: "PAILITAS"}
    , { departamento: "Cesar", codigo: "20550", nombre: "PELAYA"}
    , { departamento: "Cesar", codigo: "20570", nombre: "PUEBLO BELLO"}
    , { departamento: "Cesar", codigo: "20614", nombre: "RÍO DE ORO"}
    , { departamento: "Cesar", codigo: "20621", nombre: "LA PAZ"}
    , { departamento: "Cesar", codigo: "20710", nombre: "SAN ALBERTO"}
    , { departamento: "Cesar", codigo: "20750", nombre: "SAN DIEGO"}
    , { departamento: "Cesar", codigo: "20770", nombre: "SAN MARTÍN"}
    , { departamento: "Cesar", codigo: "20787", nombre: "TAMALAMEQUE"}
    , { departamento: "Choco", codigo: "27001", nombre: "QUIBDÓ"}
    , { departamento: "Choco", codigo: "27006", nombre: "ACANDÍ"}
    , { departamento: "Choco", codigo: "27025", nombre: "ALTO BAUDÓ"}
    , { departamento: "Choco", codigo: "27050", nombre: "ATRATO"}
    , { departamento: "Choco", codigo: "27073", nombre: "BAGADÓ"}
    , { departamento: "Choco", codigo: "27075", nombre: "BAHÍA SOLANO"}
    , { departamento: "Choco", codigo: "27077", nombre: "BAJO BAUDÓ"}
    , { departamento: "Choco", codigo: "27099", nombre: "BOJAYA"}
    , { departamento: "Choco", codigo: "27135", nombre: "EL CANTÓN DEL SAN PABLO"}
    , { departamento: "Choco", codigo: "27150", nombre: "CARMEN DEL DARIÉN"}
    , { departamento: "Choco", codigo: "27160", nombre: "CÉRTEGUI"}
    , { departamento: "Choco", codigo: "27205", nombre: "CONDOTO"}
    , { departamento: "Choco", codigo: "27245", nombre: "EL CARMEN DE ATRATO"}
    , { departamento: "Choco", codigo: "27250", nombre: "EL LITORAL DEL SAN JUAN"}
    , { departamento: "Choco", codigo: "27361", nombre: "ISTMINA"}
    , { departamento: "Choco", codigo: "27372", nombre: "JURADÓ"}
    , { departamento: "Choco", codigo: "27413", nombre: "LLORÓ"}
    , { departamento: "Choco", codigo: "27425", nombre: "MEDIO ATRATO"}
    , { departamento: "Choco", codigo: "27430", nombre: "MEDIO BAUDÓ"}
    , { departamento: "Choco", codigo: "27450", nombre: "MEDIO SAN JUAN"}
    , { departamento: "Choco", codigo: "27491", nombre: "NÓVITA"}
    , { departamento: "Choco", codigo: "27495", nombre: "NUQUÍ"}
    , { departamento: "Choco", codigo: "27580", nombre: "RÍO IRÓ"}
    , { departamento: "Choco", codigo: "27600", nombre: "RÍO QUITO"}
    , { departamento: "Choco", codigo: "27615", nombre: "RIOSUCIO"}
    , { departamento: "Choco", codigo: "27660", nombre: "SAN JOSÉ DEL PALMAR"}
    , { departamento: "Choco", codigo: "27745", nombre: "SIPÍ"}
    , { departamento: "Choco", codigo: "27787", nombre: "TADÓ"}
    , { departamento: "Choco", codigo: "27800", nombre: "UNGUÍA"}
    , { departamento: "Choco", codigo: "27810", nombre: "UNIÓN PANAMERICANA"}
    , { departamento: "Cordoba", codigo: "23001", nombre: "MONTERÍA"}
    , { departamento: "Cordoba", codigo: "23068", nombre: "AYAPEL"}
    , { departamento: "Cordoba", codigo: "23079", nombre: "BUENAVISTA"}
    , { departamento: "Cordoba", codigo: "23090", nombre: "CANALETE"}
    , { departamento: "Cordoba", codigo: "23162", nombre: "CERETÉ"}
    , { departamento: "Cordoba", codigo: "23168", nombre: "CHIMÁ"}
    , { departamento: "Cordoba", codigo: "23182", nombre: "CHINÚ"}
    , { departamento: "Cordoba", codigo: "23189", nombre: "CIÉNAGA DE ORO"}
    , { departamento: "Cordoba", codigo: "23300", nombre: "COTORRA"}
    , { departamento: "Cordoba", codigo: "23350", nombre: "LA APARTADA"}
    , { departamento: "Cordoba", codigo: "23417", nombre: "LORICA"}
    , { departamento: "Cordoba", codigo: "23419", nombre: "LOS CÓRDOBAS"}
    , { departamento: "Cordoba", codigo: "23464", nombre: "MOMIL"}
    , { departamento: "Cordoba", codigo: "23466", nombre: "MONTELÍBANO"}
    , { departamento: "Cordoba", codigo: "23500", nombre: "MOÑITOS"}
    , { departamento: "Cordoba", codigo: "23555", nombre: "PLANETA RICA"}
    , { departamento: "Cordoba", codigo: "23570", nombre: "PUEBLO NUEVO"}
    , { departamento: "Cordoba", codigo: "23574", nombre: "PUERTO ESCONDIDO"}
    , { departamento: "Cordoba", codigo: "23580", nombre: "PUERTO LIBERTADOR"}
    , { departamento: "Cordoba", codigo: "23586", nombre: "PURÍSIMA"}
    , { departamento: "Cordoba", codigo: "23660", nombre: "SAHAGÚN"}
    , { departamento: "Cordoba", codigo: "23670", nombre: "SAN ANDRÉS SOTAVENTO"}
    , { departamento: "Cordoba", codigo: "23672", nombre: "SAN ANTERO"}
    , { departamento: "Cordoba", codigo: "23675", nombre: "SAN BERNARDO DEL VIENTO"}
    , { departamento: "Cordoba", codigo: "23678", nombre: "SAN CARLOS"}
    , { departamento: "Cordoba", codigo: "23682", nombre: "SAN JOSÉ DE URÉ"}
    , { departamento: "Cordoba", codigo: "23686", nombre: "SAN PELAYO"}
    , { departamento: "Cordoba", codigo: "23807", nombre: "TIERRALTA"}
    , { departamento: "Cordoba", codigo: "23815", nombre: "TUCHÍN"}
    , { departamento: "Cordoba", codigo: "23855", nombre: "VALENCIA"}
    , { departamento: "Cundinamarca", codigo: "25001", nombre: "AGUA DE DIOS"}
    , { departamento: "Cundinamarca", codigo: "25019", nombre: "ALBÁN"}
    , { departamento: "Cundinamarca", codigo: "25035", nombre: "ANAPOIMA"}
    , { departamento: "Cundinamarca", codigo: "25040", nombre: "ANOLAIMA"}
    , { departamento: "Cundinamarca", codigo: "25053", nombre: "ARBELÁEZ"}
    , { departamento: "Cundinamarca", codigo: "25086", nombre: "BELTRÁN"}
    , { departamento: "Cundinamarca", codigo: "25095", nombre: "BITUIMA"}
    , { departamento: "Cundinamarca", codigo: "25099", nombre: "BOJACÁ"}
    , { departamento: "Cundinamarca", codigo: "25120", nombre: "CABRERA"}
    , { departamento: "Cundinamarca", codigo: "25123", nombre: "CACHIPAY"}
    , { departamento: "Cundinamarca", codigo: "25126", nombre: "CAJICÁ"}
    , { departamento: "Cundinamarca", codigo: "25148", nombre: "CAPARRAPÍ"}
    , { departamento: "Cundinamarca", codigo: "25151", nombre: "CAQUEZA"}
    , { departamento: "Cundinamarca", codigo: "25154", nombre: "CARMEN DE CARUPA"}
    , { departamento: "Cundinamarca", codigo: "25168", nombre: "CHAGUANÍ"}
    , { departamento: "Cundinamarca", codigo: "25175", nombre: "CHÍA"}
    , { departamento: "Cundinamarca", codigo: "25178", nombre: "CHIPAQUE"}
    , { departamento: "Cundinamarca", codigo: "25181", nombre: "CHOACHÍ"}
    , { departamento: "Cundinamarca", codigo: "25183", nombre: "CHOCONTÁ"}
    , { departamento: "Cundinamarca", codigo: "25200", nombre: "COGUA"}
    , { departamento: "Cundinamarca", codigo: "25214", nombre: "COTA"}
    , { departamento: "Cundinamarca", codigo: "25224", nombre: "CUCUNUBÁ"}
    , { departamento: "Cundinamarca", codigo: "25245", nombre: "EL COLEGIO"}
    , { departamento: "Cundinamarca", codigo: "25258", nombre: "EL PEÑÓN"}
    , { departamento: "Cundinamarca", codigo: "25260", nombre: "EL ROSAL"}
    , { departamento: "Cundinamarca", codigo: "25269", nombre: "FACATATIVÁ"}
    , { departamento: "Cundinamarca", codigo: "25279", nombre: "FOMEQUE"}
    , { departamento: "Cundinamarca", codigo: "25281", nombre: "FOSCA"}
    , { departamento: "Cundinamarca", codigo: "25286", nombre: "FUNZA"}
    , { departamento: "Cundinamarca", codigo: "25288", nombre: "FÚQUENE"}
    , { departamento: "Cundinamarca", codigo: "25290", nombre: "FUSAGASUGÁ"}
    , { departamento: "Cundinamarca", codigo: "25293", nombre: "GACHALA"}
    , { departamento: "Cundinamarca", codigo: "25295", nombre: "GACHANCIPÁ"}
    , { departamento: "Cundinamarca", codigo: "25297", nombre: "GACHETÁ"}
    , { departamento: "Cundinamarca", codigo: "25299", nombre: "GAMA"}
    , { departamento: "Cundinamarca", codigo: "25307", nombre: "GIRARDOT"}
    , { departamento: "Cundinamarca", codigo: "25312", nombre: "GRANADA"}
    , { departamento: "Cundinamarca", codigo: "25317", nombre: "GUACHETÁ"}
    , { departamento: "Cundinamarca", codigo: "25320", nombre: "GUADUAS"}
    , { departamento: "Cundinamarca", codigo: "25322", nombre: "GUASCA"}
    , { departamento: "Cundinamarca", codigo: "25324", nombre: "GUATAQUÍ"}
    , { departamento: "Cundinamarca", codigo: "25326", nombre: "GUATAVITA"}
    , { departamento: "Cundinamarca", codigo: "25328", nombre: "GUAYABAL DE SIQUIMA"}
    , { departamento: "Cundinamarca", codigo: "25335", nombre: "GUAYABETAL"}
    , { departamento: "Cundinamarca", codigo: "25339", nombre: "GUTIÉRREZ"}
    , { departamento: "Cundinamarca", codigo: "25368", nombre: "JERUSALÉN"}
    , { departamento: "Cundinamarca", codigo: "25372", nombre: "JUNÍN"}
    , { departamento: "Cundinamarca", codigo: "25377", nombre: "LA CALERA"}
    , { departamento: "Cundinamarca", codigo: "25386", nombre: "LA MESA"}
    , { departamento: "Cundinamarca", codigo: "25394", nombre: "LA PALMA"}
    , { departamento: "Cundinamarca", codigo: "25398", nombre: "LA PEÑA"}
    , { departamento: "Cundinamarca", codigo: "25402", nombre: "LA VEGA"}
    , { departamento: "Cundinamarca", codigo: "25407", nombre: "LENGUAZAQUE"}
    , { departamento: "Cundinamarca", codigo: "25426", nombre: "MACHETA"}
    , { departamento: "Cundinamarca", codigo: "25430", nombre: "MADRID"}
    , { departamento: "Cundinamarca", codigo: "25436", nombre: "MANTA"}
    , { departamento: "Cundinamarca", codigo: "25438", nombre: "MEDINA"}
    , { departamento: "Cundinamarca", codigo: "25473", nombre: "MOSQUERA"}
    , { departamento: "Cundinamarca", codigo: "25483", nombre: "NARIÑO"}
    , { departamento: "Cundinamarca", codigo: "25486", nombre: "NEMOCÓN"}
    , { departamento: "Cundinamarca", codigo: "25488", nombre: "NILO"}
    , { departamento: "Cundinamarca", codigo: "25489", nombre: "NIMAIMA"}
    , { departamento: "Cundinamarca", codigo: "25491", nombre: "NOCAIMA"}
    , { departamento: "Cundinamarca", codigo: "25506", nombre: "VENECIA"}
    , { departamento: "Cundinamarca", codigo: "25513", nombre: "PACHO"}
    , { departamento: "Cundinamarca", codigo: "25518", nombre: "PAIME"}
    , { departamento: "Cundinamarca", codigo: "25524", nombre: "PANDI"}
    , { departamento: "Cundinamarca", codigo: "25530", nombre: "PARATEBUENO"}
    , { departamento: "Cundinamarca", codigo: "25535", nombre: "PASCA"}
    , { departamento: "Cundinamarca", codigo: "25572", nombre: "PUERTO SALGAR"}
    , { departamento: "Cundinamarca", codigo: "25580", nombre: "PULÍ"}
    , { departamento: "Cundinamarca", codigo: "25592", nombre: "QUEBRADANEGRA"}
    , { departamento: "Cundinamarca", codigo: "25594", nombre: "QUETAME"}
    , { departamento: "Cundinamarca", codigo: "25596", nombre: "QUIPILE"}
    , { departamento: "Cundinamarca", codigo: "25599", nombre: "APULO"}
    , { departamento: "Cundinamarca", codigo: "25612", nombre: "RICAURTE"}
    , { departamento: "Cundinamarca", codigo: "25645", nombre: "SAN ANTONIO DEL TEQUENDAMA"}
    , { departamento: "Cundinamarca", codigo: "25649", nombre: "SAN BERNARDO"}
    , { departamento: "Cundinamarca", codigo: "25653", nombre: "SAN CAYETANO"}
    , { departamento: "Cundinamarca", codigo: "25658", nombre: "SAN FRANCISCO"}
    , { departamento: "Cundinamarca", codigo: "25662", nombre: "SAN JUAN DE RÍO SECO"}
    , { departamento: "Cundinamarca", codigo: "25718", nombre: "SASAIMA"}
    , { departamento: "Cundinamarca", codigo: "25736", nombre: "SESQUILÉ"}
    , { departamento: "Cundinamarca", codigo: "25740", nombre: "SIBATÉ"}
    , { departamento: "Cundinamarca", codigo: "25743", nombre: "SILVANIA"}
    , { departamento: "Cundinamarca", codigo: "25745", nombre: "SIMIJACA"}
    , { departamento: "Cundinamarca", codigo: "25754", nombre: "SOACHA"}
    , { departamento: "Cundinamarca", codigo: "25758", nombre: "SOPÓ"}
    , { departamento: "Cundinamarca", codigo: "25769", nombre: "SUBACHOQUE"}
    , { departamento: "Cundinamarca", codigo: "25772", nombre: "SUESCA"}
    , { departamento: "Cundinamarca", codigo: "25777", nombre: "SUPATÁ"}
    , { departamento: "Cundinamarca", codigo: "25779", nombre: "SUSA"}
    , { departamento: "Cundinamarca", codigo: "25781", nombre: "SUTATAUSA"}
    , { departamento: "Cundinamarca", codigo: "25785", nombre: "TABIO"}
    , { departamento: "Cundinamarca", codigo: "25793", nombre: "TAUSA"}
    , { departamento: "Cundinamarca", codigo: "25797", nombre: "TENA"}
    , { departamento: "Cundinamarca", codigo: "25799", nombre: "TENJO"}
    , { departamento: "Cundinamarca", codigo: "25805", nombre: "TIBACUY"}
    , { departamento: "Cundinamarca", codigo: "25807", nombre: "TIBIRITA"}
    , { departamento: "Cundinamarca", codigo: "25815", nombre: "TOCAIMA"}
    , { departamento: "Cundinamarca", codigo: "25817", nombre: "TOCANCIPÁ"}
    , { departamento: "Cundinamarca", codigo: "25823", nombre: "TOPAIPÍ"}
    , { departamento: "Cundinamarca", codigo: "25839", nombre: "UBALÁ"}
    , { departamento: "Cundinamarca", codigo: "25841", nombre: "UBAQUE"}
    , { departamento: "Cundinamarca", codigo: "25843", nombre: "VILLA DE SAN DIEGO DE UBATE"}
    , { departamento: "Cundinamarca", codigo: "25845", nombre: "UNE"}
    , { departamento: "Cundinamarca", codigo: "25851", nombre: "ÚTICA"}
    , { departamento: "Cundinamarca", codigo: "25862", nombre: "VERGARA"}
    , { departamento: "Cundinamarca", codigo: "25867", nombre: "VIANÍ"}
    , { departamento: "Cundinamarca", codigo: "25871", nombre: "VILLAGÓMEZ"}
    , { departamento: "Cundinamarca", codigo: "25873", nombre: "VILLAPINZÓN"}
    , { departamento: "Cundinamarca", codigo: "25875", nombre: "VILLETA"}
    , { departamento: "Cundinamarca", codigo: "25878", nombre: "VIOTÁ"}
    , { departamento: "Cundinamarca", codigo: "25885", nombre: "YACOPÍ"}
    , { departamento: "Cundinamarca", codigo: "25898", nombre: "ZIPACÓN"}
    , { departamento: "Cundinamarca", codigo: "25899", nombre: "ZIPAQUIRÁ"}
    , { departamento: "Guainia", codigo: "94001", nombre: "INÍRIDA"}
    , { departamento: "Guainia", codigo: "94343", nombre: "BARRANCO MINAS"}
    , { departamento: "Guainia", codigo: "94663", nombre: "MAPIRIPANA"}
    , { departamento: "Guainia", codigo: "94883", nombre: "SAN FELIPE"}
    , { departamento: "Guainia", codigo: "94884", nombre: "PUERTO COLOMBIA"}
    , { departamento: "Guainia", codigo: "94885", nombre: "LA GUADALUPE"}
    , { departamento: "Guainia", codigo: "94886", nombre: "CACAHUAL"}
    , { departamento: "Guainia", codigo: "94887", nombre: "PANA PANA"}
    , { departamento: "Guainia", codigo: "94888", nombre: "MORICHAL"}
    , { departamento: "Guaviare", codigo: "95001", nombre: "SAN JOSÉ DEL GUAVIARE"}
    , { departamento: "Guaviare", codigo: "95015", nombre: "CALAMAR"}
    , { departamento: "Guaviare", codigo: "95025", nombre: "EL RETORNO"}
    , { departamento: "Guaviare", codigo: "95200", nombre: "MIRAFLORES"}
    , { departamento: "Huila", codigo: "41001", nombre: "NEIVA"}
    , { departamento: "Huila", codigo: "41006", nombre: "ACEVEDO"}
    , { departamento: "Huila", codigo: "41013", nombre: "AGRADO"}
    , { departamento: "Huila", codigo: "41016", nombre: "AIPE"}
    , { departamento: "Huila", codigo: "41020", nombre: "ALGECIRAS"}
    , { departamento: "Huila", codigo: "41026", nombre: "ALTAMIRA"}
    , { departamento: "Huila", codigo: "41078", nombre: "BARAYA"}
    , { departamento: "Huila", codigo: "41132", nombre: "CAMPOALEGRE"}
    , { departamento: "Huila", codigo: "41206", nombre: "COLOMBIA"}
    , { departamento: "Huila", codigo: "41244", nombre: "ELÍAS"}
    , { departamento: "Huila", codigo: "41298", nombre: "GARZÓN"}
    , { departamento: "Huila", codigo: "41306", nombre: "GIGANTE"}
    , { departamento: "Huila", codigo: "41319", nombre: "GUADALUPE"}
    , { departamento: "Huila", codigo: "41349", nombre: "HOBO"}
    , { departamento: "Huila", codigo: "41357", nombre: "IQUIRA"}
    , { departamento: "Huila", codigo: "41359", nombre: "ISNOS"}
    , { departamento: "Huila", codigo: "41378", nombre: "LA ARGENTINA"}
    , { departamento: "Huila", codigo: "41396", nombre: "LA PLATA"}
    , { departamento: "Huila", codigo: "41483", nombre: "NÁTAGA"}
    , { departamento: "Huila", codigo: "41503", nombre: "OPORAPA"}
    , { departamento: "Huila", codigo: "41518", nombre: "PAICOL"}
    , { departamento: "Huila", codigo: "41524", nombre: "PALERMO"}
    , { departamento: "Huila", codigo: "41530", nombre: "PALESTINA"}
    , { departamento: "Huila", codigo: "41548", nombre: "PITAL"}
    , { departamento: "Huila", codigo: "41551", nombre: "PITALITO"}
    , { departamento: "Huila", codigo: "41615", nombre: "RIVERA"}
    , { departamento: "Huila", codigo: "41660", nombre: "SALADOBLANCO"}
    , { departamento: "Huila", codigo: "41668", nombre: "SAN AGUSTÍN"}
    , { departamento: "Huila", codigo: "41676", nombre: "SANTA MARÍA"}
    , { departamento: "Huila", codigo: "41770", nombre: "SUAZA"}
    , { departamento: "Huila", codigo: "41791", nombre: "TARQUI"}
    , { departamento: "Huila", codigo: "41797", nombre: "TESALIA"}
    , { departamento: "Huila", codigo: "41799", nombre: "TELLO"}
    , { departamento: "Huila", codigo: "41801", nombre: "TERUEL"}
    , { departamento: "Huila", codigo: "41807", nombre: "TIMANÁ"}
    , { departamento: "Huila", codigo: "41872", nombre: "VILLAVIEJA"}
    , { departamento: "Huila", codigo: "41885", nombre: "YAGUARÁ"}
    , { departamento: "La Guajira", codigo: "44001", nombre: "RIOHACHA"}
    , { departamento: "La Guajira", codigo: "44035", nombre: "ALBANIA"}
    , { departamento: "La Guajira", codigo: "44078", nombre: "BARRANCAS"}
    , { departamento: "La Guajira", codigo: "44090", nombre: "DIBULLA"}
    , { departamento: "La Guajira", codigo: "44098", nombre: "DISTRACCIÓN"}
    , { departamento: "La Guajira", codigo: "44110", nombre: "EL MOLINO"}
    , { departamento: "La Guajira", codigo: "44279", nombre: "FONSECA"}
    , { departamento: "La Guajira", codigo: "44378", nombre: "HATONUEVO"}
    , { departamento: "La Guajira", codigo: "44420", nombre: "LA JAGUA DEL PILAR"}
    , { departamento: "La Guajira", codigo: "44430", nombre: "MAICAO"}
    , { departamento: "La Guajira", codigo: "44560", nombre: "MANAURE"}
    , { departamento: "La Guajira", codigo: "44650", nombre: "SAN JUAN DEL CESAR"}
    , { departamento: "La Guajira", codigo: "44847", nombre: "URIBIA"}
    , { departamento: "La Guajira", codigo: "44855", nombre: "URUMITA"}
    , { departamento: "La Guajira", codigo: "44874", nombre: "VILLANUEVA"}
    , { departamento: "Magdalena", codigo: "47001", nombre: "SANTA MARTA"}
    , { departamento: "Magdalena", codigo: "47030", nombre: "ALGARROBO"}
    , { departamento: "Magdalena", codigo: "47053", nombre: "ARACATACA"}
    , { departamento: "Magdalena", codigo: "47058", nombre: "ARIGUANÍ"}
    , { departamento: "Magdalena", codigo: "47161", nombre: "CERRO SAN ANTONIO"}
    , { departamento: "Magdalena", codigo: "47170", nombre: "CHIVOLO"}
    , { departamento: "Magdalena", codigo: "47189", nombre: "CIÉNAGA"}
    , { departamento: "Magdalena", codigo: "47205", nombre: "CONCORDIA"}
    , { departamento: "Magdalena", codigo: "47245", nombre: "EL BANCO"}
    , { departamento: "Magdalena", codigo: "47258", nombre: "EL PIÑON"}
    , { departamento: "Magdalena", codigo: "47268", nombre: "EL RETÉN"}
    , { departamento: "Magdalena", codigo: "47288", nombre: "FUNDACIÓN"}
    , { departamento: "Magdalena", codigo: "47318", nombre: "GUAMAL"}
    , { departamento: "Magdalena", codigo: "47460", nombre: "NUEVA GRANADA"}
    , { departamento: "Magdalena", codigo: "47541", nombre: "PEDRAZA"}
    , { departamento: "Magdalena", codigo: "47545", nombre: "PIJIÑO DEL CARMEN"}
    , { departamento: "Magdalena", codigo: "47551", nombre: "PIVIJAY"}
    , { departamento: "Magdalena", codigo: "47555", nombre: "PLATO"}
    , { departamento: "Magdalena", codigo: "47570", nombre: "PUEBLOVIEJO"}
    , { departamento: "Magdalena", codigo: "47605", nombre: "REMOLINO"}
    , { departamento: "Magdalena", codigo: "47660", nombre: "SABANAS DE SAN ANGEL"}
    , { departamento: "Magdalena", codigo: "47675", nombre: "SALAMINA"}
    , { departamento: "Magdalena", codigo: "47692", nombre: "SAN SEBASTIÁN DE BUENAVISTA"}
    , { departamento: "Magdalena", codigo: "47703", nombre: "SAN ZENÓN"}
    , { departamento: "Magdalena", codigo: "47707", nombre: "SANTA ANA"}
    , { departamento: "Magdalena", codigo: "47720", nombre: "SANTA BÁRBARA DE PINTO"}
    , { departamento: "Magdalena", codigo: "47745", nombre: "SITIONUEVO"}
    , { departamento: "Magdalena", codigo: "47798", nombre: "TENERIFE"}
    , { departamento: "Magdalena", codigo: "47960", nombre: "ZAPAYÁN"}
    , { departamento: "Magdalena", codigo: "47980", nombre: "ZONA BANANERA"}
    , { departamento: "Meta", codigo: "50001", nombre: "VILLAVICENCIO"}
    , { departamento: "Meta", codigo: "50006", nombre: "ACACÍAS"}
    , { departamento: "Meta", codigo: "50110", nombre: "BARRANCA DE UPÍA"}
    , { departamento: "Meta", codigo: "50124", nombre: "CABUYARO"}
    , { departamento: "Meta", codigo: "50150", nombre: "CASTILLA LA NUEVA"}
    , { departamento: "Meta", codigo: "50223", nombre: "CUBARRAL"}
    , { departamento: "Meta", codigo: "50226", nombre: "CUMARAL"}
    , { departamento: "Meta", codigo: "50245", nombre: "EL CALVARIO"}
    , { departamento: "Meta", codigo: "50251", nombre: "EL CASTILLO"}
    , { departamento: "Meta", codigo: "50270", nombre: "EL DORADO"}
    , { departamento: "Meta", codigo: "50287", nombre: "FUENTE DE ORO"}
    , { departamento: "Meta", codigo: "50313", nombre: "GRANADA"}
    , { departamento: "Meta", codigo: "50318", nombre: "GUAMAL"}
    , { departamento: "Meta", codigo: "50325", nombre: "MAPIRIPÁN"}
    , { departamento: "Meta", codigo: "50330", nombre: "MESETAS"}
    , { departamento: "Meta", codigo: "50350", nombre: "LA MACARENA"}
    , { departamento: "Meta", codigo: "50370", nombre: "URIBE"}
    , { departamento: "Meta", codigo: "50400", nombre: "LEJANÍAS"}
    , { departamento: "Meta", codigo: "50450", nombre: "PUERTO CONCORDIA"}
    , { departamento: "Meta", codigo: "50568", nombre: "PUERTO GAITÁN"}
    , { departamento: "Meta", codigo: "50573", nombre: "PUERTO LÓPEZ"}
    , { departamento: "Meta", codigo: "50577", nombre: "PUERTO LLERAS"}
    , { departamento: "Meta", codigo: "50590", nombre: "PUERTO RICO"}
    , { departamento: "Meta", codigo: "50606", nombre: "RESTREPO"}
    , { departamento: "Meta", codigo: "50680", nombre: "SAN CARLOS DE GUAROA"}
    , { departamento: "Meta", codigo: "50683", nombre: "SAN JUAN DE ARAMA"}
    , { departamento: "Meta", codigo: "50686", nombre: "SAN JUANITO"}
    , { departamento: "Meta", codigo: "50689", nombre: "SAN MARTÍN"}
    , { departamento: "Meta", codigo: "50711", nombre: "VISTAHERMOSA"}
    , { departamento: "Nariño", codigo: "52001", nombre: "PASTO"}
    , { departamento: "Nariño", codigo: "52019", nombre: "ALBÁN"}
    , { departamento: "Nariño", codigo: "52022", nombre: "ALDANA"}
    , { departamento: "Nariño", codigo: "52036", nombre: "ANCUYÁ"}
    , { departamento: "Nariño", codigo: "52051", nombre: "ARBOLEDA"}
    , { departamento: "Nariño", codigo: "52079", nombre: "BARBACOAS"}
    , { departamento: "Nariño", codigo: "52083", nombre: "BELÉN"}
    , { departamento: "Nariño", codigo: "52110", nombre: "BUESACO"}
    , { departamento: "Nariño", codigo: "52203", nombre: "COLÓN"}
    , { departamento: "Nariño", codigo: "52207", nombre: "CONSACA"}
    , { departamento: "Nariño", codigo: "52210", nombre: "CONTADERO"}
    , { departamento: "Nariño", codigo: "52215", nombre: "CÓRDOBA"}
    , { departamento: "Nariño", codigo: "52224", nombre: "CUASPUD"}
    , { departamento: "Nariño", codigo: "52227", nombre: "CUMBAL"}
    , { departamento: "Nariño", codigo: "52233", nombre: "CUMBITARA"}
    , { departamento: "Nariño", codigo: "52240", nombre: "CHACHAGÜÍ"}
    , { departamento: "Nariño", codigo: "52250", nombre: "EL CHARCO"}
    , { departamento: "Nariño", codigo: "52254", nombre: "EL PEÑOL"}
    , { departamento: "Nariño", codigo: "52256", nombre: "EL ROSARIO"}
    , { departamento: "Nariño", codigo: "52258", nombre: "EL TABLÓN DE GÓMEZ"}
    , { departamento: "Nariño", codigo: "52260", nombre: "EL TAMBO"}
    , { departamento: "Nariño", codigo: "52287", nombre: "FUNES"}
    , { departamento: "Nariño", codigo: "52317", nombre: "GUACHUCAL"}
    , { departamento: "Nariño", codigo: "52320", nombre: "GUAITARILLA"}
    , { departamento: "Nariño", codigo: "52323", nombre: "GUALMATÁN"}
    , { departamento: "Nariño", codigo: "52352", nombre: "ILES"}
    , { departamento: "Nariño", codigo: "52354", nombre: "IMUÉS"}
    , { departamento: "Nariño", codigo: "52356", nombre: "IPIALES"}
    , { departamento: "Nariño", codigo: "52378", nombre: "LA CRUZ"}
    , { departamento: "Nariño", codigo: "52381", nombre: "LA FLORIDA"}
    , { departamento: "Nariño", codigo: "52385", nombre: "LA LLANADA"}
    , { departamento: "Nariño", codigo: "52390", nombre: "LA TOLA"}
    , { departamento: "Nariño", codigo: "52399", nombre: "LA UNIÓN"}
    , { departamento: "Nariño", codigo: "52405", nombre: "LEIVA"}
    , { departamento: "Nariño", codigo: "52411", nombre: "LINARES"}
    , { departamento: "Nariño", codigo: "52418", nombre: "LOS ANDES"}
    , { departamento: "Nariño", codigo: "52427", nombre: "MAGÜI"}
    , { departamento: "Nariño", codigo: "52435", nombre: "MALLAMA"}
    , { departamento: "Nariño", codigo: "52473", nombre: "MOSQUERA"}
    , { departamento: "Nariño", codigo: "52480", nombre: "NARIÑO"}
    , { departamento: "Nariño", codigo: "52490", nombre: "OLAYA HERRERA"}
    , { departamento: "Nariño", codigo: "52506", nombre: "OSPINA"}
    , { departamento: "Nariño", codigo: "52520", nombre: "FRANCISCO PIZARRO"}
    , { departamento: "Nariño", codigo: "52540", nombre: "POLICARPA"}
    , { departamento: "Nariño", codigo: "52560", nombre: "POTOSÍ"}
    , { departamento: "Nariño", codigo: "52565", nombre: "PROVIDENCIA"}
    , { departamento: "Nariño", codigo: "52573", nombre: "PUERRES"}
    , { departamento: "Nariño", codigo: "52585", nombre: "PUPIALES"}
    , { departamento: "Nariño", codigo: "52612", nombre: "RICAURTE"}
    , { departamento: "Nariño", codigo: "52621", nombre: "ROBERTO PAYÁN"}
    , { departamento: "Nariño", codigo: "52678", nombre: "SAMANIEGO"}
    , { departamento: "Nariño", codigo: "52683", nombre: "SANDONÁ"}
    , { departamento: "Nariño", codigo: "52685", nombre: "SAN BERNARDO"}
    , { departamento: "Nariño", codigo: "52687", nombre: "SAN LORENZO"}
    , { departamento: "Nariño", codigo: "52693", nombre: "SAN PABLO"}
    , { departamento: "Nariño", codigo: "52694", nombre: "SAN PEDRO DE CARTAGO"}
    , { departamento: "Nariño", codigo: "52696", nombre: "SANTA BÁRBARA"}
    , { departamento: "Nariño", codigo: "52699", nombre: "SANTACRUZ"}
    , { departamento: "Nariño", codigo: "52720", nombre: "SAPUYES"}
    , { departamento: "Nariño", codigo: "52786", nombre: "TAMINANGO"}
    , { departamento: "Nariño", codigo: "52788", nombre: "TANGUA"}
    , { departamento: "Nariño", codigo: "52835", nombre: "SAN ANDRES DE TUMACO"}
    , { departamento: "Nariño", codigo: "52838", nombre: "TÚQUERRES"}
    , { departamento: "Nariño", codigo: "52885", nombre: "YACUANQUER"}
    , { departamento: "Norte de Santander", codigo: "54001", nombre: "CÚCUTA"}
    , { departamento: "Norte de Santander", codigo: "54003", nombre: "ABREGO"}
    , { departamento: "Norte de Santander", codigo: "54051", nombre: "ARBOLEDAS"}
    , { departamento: "Norte de Santander", codigo: "54099", nombre: "BOCHALEMA"}
    , { departamento: "Norte de Santander", codigo: "54109", nombre: "BUCARASICA"}
    , { departamento: "Norte de Santander", codigo: "54125", nombre: "CÁCOTA"}
    , { departamento: "Norte de Santander", codigo: "54128", nombre: "CACHIRÁ"}
    , { departamento: "Norte de Santander", codigo: "54172", nombre: "CHINÁCOTA"}
    , { departamento: "Norte de Santander", codigo: "54174", nombre: "CHITAGÁ"}
    , { departamento: "Norte de Santander", codigo: "54206", nombre: "CONVENCIÓN"}
    , { departamento: "Norte de Santander", codigo: "54223", nombre: "CUCUTILLA"}
    , { departamento: "Norte de Santander", codigo: "54239", nombre: "DURANIA"}
    , { departamento: "Norte de Santander", codigo: "54245", nombre: "EL CARMEN"}
    , { departamento: "Norte de Santander", codigo: "54250", nombre: "EL TARRA"}
    , { departamento: "Norte de Santander", codigo: "54261", nombre: "EL ZULIA"}
    , { departamento: "Norte de Santander", codigo: "54313", nombre: "GRAMALOTE"}
    , { departamento: "Norte de Santander", codigo: "54344", nombre: "HACARÍ"}
    , { departamento: "Norte de Santander", codigo: "54347", nombre: "HERRÁN"}
    , { departamento: "Norte de Santander", codigo: "54377", nombre: "LABATECA"}
    , { departamento: "Norte de Santander", codigo: "54385", nombre: "LA ESPERANZA"}
    , { departamento: "Norte de Santander", codigo: "54398", nombre: "LA PLAYA"}
    , { departamento: "Norte de Santander", codigo: "54405", nombre: "LOS PATIOS"}
    , { departamento: "Norte de Santander", codigo: "54418", nombre: "LOURDES"}
    , { departamento: "Norte de Santander", codigo: "54480", nombre: "MUTISCUA"}
    , { departamento: "Norte de Santander", codigo: "54498", nombre: "OCAÑA"}
    , { departamento: "Norte de Santander", codigo: "54518", nombre: "PAMPLONA"}
    , { departamento: "Norte de Santander", codigo: "54520", nombre: "PAMPLONITA"}
    , { departamento: "Norte de Santander", codigo: "54553", nombre: "PUERTO SANTANDER"}
    , { departamento: "Norte de Santander", codigo: "54599", nombre: "RAGONVALIA"}
    , { departamento: "Norte de Santander", codigo: "54660", nombre: "SALAZAR"}
    , { departamento: "Norte de Santander", codigo: "54670", nombre: "SAN CALIXTO"}
    , { departamento: "Norte de Santander", codigo: "54673", nombre: "SAN CAYETANO"}
    , { departamento: "Norte de Santander", codigo: "54680", nombre: "SANTIAGO"}
    , { departamento: "Norte de Santander", codigo: "54720", nombre: "SARDINATA"}
    , { departamento: "Norte de Santander", codigo: "54743", nombre: "SILOS"}
    , { departamento: "Norte de Santander", codigo: "54800", nombre: "TEORAMA"}
    , { departamento: "Norte de Santander", codigo: "54810", nombre: "TIBÚ"}
    , { departamento: "Norte de Santander", codigo: "54820", nombre: "TOLEDO"}
    , { departamento: "Norte de Santander", codigo: "54871", nombre: "VILLA CARO"}
    , { departamento: "Norte de Santander", codigo: "54874", nombre: "VILLA DEL ROSARIO"}
    , { departamento: "Putumayo", codigo: "86001", nombre: "MOCOA"}
    , { departamento: "Putumayo", codigo: "86219", nombre: "COLÓN"}
    , { departamento: "Putumayo", codigo: "86320", nombre: "ORITO"}
    , { departamento: "Putumayo", codigo: "86568", nombre: "PUERTO ASÍS"}
    , { departamento: "Putumayo", codigo: "86569", nombre: "PUERTO CAICEDO"}
    , { departamento: "Putumayo", codigo: "86571", nombre: "PUERTO GUZMÁN"}
    , { departamento: "Putumayo", codigo: "86573", nombre: "PUERTO LEGUÍZAMO"}
    , { departamento: "Putumayo", codigo: "86749", nombre: "SIBUNDOY"}
    , { departamento: "Putumayo", codigo: "86755", nombre: "SAN FRANCISCO"}
    , { departamento: "Putumayo", codigo: "86757", nombre: "SAN MIGUEL"}
    , { departamento: "Putumayo", codigo: "86760", nombre: "SANTIAGO"}
    , { departamento: "Putumayo", codigo: "86865", nombre: "VALLE DEL GUAMUEZ"}
    , { departamento: "Putumayo", codigo: "86885", nombre: "VILLAGARZÓN"}
    , { departamento: "Quindio", codigo: "63001", nombre: "ARMENIA"}
    , { departamento: "Quindio", codigo: "63111", nombre: "BUENAVISTA"}
    , { departamento: "Quindio", codigo: "63130", nombre: "CALARCA"}
    , { departamento: "Quindio", codigo: "63190", nombre: "CIRCASIA"}
    , { departamento: "Quindio", codigo: "63212", nombre: "CÓRDOBA"}
    , { departamento: "Quindio", codigo: "63272", nombre: "FILANDIA"}
    , { departamento: "Quindio", codigo: "63302", nombre: "GÉNOVA"}
    , { departamento: "Quindio", codigo: "63401", nombre: "LA TEBAIDA"}
    , { departamento: "Quindio", codigo: "63470", nombre: "MONTENEGRO"}
    , { departamento: "Quindio", codigo: "63548", nombre: "PIJAO"}
    , { departamento: "Quindio", codigo: "63594", nombre: "QUIMBAYA"}
    , { departamento: "Quindio", codigo: "63690", nombre: "SALENTO"}
    , { departamento: "Risaralda", codigo: "66001", nombre: "PEREIRA"}
    , { departamento: "Risaralda", codigo: "66045", nombre: "APÍA"}
    , { departamento: "Risaralda", codigo: "66075", nombre: "BALBOA"}
    , { departamento: "Risaralda", codigo: "66088", nombre: "BELÉN DE UMBRÍA"}
    , { departamento: "Risaralda", codigo: "66170", nombre: "DOSQUEBRADAS"}
    , { departamento: "Risaralda", codigo: "66318", nombre: "GUÁTICA"}
    , { departamento: "Risaralda", codigo: "66383", nombre: "LA CELIA"}
    , { departamento: "Risaralda", codigo: "66400", nombre: "LA VIRGINIA"}
    , { departamento: "Risaralda", codigo: "66440", nombre: "MARSELLA"}
    , { departamento: "Risaralda", codigo: "66456", nombre: "MISTRATÓ"}
    , { departamento: "Risaralda", codigo: "66572", nombre: "PUEBLO RICO"}
    , { departamento: "Risaralda", codigo: "66594", nombre: "QUINCHÍA"}
    , { departamento: "Risaralda", codigo: "66682", nombre: "SANTA ROSA DE CABAL"}
    , { departamento: "Risaralda", codigo: "66687", nombre: "SANTUARIO"}
    , { departamento: "San Andres", codigo: "88001", nombre: "SAN ANDRÉS"}
    , { departamento: "San Andres", codigo: "88564", nombre: "PROVIDENCIA"}
    , { departamento: "Santander", codigo: "68001", nombre: "BUCARAMANGA"}
    , { departamento: "Santander", codigo: "68013", nombre: "AGUADA"}
    , { departamento: "Santander", codigo: "68020", nombre: "ALBANIA"}
    , { departamento: "Santander", codigo: "68051", nombre: "ARATOCA"}
    , { departamento: "Santander", codigo: "68077", nombre: "BARBOSA"}
    , { departamento: "Santander", codigo: "68079", nombre: "BARICHARA"}
    , { departamento: "Santander", codigo: "68081", nombre: "BARRANCABERMEJA"}
    , { departamento: "Santander", codigo: "68092", nombre: "BETULIA"}
    , { departamento: "Santander", codigo: "68101", nombre: "BOLÍVAR"}
    , { departamento: "Santander", codigo: "68121", nombre: "CABRERA"}
    , { departamento: "Santander", codigo: "68132", nombre: "CALIFORNIA"}
    , { departamento: "Santander", codigo: "68147", nombre: "CAPITANEJO"}
    , { departamento: "Santander", codigo: "68152", nombre: "CARCASÍ"}
    , { departamento: "Santander", codigo: "68160", nombre: "CEPITÁ"}
    , { departamento: "Santander", codigo: "68162", nombre: "CERRITO"}
    , { departamento: "Santander", codigo: "68167", nombre: "CHARALÁ"}
    , { departamento: "Santander", codigo: "68169", nombre: "CHARTA"}
    , { departamento: "Santander", codigo: "68176", nombre: "CHIMA"}
    , { departamento: "Santander", codigo: "68179", nombre: "CHIPATÁ"}
    , { departamento: "Santander", codigo: "68190", nombre: "CIMITARRA"}
    , { departamento: "Santander", codigo: "68207", nombre: "CONCEPCIÓN"}
    , { departamento: "Santander", codigo: "68209", nombre: "CONFINES"}
    , { departamento: "Santander", codigo: "68211", nombre: "CONTRATACIÓN"}
    , { departamento: "Santander", codigo: "68217", nombre: "COROMORO"}
    , { departamento: "Santander", codigo: "68229", nombre: "CURITÍ"}
    , { departamento: "Santander", codigo: "68235", nombre: "EL CARMEN DE CHUCURÍ"}
    , { departamento: "Santander", codigo: "68245", nombre: "EL GUACAMAYO"}
    , { departamento: "Santander", codigo: "68250", nombre: "EL PEÑÓN"}
    , { departamento: "Santander", codigo: "68255", nombre: "EL PLAYÓN"}
    , { departamento: "Santander", codigo: "68264", nombre: "ENCINO"}
    , { departamento: "Santander", codigo: "68266", nombre: "ENCISO"}
    , { departamento: "Santander", codigo: "68271", nombre: "FLORIÁN"}
    , { departamento: "Santander", codigo: "68276", nombre: "FLORIDABLANCA"}
    , { departamento: "Santander", codigo: "68296", nombre: "GALÁN"}
    , { departamento: "Santander", codigo: "68298", nombre: "GAMBITA"}
    , { departamento: "Santander", codigo: "68307", nombre: "GIRÓN"}
    , { departamento: "Santander", codigo: "68318", nombre: "GUACA"}
    , { departamento: "Santander", codigo: "68320", nombre: "GUADALUPE"}
    , { departamento: "Santander", codigo: "68322", nombre: "GUAPOTÁ"}
    , { departamento: "Santander", codigo: "68324", nombre: "GUAVATÁ"}
    , { departamento: "Santander", codigo: "68327", nombre: "GÜEPSA"}
    , { departamento: "Santander", codigo: "68344", nombre: "HATO"}
    , { departamento: "Santander", codigo: "68368", nombre: "JESÚS MARÍA"}
    , { departamento: "Santander", codigo: "68370", nombre: "JORDÁN"}
    , { departamento: "Santander", codigo: "68377", nombre: "LA BELLEZA"}
    , { departamento: "Santander", codigo: "68385", nombre: "LANDÁZURI"}
    , { departamento: "Santander", codigo: "68397", nombre: "LA PAZ"}
    , { departamento: "Santander", codigo: "68406", nombre: "LEBRIJA"}
    , { departamento: "Santander", codigo: "68418", nombre: "LOS SANTOS"}
    , { departamento: "Santander", codigo: "68425", nombre: "MACARAVITA"}
    , { departamento: "Santander", codigo: "68432", nombre: "MÁLAGA"}
    , { departamento: "Santander", codigo: "68444", nombre: "MATANZA"}
    , { departamento: "Santander", codigo: "68464", nombre: "MOGOTES"}
    , { departamento: "Santander", codigo: "68468", nombre: "MOLAGAVITA"}
    , { departamento: "Santander", codigo: "68498", nombre: "OCAMONTE"}
    , { departamento: "Santander", codigo: "68500", nombre: "OIBA"}
    , { departamento: "Santander", codigo: "68502", nombre: "ONZAGA"}
    , { departamento: "Santander", codigo: "68522", nombre: "PALMAR"}
    , { departamento: "Santander", codigo: "68524", nombre: "PALMAS DEL SOCORRO"}
    , { departamento: "Santander", codigo: "68533", nombre: "PÁRAMO"}
    , { departamento: "Santander", codigo: "68547", nombre: "PIEDECUESTA"}
    , { departamento: "Santander", codigo: "68549", nombre: "PINCHOTE"}
    , { departamento: "Santander", codigo: "68572", nombre: "PUENTE NACIONAL"}
    , { departamento: "Santander", codigo: "68573", nombre: "PUERTO PARRA"}
    , { departamento: "Santander", codigo: "68575", nombre: "PUERTO WILCHES"}
    , { departamento: "Santander", codigo: "68615", nombre: "RIONEGRO"}
    , { departamento: "Santander", codigo: "68655", nombre: "SABANA DE TORRES"}
    , { departamento: "Santander", codigo: "68669", nombre: "SAN ANDRÉS"}
    , { departamento: "Santander", codigo: "68673", nombre: "SAN BENITO"}
    , { departamento: "Santander", codigo: "68679", nombre: "SAN GIL"}
    , { departamento: "Santander", codigo: "68682", nombre: "SAN JOAQUÍN"}
    , { departamento: "Santander", codigo: "68684", nombre: "SAN JOSÉ DE MIRANDA"}
    , { departamento: "Santander", codigo: "68686", nombre: "SAN MIGUEL"}
    , { departamento: "Santander", codigo: "68689", nombre: "SAN VICENTE DE CHUCURÍ"}
    , { departamento: "Santander", codigo: "68705", nombre: "SANTA BÁRBARA"}
    , { departamento: "Santander", codigo: "68720", nombre: "SANTA HELENA DEL OPÓN"}
    , { departamento: "Santander", codigo: "68745", nombre: "SIMACOTA"}
    , { departamento: "Santander", codigo: "68755", nombre: "SOCORRO"}
    , { departamento: "Santander", codigo: "68770", nombre: "SUAITA"}
    , { departamento: "Santander", codigo: "68773", nombre: "SUCRE"}
    , { departamento: "Santander", codigo: "68780", nombre: "SURATÁ"}
    , { departamento: "Santander", codigo: "68820", nombre: "TONA"}
    , { departamento: "Santander", codigo: "68855", nombre: "VALLE DE SAN JOSÉ"}
    , { departamento: "Santander", codigo: "68861", nombre: "VÉLEZ"}
    , { departamento: "Santander", codigo: "68867", nombre: "VETAS"}
    , { departamento: "Santander", codigo: "68872", nombre: "VILLANUEVA"}
    , { departamento: "Santander", codigo: "68895", nombre: "ZAPATOCA"}
    , { departamento: "Sucre", codigo: "70001", nombre: "SINCELEJO"}
    , { departamento: "Sucre", codigo: "70110", nombre: "BUENAVISTA"}
    , { departamento: "Sucre", codigo: "70124", nombre: "CAIMITO"}
    , { departamento: "Sucre", codigo: "70204", nombre: "COLOSO"}
    , { departamento: "Sucre", codigo: "70215", nombre: "COROZAL"}
    , { departamento: "Sucre", codigo: "70221", nombre: "COVEÑAS"}
    , { departamento: "Sucre", codigo: "70230", nombre: "CHALÁN"}
    , { departamento: "Sucre", codigo: "70233", nombre: "EL ROBLE"}
    , { departamento: "Sucre", codigo: "70235", nombre: "GALERAS"}
    , { departamento: "Sucre", codigo: "70265", nombre: "GUARANDA"}
    , { departamento: "Sucre", codigo: "70400", nombre: "LA UNIÓN"}
    , { departamento: "Sucre", codigo: "70418", nombre: "LOS PALMITOS"}
    , { departamento: "Sucre", codigo: "70429", nombre: "MAJAGUAL"}
    , { departamento: "Sucre", codigo: "70473", nombre: "MORROA"}
    , { departamento: "Sucre", codigo: "70508", nombre: "OVEJAS"}
    , { departamento: "Sucre", codigo: "70523", nombre: "PALMITO"}
    , { departamento: "Sucre", codigo: "70670", nombre: "SAMPUÉS"}
    , { departamento: "Sucre", codigo: "70678", nombre: "SAN BENITO ABAD"}
    , { departamento: "Sucre", codigo: "70702", nombre: "SAN JUAN DE BETULIA"}
    , { departamento: "Sucre", codigo: "70708", nombre: "SAN MARCOS"}
    , { departamento: "Sucre", codigo: "70713", nombre: "SAN ONOFRE"}
    , { departamento: "Sucre", codigo: "70717", nombre: "SAN PEDRO"}
    , { departamento: "Sucre", codigo: "70742", nombre: "SAN LUIS DE SINCÉ"}
    , { departamento: "Sucre", codigo: "70771", nombre: "SUCRE"}
    , { departamento: "Sucre", codigo: "70820", nombre: "SANTIAGO DE TOLÚ"}
    , { departamento: "Sucre", codigo: "70823", nombre: "TOLÚ VIEJO"}
    , { departamento: "Tolima", codigo: "73001", nombre: "IBAGUÉ"}
    , { departamento: "Tolima", codigo: "73024", nombre: "ALPUJARRA"}
    , { departamento: "Tolima", codigo: "73026", nombre: "ALVARADO"}
    , { departamento: "Tolima", codigo: "73030", nombre: "AMBALEMA"}
    , { departamento: "Tolima", codigo: "73043", nombre: "ANZOÁTEGUI"}
    , { departamento: "Tolima", codigo: "73055", nombre: "ARMERO"}
    , { departamento: "Tolima", codigo: "73067", nombre: "ATACO"}
    , { departamento: "Tolima", codigo: "73124", nombre: "CAJAMARCA"}
    , { departamento: "Tolima", codigo: "73148", nombre: "CARMEN DE APICALÁ"}
    , { departamento: "Tolima", codigo: "73152", nombre: "CASABIANCA"}
    , { departamento: "Tolima", codigo: "73168", nombre: "CHAPARRAL"}
    , { departamento: "Tolima", codigo: "73200", nombre: "COELLO"}
    , { departamento: "Tolima", codigo: "73217", nombre: "COYAIMA"}
    , { departamento: "Tolima", codigo: "73226", nombre: "CUNDAY"}
    , { departamento: "Tolima", codigo: "73236", nombre: "DOLORES"}
    , { departamento: "Tolima", codigo: "73268", nombre: "ESPINAL"}
    , { departamento: "Tolima", codigo: "73270", nombre: "FALAN"}
    , { departamento: "Tolima", codigo: "73275", nombre: "FLANDES"}
    , { departamento: "Tolima", codigo: "73283", nombre: "FRESNO"}
    , { departamento: "Tolima", codigo: "73319", nombre: "GUAMO"}
    , { departamento: "Tolima", codigo: "73347", nombre: "HERVEO"}
    , { departamento: "Tolima", codigo: "73349", nombre: "HONDA"}
    , { departamento: "Tolima", codigo: "73352", nombre: "ICONONZO"}
    , { departamento: "Tolima", codigo: "73408", nombre: "LÉRIDA"}
    , { departamento: "Tolima", codigo: "73411", nombre: "LÍBANO"}
    , { departamento: "Tolima", codigo: "73443", nombre: "SAN SEBASTIÁN DE MARIQUITA"}
    , { departamento: "Tolima", codigo: "73449", nombre: "MELGAR"}
    , { departamento: "Tolima", codigo: "73461", nombre: "MURILLO"}
    , { departamento: "Tolima", codigo: "73483", nombre: "NATAGAIMA"}
    , { departamento: "Tolima", codigo: "73504", nombre: "ORTEGA"}
    , { departamento: "Tolima", codigo: "73520", nombre: "PALOCABILDO"}
    , { departamento: "Tolima", codigo: "73547", nombre: "PIEDRAS"}
    , { departamento: "Tolima", codigo: "73555", nombre: "PLANADAS"}
    , { departamento: "Tolima", codigo: "73563", nombre: "PRADO"}
    , { departamento: "Tolima", codigo: "73585", nombre: "PURIFICACIÓN"}
    , { departamento: "Tolima", codigo: "73616", nombre: "RIOBLANCO"}
    , { departamento: "Tolima", codigo: "73622", nombre: "RONCESVALLES"}
    , { departamento: "Tolima", codigo: "73624", nombre: "ROVIRA"}
    , { departamento: "Tolima", codigo: "73671", nombre: "SALDAÑA"}
    , { departamento: "Tolima", codigo: "73675", nombre: "SAN ANTONIO"}
    , { departamento: "Tolima", codigo: "73678", nombre: "SAN LUIS"}
    , { departamento: "Tolima", codigo: "73686", nombre: "SANTA ISABEL"}
    , { departamento: "Tolima", codigo: "73770", nombre: "SUÁREZ"}
    , { departamento: "Tolima", codigo: "73854", nombre: "VALLE DE SAN JUAN"}
    , { departamento: "Tolima", codigo: "73861", nombre: "VENADILLO"}
    , { departamento: "Tolima", codigo: "73870", nombre: "VILLAHERMOSA"}
    , { departamento: "Tolima", codigo: "73873", nombre: "VILLARRICA"}
    , { departamento: "Valle", codigo: "76001", nombre: "CALI"}
    , { departamento: "Valle", codigo: "76020", nombre: "ALCALÁ"}
    , { departamento: "Valle", codigo: "76036", nombre: "ANDALUCÍA"}
    , { departamento: "Valle", codigo: "76041", nombre: "ANSERMANUEVO"}
    , { departamento: "Valle", codigo: "76054", nombre: "ARGELIA"}
    , { departamento: "Valle", codigo: "76100", nombre: "BOLÍVAR"}
    , { departamento: "Valle", codigo: "76109", nombre: "BUENAVENTURA"}
    , { departamento: "Valle", codigo: "76111", nombre: "GUADALAJARA DE BUGA"}
    , { departamento: "Valle", codigo: "76113", nombre: "BUGALAGRANDE"}
    , { departamento: "Valle", codigo: "76122", nombre: "CAICEDONIA"}
    , { departamento: "Valle", codigo: "76126", nombre: "CALIMA"}
    , { departamento: "Valle", codigo: "76130", nombre: "CANDELARIA"}
    , { departamento: "Valle", codigo: "76147", nombre: "CARTAGO"}
    , { departamento: "Valle", codigo: "76233", nombre: "DAGUA"}
    , { departamento: "Valle", codigo: "76243", nombre: "EL ÁGUILA"}
    , { departamento: "Valle", codigo: "76246", nombre: "EL CAIRO"}
    , { departamento: "Valle", codigo: "76248", nombre: "EL CERRITO"}
    , { departamento: "Valle", codigo: "76250", nombre: "EL DOVIO"}
    , { departamento: "Valle", codigo: "76275", nombre: "FLORIDA"}
    , { departamento: "Valle", codigo: "76306", nombre: "GINEBRA"}
    , { departamento: "Valle", codigo: "76318", nombre: "GUACARÍ"}
    , { departamento: "Valle", codigo: "76364", nombre: "JAMUNDÍ"}
    , { departamento: "Valle", codigo: "76377", nombre: "LA CUMBRE"}
    , { departamento: "Valle", codigo: "76400", nombre: "LA UNIÓN"}
    , { departamento: "Valle", codigo: "76403", nombre: "LA VICTORIA"}
    , { departamento: "Valle", codigo: "76497", nombre: "OBANDO"}
    , { departamento: "Valle", codigo: "76520", nombre: "PALMIRA"}
    , { departamento: "Valle", codigo: "76563", nombre: "PRADERA"}
    , { departamento: "Valle", codigo: "76606", nombre: "RESTREPO"}
    , { departamento: "Valle", codigo: "76616", nombre: "RIOFRÍO"}
    , { departamento: "Valle", codigo: "76622", nombre: "ROLDANILLO"}
    , { departamento: "Valle", codigo: "76670", nombre: "SAN PEDRO"}
    , { departamento: "Valle", codigo: "76736", nombre: "SEVILLA"}
    , { departamento: "Valle", codigo: "76823", nombre: "TORO"}
    , { departamento: "Valle", codigo: "76828", nombre: "TRUJILLO"}
    , { departamento: "Valle", codigo: "76834", nombre: "TULUÁ"}
    , { departamento: "Valle", codigo: "76845", nombre: "ULLOA"}
    , { departamento: "Valle", codigo: "76863", nombre: "VERSALLES"}
    , { departamento: "Valle", codigo: "76869", nombre: "VIJES"}
    , { departamento: "Valle", codigo: "76890", nombre: "YOTOCO"}
    , { departamento: "Valle", codigo: "76892", nombre: "YUMBO"}
    , { departamento: "Valle", codigo: "76895", nombre: "ZARZAL"}
    , { departamento: "Vaupes", codigo: "97001", nombre: "MITÚ"}
    , { departamento: "Vaupes", codigo: "97161", nombre: "CARURU"}
    , { departamento: "Vaupes", codigo: "97511", nombre: "PACOA"}
    , { departamento: "Vaupes", codigo: "97666", nombre: "TARAIRA"}
    , { departamento: "Vaupes", codigo: "97777", nombre: "PAPUNAUA"}
    , { departamento: "Vaupes", codigo: "97889", nombre: "YAVARATÉ"}
    , { departamento: "Vichada", codigo: "99001", nombre: "PUERTO CARREÑO"}
    , { departamento: "Vichada", codigo: "99524", nombre: "LA PRIMAVERA"}
    , { departamento: "Vichada", codigo: "99624", nombre: "SANTA ROSALÍA"}
    , { departamento: "Vichada", codigo: "99773", nombre: "CUMARIBO"}
]
export { municipios };
