CREATE TABLE Paciente1(
		idPaciente	int				NOT NULL,
		nombre		varchar(50)		NULL,
		apellido	varchar(50)		NULL,
		fNacimiento	date			NULL,
		domicilio	varchar(50)		NULL,
		idPais		char(3)			NULL,
		telefono	varchar(20)		NULL,
		email		varchar(30)		NULL,
		observacion	varchar(1000)	NULL,
		fechaAlta	datetime		NOT NULL,

		CONSTRAINT PK_idpaciente PRIMARY KEY (idPaciente)
)

CREATE TABLE Historia (
		idHistoria		INT IDENTITY(1,1)	NOT NULL,
		fechaHistoria	DATETIME			NULL,
		observacion		VARCHAR(2000)		NULL,

		CONSTRAINT PK_idhistoria PRIMARY KEY (idHistoria)
)

CREATE TABLE Pais (
		idPais		CHAR(3)		NOT NULL,
		pais		VARCHAR(30)	NOT NULL,

		CONSTRAINT PK_idpais PRIMARY KEY (idPais)
)

CREATE TABLE Turno (
		idTurno			INT	IDENTITY(1,1)	NOT NULL,
		fechaTurno		DATETIME			NOT NULL,
		estado			SMALLINT			NOT NULL,
		observacion		VARCHAR(300)		NOT NULL,

		CONSTRAINT PK_idturno PRIMARY KEY (idTurno)
)

CREATE TABLE TurnoEstado (
		idEstado		SMALLINT NOT NULL,
		descripcion		VARCHAR(50) NULL,

		CONSTRAINT PK_idestado PRIMARY KEY (idEstado)
)

CREATE TABLE Especialidad(
		idEspecialidad		INT IDENTITY(1,1) NOT NULL,
		especialidad		VARCHAR(30) NULL,

		CONSTRAINT PK_idespecialidad PRIMARY KEY (idEspecialidad)
)

CREATE TABLE Pago (
		idPago			INT IDENTITY (1,1)	NOT NULL PRIMARY KEY,
		concepto		TINYINT				NOT NULL,
		fecha			DATETIME			NOT NULL,
		monto			MONEY				NOT NULL,
		estado			TINYINT				NULL,
		observacion		VARCHAR(1000)		NULL
)

CREATE TABLE PagoPaciente (
		idPago		INT		NOT NULL,
		idPaciente	INT		NOT NULL,
		idTurno		INT		NOT NULL

		PRIMARY KEY (idPago, idPaciente, idTurno)
)

CREATE TABLE Medico (
		idMedico		INT IDENTITY(1,1)	NOT NULL,
		nombre			VARCHAR(50)			NOT NULL,
		apellido		VARCHAR(50)			NOT NULL,

		CONSTRAINT PK_idmedico PRIMARY KEY(idMedico)
)

CREATE TABLE MedicoEspecialidad (
		idMedico		INT				NOT NULL,
		idEspecialidad	INT				NOT NULL,
		descripcion		VARCHAR(50)		NULL,

		PRIMARY KEY(idMedico, idEspecialidad)
)

CREATE TABLE Concepto(
		idConcepto		TINYINT IDENTITY(1,1)		NOT NULL PRIMARY KEY,
		descripcion		VARCHAR(100)
);

CREATE TYPE medico FROM INT NOT NULL

CREATE TYPE turno FROM INT NOT NULL

CREATE TYPE historia FROM INT NOT NULL

CREATE TYPE observacion FROM VARCHAR(1000) NULL