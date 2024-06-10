/*==============================================================*/
/* DBMS name:      ORACLE Version 19c                           */
/* Created on:     07/06/2024 18:24:52                          */
/*==============================================================*/


/*==============================================================*/
/* Table: CENTROS                                               */
/*==============================================================*/
create table CENTROS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_RED               CHAR(2)               not null,
   DESCRIPCION_CENTRO   VARCHAR2(200),
   COD_CENTROSGH        INTEGER,
   DESCRIPCIONSGH       VARCHAR2(200),
   NIVEL                VARCHAR2(50),
   TIPO_NIVEL           INTEGER,
   DESCRIPCION_NIVEL    VARCHAR2(50),
   CODIGO_RENIPRESS     VARCHAR2(8),
   OFERTA               VARCHAR2(500),
   TIPO_OFERTA_EXTRAINST VARCHAR2(500),
   NIVEL_TMI            VARCHAR2(50),
   COD_CENTRO_SAP       VARCHAR2(10),
   DEPARTAMENTO         VARCHAR2(50),
   LATITUD              NUMBER(18,8),
   LONGITUD             NUMBER(18,8),
   UBIGEO               VARCHAR2(6),
   ACTIVO               INTEGER,
   constraint PK_CENTROS primary key (ID_CENTRO)
);

/*==============================================================*/
/* Index: CUENTA___CON_FK                                       */
/*==============================================================*/
create index CENTROS_ID_RED on CENTROS (
   ID_RED ASC
);

/*==============================================================*/
/* Table: CENTROS_EQUIPAMIENTOS                                 */
/*==============================================================*/
create table CENTROS_EQUIPAMIENTOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_EQUIPAMIENTO      VARCHAR2(10)               not null,
   COSTO_UNITARIO       NUMBER(13,4),
   constraint PK_CENTROS_EQUIPAMIENTOS primary key (ID_CENTRO, ID_EQUIPAMIENTO)
);

/*==============================================================*/
/* Index: __RELACIONA___FK                                      */
/*==============================================================*/
create index CENTROS_ID_EQUIP on CENTROS_EQUIPAMIENTOS (
   ID_EQUIPAMIENTO ASC
);

