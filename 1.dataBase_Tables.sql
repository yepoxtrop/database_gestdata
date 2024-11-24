-- BASE DE DATOS Y TABLAS
-- drop database gestdata;
-- BASE DE DATOS
-- create database gestdata;	
-- use gestdata;

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- cliente
create table cliente(
	idCliente int not null auto_increment,
    nombreComercialCliente varchar(50) not null check(length(nombreComercialCliente)>=5),
    razonSocialCliente varchar(50) not null unique check(length(razonSocialCliente)>=10),
    telefonoCliente bigint not null unique check(length(telefonoCliente)>=10),
    gmailCliente varchar(200) not null unique check(length(gmailCliente)>=10),
    direcionCliente varchar(50) not null check(length(direcionCliente)>=10),
    descripcionCliente varchar(200) not null check(length(descripcionCliente)>=50),
    logoCliente text not null check(length(logoCliente)>=5),
    contrasenaCliente varchar(200) not null default('12345ABCDE') check(length(contrasenaCliente)>=10),
    estadoCliente boolean not null default(true),
    primary key(idCliente)
);

-- sede cliente
create table sedesCliente(
	idSedeCliente int not null auto_increment,
    nitSedeCliente bigint not null unique check(length(nitSedeCliente)>=10),
    nombreSedeCliente varchar(50) not null check(length(nombreSedeCliente)>=5),
    direccionSedeCliente varchar(40) not null check(length(direccionSedeCliente)>=10),
    gmailSedeCliente varchar(200) not null unique check(length(gmailSedeCliente)>=10),
    contrasenaSedeCliente varchar(200) not null default('12345ABCDE') check(length(contrasenaSedeCliente)>=10),
    telefonoSedeCliente bigint not null unique check(length(telefonoSedeCliente)>=10),
    departamentoSedeCliente  enum('Amazonas','Antioquía','Arauca','Atlántico','Bolívar','Boyacá',
									   'Caldas','Caquetá','Casanare','Cauca','Cesar','Chocó','Córdoba',
                                       'Cundinamarca','Guainía','Guaviare','Huila','La Guajira','Magdalena',
                                       'Meta','Nariño','Norte de Santander','Putumayo','Quindío','Risaralda',
                                       'San Andrés y Providencia','Santander','Sucre','Tolima','Valle del Cauca',
                                       'Vaupés','Vichada','Distrito Capital') not null default('Distrito Capital'),
    logoSedeCliente text not null check(length(logoSedeCliente)>=5),
    nombreEncargadoSedeCliente varchar(50) not null check(length(nombreEncargadoSedeCliente)>=10),
    telefonoEncargadoSedeCliente bigint not null unique check(length(telefonoEncargadoSedeCliente)>=10),
    gmailEncargadoSedeCliente varchar(200) not null unique check(length(gmailEncargadoSedeCliente)>=10),
    fotoEncargadoSedeCliente text not null check(length(fotoEncargadoSedeCliente)>=5),
    idClienteFk int not null,
    estadoSede boolean not null default(true),
    primary key(idSedeCliente)
);

-- empresa fumigadora
create table empresaFumigadora(
	idEmpresaFumigadora int not null auto_increment,
    fotoLogoEmpresaFumigadora text not null check(length(fotoLogoEmpresaFumigadora)>=5),
    nitEmpresaFumigadora bigint not null unique check(length(nitEmpresaFumigadora)>=10),
    nombreEmpresaFumigadora varchar(50) not null check(length(nombreEmpresaFumigadora)>=10),
    direccionEmpresaFumigadora varchar(50) not null check(length(direccionEmpresaFumigadora)>=10),
    departamentoEmpresaFumigadora enum('Amazonas','Antioquía','Arauca','Atlántico','Bolívar','Boyacá',
									   'Caldas','Caquetá','Casanare','Cauca','Cesar','Chocó','Córdoba',
                                       'Cundinamarca','Guainía','Guaviare','Huila','La Guajira','Magdalena',
                                       'Meta','Nariño','Norte de Santander','Putumayo','Quindío','Risaralda',
                                       'San Andrés y Providencia','Santander','Sucre','Tolima','Valle del Cauca',
                                       'Vaupés','Vichada','Distrito Capital') not null default('Distrito Capital'),
    contrasenaEmpresaFumigadora varchar(200) not null default('12345ABCDE') check(length(contrasenaEmpresaFumigadora)>=10),
    descripcionEmpresaFumigadora  varchar(200) not null check(length(descripcionEmpresaFumigadora)>=50),
    telefonoEmpresaFumigadora bigint not null unique check(length(telefonoEmpresaFumigadora)>=10),
    gmailEmpresaFumigadora varchar(200) not null unique check(length(gmailEmpresaFumigadora)>=10),
    nombreEncargadoEmpresaFumigadora varchar(50) not null check(length(nombreEncargadoEmpresaFumigadora)>=10),
    gmailEncargadoEmpresaFumigadora varchar(200) not null unique check(length(gmailEncargadoEmpresaFumigadora)>=10),
    telefonoEncargadoEmpresaFumigadora bigint not null unique check(length(telefonoEncargadoEmpresaFumigadora)>=10),
    fotoEncargadoEmpresaFumigadora text not null check(length(fotoEncargadoEmpresaFumigadora)>=5),
    estadoEmpresa boolean not null default(true),
    primary key(idEmpresaFumigadora)
);

