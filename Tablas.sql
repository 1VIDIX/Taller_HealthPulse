CREATE TABLE Pacientes (
    paciente_id SERIAL,
    cedula VARCHAR(20),
    nombre VARCHAR(255),
    fecha_nacimiento DATE,
    tipo_sangre VARCHAR(10),

    CONSTRAINT pk_pacientes PRIMARY KEY (paciente_id),
    CONSTRAINT uq_pacientes_cedula UNIQUE (cedula)
);

CREATE TABLE Personal_Medico (
    id SERIAL,
    nombre VARCHAR(255),
    tarjeta_p VARCHAR(50),
    especialidad VARCHAR(100),

    CONSTRAINT pk_personal_medico PRIMARY KEY (id),
    CONSTRAINT uq_personal_tarjeta UNIQUE (tarjeta_p)
);

CREATE TABLE Citas_Medicas (
    id SERIAL,
    paciente_id INTEGER,
    medico_id INTEGER,
    agenda TIMESTAMP,
    motivo VARCHAR(255),

    CONSTRAINT pk_citas_medicas PRIMARY KEY (id),

    CONSTRAINT fk_citas_paciente 
        FOREIGN KEY (paciente_id) 
        REFERENCES Pacientes(paciente_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_citas_medico 
        FOREIGN KEY (medico_id) 
        REFERENCES Personal_Medico(id)
        ON DELETE SET NULL
);

CREATE TABLE Historial (
    id SERIAL,
    cita_id INTEGER,
    diagnostico VARCHAR(255),
    tratamiento VARCHAR(255),

    CONSTRAINT pk_historial PRIMARY KEY (id),

    CONSTRAINT fk_historial_cita 
        FOREIGN KEY (cita_id) 
        REFERENCES Citas_Medicas(id)
        ON DELETE CASCADE
);

CREATE TABLE Signos_Vitales (
    id SERIAL,
    paciente_id INTEGER,
    frecuencia INTEGER,
    temperatura NUMERIC(5,2),
    fecha_hora TIMESTAMP,

    CONSTRAINT pk_signos_vitales PRIMARY KEY (id),

    CONSTRAINT fk_signos_paciente 
        FOREIGN KEY (paciente_id) 
        REFERENCES Pacientes(paciente_id)
        ON DELETE RESTRICT
);