/*==============================================================*/
/* Index: _RELACIONA_FK                                         */
/*==============================================================*/
create index CENTROS_ID_CENTRO on CENTROS_EQUIPAMIENTOS (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Table: CENTROS_EQUIP_ADICION                                 */
/*==============================================================*/
create table CENTROS_EQUIP_ADICION (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_EQUIP_ADIC    VARCHAR2(10)               not null,
   PRECIO_UNITARIO_DOLARES NUMBER(13,4),
   PRECIO_UNITARIO_SOLES NUMBER(13,4),
   VIDA_UTIL_ANIOS      INTEGER,
   MESES_POR_ANIO       INTEGER,
   DIAS_POR_MES         INTEGER,
   HORAS_POR_DIA        INTEGER,
   MINUTOS_POR_HORA     INTEGER,
   VIDA_UTIL_MINUTOS    INTEGER,
   TAZA_UTIL            NUMBER(13,4),
   MINUTOS_UTIL         INTEGER,
   COSTO_POR_MINUTO     NUMBER(13,4),
   ANIO                 INTEGER,
   constraint PK_CENTROS_EQUIP_ADICION primary key (ID_EQUIP_ADIC, ID_CENTRO)
);

/*==============================================================*/
/* Index: _SE_VINCULA__FK                                       */
/*==============================================================*/
create index CENTROS_EQ_ADIC_IDCENTRO on CENTROS_EQUIP_ADICION (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: _VINCULA____FK                                        */
/*==============================================================*/
create index CENTROS_ID_EQUIP2 on CENTROS_EQUIP_ADICION (
   ID_EQUIP_ADIC ASC
);

/*==============================================================*/
/* Table: CENTROS_INSUMOS_MEDICOS                               */
/*==============================================================*/
create table CENTROS_INSUMOS_MEDICOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_INSUMO            CHAR(10)               not null,
   PRECIO_UNITARIO      NUMBER(13,4),
   CANTIDAD_PRESENTACION NUMBER(13,4),
   UNIDAD_MEDIDA        VARCHAR2(10),
   COSTO_UNITARIO       NUMBER(13,4),
   ANIO                 INTEGER,
   constraint PK_CENTROS_INSUMOS_MEDICOS primary key (ID_INSUMO, ID_CENTRO)
);

/*==============================================================*/
/* Index: VINCULA_____FK                                        */
/*==============================================================*/
create index INSUMOS_MEDICOS_IDCENTRO on CENTROS_INSUMOS_MEDICOS (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: _INSUMOS_CENTROS_FK                                   */
/*==============================================================*/
create index INSUMOS_CENTROS_IDINSUMO on CENTROS_INSUMOS_MEDICOS (
   ID_INSUMO ASC
);

/*==============================================================*/
/* Table: CENTROS_RECURSOS_HUMANOS                              */
/*==============================================================*/
create table CENTROS_RECURSOS_HUMANOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_GRUPO_OCUPACIONAL CHAR(8)               not null,
   VALORIZACION_PRINCIPAL NUMBER(13,4),
   BONO_JEFE_DEPARTAMENTO NUMBER(13,4),
   BONO_JEFE_ESTABLECIMIENTO NUMBER(13,4),
   BONO_PUESTO_SERVICIOS NUMBER(13,4),
   BONO_PUESTO_ESPECIFICO NUMBER(13,4),
   ZONA_ALEJADA         NUMBER(13,4),
   ZONA_EMERGENCIA      NUMBER(13,4),
   ATENCION_PRIMARIA    NUMBER(13,4),
   ATENCION_ESPECIALIZADA NUMBER(13,4),
   SERVICIOS_CRITICOS   NUMBER(13,4),
   SUBTOTAL_COMPENSACION NUMBER(13,4),
   GUARDIA_DIURNA       NUMBER(13,4),
   GUARDIA_NOCTURNA     NUMBER(13,4),
   GUARDIA_DIURNA_FERIADOS NUMBER(13,4),
   GUARDIA_NOCTURNA_FERIADOS NUMBER(13,4),
   SUBTOTAL_GUARDIAS    NUMBER(13,4),
   BONO_ESCOLARIDAD     NUMBER(13,4),
   BONO_PATRIAS         NUMBER(13,4),
   BONO_NAVIDAD         NUMBER(13,4),
   ESSALUD              NUMBER(13,4),
   SCTR                 NUMBER(13,4),
   SUBTOTAL_BONOS       NUMBER(13,4),
   TOTAL_ANUAL_SIN_GUARDIA NUMBER(13,4),
   TOTAL_ANUAL_CON_GUARDIA NUMBER(13,4),
   PROMEDIO_MENSUAL_SIN_GUARDIA NUMBER(13,4),
   PROMEDIO_MENSUAL_CON_GUARDIA NUMBER(13,4),
   JORNADA_MENSUAL_MINUTOS NUMBER(13,4),
   COSTO_POR_MINUTO_SIN_GUARDIA NUMBER(13,4),
   COSTO_POR_MINUTO_CON_GUARDIA NUMBER(13,4),
   ANIO                 INTEGER,
   constraint PK_CENTROS_RECURSOS_HUMANOS primary key (ID_GRUPO_OCUPACIONAL, ID_CENTRO)
);

/*==============================================================*/
/* Index: __RELACIONA_FK                                        */
/*==============================================================*/
create index RRHH_IDCENTRO on CENTROS_RECURSOS_HUMANOS (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: _RELACION___FK                                        */
/*==============================================================*/
create index CENTROS_RRHH_GRUPOOCUP on CENTROS_RECURSOS_HUMANOS (
   ID_GRUPO_OCUPACIONAL ASC
);

/*==============================================================*/
/* Table: CENTROS_SERVICIOS_BASICOS                             */
/*==============================================================*/
create table CENTROS_SERVICIOS_BASICOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_SERVICIO_BASICO   VARCHAR2(10)                not null,
   GASTO_ANUAL          NUMBER(13,4),
   ANIO                 INTEGER,
   constraint PK_CENTROS_SERVICIOS_BASICOS primary key (ID_CENTRO, ID_SERVICIO_BASICO)
);

/*==============================================================*/
/* Index: ____RELAICONA_FK                                      */
/*==============================================================*/
create index CENTROS_IDSSB on CENTROS_SERVICIOS_BASICOS (
   ID_SERVICIO_BASICO ASC
);

/*==============================================================*/
/* Index: _RELACIONA___FK                                       */
/*==============================================================*/
create index SSB_IDCENTRO on CENTROS_SERVICIOS_BASICOS (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Table: CENTROS_SERVICIO_GNRALYADMINS                         */
/*==============================================================*/
create table CENTROS_SERVICIO_GNRALYADMINS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_SERVICIO_GENYADMIN VARCHAR2(10)               not null,
   GASTO_ANUAL          NUMBER(13,4),
   ANIO                 INTEGER,
   constraint PK_CENTROS_SERVICIO_GNRALYADMI primary key (ID_CENTRO, ID_SERVICIO_GENYADMIN)
);

/*==============================================================*/
/* Index: __VINCULA__FK                                         */
/*==============================================================*/
create index CENTROS_IDSSGYA on CENTROS_SERVICIO_GNRALYADMINS (
   ID_SERVICIO_GENYADMIN ASC
);

/*==============================================================*/
/* Index: _VINCULA__FK                                          */
/*==============================================================*/
create index SSGYA_IDCENTRO on CENTROS_SERVICIO_GNRALYADMINS (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Table: CENTRO_UPS                                            */
/*==============================================================*/
create table CENTRO_UPS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   AREA_NI              NUMBER(13,4),
   AREA_NII             NUMBER(13,4),
   AREA_NIII            NUMBER(13,4),
   AREA                 NUMBER(13,4),
   TOTAL_PRODUCCION_ANUAL NUMBER(13,4),
   VALOR_UNIT_PROM_NI   NUMBER(13,4),
   VALOR_UNIT_PROM_NII  NUMBER(13,4),
   VALOR_UNIT_PROM_NIII NUMBER(13,4),
   VALOR_UNIT_PROM      NUMBER(13,4),
   COSTO_COSTRUCCION_INFRA_NI NUMBER(13,4),
   COSTO_COSTRUCCION_INFRA_NII NUMBER(13,4),
   COSTO_COSTRUCCION_INFRA_NIII NUMBER(13,4),
   COSTO_COSTRUCCION_INFRA NUMBER(13,4),
   VIDA_UTIL_ANIOS_INFRA NUMBER(13,4),
   MESES_POR_ANIO_INFRA NUMBER(13,4),
   DIAS_POR_MES_INFRA   NUMBER(13,4),
   HORAS_POR_DIA_INFRA  NUMBER(13,4),
   MIN_POR_HORA_INFRA   NUMBER(13,4),
   VIDA_UTIL_MIN_INFRA  NUMBER(13,4),
   TAZA_UTIL_INFRA      NUMBER(13,4),
   MIN_UTIL_INFRA       NUMBER(13,4),
   COSTO_TOTAL_INFRA_MIN_NI NUMBER(13,4),
   COSTO_TOTAL_INFRA_MIN_NII NUMBER(13,4),
   COSTO_TOTAL_INFRA_MIN_NIII NUMBER(13,4),
   COSTO_TOTAL_INFRA_MIN NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_BAS_NI NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_BAS_NII NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_BAS_NIII NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_BAS NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_AYG_NI NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_AYG_NII NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_AYG_NIII NUMBER(13,4),
   COSTO_TOTAL_UPS_SERV_AYG NUMBER(13,4),
   COSTO_TOTAL_EQUIP_MAYOR NUMBER(13,4),
   VIDA_UTIL_ANIOS_EQUIP_MAYOR NUMBER(13,4),
   MESES_POR_ANIO_EQUIP_MAYOR NUMBER(13,4),
   DIAS_POR_MES_EQUIP_MAYOR NUMBER(13,4),
   HORAS_POR_DIA_EQUIP_MAYOR NUMBER(13,4),
   MIN_POR_HORA_EQUIP_MAYOR NUMBER(13,4),
   VIDA_UTIL_MIN_EQUIP_MAYOR NUMBER(13,4),
   TAZA_UTIL_EQUIP_MAYOR NUMBER(13,4),
   MIN_UTIL_EQUIP_MAYOR NUMBER(13,4),
   COSTO_TOTAL_EQUIP_MENOR NUMBER(13,4),
   VIDA_UTIL_ANIOS_EQUIP_MENOR NUMBER(13,4),
   MESES_POR_ANIO_EQUIP_MENOR NUMBER(13,4),
   DIAS_POR_MES_EQUIP_MENOR NUMBER(13,4),
   HORAS_POR_DIA_EQUIP_MENOR NUMBER(13,4),
   MIN_POR_HORA_EQUIP_MENOR NUMBER(13,4),
   VIDA_UTIL_MIN_EQUIP_MENOR NUMBER(13,4),
   TAZA_UTIL_EQUIP_MENOR NUMBER(13,4),
   MIN_UTIL_EQUIP_MENOR NUMBER(13,4),
   COSTO_TOTAL_EQUIP_INFORM NUMBER(13,4),
   VIDA_UTIL_ANIOS_EQUIP_INFORM NUMBER(13,4),
   MESES_POR_ANIO_EQUIP_INFORM NUMBER(13,4),
   DIAS_POR_MES_EQUIP_INFORM NUMBER(13,4),
   HORAS_POR_DIA_EQUIP_INFORM NUMBER(13,4),
   MIN_POR_HORA_EQUIP_INFORM NUMBER(13,4),
   VIDA_UTIL_MIN_EQUIP_INFORM NUMBER(13,4),
   TAZA_UTIL_EQUIP_INFORM NUMBER(13,4),
   MIN_UTIL_EQUIP_INFORM NUMBER(13,4),
   COSTO_TOTAL_EQUIP_POR_MIN NUMBER(13,4),
   constraint PK_CENTRO_UPS primary key (ID_UPS, ID_CENTRO)
);

/*==============================================================*/
/* Index: CENTRO_UPS_FK                                         */
/*==============================================================*/
create index UPS_IDCENTRO on CENTRO_UPS (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: __CUENTA_CON_FK                                       */
/*==============================================================*/
create index CENTRO_IDUPS on CENTRO_UPS (
   ID_UPS ASC
);

/*==============================================================*/
/* Table: DETALLE_COSTO_ESTANDAR                                */
/*==============================================================*/
create table DETALLE_COSTO_ESTANDAR (
   ID_REGISTRO_COSTEO_ESTANDAR INTEGER               not null,
   ID_CENTRO            VARCHAR2(6),
   NOMBRE_CENTRO        VARCHAR2(200),
   ID_PROCEDIMIENTO_MEDICO VARCHAR2(15),
   NOMBRE_PMS           VARCHAR2(1000),
   UNIDAD_PRODUCTORA_SERVICIOS VARCHAR2(100),
   TIEMPO_MAXIMO_RECURSOS_HUMANOS INTEGER,
   COSTO_TOTAL_RRHH     NUMBER(13,4),
   SUBTOTAL_EQUIPAMIENTO NUMBER(13,4),
   COSTO_TOTAL_EQUIPAMIENTO NUMBER(13,4),
   SUBTOTAL_COSTO_EQUIP_ADIC NUMBER(13,4),
   COSTO_TOTAL_EQUIPA_ADIC NUMBER(13,4),
   SUBTOTAL_COSTO_INFRA NUMBER(13,4),
   COSTO_TOTAL_INFRA    NUMBER(13,4),
   COSTO_TOTAL_INSUMOS  NUMBER(13,4),
   COSTO_TOTAL_SERV_BASICOS NUMBER(13,4),
   COSTO_TOTAL_SERV_GENYADMINS NUMBER(13,4),
   COSTO_ESTANDAR_TOTAL NUMBER(13,4),
   ANIO                 INTEGER,
   constraint PK_DETALLE_COSTO_ESTANDAR primary key (ID_REGISTRO_COSTEO_ESTANDAR)
);

/*==============================================================*/
/* Table: EQUIPAMIENTOS                                         */
/*==============================================================*/
create table EQUIPAMIENTOS (
   ID_EQUIPAMIENTO      VARCHAR2(10)               not null,
   ID_TIPO_EQUIPAMIENTO INTEGER               not null,
   NOMBRE               VARCHAR2(250),
   constraint PK_EQUIPAMIENTOS primary key (ID_EQUIPAMIENTO)
);

/*==============================================================*/
/* Index: PERTENECE_A_FK                                        */
/*==============================================================*/
create index EQUIP_IDTIPOEQUIP on EQUIPAMIENTOS (
   ID_TIPO_EQUIPAMIENTO ASC
);

/*==============================================================*/
/* Table: EQUIPAMIENTOS_ADICIONALES                             */
/*==============================================================*/
create table EQUIPAMIENTOS_ADICIONALES (
   ID_EQUIP_ADIC    VARCHAR2(10)               not null,
   NOMBRE               VARCHAR2(250),
   constraint PK_EQUIPAMIENTOS_ADICIONALES primary key (ID_EQUIP_ADIC)
);

/*==============================================================*/
/* Table: GRUPOS_OCUPACIONALES                                  */
/*==============================================================*/
create table GRUPOS_OCUPACIONALES (
   ID_GRUPO_OCUPACIONAL CHAR(8)               not null,
   DESCRIPCION          VARCHAR2(100),
   constraint PK_GRUPOS_OCUPACIONALES primary key (ID_GRUPO_OCUPACIONAL)
);

/*==============================================================*/
/* Table: INSUMOS_MEDICOS                                       */
/*==============================================================*/
create table INSUMOS_MEDICOS (
   ID_INSUMO            CHAR(10)               not null,
   NOMBRE               VARCHAR2(200),
   constraint PK_INSUMOS_MEDICOS primary key (ID_INSUMO)
);

/*==============================================================*/
/* Table: INVERSIONES_INFRAESTRUCTURA                           */
/*==============================================================*/
create table INVERSIONES_INFRAESTRUCTURA (
   CODIGO_UNICO         INTEGER               not null,
   ID_CENTRO            VARCHAR2(6)               not null,
   CODIGO_SNIP          INTEGER,
   NOMBRE_INVERSION     VARCHAR2(200),
   NIVEL_DE_ATENCION    VARCHAR2(15),
   ESTABLECIMIENTO      VARCHAR2(200),
   MONTO_VIABLE         NUMBER(13,4),
   FUNCION              VARCHAR2(80),
   PROGRAMA             VARCHAR2(80),
   SECTOR               VARCHAR2(80),
   ENTIDAD              VARCHAR2(80),
   UNIDAD_FORMULADORA   VARCHAR2(80),
   UNIDAD_EJECUTORA     VARCHAR2(80),
   FECHA_REGISTRO       DATE,
   TIPO_FORMATO         VARCHAR2(80),
   DEPARTAMENTO         VARCHAR2(100),
   TAMANIO_INFRA        NUMBER(13,4),
   COSTO_CONTRUCCION_INFRA NUMBER(13,4),
   VALOR_UNITARIO_INFRA NUMBER(13,4),
   ANIO_REGISTRO        INTEGER,
   constraint PK_INVERSIONES_INFRAESTRUCTURA primary key (CODIGO_UNICO)
);

/*==============================================================*/
/* Index: CUENTAN_CON____FK                                     */
/*==============================================================*/
create index INV_INFRA_IDCENTRO on INVERSIONES_INFRAESTRUCTURA (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Table: KITS_INSUMOS_MEDICOS                                  */
/*==============================================================*/
create table KITS_INSUMOS_MEDICOS (
   ID_KIT               VARCHAR2(10)                not null,
   ID_INSUMO            CHAR(10)               not null,
   CANTIDAD_USO         NUMBER(13,4),
   constraint PK_KITS_INSUMOS_MEDICOS primary key (ID_INSUMO, ID_KIT)
);

/*==============================================================*/
/* Index: CONTIENE2_FK                                          */
/*==============================================================*/
create index INSUMOS_IDKIT on KITS_INSUMOS_MEDICOS (
   ID_KIT ASC
);

/*==============================================================*/
/* Index: CONTIENE_FK                                           */
/*==============================================================*/
create index KIT_IDINSUMO on KITS_INSUMOS_MEDICOS (
   ID_INSUMO ASC
);

/*==============================================================*/
/* Table: KITS_MEDICOS                                          */
/*==============================================================*/
create table KITS_MEDICOS (
   ID_KIT               VARCHAR2(10)               not null,
   NOMBRE               VARCHAR2(200),
   constraint PK_KITS_MEDICOS primary key (ID_KIT)
);

/*==============================================================*/
/* Table: MENU                                                  */
/*==============================================================*/
create table MENU (
   ID_MENU              INTEGER               not null,
   PADRE                INTEGER,
   DESCRIPCION_MENU     VARCHAR2(500),
   IDUSUARIO_CREA       INTEGER,
   IDUSUARIO_MODIFICA   INTEGER,
   FECHA_CREA           DATE,
   FECHA_MODIFICA       DATE,
   BORRADO              CHAR(1),
   COD_MENU             VARCHAR2(100),
   LINK_MENU            VARCHAR2(500),
   ORDEN                VARCHAR2(10),
   constraint PK_MENU primary key (ID_MENU)
);

/*==============================================================*/
/* Index: TIENE_COMO_HIJO_FK                                    */
/*==============================================================*/
create index TIENE_COMO_HIJO on MENU (
   PADRE ASC
);

/*==============================================================*/
/* Table: PERMISOS                                              */
/*==============================================================*/
create table PERMISOS (
   ID_PERMISO           INTEGER               not null,
   ID_ROL               INTEGER               not null,
   ID_MENU              INTEGER               not null,
   DESCRIPCION_PERMISO  VARCHAR2(100),
   LECTURA              CHAR(1),
   NUEVO                CHAR(1),
   ELIMINAR             CHAR(1),
   EDITAR               CHAR(1),
   IDUSUARIO_CREA       INTEGER,
   IDUSUARIO_MODIFICA   INTEGER,
   FECHA_CREA           DATE,
   FECHA_MODIFICA       DATE,
   BORRADO              CHAR(1),
   constraint PK_PERMISOS primary key (ID_PERMISO)
);

/*==============================================================*/
/* Index: CUENTA_CON_FK                                         */
/*==============================================================*/
create index PERMISOS_IDROL on PERMISOS (
   ID_ROL ASC
);

/*==============================================================*/
/* Index: SE_MUESTRA_FK                                         */
/*==============================================================*/
create index PERMISOS_IDMENU on PERMISOS (
   ID_MENU ASC
);

/*==============================================================*/
/* Table: PERSONAL                                              */
/*==============================================================*/
create table PERSONAL (
   ID_PERSONAL          VARCHAR2(10)               not null,
   APELLIDO_PATERNO     VARCHAR2(50),
   APELLIDO_MATERNO     VARCHAR2(50),
   NOMBRES              VARCHAR2(50),
   RED_GERENCIA         VARCHAR2(50),
   DNI                  VARCHAR2(8),
   IDUSUARIO_CREA       INTEGER,
   IDUSUARIO_MODIFICA   INTEGER,
   FECHA_CREA           DATE,
   FECHA_MODIFICA       DATE,
   BORRADO              CHAR(1),
   CORREO               VARCHAR2(100),
   CARGO                VARCHAR2(50),
   constraint PK_PERSONAL primary key (ID_PERSONAL)
);

/*==============================================================*/
/* Table: PMS_CENTRO_UPS                                        */
/*==============================================================*/
create table PMS_CENTRO_UPS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   ID_PMS               VARCHAR2(15)               not null,
   COSTO_TOTAL_RRHH_NI  NUMBER(13,4),
   COSTO_TOTAL_RRHH_NII NUMBER(13,4),
   COSTO_TOTAL_RRHH_NIII NUMBER(13,4),
   COSTO_TOTAL_RRHH     NUMBER(13,4),
   COSTO_TOTAL_EQUIPAMIENTO_NI NUMBER(13,4),
   COSTO_TOTAL_EQUIPAMIENTO_NII NUMBER(13,4),
   COSTO_TOTAL_EQUIPAMIENTO_NIII NUMBER(13,4),
   COSTO_TOTAL_EQUIPAMIENTO NUMBER(13,4),
   COSTO_TOTAL_EQUIP_ADIC_NI NUMBER(13,4),
   COSTO_TOTAL_EQUIP_ADIC_NII NUMBER(13,4),
   COSTO_TOTAL_EQUIP_ADIC_NIII NUMBER(13,4),
   COSTO_TOTAL_EQUIP_ADIC NUMBER(13,4),
   COSTO_TOTAL_INFRA_NI NUMBER(13,4),
   COSTO_TOTAL_INFRA_NII NUMBER(13,4),
   COSTO_TOTAL_INFRA_NIII NUMBER(13,4),
   COSTO_TOTAL_INFRA    NUMBER(13,4),
   COSTO_TOTAL_INSUMOS  NUMBER(13,4),
   COSTO_TOTAL_SERV_BAS_NI NUMBER(13,4),
   COSTO_TOTAL_SERV_BAS_NII NUMBER(13,4),
   COSTO_TOTAL_SERV_BAS_NIII NUMBER(13,4),
   COSTO_TOTAL_SERV_BAS NUMBER(13,4),
   COSTO_TOTAL_SS_GENYADMINS_NI NUMBER(13,4),
   COSTO_TOTAL_SS_GENYADMINS_NII NUMBER(13,4),
   COSTO_TOTAL_SS_GENYADMINS_NIII NUMBER(13,4),
   COSTO_TOTAL_SERV_GENYADMINS NUMBER(13,4),
   COSTO_TOTAL_PMS      NUMBER(13,4),
   ANIO                 INTEGER,
   COSTO_TOTAL_ESTANDAR_NI NUMBER(13,4),
   COSTO_TOTAL_ESTANDAR_NII NUMBER(13,4),
   COSTO_TOTAL_ESTANDAR_NIII NUMBER(13,4),
   COSTO_TOTAL_ESTANDAR NUMBER(13,4),
   constraint PK_PMS_CENTRO_UPS primary key (ID_PMS, ID_UPS, ID_CENTRO)
);

/*==============================================================*/
/* Index: PMS_UPS_CENTRO_FK                                     */
/*==============================================================*/
create index PMS_IDUPS_IDCENTRO on PMS_CENTRO_UPS (
   ID_UPS ASC,
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: _REALIZA__FK                                          */
/*==============================================================*/
create index CENTRO_UPS_IDPMS on PMS_CENTRO_UPS (
   ID_PMS ASC
);

/*==============================================================*/
/* Table: PMS_EQUIPAMIENTOS_ADICIONALES                         */
/*==============================================================*/
create table PMS_EQUIPAMIENTOS_ADICIONALES (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   ID_PMS               VARCHAR2(15)               not null,
   ID_EQUIP_ADIC    VARCHAR2(10)               not null,
   SUBTOTAL_COSTO_PMS_EQUIP_ADIC NUMBER(13,4),
   constraint PK_PMS_EQUIPAMIENTOS_ADICIONAL primary key (ID_PMS, ID_UPS, ID_CENTRO, ID_EQUIP_ADIC)
);

/*==============================================================*/
/* Index: UTILIZAA2_FK                                          */
/*==============================================================*/
create index EQAD_IDPMS_IDUPS_IDCENTRO on PMS_EQUIPAMIENTOS_ADICIONALES (
   ID_PMS ASC,
   ID_UPS ASC,
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: UTILIZAA_FK                                           */
/*==============================================================*/
create index PMS_CODEQUIP2 on PMS_EQUIPAMIENTOS_ADICIONALES (
   ID_EQUIP_ADIC ASC
);

/*==============================================================*/
/* Table: PMS_KITS_MEDICOS                                      */
/*==============================================================*/
create table PMS_KITS_MEDICOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   ID_PMS               VARCHAR2(15)               not null,
   ID_KIT               VARCHAR2(10)                not null,
   CANTIDAD             INTEGER,
   SUBTOTAL_COSTO_PMS_KIT NUMBER(13,4),
   constraint PK_PMS_KITS_MEDICOS primary key (ID_PMS, ID_UPS, ID_CENTRO, ID_KIT)
);

/*==============================================================*/
/* Index: UTILIZA2_FK                                           */
/*==============================================================*/
create index KITS_IDPMSUPSCENTRO on PMS_KITS_MEDICOS (
   ID_PMS ASC,
   ID_UPS ASC,
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: UTILIZA_FK                                            */
/*==============================================================*/
create index PMS_IDKITS on PMS_KITS_MEDICOS (
   ID_KIT ASC
);

/*==============================================================*/
/* Table: PMS_RECURSOS_HUMANOS                                  */
/*==============================================================*/
create table PMS_RECURSOS_HUMANOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   ID_PMS               VARCHAR2(15)               not null,
   ID_GRUPO_OCUPACIONAL CHAR(8)               not null,
   CANTIDAD             INTEGER,
   TIEMPO_MINUTOS       INTEGER,
   COSTO_POR_MIN_RRHH   NUMBER(13,4),
   SUBTOTAL_COSTO_PMS_RRHH NUMBER(13,4),
   constraint PK_PMS_RECURSOS_HUMANOS primary key (ID_PMS, ID_UPS, ID_CENTRO, ID_GRUPO_OCUPACIONAL)
);

/*==============================================================*/
/* Index: REQUIERE2_FK                                          */
/*==============================================================*/
create index RRHH_IDPMSUPSCENTRO on PMS_RECURSOS_HUMANOS (
   ID_PMS ASC,
   ID_UPS ASC,
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: REQUIERE_FK                                           */
/*==============================================================*/
create index PMS_IDGRUPOOCUP on PMS_RECURSOS_HUMANOS (
   ID_GRUPO_OCUPACIONAL ASC
);

/*==============================================================*/
/* Table: PROCEDIMIENTO_MEDICO_SANITARIO                        */
/*==============================================================*/
create table PROCEDIMIENTO_MEDICO_SANITARIO (
   ID_PMS               VARCHAR2(15)               not null,
   NOMBRE               VARCHAR2(1000),
   ANIO                 INTEGER,
   constraint PK_PROCEDIMIENTO_MEDICO_SANITA primary key (ID_PMS)
);

/*==============================================================*/
/* Table: REDES                                                 */
/*==============================================================*/
create table REDES (
   ID_RED               CHAR(2)               not null,
   NOMBRE               VARCHAR2(200),
   CODREDSGH            INTEGER,
   REDSGH               VARCHAR2(200),
   TIPO_RED             VARCHAR2(2),
   CODREDGCAA           INTEGER,
   N_IDDEPENDENCIA      INTEGER,
   CODREDSAP            VARCHAR2(10),
   UBICACION            VARCHAR2(250),
   ACTIVO               INTEGER,
   CODREDSGSS           INTEGER,
   constraint PK_REDES primary key (ID_RED)
);

/*==============================================================*/
/* Table: ROLES                                                 */
/*==============================================================*/
create table ROLES (
   ID_ROL               INTEGER               not null,
   DESCRIPCION          VARCHAR2(50),
   ID_USUARIO_CREA      INTEGER,
   ID_USUARIO_MODIFICA  INTEGER,
   FECHA_CREA           DATE,
   FECCHA_MODIFICA      DATE,
   BORRADO              CHAR(1),
   constraint PK_ROLES primary key (ID_ROL)
);

/*==============================================================*/
/* Table: SERVICIOS_BASICOS                                     */
/*==============================================================*/
create table SERVICIOS_BASICOS (
   ID_SERVICIO_BASICO   VARCHAR2(10)               not null,
   NOMBRE               VARCHAR2(80),
   GASTO_ANUAL_PROM_NI  NUMBER(13,4),
   GASTO_ANUAL_PROM_NII NUMBER(13,4),
   GASTO_ANUAL_PROM_NIII NUMBER(13,4),
   GASTO_ANUAL_PROM     NUMBER(13,4),
   constraint PK_SERVICIOS_BASICOS primary key (ID_SERVICIO_BASICO)
);

/*==============================================================*/
/* Table: SERVICIOS_GENYADMINS                                  */
/*==============================================================*/
create table SERVICIOS_GENYADMINS (
   ID_SERVICIO_GENYADMIN VARCHAR2(10)               not null,
   NOMBRE               VARCHAR2(80),
   constraint PK_SERVICIOS_GENYADMINS primary key (ID_SERVICIO_GENYADMIN)
);

/*==============================================================*/
/* Table: TIPOS_DE_EQUIPAMIENTOS                                */
/*==============================================================*/
create table TIPOS_DE_EQUIPAMIENTOS (
   ID_TIPO_EQUIPAMIENTO INTEGER               not null,
   NOMBRE               VARCHAR2(100),
   constraint PK_TIPOS_DE_EQUIPAMIENTOS primary key (ID_TIPO_EQUIPAMIENTO)
);

/*==============================================================*/
/* Table: UNIDAD_PRODUCTORA_SERVICIOS                           */
/*==============================================================*/
create table UNIDAD_PRODUCTORA_SERVICIOS (
   ID_UPS               VARCHAR2(10)               not null,
   NOMBRE               VARCHAR2(100),
   constraint PK_UNIDAD_PRODUCTORA_SERVICIOS primary key (ID_UPS)
);

/*==============================================================*/
/* Table: UPS_EQUIPAMIENTOS                                     */
/*==============================================================*/
create table UPS_EQUIPAMIENTOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   ID_EQUIPAMIENTO      VARCHAR2(10)               not null,
   CANTIDAD             INTEGER,
   COSTO_UNITARIO       NUMBER(13,4),
   ANIO                 INTEGER,
   constraint PK_UPS_EQUIPAMIENTOS primary key (ID_UPS, ID_CENTRO, ID_EQUIPAMIENTO)
);

/*==============================================================*/
/* Index: UTILIZA__2_FK                                         */
/*==============================================================*/
create index EQUIP_IDUPSCENTRO on UPS_EQUIPAMIENTOS (
   ID_UPS ASC,
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: UTILIZA___FK                                          */
/*==============================================================*/
create index UPS_IDEQUIPAM on UPS_EQUIPAMIENTOS (
   ID_EQUIPAMIENTO ASC
);

/*==============================================================*/
/* Table: UPS_SERVICIOS_BASICOS                                 */
/*==============================================================*/
create table UPS_SERVICIOS_BASICOS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   ID_SERVICIO_BASICO   VARCHAR2(10)               not null,
   ASIGNACION_CONSUMO   NUMBER(4,2),
   INDUCTOR_NI          NUMBER(13,4),
   INDUCTOR_NII         NUMBER(13,4),
   INDUCTOR_NIII        NUMBER(13,4),
   INDUCTOR             NUMBER(13,4),
   COSTO_PROM_ANUAL_NI  NUMBER(13,4),
   COSTO_NI             NUMBER(13,4),
   COSTO_PROM_ANUAL_NII NUMBER(13,4),
   COSTO_NII            NUMBER(13,4),
   COSTO_PROM_ANUAL_NIII NUMBER(13,4),
   COSTO_NIII           NUMBER(13,4),
   COSTO_PROM_ANUAL     NUMBER(13,4),
   COSTO                NUMBER(13,4),
   TOTAL_PROD_ANUAL     NUMBER(13,4),
   COSTO_PROM_NI        NUMBER(13,4),
   COSTO_TOTAL_NI       NUMBER(13,4),
   COSTO_PROM_NII       NUMBER(13,4),
   COSTO_TOTAL_NII      NUMBER(13,4),
   COSTO_PROM_NIII      NUMBER(13,4),
   COSTO_TOTAL_NIII     NUMBER(13,4),
   COSTO_PROM           NUMBER(13,4),
   COSTO_TOTAL          NUMBER(13,4),
   constraint PK_UPS_SERVICIOS_BASICOS primary key (ID_UPS, ID_CENTRO, ID_SERVICIO_BASICO)
);

/*==============================================================*/
/* Index: USA2_FK                                               */
/*==============================================================*/
create index SSBASIC_IDUPSCENTRO on UPS_SERVICIOS_BASICOS (
   ID_UPS ASC,
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: USA_FK                                                */
/*==============================================================*/
create index UPS_IDSSBASIC on UPS_SERVICIOS_BASICOS (
   ID_SERVICIO_BASICO ASC
);

/*==============================================================*/
/* Table: UPS_SERVICIOS_GENYADMINS                              */
/*==============================================================*/
create table UPS_SERVICIOS_GENYADMINS (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_UPS               VARCHAR2(10)               not null,
   ID_SERVICIO_GENYADMIN VARCHAR2(10)               not null,
   COSTO_PROM_ANUAL_NI  NUMBER(13,4),
   COSTO_INDIRECTO_NI   NUMBER(13,4),
   COSTO_INDIRECTO_PROM_NI NUMBER(13,4),
   COSTO_PROM_ANUAL_NII NUMBER(13,4),
   COSTO_INDIRECTO_NII  NUMBER(13,4),
   COSTO_INDIRECTO_PROM_NII NUMBER(13,4),
   COSTO_PROM_ANUAL_NIII NUMBER(13,4),
   COSTO_INDIRECTO_NIII NUMBER(13,4),
   COSTO_INDIRECTO_PROM_NIII NUMBER(13,4),
   C                    NUMBER(13,4),
   COSTO_INDIRECTO      NUMBER(13,4),
   COSTO_INDIRECTO_PROM NUMBER(13,4),
   constraint PK_UPS_SERVICIOS_GENYADMINS primary key (ID_UPS, ID_CENTRO, ID_SERVICIO_GENYADMIN)
);

/*==============================================================*/
/* Index: CONSUME2_FK                                           */
/*==============================================================*/
create index SSGENYADMINS_IDUPSCENTRO on UPS_SERVICIOS_GENYADMINS (
   ID_UPS ASC,
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: CONSUME_FK                                            */
/*==============================================================*/
create index UPS_IDSSGENYADMINS on UPS_SERVICIOS_GENYADMINS (
   ID_SERVICIO_GENYADMIN ASC
);

/*==============================================================*/
/* Table: USUARIOS                                              */
/*==============================================================*/
create table USUARIOS (
   ID_USUARIO           INTEGER               not null,
   ID_CENTRO            VARCHAR2(6)               not null,
   CODIGO_USUARIO       VARCHAR2(30),
   CONTRASENIA          VARCHAR2(40),
   ID_USUARIO_CREA      INTEGER,
   ID_USUARIO_MODIFICA  INTEGER,
   FECHA_CREA           DATE,
   FECHA_MODIFICA       DATE,
   BORRADO              INTEGER,
   ESTADO               CHAR(1),
   constraint PK_USUARIOS primary key (ID_USUARIO)
);

/*==============================================================*/
/* Index: CUENTA__CON_FK                                        */
/*==============================================================*/
create index USUARIOS_IDCENTRO on USUARIOS (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Table: USUARIO_CENTRO                                        */
/*==============================================================*/
create table USUARIO_CENTRO (
   ID_CENTRO            VARCHAR2(6)               not null,
   ID_USUARIO           INTEGER               not null,
   ID_USUARIO_CREA      INTEGER,
   ID_USUARIO_MODIFICA  INTEGER,
   FECHA_CREA           DATE,
   FECHA_MODIFICA       DATE,
   BORRADO              CHAR(1),
   constraint PK_USUARIO_CENTRO primary key (ID_USUARIO, ID_CENTRO)
);

/*==============================================================*/
/* Index: VINCULAN_FK                                           */
/*==============================================================*/
create index USUARIO_IDCENTRO on USUARIO_CENTRO (
   ID_CENTRO ASC
);

/*==============================================================*/
/* Index: FORMA_FK                                              */
/*==============================================================*/
create index CENTRO_IDUSUARIO on USUARIO_CENTRO (
   ID_USUARIO ASC
);

/*==============================================================*/
/* Table: USUARIO_PERSONAL                                      */
/*==============================================================*/
create table USUARIO_PERSONAL (
   ID_PERSONAL          VARCHAR2(10)               not null,
   ID_USUARIO           INTEGER               not null,
   ID_USUARIO_CREA      INTEGER,
   ID_USUARIO_MODIFICA  INTEGER,
   FECHA_CREA           DATE,
   FECHA_MODIFICA       DATE,
   BORRADO              CHAR(1),
   constraint PK_USUARIO_PERSONAL primary key (ID_PERSONAL, ID_USUARIO)
);

/*==============================================================*/
/* Index: SE_VINCULAN_FK                                        */
/*==============================================================*/
create index PERSONAL_IDUSUARIO on USUARIO_PERSONAL (
   ID_USUARIO ASC
);

/*==============================================================*/
/* Index: TIENE_VINCULADO_FK                                    */
/*==============================================================*/
create index USUARIO_IDPERSONAL on USUARIO_PERSONAL (
   ID_PERSONAL ASC
);

/*==============================================================*/
/* Table: USUARIO_ROL                                           */
/*==============================================================*/
create table USUARIO_ROL (
   ID_USUARIO           INTEGER               not null,
   ID_ROL               INTEGER               not null,
   ID_USUARIO_CREA      INTEGER,
   ID_USUARIO_MODIFICA  INTEGER,
   FECHA_CREA           DATE,
   FECHA_MODIFICA       DATE,
   BORRADO              CHAR(1),
   constraint PK_USUARIO_ROL primary key (ID_USUARIO, ID_ROL)
);

/*==============================================================*/
/* Index: VINCULA_CON_FK                                        */
/*==============================================================*/
create index USUARIO_IDROL on USUARIO_ROL (
   ID_ROL ASC
);

/*==============================================================*/
/* Index: SE_VINCULA_FK                                         */
/*==============================================================*/
create index ROL_IDUSUARIO on USUARIO_ROL (
   ID_USUARIO ASC
);

/*==============================================================*/
/* Table: VALORIZACIONES                                        */
/*==============================================================*/
create table VALORIZACIONES (
   ID_VALORIZACION      INTEGER               not null,
   ID_GRUPO_OCUPACIONAL        CHAR(8),
   NOMBRE_GRUPO_OCUP    VARCHAR2(100),
   NIVEL_GRUPO_OCUP     VARCHAR2(20),
   VALOR_PRINCIPAL      NUMBER(13,4),
   VALOR_ATENCION_PRIMARIA NUMBER(13,4),
   VALOR_ESTAB_ESTRATEGICO NUMBER(13,4),
   VALOR_HOSP_ESPECIALIZADO NUMBER(13,4),
   VALOR_ZONA_FRONTERA  NUMBER(13,4),
   BONO_ESPECIALIDAD    NUMBER(13,4),
   AGUINALDO_FIESTAS_PATRIAS NUMBER(13,4),
   AGUINALDO_NAVIDAD    NUMBER(13,4),
   GUARDIA_DIURNA       NUMBER(13,4),
   GUARDIA_NOCTURNA     NUMBER(13,4),
   GUARDIA_DIURNA_FERIADOS NUMBER(13,4),
   GUARDIA_NOCTURNA_FERIADOS NUMBER(13,4),
   constraint PK_VALORIZACIONES primary key (ID_VALORIZACION)
);

alter table CENTROS
   add constraint FK_CENTROS_CUENTA____REDES foreign key (ID_RED)
      references REDES (ID_RED);

alter table CENTROS_EQUIPAMIENTOS
   add constraint FK_CENTROS__CENTROS_E_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table CENTROS_EQUIPAMIENTOS
   add constraint FK_CENTROS____RELACIO_EQUIPAMI foreign key (ID_EQUIPAMIENTO)
      references EQUIPAMIENTOS (ID_EQUIPAMIENTO);

alter table CENTROS_EQUIP_ADICION
   add constraint FK_CENTROS___SE_VINCU_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table CENTROS_EQUIP_ADICION
   add constraint FK_CENTROS___VINCULA__EQUIPAMI foreign key (ID_EQUIP_ADIC)
      references EQUIPAMIENTOS_ADICIONALES (ID_EQUIP_ADIC);

alter table CENTROS_INSUMOS_MEDICOS
   add constraint FK_CENTROS__VINCULA___CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table CENTROS_INSUMOS_MEDICOS
   add constraint FK_CENTROS___INSUMOS__INSUMOS_ foreign key (ID_INSUMO)
      references INSUMOS_MEDICOS (ID_INSUMO);

alter table CENTROS_RECURSOS_HUMANOS
   add constraint FK_CENTROS___RELACION_GRUPOS_O foreign key (ID_GRUPO_OCUPACIONAL)
      references GRUPOS_OCUPACIONALES (ID_GRUPO_OCUPACIONAL);

alter table CENTROS_RECURSOS_HUMANOS
   add constraint FK_CENTROS____RELACIO_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table CENTROS_SERVICIOS_BASICOS
   add constraint FK_CENTROS__CENTROS_S_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table CENTROS_SERVICIOS_BASICOS
   add constraint FK_CENTROS______RELAI_SERVICIO foreign key (ID_SERVICIO_BASICO)
      references SERVICIOS_BASICOS (ID_SERVICIO_BASICO);

alter table CENTROS_SERVICIO_GNRALYADMINS
   add constraint FK_CENTROS___VINCULA__CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table CENTROS_SERVICIO_GNRALYADMINS
   add constraint FK_CENTROS____VINCULA_SERVICIO foreign key (ID_SERVICIO_GENYADMIN)
      references SERVICIOS_GENYADMINS (ID_SERVICIO_GENYADMIN);

alter table CENTRO_UPS
   add constraint FK_CENTRO_U_CENTRO_UP_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table CENTRO_UPS
   add constraint FK_CENTRO_U___CUENTA__UNIDAD_P foreign key (ID_UPS)
      references UNIDAD_PRODUCTORA_SERVICIOS (ID_UPS);

alter table EQUIPAMIENTOS
   add constraint FK_EQUIPAMI_PERTENECE_TIPOS_DE foreign key (ID_TIPO_EQUIPAMIENTO)
      references TIPOS_DE_EQUIPAMIENTOS (ID_TIPO_EQUIPAMIENTO);

alter table INVERSIONES_INFRAESTRUCTURA
   add constraint FK_INVERSIO_CUENTAN_C_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table KITS_INSUMOS_MEDICOS
   add constraint FK_KITS_INS_CONTIENE_INSUMOS_ foreign key (ID_INSUMO)
      references INSUMOS_MEDICOS (ID_INSUMO);

alter table KITS_INSUMOS_MEDICOS
   add constraint FK_KITS_INS_CONTIENE2_KITS_MED foreign key (ID_KIT)
      references KITS_MEDICOS (ID_KIT);

alter table MENU
   add constraint FK_MENU_TIENE_COM_MENU foreign key (PADRE)
      references MENU (ID_MENU);

alter table PERMISOS
   add constraint FK_PERMISOS_CUENTA_CO_ROLES foreign key (ID_ROL)
      references ROLES (ID_ROL);

alter table PERMISOS
   add constraint FK_PERMISOS_SE_MUESTR_MENU foreign key (ID_MENU)
      references MENU (ID_MENU);

alter table PMS_CENTRO_UPS
   add constraint FK_PMS_CENT_PMS_UPS_C_CENTRO_U foreign key (ID_UPS, ID_CENTRO)
      references CENTRO_UPS (ID_UPS, ID_CENTRO);

alter table PMS_CENTRO_UPS
   add constraint FK_PMS_CENT__REALIZA__PROCEDIM foreign key (ID_PMS)
      references PROCEDIMIENTO_MEDICO_SANITARIO (ID_PMS);

alter table PMS_EQUIPAMIENTOS_ADICIONALES
   add constraint FK_PMS_EQUI_UTILIZAA_EQUIPAMI foreign key (ID_EQUIP_ADIC)
      references EQUIPAMIENTOS_ADICIONALES (ID_EQUIP_ADIC);

alter table PMS_EQUIPAMIENTOS_ADICIONALES
   add constraint FK_PMS_EQUI_UTILIZAA2_PMS_CENT foreign key (ID_PMS, ID_UPS, ID_CENTRO)
      references PMS_CENTRO_UPS (ID_PMS, ID_UPS, ID_CENTRO);

alter table PMS_KITS_MEDICOS
   add constraint FK_PMS_KITS_UTILIZA_KITS_MED foreign key (ID_KIT)
      references KITS_MEDICOS (ID_KIT);

alter table PMS_KITS_MEDICOS
   add constraint FK_PMS_KITS_UTILIZA2_PMS_CENT foreign key (ID_PMS, ID_UPS, ID_CENTRO)
      references PMS_CENTRO_UPS (ID_PMS, ID_UPS, ID_CENTRO);

alter table PMS_RECURSOS_HUMANOS
   add constraint FK_PMS_RECU_REQUIERE_GRUPOS_O foreign key (ID_GRUPO_OCUPACIONAL)
      references GRUPOS_OCUPACIONALES (ID_GRUPO_OCUPACIONAL);

alter table PMS_RECURSOS_HUMANOS
   add constraint FK_PMS_RECU_REQUIERE2_PMS_CENT foreign key (ID_PMS, ID_UPS, ID_CENTRO)
      references PMS_CENTRO_UPS (ID_PMS, ID_UPS, ID_CENTRO);

alter table UPS_EQUIPAMIENTOS
   add constraint FK_UPS_EQUI_UTILIZA___EQUIPAMI foreign key (ID_EQUIPAMIENTO)
      references EQUIPAMIENTOS (ID_EQUIPAMIENTO);

alter table UPS_EQUIPAMIENTOS
   add constraint FK_UPS_EQUI_UTILIZA___CENTRO_U foreign key (ID_UPS, ID_CENTRO)
      references CENTRO_UPS (ID_UPS, ID_CENTRO);

alter table UPS_SERVICIOS_BASICOS
   add constraint FK_UPS_SERV_USA_SERVICIO foreign key (ID_SERVICIO_BASICO)
      references SERVICIOS_BASICOS (ID_SERVICIO_BASICO);

alter table UPS_SERVICIOS_BASICOS
   add constraint FK_UPS_SERV_USA2_CENTRO_U foreign key (ID_UPS, ID_CENTRO)
      references CENTRO_UPS (ID_UPS, ID_CENTRO);

alter table UPS_SERVICIOS_GENYADMINS
   add constraint FK_UPS_SERV_CONSUME_SERVICIO foreign key (ID_SERVICIO_GENYADMIN)
      references SERVICIOS_GENYADMINS (ID_SERVICIO_GENYADMIN);

alter table UPS_SERVICIOS_GENYADMINS
   add constraint FK_UPS_SERV_CONSUME2_CENTRO_U foreign key (ID_UPS, ID_CENTRO)
      references CENTRO_UPS (ID_UPS, ID_CENTRO);

alter table USUARIOS
   add constraint FK_USUARIOS_CUENTA__C_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table USUARIO_CENTRO
   add constraint FK_USUARIO__FORMA_USUARIOS foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO);

alter table USUARIO_CENTRO
   add constraint FK_USUARIO__VINCULAN_CENTROS foreign key (ID_CENTRO)
      references CENTROS (ID_CENTRO);

alter table USUARIO_PERSONAL
   add constraint FK_USUARIO__TIENE_VIN_PERSONAL foreign key (ID_PERSONAL)
      references PERSONAL (ID_PERSONAL);

alter table USUARIO_PERSONAL
   add constraint FK_USUARIO__USUARIO__PERSONAL foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO);

alter table USUARIO_ROL
   add constraint FK_USUARIOS_USUARIO_ROL foreign key (ID_USUARIO)
      references USUARIOS (ID_USUARIO);

alter table USUARIO_ROL
   add constraint FK_USUARIO__VINCULA_C_ROLES foreign key (ID_ROL)
      references ROLES (ID_ROL);

/*

alter table CENTROS
   drop constraint FK_CENTROS_CUENTA____REDES;

alter table CENTROS_EQUIPAMIENTOS
   drop constraint FK_CENTROS__CENTROS_E_CENTROS;

alter table CENTROS_EQUIPAMIENTOS
   drop constraint FK_CENTROS____RELACIO_EQUIPAMI;

alter table CENTROS_EQUIP_ADICION
   drop constraint FK_CENTROS___SE_VINCU_CENTROS;

alter table CENTROS_EQUIP_ADICION
   drop constraint FK_CENTROS___VINCULA__EQUIPAMI;

alter table CENTROS_INSUMOS_MEDICOS
   drop constraint FK_CENTROS__VINCULA___CENTROS;

alter table CENTROS_INSUMOS_MEDICOS
   drop constraint FK_CENTROS___INSUMOS__INSUMOS_;

alter table CENTROS_RECURSOS_HUMANOS
   drop constraint FK_CENTROS___RELACION_GRUPOS_O;

alter table CENTROS_RECURSOS_HUMANOS
   drop constraint FK_CENTROS____RELACIO_CENTROS;

alter table CENTROS_SERVICIOS_BASICOS
   drop constraint FK_CENTROS__CENTROS_S_CENTROS;

alter table CENTROS_SERVICIOS_BASICOS
   drop constraint FK_CENTROS______RELAI_SERVICIO;

alter table CENTROS_SERVICIO_GNRALYADMINS
   drop constraint FK_CENTROS___VINCULA__CENTROS;

alter table CENTROS_SERVICIO_GNRALYADMINS
   drop constraint FK_CENTROS____VINCULA_SERVICIO;

alter table CENTRO_UPS
   drop constraint FK_CENTRO_U_CENTRO_UP_CENTROS;

alter table CENTRO_UPS
   drop constraint FK_CENTRO_U___CUENTA__UNIDAD_P;

alter table EQUIPAMIENTOS
   drop constraint FK_EQUIPAMI_PERTENECE_TIPOS_DE;

alter table INVERSIONES_INFRAESTRUCTURA
   drop constraint FK_INVERSIO_CUENTAN_C_CENTROS;

alter table KITS_INSUMOS_MEDICOS
   drop constraint FK_KITS_INS_CONTIENE_INSUMOS_;

alter table KITS_INSUMOS_MEDICOS
   drop constraint FK_KITS_INS_CONTIENE2_KITS_MED;

alter table MENU
   drop constraint FK_MENU_TIENE_COM_MENU;

alter table PERMISOS
   drop constraint FK_PERMISOS_CUENTA_CO_ROLES;

alter table PERMISOS
   drop constraint FK_PERMISOS_SE_MUESTR_MENU;

alter table PMS_CENTRO_UPS
   drop constraint FK_PMS_CENT_PMS_UPS_C_CENTRO_U;

alter table PMS_CENTRO_UPS
   drop constraint FK_PMS_CENT__REALIZA__PROCEDIM;

alter table PMS_EQUIPAMIENTOS_ADICIONALES
   drop constraint FK_PMS_EQUI_UTILIZAA_EQUIPAMI;

alter table PMS_EQUIPAMIENTOS_ADICIONALES
   drop constraint FK_PMS_EQUI_UTILIZAA2_PMS_CENT;

alter table PMS_KITS_MEDICOS
   drop constraint FK_PMS_KITS_UTILIZA_KITS_MED;

alter table PMS_KITS_MEDICOS
   drop constraint FK_PMS_KITS_UTILIZA2_PMS_CENT;

alter table PMS_RECURSOS_HUMANOS
   drop constraint FK_PMS_RECU_REQUIERE_GRUPOS_O;

alter table PMS_RECURSOS_HUMANOS
   drop constraint FK_PMS_RECU_REQUIERE2_PMS_CENT;

alter table UPS_EQUIPAMIENTOS
   drop constraint FK_UPS_EQUI_UTILIZA___EQUIPAMI;

alter table UPS_EQUIPAMIENTOS
   drop constraint FK_UPS_EQUI_UTILIZA___CENTRO_U;

alter table UPS_SERVICIOS_BASICOS
   drop constraint FK_UPS_SERV_USA_SERVICIO;

alter table UPS_SERVICIOS_BASICOS
   drop constraint FK_UPS_SERV_USA2_CENTRO_U;

alter table UPS_SERVICIOS_GENYADMINS
   drop constraint FK_UPS_SERV_CONSUME_SERVICIO;

alter table UPS_SERVICIOS_GENYADMINS
   drop constraint FK_UPS_SERV_CONSUME2_CENTRO_U;

alter table USUARIOS
   drop constraint FK_USUARIOS_CUENTA__C_CENTROS;

alter table USUARIO_CENTRO
   drop constraint FK_USUARIO__FORMA_USUARIOS;

alter table USUARIO_CENTRO
   drop constraint FK_USUARIO__VINCULAN_CENTROS;

alter table USUARIO_PERSONAL
   drop constraint FK_USUARIO__TIENE_VIN_PERSONAL;

alter table USUARIO_PERSONAL
   drop constraint FK_USUARIO__USUARIO__PERSONAL;

alter table USUARIO_ROL
   drop constraint FK_USUARIOS_USUARIO_ROL;

alter table USUARIO_ROL
   drop constraint FK_USUARIO__VINCULA_C_ROLES;

drop index CUENTA___CON_FK;

drop table CENTROS cascade constraints;

drop index _RELACIONA_FK;

drop index __RELACIONA___FK;

drop table CENTROS_EQUIPAMIENTOS cascade constraints;

drop index _VINCULA____FK;

drop index _SE_VINCULA__FK;

drop table CENTROS_EQUIP_ADICION cascade constraints;

drop index _INSUMOS_CENTROS_FK;

drop index VINCULA_____FK;

drop table CENTROS_INSUMOS_MEDICOS cascade constraints;

drop index _RELACION___FK;

drop index __RELACIONA_FK;

drop table CENTROS_RECURSOS_HUMANOS cascade constraints;

drop index _RELACIONA___FK;

drop index ____RELAICONA_FK;

drop table CENTROS_SERVICIOS_BASICOS cascade constraints;

drop index _VINCULA__FK;

drop index __VINCULA__FK;

drop table CENTROS_SERVICIO_GNRALYADMINS cascade constraints;

drop index __CUENTA_CON_FK;

drop index CENTRO_UPS_FK;

drop table CENTRO_UPS cascade constraints;

drop table DETALLE_COSTO_ESTANDAR cascade constraints;

drop index PERTENECE_A_FK;

drop table EQUIPAMIENTOS cascade constraints;

drop table EQUIPAMIENTOS_ADICIONALES cascade constraints;

drop table GRUPOS_OCUPACIONALES cascade constraints;

drop table INSUMOS_MEDICOS cascade constraints;

drop index CUENTAN_CON____FK;

drop table INVERSIONES_INFRAESTRUCTURA cascade constraints;

drop index CONTIENE_FK;

drop index CONTIENE2_FK;

drop table KITS_INSUMOS_MEDICOS cascade constraints;

drop table KITS_MEDICOS cascade constraints;

drop index TIENE_COMO_HIJO_FK;

drop table MENU cascade constraints;

drop index SE_MUESTRA_FK;

drop index CUENTA_CON_FK;

drop table PERMISOS cascade constraints;

drop table PERSONAL cascade constraints;

drop index _REALIZA__FK;

drop index PMS_UPS_CENTRO_FK;

drop table PMS_CENTRO_UPS cascade constraints;

drop index UTILIZAA_FK;

drop index UTILIZAA2_FK;

drop table PMS_EQUIPAMIENTOS_ADICIONALES cascade constraints;

drop index UTILIZA_FK;

drop index UTILIZA2_FK;

drop table PMS_KITS_MEDICOS cascade constraints;

drop index REQUIERE_FK;

drop index REQUIERE2_FK;

drop table PMS_RECURSOS_HUMANOS cascade constraints;

drop table PROCEDIMIENTO_MEDICO_SANITARIO cascade constraints;

drop table REDES cascade constraints;

drop table ROLES cascade constraints;

drop table SERVICIOS_BASICOS cascade constraints;

drop table SERVICIOS_GENYADMINS cascade constraints;

drop table TIPOS_DE_EQUIPAMIENTOS cascade constraints;

drop table UNIDAD_PRODUCTORA_SERVICIOS cascade constraints;

drop index UTILIZA___FK;

drop index UTILIZA__2_FK;

drop table UPS_EQUIPAMIENTOS cascade constraints;

drop index USA_FK;

drop index USA2_FK;

drop table UPS_SERVICIOS_BASICOS cascade constraints;

drop index CONSUME_FK;

drop index CONSUME2_FK;

drop table UPS_SERVICIOS_GENYADMINS cascade constraints;

drop index CUENTA__CON_FK;

drop table USUARIOS cascade constraints;

drop index FORMA_FK;

drop index VINCULAN_FK;

drop table USUARIO_CENTRO cascade constraints;

drop index TIENE_VINCULADO_FK;

drop index SE_VINCULAN_FK;

drop table USUARIO_PERSONAL cascade constraints;

drop index SE_VINCULA_FK;

drop index VINCULA_CON_FK;

drop table USUARIO_ROL cascade constraints;

drop table VALORIZACIONES cascade constraints;











*/