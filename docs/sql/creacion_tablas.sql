-----------------------------------------------------------------------
-- CREACIÓN DE TABLAS BASADAS EN LA VERSIÓN 02 DEL DIAGRAMA DE CLASES
-----------------------------------------------------------------------

------------------------
-- [01] CLASES FUERTES
------------------------

CREATE TABLE Usuario (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    fechaNacimiento DATE NOT NULL,
    password TEXT NOT NULL,
    telefono TEXT
);

---------------------------------------
-- [02] CLASES DEPENDIENTES - NIVEL 1
---------------------------------------

CREATE TABLE Paciente (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    fechaRegistro DATE NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

CREATE TABLE Terapeuta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    descripcion TEXT,
    experienciaAnios INTEGER,
    calificacionPromedio REAL,
    genero TEXT,
    pais TEXT,
    especialidades TEXT,
    idiomas TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

---------------------------------------
-- [03] CLASES DEPENDIENTES - NIVEL 2
---------------------------------------

CREATE TABLE Cita (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    paciente_id INTEGER NOT NULL,
    terapeuta_id INTEGER NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    tipo TEXT NOT NULL,
    estado TEXT NOT NULL,
    tarifa REAL NOT NULL,
    duracion INTEGER NOT NULL,
    modalidad TEXT NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id),
    FOREIGN KEY (terapeuta_id) REFERENCES Terapeuta(id)
);

CREATE TABLE MetodoPago (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    paciente_id INTEGER NOT NULL,
    tipo TEXT NOT NULL,
    numeroTarjeta TEXT NOT NULL,
    vencimiento DATE NOT NULL,
    nombreTitular TEXT NOT NULL,
    tipoDocumento TEXT NOT NULL,
    numeroDocumento TEXT NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id)
);

CREATE TABLE Horario (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    terapeuta_id INTEGER NOT NULL,
    diaSemana TEXT NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    FOREIGN KEY (terapeuta_id) REFERENCES Terapeuta(id)
);

CREATE TABLE Resenia (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    paciente_id INTEGER NOT NULL,
    terapeuta_id INTEGER NOT NULL,
    puntaje INTEGER NOT NULL,
    comentario TEXT,
    fecha DATE NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id),
    FOREIGN KEY (terapeuta_id) REFERENCES Terapeuta(id)
);

CREATE TABLE Notificacion (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    usuario_id INTEGER NOT NULL,
    mensaje TEXT NOT NULL,
    fechaEnvio DATE NOT NULL,
    vista BOOLEAN NOT NULL DEFAULT 0,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id)
);

---------------
-- [04] ENUMS
---------------

CREATE TABLE Enum_DiaSemana (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE Enum_TipoCita (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE Enum_EstadoCita (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE Enum_TipoDocumento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE Enum_EstadoRevision (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE Enum_Genero (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE Enum_Modalidad (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);

CREATE TABLE Enum_Especialidad (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE
);
