create database TransporteEscolar
go

Use TransporteEscolar
go

CREATE TABLE CriteriosDePrecio (
    diCriterio int  NOT NULL,
    Distancia varchar(50)  NOT NULL,
    CantEstu int  NOT NULL,
    InicioContrato date  NOT NULL,
    FinDelContrado date  NOT NULL,
    Precio decimal(2,2)  NOT NULL,
    TipoDeServi char(1)  NOT NULL,
    CONSTRAINT CriteriosDePrecio_pk PRIMARY KEY  (diCriterio)
);
go

CREATE TABLE Estudiantes (
    idEstu int  NOT NULL,
    Nombre varchar(50)  NOT NULL,
    Apellido varchar(50)  NOT NULL,
    Direccion varchar(100)  NOT NULL,
    TipoEstu char(1)  NOT NULL,
    HoraDeEntra datetime  NOT NULL,
    HoraDeSalida datetime  NOT NULL,
    CriteriosDePrecio_diCriterio int  NOT NULL,
    CONSTRAINT Estudiantes_pk PRIMARY KEY  (idEstu)
);
go

CREATE TABLE MiniBuses (
    idminiBus int  NOT NULL,
    NroPlaca varchar(10)  NOT NULL,
    Estudiantes_idEstu int  NOT NULL,
    RegistroRecorido_idRegis int  NOT NULL,
    CONSTRAINT MiniBuses_pk PRIMARY KEY  (idminiBus)
);
go

CREATE TABLE Personal (
    idChoferes int  NOT NULL,
    Nombre varchar(50)  NOT NULL,
    Apellido varchar(50)  NOT NULL,
    Turno char(1)  NOT NULL,
    Dni varchar(8)  NOT NULL,
    TipodeLicen char(1)  NOT NULL,
    TipoPersonal char(1)  NOT NULL,
    Estado char(1)  NOT NULL,
    Turnos_idTurnos int  NOT NULL,
    MiniBuses_idminiBus int  NOT NULL,
    CONSTRAINT Personal_pk PRIMARY KEY  (idChoferes)
);
go

CREATE TABLE RegistroRecorido (
    idRegis int  NOT NULL,
    HoraDeSalida datetime  NOT NULL,
    HoraDeEntrada datetime  NOT NULL,
    CantPapeleta int  NOT NULL,
    ParoPorPoli char(1)  NOT NULL,
    CambioRuta char(2)  NOT NULL,
    NuevaRuta varchar(100)  NOT NULL,
    CantKilome int  NOT NULL,
    CONSTRAINT RegistroRecorido_pk PRIMARY KEY  (idRegis)
);
go

CREATE TABLE Turnos (
    idTurnos int  NOT NULL,
    Turno varchar(20)  NOT NULL,
    Ruta varchar(100)  NOT NULL,
    CONSTRAINT Turnos_pk PRIMARY KEY  (idTurnos)
);
go
-- foreign keys
-- Reference: Estudiantes_CriteriosDePrecio (table: Estudiantes)
ALTER TABLE Estudiantes ADD CONSTRAINT Estudiantes_CriteriosDePrecio
    FOREIGN KEY (CriteriosDePrecio_diCriterio)
    REFERENCES CriteriosDePrecio (diCriterio);

-- Reference: MiniBuses_Estudiantes (table: MiniBuses)
ALTER TABLE MiniBuses ADD CONSTRAINT MiniBuses_Estudiantes
    FOREIGN KEY (Estudiantes_idEstu)
    REFERENCES Estudiantes (idEstu);

-- Reference: MiniBuses_RegistroRecorido (table: MiniBuses)
ALTER TABLE MiniBuses ADD CONSTRAINT MiniBuses_RegistroRecorido
    FOREIGN KEY (RegistroRecorido_idRegis)
    REFERENCES RegistroRecorido (idRegis);

-- Reference: Personal_MiniBuses (table: Personal)
ALTER TABLE Personal ADD CONSTRAINT Personal_MiniBuses
    FOREIGN KEY (MiniBuses_idminiBus)
    REFERENCES MiniBuses (idminiBus);

-- Reference: Personal_Turnos (table: Personal)
ALTER TABLE Personal ADD CONSTRAINT Personal_Turnos
    FOREIGN KEY (Turnos_idTurnos)
    REFERENCES Turnos (idTurnos);

-- End of file.