-- empleado
create table empleado(
	idEmpleado int not null auto_increment,
    nombresEmpleado varchar(50) not null check(length(nombresEmpleado)>=10),
    apellidosEmpleado varchar(50) not null check(length(apellidosEmpleado)>=10),
    numeroTelefonicoEmpleado bigint not null check(length(numeroTelefonicoEmpleado)=10),
    correoEmpresarialEmpleado varchar(200) not null unique check(length(correoEmpresarialEmpleado)>=10),
    correoPersonalEmpleado varchar(200) not null unique check(length(correoPersonalEmpleado)>=10),
    contrasenaEmpleado varchar(200) not null default('12345ABCDE') check(length(contrasenaEmpleado)>=10),
    estadoEmpleado bool default(true),
    idEmpresaFumigadoraFk int not null,
    primary key(idEmpleado)
);



-- servicio
create table servicio(
	idServicio int not null auto_increment,
    descripcionServicio text(500) not null check(length(descripcionServicio)>=50),
    fechaSolicitudServicio date not null default(curdate()),
    fechaInicioServicio date default(null),
    fechaFinalServicio date default(null),
    nivelInfestacionDetallesServicio enum('alto', 'medio', 'bajo') not null default('medio'),
    prioridadServicio enum('baja', 'media', 'alta') not null default('media'),
    estadoServicio enum('en espera', 'finalizado') not null default('en espera'),
    idSedeClienteFk int not null,
    idEmpleadoFk int default(null),
    primary key(idServicio)
);

-- clases 
create table clases(
	idClases int not null auto_increment,
    nombreClases varchar(200) not null check(length(nombreClases)>=10),
    primary key(idClases)
);

-- caracteristica
create table caracteristicas(
	idCaracteristicas int not null auto_increment,
    nombreCaracteristicas varchar(200) not null check(length(nombreCaracteristicas)>=10),
    idClasesFk int not null,
    primary key(idCaracteristicas)
);


-- detallesServicio
create table detallesServicio(
	idDetalle int not null auto_increment,
	valorDetalle text(500) not null check(length(valorDetalle)>=30),
    idCaracteristicaFk int not null,
    idServicioFk int not null,
    primary key(idDetalle)
);


-- antecedentes
create table antecedentes(
	idAntecedentes int not null auto_increment,
    descripcionAntecedentes varchar(200) not null check(length(descripcionAntecedentes)>=100),
    nivelGravedadAntecedentes enum('baja', 'media', 'alta') not null,
    primary key(idAntecedentes)
);

-- historial antecedentes
create table historialAntecedentes(
	idHistorialAntecedentes int not null auto_increment,
	idAntecedentesFk int not null,
    idSedeClienteFk int not null, 
    primary key(idHistorialAntecedentes)
);


-- licencias
create table licencias(
	idLicencia int not null auto_increment,
    nombreLicencia varchar(50) not null unique check(length(nombreLicencia)>=10),
    descripcionLicencia varchar(300) not null check(length(descripcionLicencia)>=50),
    duracionLicencia int not null,
    primary key(idLicencia)
);

-- metodosPagoSoftware
create table metodosPagoSoftware(
	idMetodoPagoSoftware int not null auto_increment,
    nombreMetodoPagoSoftware varchar(100) not null check(length(nombreMetodoPagoSoftware)>=10),
    descripcionMetodoPagoSoftware varchar(100) not null check(length(descripcionMetodoPagoSoftware)>=10),
    primary key(idMetodoPagoSoftware)
);

-- rentaSoftware
create table rentaSoftware(
	idRentaSoftware int not null auto_increment,
    estadoRentaSoftware boolean not null default(false),
    duracionRenta date null default(null),
    idEmpresaFumigadoraFk int not null,
    primary key(idRentaSoftware)
);


-- pagosSoftware
create table pagosSoftware(
	idPagosSoftware int not null auto_increment,
    subTotalPagosSoftware float not null,
    fechaPagosSoftware date not null default(curdate()),
    totalPagosSoftware float not null ,
    idPaypalPago varchar(100) not null,
    verificacionPago boolean not null,
    idRentaSoftwareFk int not null,
    idLicenciaFk int not null,
    idMediosPagoFk int not null default(1),
    primary key(idPagosSoftware)
);

/*AUTOR LUIS Á.SARMIENTO DÍAZ*/
