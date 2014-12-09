/*
Navicat SQLite Data Transfer

Source Server         : Banking
Source Server Version : 30802
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30802
File Encoding         : 65001

Date: 2014-12-09 11:58:18
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for APORCuentasGlosas
-- ----------------------------
DROP TABLE IF EXISTS "main"."APORCuentasGlosas";
CREATE TABLE "APORCuentasGlosas" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"TPO"  TEXT,
"GLEDGER"  TEXT,
"GLOSA"  TEXT
);

-- ----------------------------
-- Table structure for AuxiliarTasaCtasCorrientes
-- ----------------------------
DROP TABLE IF EXISTS "main"."AuxiliarTasaCtasCorrientes";
CREATE TABLE "AuxiliarTasaCtasCorrientes" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"IdCliente"  INTEGER NOT NULL,
"IdRegistroSigir"  INTEGER NOT NULL,
CONSTRAINT "IdCliente" FOREIGN KEY ("IdCliente") REFERENCES "ClienteSegmento" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT "IdRegistroSigir" FOREIGN KEY ("IdRegistroSigir") REFERENCES "ConsolidadoOperacionesSigir1" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for BaseTasa
-- ----------------------------
DROP TABLE IF EXISTS "main"."BaseTasa";
CREATE TABLE "BaseTasa" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "Base" varchar
);

-- ----------------------------
-- Table structure for CalculoProducto
-- ----------------------------
DROP TABLE IF EXISTS "main"."CalculoProducto";
CREATE TABLE "CalculoProducto" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"SRC_ID"  varchar,
"PROD"  varchar,
"CCY"  varchar,
"IdQueEstado"  INTEGER,
"IdQueTasa"  INTEGER,
"IdTipoTasa"  INTEGER,
"IdBase"  INTEGER,
CONSTRAINT "IdQueTasa" FOREIGN KEY ("IdQueTasa") REFERENCES "QueTasa" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT "IdTipoTasa" FOREIGN KEY ("IdTipoTasa") REFERENCES "TipoTasa" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT "IdBase" FOREIGN KEY ("IdBase") REFERENCES "BaseTasa" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT "IdQueEstado" FOREIGN KEY ("IdQueEstado") REFERENCES "QueEstado" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT "PROD-CCY-IdQueEstado-IdQueTasa" UNIQUE ("PROD" ASC, "CCY" ASC, "IdQueEstado" ASC, "IdQueTasa" ASC) ON CONFLICT ABORT
);

-- ----------------------------
-- Table structure for CampoTipoInterfaz
-- ----------------------------
DROP TABLE IF EXISTS "main"."CampoTipoInterfaz";
CREATE TABLE "CampoTipoInterfaz" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "Nombre" varchar,
	 "IdTipoInterfaz" INTEGER,
	 "Descripcion" varchar,
	 "Tipo" varchar,
	 "SeImporta" integer,
	 "EsSigno" integer,
	 "Imprescindible" INTEGER,
	CONSTRAINT "IdTipoInterfaz" FOREIGN KEY ("IdTipoInterfaz") REFERENCES "TipoInterfaz" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for ClienteSegmento
-- ----------------------------
DROP TABLE IF EXISTS "main"."ClienteSegmento";
CREATE TABLE "ClienteSegmento" ("Id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "IDENT_CLI" VARCHAR, "IdSegmento" INTEGER REFERENCES "Segmento" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT, "Nombre" VARCHAR, "Rut" VARCHAR);

-- ----------------------------
-- Table structure for ConsolidadoOperacionesSigir
-- ----------------------------
DROP TABLE IF EXISTS "main"."ConsolidadoOperacionesSigir";
CREATE TABLE "ConsolidadoOperacionesSigir" (
"Id"  INTEGER NOT NULL,
"BOOK_DT"  INTEGER,
"SRC_ID"  VARCHAR COLLATE RTRIM ,
"CON_STA"  VARCHAR COLLATE RTRIM ,
"DLNQ_STA"  VARCHAR COLLATE RTRIM ,
"PROD"  VARCHAR COLLATE RTRIM ,
"IDENT_CLI"  VARCHAR COLLATE RTRIM ,
"CC"  VARCHAR COLLATE RTRIM ,
"CON_NO"  VARCHAR COLLATE RTRIM ,
"STRT_DT"  INTEGER,
"END_DT"  INTEGER,
"CCY"  VARCHAR COLLATE RTRIM ,
"OCY_NOM_AMT_SIGN"  VARCHAR,
"OCY_NOM_AMT"  REAL,
"OCY_INT_AMT_SING"  VARCHAR,
"OCY_INT_AMT"  REAL,
"INT_RT"  REAL,
"RT_METH"  VARCHAR COLLATE RTRIM ,
"POOL_RT"  REAL,
"OCY_ORIG_NOM_AMT"  REAL,
"INT_RT_INT"  REAL,
"POOL_RT_INT"  REAL,
"NEXT_BOOK_DT"  REAL,
"IdCliente"  INTEGER,
PRIMARY KEY ("Id" ASC),
CONSTRAINT "IdCliente" FOREIGN KEY ("IdCliente") REFERENCES "ClienteSegmento" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for CuentasExcluidas
-- ----------------------------
DROP TABLE IF EXISTS "main"."CuentasExcluidas";
CREATE TABLE "CuentasExcluidas" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"SRC_ID"  TEXT,
"IdGLEDGER"  INTEGER,
CONSTRAINT "IdGLEDGER" FOREIGN KEY ("IdGLEDGER") REFERENCES "APORCuentasGlosas" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT "IdGLEDGER" UNIQUE ("IdGLEDGER" ASC, "SRC_ID" ASC) ON CONFLICT ROLLBACK
);

-- ----------------------------
-- Table structure for DEPAS400
-- ----------------------------
DROP TABLE IF EXISTS "main"."DEPAS400";
CREATE TABLE "DEPAS400"("NumeroCliente" float,"DescripcionCliente" varchar(255),"Moneda" varchar(255),"NumeroContrato" float,"FechaInicio" float,"FechaTermino" float,"Capital" float,"TasaInteres" float,"SpreadCalculado" float,"RentabilidadEnPesos" float,"NumeroDeposito" varchar(255));

-- ----------------------------
-- Table structure for DESCRIPCION_PRODUCTO
-- ----------------------------
DROP TABLE IF EXISTS "main"."DESCRIPCION_PRODUCTO";
CREATE TABLE "DESCRIPCION_PRODUCTO" (
"Id"  integer PRIMARY KEY AUTOINCREMENT NOT NULL,
"PROD"  varchar(255),
"AP"  varchar(255),
"Nombre_Informe"  varchar(255)
);

-- ----------------------------
-- Table structure for DestinoInterfaz
-- ----------------------------
DROP TABLE IF EXISTS "main"."DestinoInterfaz";
CREATE TABLE "DestinoInterfaz" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "NombreTabla" varchar
);

-- ----------------------------
-- Table structure for Divisas
-- ----------------------------
DROP TABLE IF EXISTS "main"."Divisas";
CREATE TABLE "Divisas" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"Divisa"  TEXT(255)
);

-- ----------------------------
-- Table structure for Feriado
-- ----------------------------
DROP TABLE IF EXISTS "main"."Feriado";
CREATE TABLE "Feriado" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "Fecha" integer,
	 "Descripcion" varchar
);

-- ----------------------------
-- Table structure for LogCargaInterfaces
-- ----------------------------
DROP TABLE IF EXISTS "main"."LogCargaInterfaces";
CREATE TABLE "LogCargaInterfaces" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "IdInterfaz" INTEGER,
	 "NombreArchivo" varchar,
	 "FechaHoraCarga" varchar,
	CONSTRAINT "IdInterfaz" FOREIGN KEY ("IdInterfaz") REFERENCES "NombreInterfaz" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for NombreInterfaz
-- ----------------------------
DROP TABLE IF EXISTS "main"."NombreInterfaz";
CREATE TABLE "NombreInterfaz" ("Id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "Nombre" VARCHAR UNIQUE, "IdTipoInterfaz" INTEGER REFERENCES "TipoInterfaz" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT, "IdTipoArchivo" INTEGER REFERENCES "TipoArchivo" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT, "Descripcion" VARCHAR);

-- ----------------------------
-- Table structure for OP07_From_ConsOpSigir
-- ----------------------------
DROP TABLE IF EXISTS "main"."OP07_From_ConsOpSigir";
CREATE TABLE OP07_From_ConsOpSigir(
  Id INT,
  BOOK_DT INT,
  SRC_ID TEXT,
  CON_STA TEXT,
  DLNQ_STA TEXT,
  PROD TEXT,
  IDENT_CLI TEXT,
  CC TEXT,
  CON_NO TEXT,
  STRT_DT INT,
  END_DT INT,
  CCY TEXT,
  OCY_NOM_AMT_SIGN TEXT,
  OCY_NOM_AMT REAL,
  OCY_INT_AMT_SING TEXT,
  OCY_INT_AMT REAL,
  INT_RT REAL,
  RT_METH TEXT,
  POOL_RT REAL,
  OCY_ORIG_NOM_AMT REAL,
  INT_RT_INT REAL,
  POOL_RT_INT REAL,
  NEXT_BOOK_DT REAL,
  IdCliente INT
);

-- ----------------------------
-- Table structure for OP29_From_ConsOpSigir
-- ----------------------------
DROP TABLE IF EXISTS "main"."OP29_From_ConsOpSigir";
CREATE TABLE OP29_From_ConsOpSigir(
  Id INT,
  BOOK_DT INT,
  SRC_ID TEXT,
  CON_STA TEXT,
  DLNQ_STA TEXT,
  PROD TEXT,
  IDENT_CLI TEXT,
  CC TEXT,
  CON_NO TEXT,
  STRT_DT INT,
  END_DT INT,
  CCY TEXT,
  OCY_NOM_AMT_SIGN TEXT,
  OCY_NOM_AMT REAL,
  OCY_INT_AMT_SING TEXT,
  OCY_INT_AMT REAL,
  INT_RT REAL,
  RT_METH TEXT,
  POOL_RT REAL,
  OCY_ORIG_NOM_AMT REAL,
  INT_RT_INT REAL,
  POOL_RT_INT REAL,
  NEXT_BOOK_DT REAL,
  IdCliente INT
);

-- ----------------------------
-- Table structure for PichicataDepos
-- ----------------------------
DROP TABLE IF EXISTS "main"."PichicataDepos";
CREATE TABLE "PichicataDepos" ("CON_NO" TEXT,"STRT_DT" TEXT,"POOL_RT" TEXT);

-- ----------------------------
-- Table structure for ProductoTasa
-- ----------------------------
DROP TABLE IF EXISTS "main"."ProductoTasa";
CREATE TABLE "ProductoTasa" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"PROD"  TEXT NOT NULL,
"CCY"  TEXT NOT NULL,
"IdTasa"  INTEGER NOT NULL,
CONSTRAINT "IdTasa" FOREIGN KEY ("IdTasa") REFERENCES "Tasa" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- Table structure for QueEstado
-- ----------------------------
DROP TABLE IF EXISTS "main"."QueEstado";
CREATE TABLE "QueEstado" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "QueEstado" varchar
);

-- ----------------------------
-- Table structure for QueTasa
-- ----------------------------
DROP TABLE IF EXISTS "main"."QueTasa";
CREATE TABLE "QueTasa" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "QueTasa" varchar
);

-- ----------------------------
-- Table structure for SBIF_A_BO07140926
-- ----------------------------
DROP TABLE IF EXISTS "main"."SBIF_A_BO07140926";
CREATE TABLE "SBIF_A_BO07140926"("CTRY" varchar(3),"INTFDT" float,"SRCID" varchar(14),"CEM" varchar(3),"PROD" varchar(16),"NROOPE" varchar(20),"BOOKDT" float,"AIN" varchar(20),"INDECR" varchar(1),"CODEVC" varchar(3),"OCYSGB" varchar(1),"OCYBAL" float,"LCYSGB" varchar(1),"LCYBAL" float,"LCYSGA" varchar(1),"LCYBAG" float,"BR" varchar(4),"CCCTO" varchar(10));

-- ----------------------------
-- Table structure for SBIF_A_BO29140926
-- ----------------------------
DROP TABLE IF EXISTS "main"."SBIF_A_BO29140926";
CREATE TABLE "SBIF_A_BO29140926"("CTRY" varchar(3),"INTFDT" float,"SRCID" varchar(14),"CEM" varchar(3),"PROD" varchar(16),"NROOPE" varchar(20),"BOOKDT" float,"AIN" varchar(20),"INDECR" varchar(1),"CODEVC" varchar(3),"OCYSGB" varchar(1),"OCYBAL" float,"LCYSGB" varchar(1),"LCYBAL" float,"LCYSGA" varchar(1),"LCYBAG" float,"BR" varchar(4),"CCCTO" varchar(10));

-- ----------------------------
-- Table structure for SBIF_A_INT_OPE
-- ----------------------------
DROP TABLE IF EXISTS "main"."SBIF_A_INT_OPE";
CREATE TABLE "SBIF_A_INT_OPE"("ID_REG" float,"CTRY" varchar(3),"BOOK_DT" timestamp,"INTF_DT" timestamp,"SRC_ID" varchar(14),"CEM" varchar(3),"BR" varchar(4),"CON_STA" varchar(3),"DLNQ_STA" varchar(1),"PROD" varchar(16),"OPEN_DT" timestamp,"LST_ACCR_DT" timestamp,"IDENT_CLI" varchar(12),"CC" varchar(10),"CON_NO" varchar(20),"STRT_DT" timestamp,"END_DT" timestamp,"NEXT_RSET_RT_DT" timestamp,"INT_PYMT_ARRS_IND" varchar(1),"CCY" varchar(4),"OCY_NOM_AMT_SIGN" varchar(1),"OCY_NOM_AMT" float,"LCY_NOM_AMT_SIGN" varchar(1),"LCY_NOM_AMT" float,"FCY_LC_AMT" float,"LCY_REAJ_AMT_SING" varchar(1),"LCY_REAJ_AMT" float,"OCY_INT_AMT_SING" varchar(1),"OCY_INT_AMT" float,"LCY_INT_AMT_SING" varchar(1),"LCY_INT_AMT" float,"FIX_FLTING_IND" varchar(2),"INT_RT_COD" varchar(4),"INT_RT" float,"PNLT_RT" float,"RT_METH" varchar(1),"POOL_RT" float,"POOL_RT_COD" varchar(5),"PNLT_RT_COD" varchar(4),"INT_RT_SPRD" float,"POOL_RT_SPRD" float,"PNLT_RT_SPRD" float,"ASET_LIAB_IND" varchar(1),"SBIF_BAL_NO_REP_SIGN" varchar(1),"SBIF_BAL_NO_REP" float,"SBIF_TIPO_TASA" float,"SBIF_PROD_TRANS" float,"SBIF_TIPO_OPER_TRANS" float,"LCY_FEE_AMT_SIGN" varchar(1),"LCY_FEE_AMT" float,"ORIG_STRT_DT" timestamp,"NACC_FROM_DT" timestamp,"PDUE_FROM_DT" timestamp,"WROF_FROM_DT" timestamp,"ORIG_CON_NO" varchar(20),"NO_OF_REMN_COUP" float,"NO_OF_PDO_COUP" float,"NO_OF_TOT_COUP" float,"SBIF_DEST_COLOC" float,"STOP_ACCR_DT" timestamp,"LST_INT_PYMT_DT" timestamp,"REN_IND" varchar(1),"LST_RSET_DT" timestamp,"NEXT_RT_CH_DT" timestamp,"LST_RT_CH_DT" timestamp,"OCY_ORIG_NOM_AMT" float,"LCY_AVL_BAL" float,"LCY_PDO1_AMT" float,"LCY_PDO2_AMT" float,"LCY_PDO3_AMT" float,"LCY_OPER_AMT" float,"LOC" float,"LCY_MNPY" float,"LGL_ACTN_IND" varchar(1),"LCY_MV" float,"LCY_PAR_VAL" float,"PORT_TYP" float,"NO_RNG" float,"PDC_COUP" float,"PGO_AMT" float,"CON_NO_TYP" varchar(1),"OPE_TYP" varchar(1),"MOD_ENTR_BS" varchar(1),"OPC_COMPRA" float,"IDENT_INSTR" varchar(5),"IDENT_EMI_INST" varchar(15),"SERIE_INST" varchar(4),"SUBSERIE_INST" varchar(4),"CAT_RISK_INSTR" varchar(3),"LIMIT_RATE" float,"PDC_AFTER_FIX_PER" float,"LCY_PDO4_AMT" float,"LCY_PDO5_AMT" float,"LCY_PDO6_AMT" float,"SBIF_NO_REP_IND" varchar(1),"LCY_OTR_CONT_AMT" float,"LCY_PDO7_AMT" float,"LCY_PDO8_AMT" float,"LCY_PDO9_AMT" float,"ASSETS_ORIGIN" varchar(1));

-- ----------------------------
-- Table structure for Segmento
-- ----------------------------
DROP TABLE IF EXISTS "main"."Segmento";
CREATE TABLE "Segmento" ("Id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "Nombre" VARCHAR UNIQUE);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "main"."sqlite_sequence";
CREATE TABLE sqlite_sequence(name,seq);

-- ----------------------------
-- Table structure for Tasa
-- ----------------------------
DROP TABLE IF EXISTS "main"."Tasa";
CREATE TABLE "Tasa" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "Nombre" varchar,
	 "Descripcion" varchar,
	CONSTRAINT "Nombre" UNIQUE (Nombre) ON CONFLICT ABORT
);

-- ----------------------------
-- Table structure for TasaRemuneracionCtaCorriente
-- ----------------------------
DROP TABLE IF EXISTS "main"."TasaRemuneracionCtaCorriente";
CREATE TABLE "TasaRemuneracionCtaCorriente" ("Id" INTEGER PRIMARY KEY NOT NULL UNIQUE, "Periodo" INTEGER, "IdSegmento" INTEGER REFERENCES "Segmento" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT, "Tasa" REAL, CONSTRAINT unq UNIQUE ("Periodo", "IdSegmento"));

-- ----------------------------
-- Table structure for TasasBonos
-- ----------------------------
DROP TABLE IF EXISTS "main"."TasasBonos";
CREATE TABLE "TasasBonos" ("Serie" TEXT,"Tir" REAL);

-- ----------------------------
-- Table structure for TipoArchivo
-- ----------------------------
DROP TABLE IF EXISTS "main"."TipoArchivo";
CREATE TABLE "TipoArchivo" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "Tipo" varchar,
	CONSTRAINT "TipoUnico" UNIQUE ("Tipo" ASC) ON CONFLICT ABORT
);

-- ----------------------------
-- Table structure for TipoInterfaz
-- ----------------------------
DROP TABLE IF EXISTS "main"."TipoInterfaz";
CREATE TABLE "TipoInterfaz" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "Nombre" varchar,
	 "Descripcion" varchar,
	 "idTablaDestino" INTEGER,
	CONSTRAINT "IdTablaDestino" FOREIGN KEY ("idTablaDestino") REFERENCES "DestinoInterfaz" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT "Nombre" UNIQUE (Nombre) ON CONFLICT ABORT
);

-- ----------------------------
-- Table structure for TipoTasa
-- ----------------------------
DROP TABLE IF EXISTS "main"."TipoTasa";
CREATE TABLE "TipoTasa" (
	 "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	 "Tipo" varchar,
	CONSTRAINT "Tipo" UNIQUE (Tipo) ON CONFLICT ABORT
);

-- ----------------------------
-- Table structure for ValorDivisas
-- ----------------------------
DROP TABLE IF EXISTS "main"."ValorDivisas";
CREATE TABLE "ValorDivisas" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"Fecha"  INTEGER,
"idDivisa"  INTEGER,
"ValorDivisa"  REAL,
CONSTRAINT "DIVISAS" FOREIGN KEY ("idDivisa") REFERENCES "Divisas" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT,
CONSTRAINT "VALORDIVISAyIDDIVISA" UNIQUE ("Fecha", "idDivisa")
);

-- ----------------------------
-- Table structure for ValorTasa
-- ----------------------------
DROP TABLE IF EXISTS "main"."ValorTasa";
CREATE TABLE "ValorTasa" (
	 "Id" INTEGER NOT NULL,
	 "Fecha" INTEGER,
	 "idTasa" INTEGER,
	 "Valor" REAL,
	PRIMARY KEY("Id"),
	CONSTRAINT "IdTasa" FOREIGN KEY ("idTasa") REFERENCES "Tasa" ("Id") ON DELETE RESTRICT ON UPDATE RESTRICT
);

-- ----------------------------
-- View structure for CruceCuentasOP07
-- ----------------------------
DROP VIEW IF EXISTS "main"."CruceCuentasOP07";
CREATE VIEW "CruceCuentasOP07" AS 
SELECT t1.CON_NO, t2.NROOPE, t1.OCY_NOM_AMT, t2.OCYBAL, trim(t2.AIN) as AIN FROM OP07 AS t1
INNER JOIN SBIF_A_BO07 as t2 ON t1.CON_NO = t2.NROOPE
AND round(t1.OCY_NOM_AMT) - 1 <= round(t2.OCYBAL)
AND round(t1.OCY_NOM_AMT) + 1 >= round(t2.OCYBAL)
ORDER BY t1.CON_NO;

-- ----------------------------
-- View structure for CruceCuentasOP07_FromCons
-- ----------------------------
DROP VIEW IF EXISTS "main"."CruceCuentasOP07_FromCons";
CREATE VIEW "CruceCuentasOP07_FromCons" AS 
SELECT t1.CON_NO, t2.NROOPE, t1.OCY_NOM_AMT, t2.OCYBAL, trim(t2.AIN) AS AIN
FROM OP07_From_ConsOpSigir AS t1
INNER JOIN SBIF_A_BO07 as t2 ON t1.CON_NO = t2.NROOPE
AND round(t1.OCY_NOM_AMT) - 1 <= round(t2.OCYBAL)
AND round(t1.OCY_NOM_AMT) + 1 >= round(t2.OCYBAL)
ORDER BY t1.CON_NO;

-- ----------------------------
-- View structure for CruceCuentasOP29
-- ----------------------------
DROP VIEW IF EXISTS "main"."CruceCuentasOP29";
CREATE VIEW "CruceCuentasOP29" AS SELECT t1.CON_NO, t2.NROOPE, t1.OCY_NOM_AMT, t2.OCYBAL, t2.AIN FROM OP29 AS t1
INNER JOIN SBIF_A_BO29 as t2 ON t1.CON_NO = t2.NROOPE
AND round(t1.OCY_NOM_AMT) - 1 <= round(t2.OCYBAL)
AND round(t1.OCY_NOM_AMT) + 1 >= round(t2.OCYBAL)
ORDER BY t1.CON_NO;

-- ----------------------------
-- View structure for CruceCuentasOP29_FromCons
-- ----------------------------
DROP VIEW IF EXISTS "main"."CruceCuentasOP29_FromCons";
CREATE VIEW "CruceCuentasOP29_FromCons" AS 
SELECT t1.CON_NO, t2.NROOPE, t1.OCY_NOM_AMT, t2.OCYBAL, trim(t2.AIN) AS AIN
FROM OP29_From_ConsOpSigir AS t1
INNER JOIN SBIF_A_BO29 as t2 ON t1.CON_NO = t2.NROOPE
AND round(t1.OCY_NOM_AMT) - 1 <= round(t2.OCYBAL)
AND round(t1.OCY_NOM_AMT) + 1 >= round(t2.OCYBAL)
ORDER BY t1.CON_NO;

-- ----------------------------
-- View structure for DistintasFuentesDatos
-- ----------------------------
DROP VIEW IF EXISTS "main"."DistintasFuentesDatos";
CREATE VIEW "DistintasFuentesDatos" AS 
SELECT DISTINCT SRC_ID FROM ConsolidadoOperacionesSigir;

-- ----------------------------
-- View structure for FechasEnConsolidadoOperacionesSigir
-- ----------------------------
DROP VIEW IF EXISTS "main"."FechasEnConsolidadoOperacionesSigir";
CREATE VIEW "FechasEnConsolidadoOperacionesSigir" AS 
SELECT DISTINCT BOOK_DT FROM ConsolidadoOperacionesSigir;

-- ----------------------------
-- View structure for OP07
-- ----------------------------
DROP VIEW IF EXISTS "main"."OP07";
CREATE VIEW "OP07" AS 
SELECT * FROM SBIF_A_INT_OPE WHERE trim(SRC_ID) = 'OP07';

-- ----------------------------
-- View structure for OP29
-- ----------------------------
DROP VIEW IF EXISTS "main"."OP29";
CREATE VIEW "OP29" AS 
SELECT * FROM SBIF_A_INT_OPE WHERE trim(SRC_ID) = 'OP29';

-- ----------------------------
-- View structure for Ops_OP07_NoIncluir
-- ----------------------------
DROP VIEW IF EXISTS "main"."Ops_OP07_NoIncluir";
CREATE VIEW "Ops_OP07_NoIncluir" AS 
SELECT CON_NO, OCY_NOM_AMT, AIN FROM CruceCuentasOP07 as t WHERE
t.AIN IN (SELECT GLEDGER FROM APORCuentasGlosas WHERE
Id IN (SELECT IdGLEDGER FROM CuentasExcluidas WHERE SRC_ID = 'OP07'));

-- ----------------------------
-- View structure for Ops_OP07_NoIncluir_FromCons
-- ----------------------------
DROP VIEW IF EXISTS "main"."Ops_OP07_NoIncluir_FromCons";
CREATE VIEW "Ops_OP07_NoIncluir_FromCons" AS 
SELECT CON_NO, OCY_NOM_AMT, AIN FROM CruceCuentasOP07_FromCons as t WHERE
t.AIN IN (SELECT GLEDGER FROM APORCuentasGlosas WHERE
Id IN (SELECT IdGLEDGER FROM CuentasExcluidas WHERE SRC_ID = 'OP07'))
ORDER BY CON_NO;

-- ----------------------------
-- View structure for Ops_OP29_EnCuentasDeOrden
-- ----------------------------
DROP VIEW IF EXISTS "main"."Ops_OP29_EnCuentasDeOrden";
CREATE VIEW "Ops_OP29_EnCuentasDeOrden" AS 
SELECT CruceCuentasOP29.*, APORCuentasGlosas.TPO from CruceCuentasOP29 INNER JOIN APORCuentasGlosas
ON trim(CruceCuentasOP29.AIN) = APORCuentasGlosas.GLEDGER
WHERE trim(APORCuentasGlosas.TPO) <> 'A';

-- ----------------------------
-- View structure for Ops_OP29_EnCuentasDeOrden_FromCons
-- ----------------------------
DROP VIEW IF EXISTS "main"."Ops_OP29_EnCuentasDeOrden_FromCons";
CREATE VIEW "Ops_OP29_EnCuentasDeOrden_FromCons" AS 
SELECT CruceCuentasOP29_FromCons.*, APORCuentasGlosas.TPO from CruceCuentasOP29_FromCons
INNER JOIN APORCuentasGlosas
ON trim(CruceCuentasOP29_FromCons.AIN) = APORCuentasGlosas.GLEDGER
WHERE trim(APORCuentasGlosas.TPO) <> 'A';

-- ----------------------------
-- View structure for ResultadosDiarios
-- ----------------------------
DROP VIEW IF EXISTS "main"."ResultadosDiarios";
CREATE VIEW "ResultadosDiarios" AS SELECT BOOK_DT, SRC_ID, CCY, PROD, DLNQ_STA, Sum(OCY_NOM_AMT) AS SumaDeOCY_NOM_AMT, 
Sum([OCY_NOM_AMT]*[INT_RT])/Sum([OCY_NOM_AMT]) AS TasaProm, Sum(INT_RT_INT) AS SumaDeINT_RT_INT, 
Sum([OCY_NOM_AMT]*[POOL_RT])/Sum([OCY_NOM_AMT]) AS CostProm, Sum(POOL_RT_INT) AS SumaDePOOL_RT_INT
FROM ConsolidadoOperacionesSigir
GROUP BY BOOK_DT, SRC_ID, CCY, PROD, DLNQ_STA, CON_STA
HAVING OCY_NOM_AMT<>0;

-- ----------------------------
-- Indexes structure for table ClienteSegmento
-- ----------------------------
CREATE INDEX "main"."ClienteSegmentoByIDENT_CLI"
ON "ClienteSegmento" ("IDENT_CLI" ASC);

-- ----------------------------
-- Indexes structure for table ConsolidadoOperacionesSigir
-- ----------------------------
CREATE INDEX "main"."BOOK_DT"
ON "ConsolidadoOperacionesSigir" ("BOOK_DT" ASC);
CREATE INDEX "main"."ConsBookDT-SrcId"
ON "ConsolidadoOperacionesSigir" ("BOOK_DT" ASC, "SRC_ID" ASC);
CREATE INDEX "main"."ConsolidadoOperacionesSigir-CCY"
ON "ConsolidadoOperacionesSigir" ("CCY" ASC);
CREATE INDEX "main"."ConsolidadoOperacionesSigir-PROD"
ON "ConsolidadoOperacionesSigir" ("PROD" ASC);
CREATE INDEX "main"."ConsolidadoOperacionesSigir-SRC_ID"
ON "ConsolidadoOperacionesSigir" ("SRC_ID" ASC);

-- ----------------------------
-- Indexes structure for table PichicataDepos
-- ----------------------------
CREATE INDEX "main"."PichicataDepos-CON_NO-STRT_DT"
ON "PichicataDepos" ("CON_NO" ASC, "STRT_DT" ASC);
