-- PROCEDIMIENTOS ALMACENADOS

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- CLIENTE
-- 1.crear
delimiter //
create procedure InsertarCliente (
				nombreCliente varchar(50),
				razonSocialCli varchar(50),
              	  	        telefonoCli bigint,
                                gmailCli varchar(65),
                                direcionCli varchar(50),
                                descripcionCli varchar(200),
                                logoCli text,
                                contrasenaCli varchar(20)
								)
BEGIN
		insert into cliente(
				nombreComercialCliente,
                                razonSocialCliente,
                                telefonoCliente,
                                gmailCliente,
                                direcionCliente,
                                descripcionCliente,
                                logoCliente,
                                contrasenaCliente)
        values(
			nombreCliente,
			razonSocialCli,
			telefonoCli,
			gmailCli,
			direcionCli,
			descripcionCli,
			logoCli,
			contrasenaCli
        );
END//

CALL InsertarCliente(
    'Fumigaciones XYZ',                       
    'Fumigaciones XYZ S.A.S.',                
    3001234567,                               
    'empresa@correo.com',                     
    'Calle Falsa 123',                        
    'Descripción de la empresa de fumigaciones que ofrece servicios de alta calidad.', 
    'ruta/al/logo.png',                       
    'contrasena123'                           
);

-- 2.consultar
DELIMITER //

CREATE PROCEDURE Obtener_clientes_con_sedes()
BEGIN
    SELECT 
        cliente.idCliente,
        cliente.nombreComercialCliente,
        cliente.razonSocialCliente,
        sedesCliente.nombreSedeCliente,
        sedesCliente.telefonoSedeCliente
    FROM 
        cliente
    INNER JOIN 
        sedesCliente ON cliente.idCliente = sedesCliente.idClienteFk;
END //

CALL Obtener_clientes_con_sedes();

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- SEDE CLIENTE
-- 1.crear
delimiter //
create procedure InsertarSedesCliente (
					nitSede bigint,
                                        nombreSede varchar(50),
                                        direccionSede varchar(40),
                                        gmailSede varchar(100),
                                        contrasenaSede varchar(20),
                                        telefonoSede bigint,
                                        departamentoSede enum('Amazonas','Antioquía','Arauca','Atlántico','Bolívar','Boyacá',
					'Caldas','Caquetá','Casanare','Cauca','Cesar','Chocó','Córdoba',
					'Cundinamarca','Guainía','Guaviare','Huila','La Guajira','Magdalena',
					'Meta','Nariño','Norte de Santander','Putumayo','Quindío','Risaralda',
					'San Andrés y Providencia','Santander','Sucre','Tolima','Valle del Cauca',
					'Vaupés','Vichada','Distrito Capital'),
                                        
					logoSede text ,
                                        nombreEncargadoSede varchar(50),
                                        telefonoEncargadoSede bigint,
                                        gmailEncargadoSede  varchar(100),
                                        fotoEncargadoSede text,
                                        id_ClienteFk int)
BEGIN
		insert into sedesCliente(
									nitSedeCliente,
									nombreSedeCliente,
									direccionSedeCliente,
									gmailSedeCliente,
									contrasenaSedeCliente,
									telefonoSedeCliente,
									departamentoSedeCliente,
									logoSedeCliente,
									nombreEncargadoSedeCliente,
									telefonoEncargadoSedeCliente,
									gmailEncargadoSedeCliente,
									fotoEncargadoSedeCliente,
                                    idClienteFk
								)
        values(
				nitSede,
				nombreSede,
				direccionSede,
				gmailSede,
				contrasenaSede,
				telefonoSede,
				departamentoSede,
				logoSede,
				nombreEncargadoSede,
				telefonoEncargadoSede,
				gmailEncargadoSede,
				fotoEncargadoSede,
                id_ClienteFk
        );
END//
CALL InsertarSedesCliente(
    1234567870,                             
    'Sede Principal',                       
    'Calle Falsa 456',                     
    'sede@empresa.com',                    
    'contrasena123',                        
    35408534467,                             
    'Antioquía',                            
    'ruta/al/logo.png',                     
    'Juan Pérez',                           
    3704654321,                             
    'juan.perez@empresa.com',              
    'ruta/al/foto.jpg',
    1
    
);

-- 2.consultar
DELIMITER //

CREATE PROCEDURE obtener_sedes_cliente_con_empleado()
BEGIN
    SELECT 
        sedesCliente.idSedeCliente,
        sedesCliente.nombreSedeCliente,
        sedesCliente.telefonoSedeCliente,
        sedesCliente.nombreEncargadoSedeCliente,
        sedesCliente.telefonoEncargadoSedeCliente,
        sedesCliente.gmailEncargadoSedeCliente
    FROM 
        sedesCliente;
END //

CALL obtener_sedes_cliente_con_empleado();



-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- EMPRESA FUMIGADORA
-- 1.crear
delimiter //
create procedure InsertarEmpresaFumigadora (
				 LogoEmpresaFumigadora text,
				 nitEmpresa bigint,
				 nombreEmpresa varchar(50),
				 direccionEmpresa varchar(50),
				 departamentoEmpresa enum('Amazonas','Antioquía','Arauca','Atlántico','Bolívar','Boyacá',
										  'Caldas','Caquetá','Casanare','Cauca','Cesar','Chocó','Córdoba',
										  'Cundinamarca','Guainía','Guaviare','Huila','La Guajira','Magdalena',
										  'Meta','Nariño','Norte de Santander','Putumayo','Quindío','Risaralda',
										  'San Andrés y Providencia','Santander','Sucre','Tolima','Valle del Cauca',
										  'Vaupés','Vichada','Distrito Capital'),
				contrasenaEmpresa varchar(20),
				descripcionEmpresa varchar(200),
				telefonoEmpresa bigint,
				gmailEmpresa varchar(50),
				nombreEncargadoEmpresa varchar(50),
				gmailEncargadoEmpresa varchar(50),
				telefonoEncargadoEmpresa bigint,
				fotoEncargadoEmpresa text
											)
BEGIN
		insert into EmpresaFumigadora
        (
			fotoLogoEmpresaFumigadora,
			nitEmpresaFumigadora, 
			nombreEmpresaFumigadora,
			direccionEmpresaFumigadora, 
			departamentoEmpresaFumigadora, 
			contrasenaEmpresaFumigadora,
			descripcionEmpresaFumigadora, 
			telefonoEmpresaFumigadora, 
			gmailEmpresaFumigadora ,
			nombreEncargadoEmpresaFumigadora, 
            gmailEncargadoEmpresaFumigadora, 
			telefonoEncargadoEmpresaFumigadora,
			fotoEncargadoEmpresaFumigadora
		)
        values
        (
			LogoEmpresaFumigadora,
			nitEmpresa,
			nombreEmpresa,
			direccionEmpresa,
			departamentoEmpresa,
			contrasenaEmpresa,
			descripcionEmpresa,
			telefonoEmpresa,
			gmailEmpresa,
			nombreEncargadoEmpresa,
			gmailEncargadoEmpresa,
			telefonoEncargadoEmpresa,
			fotoEncargadoEmpresa
		);
END//

CALL InsertarEmpresaFumigadora(
    'ruta/al/logo.png',        -- LogoEmpresaFumigadora
    1234567890,                -- nitEmpresa
    'Fumigaciones XYZ',        -- nombreEmpresa
    'Calle Falsa 123',         -- direccionEmpresa
    'Antioquía',               -- departamentoEmpresa
    'contrasena123',           -- contrasenaEmpresa
    'Esta es una descripción detallada de la empresa Fumigaciones XYZ, que ofrece servicios de fumigación de alta calidad y atención al cliente excepcional.', -- descripcionEmpresa (al menos 50 caracteres)
    3531234567,                -- telefonoEmpresa
    'empresa@correo.com',      -- gmailEmpresa
    'Juan Pérez',              -- nombreEncargadoEmpresa
    'juan.perez@correo.com',   -- gmailEncargadoEmpresa
    3007974321,                -- telefonoEncargadoEmpresa
    'ruta/al/foto.jpg'         -- fotoEncargadoEmpresa
);

-- 2.consultar
DELIMITER //

CREATE PROCEDURE Obtener_empresa_con_empleados()
BEGIN
    SELECT 
        empresaFumigadora.idEmpresaFumigadora,
        empresaFumigadora.nombreEmpresaFumigadora,
        empresaFumigadora.telefonoEmpresaFumigadora,
        empresaFumigadora.gmailEmpresaFumigadora,
        empleado.nombresEmpleado,
        empleado.apellidosEmpleado
    FROM 
        empresaFumigadora
    INNER JOIN 
        empleado ON empresaFumigadora.idEmpresaFumigadora = empleado.idEmpresaFumigadoraFk;
END //

CALL Obtener_empresa_con_empleados();
-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- EMPLEADO
-- 1.crear
Delimiter //
create procedure crearEmplados(nombres_Empleado varchar(50),
							   apellidos_Empleado varchar(50),
							   numero_Telefonico bigint,
							   correo_Empresaria varchar(50),
							   correo_Personal varchar(50),
							   contrasena_Empleado varchar(20),
							   id_EmpresaFumigadoraFk int)
begin 
	insert into empleado (nombresEmpleado, 
						  apellidosEmpleado, 
                          numeroTelefonicoEmpleado, 
                          correoEmpresarialEmpleado, 
                          correoPersonalEmpleado, 
                          contrasenaEmpleado, 
                          idEmpresaFumigadoraFk)
	values(nombres_Empleado,
		   apellidos_Empleado,
			numero_Telefonico,
			correo_Empresaria,
			correo_Personal,
			contrasena_Empleado,
			id_EmpresaFumigadoraFk);
end
//

call crearEmplados('Rodrigo Andrés Martínez', 'García López', 2345678901, 'carlos.andres141414@empresa.com', 'carlos.martinez414141@gmail.com', '12345ABCDE', 1)
select *from empleado where idEmpresaFumigadoraFk = 1


-- 2.consultar
Delimiter //
create procedure consultarEmplados(id_Empresa int)
begin
	select empresaFumigadora.nombreEmpresaFumigadora,
		   empleado.nombresEmpleado,
		   empleado.apellidosEmpleado,
           empleado.correoEmpresarialEmpleado,
           empleado.numeroTelefonicoEmpleado
	from  empleado
    inner join empresafumigadora on empresaFumigadora.idEmpresaFumigadora = empleado.idEmpresaFumigadoraFk
    where empresafumigadora.idEmpresaFumigadora = id_Empresa;
end
//

call consultarEmplados(1);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- SERVICIO
-- 1.crear
Delimiter //
create procedure crearServicio(descripcion_Servicio text(500) ,
							   fecha_SolicitudServicio datetime ,
							   fecha_InicioServicio datetime,
							   fecha_FinalServicio datetime,
							   nivel_InfestacionDetallesServicio enum('alto', 'medio', 'bajo') ,
							   prioridad_Servicio enum('baja', 'media', 'alta') ,
							   estado_Servicio enum('en espera', 'finalizado') ,
							   certificado_Servicio text,
							   reporte_Servicio text,
							   idSede_ClienteFk int,
							   id_EmpleadoFk int)
begin
	insert into servicio(descripcionServicio, 
						 fechaSolicitudServicio, 
                         fechaInicioServicio, 
                         fechaFinalServicio, 
                         nivelInfestacionDetallesServicio, 
                         prioridadServicio, 
                         estadoServicio, 
                         certificadoServicio, 
                         reporteServicio, 
                         idSedeClienteFk, 
                         idEmpleadoFk)
	values(descripcion_Servicio,
			fecha_SolicitudServicio,
			fecha_InicioServicio,
			fecha_FinalServicio,
			nivel_InfestacionDetallesServicio,
			prioridad_Servicio,
			estado_Servicio,
			certificado_Servicio,
			reporte_Servicio,
			idSede_ClienteFk,
			id_EmpleadoFk);
end
//

call crearServicio('Servicio de limpieza profunda en oficinas de alto tráfico para eliminar plagas y asegurar un ambiente seguro y libre de infestaciones.', '2024-08-22 09:00:00', NULL, NULL, 'alto', 'alta', 'en espera', 'Certificado123', 'Reporte123', 1, 1)

-- 2.consultar
Delimiter //
create procedure consultarServicio(id_Servicio int)
begin
	select servicio.idServicio,
		   servicio.descripcionServicio,
           clases.nombreClases,
           caracteristicas.nombreCaracteristicas,
           detallesServicio.valorDetalle
	from servicio
    inner join detallesServicio on servicio.idServicio = detallesServicio.idServicioFk
    inner join caracteristicas on caracteristicas.idCaracteristicas = detallesServicio.idCaracteristicaFk
    inner join clases on clases.idClases = caracteristicas.idClasesFk
    where servicio.idServicio = id_Servicio;
end
//

call consultarServicio(1);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- CLASES
-- 1.crear
Delimiter //
create procedure registrarclases ( nombre_Clases varchar(200))
begin 
	insert into clases (nombreClases) values (nombre_Clases);
end
//
call registrarclases ('Durabdfsdfdragilidald Alta');

-- 2.consulta
Delimiter //
create procedure consultarclases(id_clases int)
begin
	select clases.nombreClases,
		   caracteristicas.nombreCaracteristicas,
           detallesservicio.valorDetalle
	from clases
    inner join caracteristicas on clases.idClases= caracteristicas.idClasesFk
    inner join detallesservicio on caracteristicas.idCaracteristicas = detallesservicio.idCaracteristicaFk
    where clases.idClases = id_clases;
end
//
call consultarclases(1);


-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- CARACTERISTICAS
-- 1.consultar
Delimiter //
create procedure consultarCaracterisicas( id_Caracteristicas int)
begin 
	select clases.nombreClases,
		   caracteristicas.nombreCaracteristicas
	from clases
    inner join caracteristicas on clases.idClases = caracteristicas.idClasesFk
    where clases.idClases =  id_Caracteristicas;
end
//
call consultarCaracterisicas(1);

-- 2.crear
Delimiter //
create procedure registrarcaracteristicas ( nombre_Caracteristicas varchar(200),id_ClasesFk int)
Begin
	insert into caracteristicas (nombreCaracteristicas, idClasesFk) values (nombre_Caracteristicas, id_ClasesFk);
end
//
call registrarcaracteristicas ('Durabilidald Alta',5);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- detallesServicio
-- 1.consultar
Delimiter //
create procedure registrardetallesservicio ( valor_Detalle text(500),
										    id_CaracteristicaFk int,id_ServicioFk int)
begin
	insert into detallesservicio (valorDetalle,idCaracteristicaFk,idServicioFk) values (valor_Detalle,id_CaracteristicaFk,id_ServicioFk);
end
//


call registrardetallesservicio ('Durabdfsdfsdsda<sdadragilidald Alta',1,1);


-- 2.consultar
Delimiter //
create procedure consuldetallesservicio(id_Detalle int)
begin
	select servicio.descripcionServicio,
		   servicio.fechaSolicitudServicio,
           servicio.fechaInicioServicio,
           servicio.fechaFinalServicio,
           servicio.nivelInfestacionDetallesServicio,
           servicio.prioridadServicio,
           servicio.estadoServicio,
           servicio.certificadoServicio,
           servicio.reporteServicio,
           caracteristicas.nombreCaracteristicas,
           detallesservicio.valorDetalle
	from servicio
    inner join detallesservicio on servicio.idServicio = detallesservicio.idServicioFk
    inner join caracteristicas on detallesservicio.idCaracteristicaFk = caracteristicas.idCaracteristicas
    where servicio.idServicio = id_Detalle;
end
//

call consuldetallesservicio(5);


-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- ANTECEDENTES
-- 1.registrar
Delimiter //
create procedure crearAntecedentes(
     descripcion_antecedentes varchar(200),
     nivel_gravedadAntecedentes enum('baja', 'media', 'alta'))
begin
    insert into antecedentes (descripcionAntecedentes, nivelGravedadAntecedentes)
    values (descripcion_antecedentes, nivel_gravedadAntecedentes);
end 
//
call crearAntecedentes('Incidente menor de seguridad que no afectó la operativa pero requirió ajustes en las políticas de seguridad.', 'baja');

-- 2.consultar
Delimiter //
create procedure consultarAntecedentes(id_Antecedentes int)
begin 
	select *from antecedentes where antecedentes.idAntecedentes = id_Antecedentes;
end
//

call consultarAntecedentes(1)

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- HISTORIAL ANTECEDENTES
-- 1.consultar
Delimiter //
create procedure consultarAntecedentesHistorial(id_hitorial int) 
begin 
	select antecedentes.descripcionAntecedentes,
		   historialAntecedentes.idSedeClienteFk,
           sedesCliente.nombreSedeCliente
	from antecedentes 
    inner join historialAntecedentes on antecedentes.idAntecedentes = historialAntecedentes.idAntecedentesFk
    inner join sedesCliente on sedesCliente.idSedeCliente = historialAntecedentes.idSedeClienteFk
    where antecedentes.idAntecedentes = id_hitorial;
end
//

call consultarAntecedentesHistorial(1)

-- 2.crear
Delimiter //
create procedure registrarAntecedentesHistorial(id_AntecedentesFk int,
												id_SedeClienteFk int)
Begin
	insert into historialAntecedentes (idAntecedentesFk, idSedeClienteFk) values (id_AntecedentesFk, id_SedeClienteFk);
end
//

call registrarAntecedentesHistorial(1,1);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- licencias
-- 1.crear
DELIMITER //
CREATE PROCEDURE registrar_licencias(
    IN Nombre_Licencia VARCHAR(50),
    IN Descripcion_Licencia VARCHAR(100),
    IN Duracion_Licencia INT
)
BEGIN
    INSERT INTO licencias (nombreLicencia, descripcionLicencia, duracionLicencia)
    VALUES (Nombre_Licencia, Descripcion_Licencia, Duracion_Licencia);
END 
//

CALL registrar_licencias(
    'Licencia de Software A',
    'Esta es una licencia para uso personal que permite el uso de software en un solo dispositivo.',
    365
);

-- 2.consultar
DELIMITER //

CREATE PROCEDURE consultar_licencias(IN idLicencia INT)
BEGIN
    SELECT 
        licencias.idLicencia,
        licencias.nombreLicencia,
        licencias.descripcionLicencia,
        licencias.duracionLicencia,
        
        pagosSoftware.subTotalPagosSoftware,
        pagosSoftware.impuestoPagosSoftware,
        pagosSoftware.fechaPagosSoftware,
        pagosSoftware.totalPagosSoftware,
        pagosSoftware.verificacionPago,
        pagosSoftware.facturaPago
    FROM 
        licencias
    INNER JOIN 
        pagosSoftware ON licencias.idLicencia = pagosSoftware.idLicenciaFk
    INNER JOIN 
        rentaSoftware ON pagosSoftware.idRentaSoftwareFk = rentaSoftware.idRentaSoftware
    WHERE 
        licencias.idLicencia = idLicencia;
END//
CALL consultar_licencias(1);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- metodosPagoSoftware
-- 1.crear
DELIMITER //

CREATE PROCEDURE insertar_metodo_pago(nombre_Metodo_Pago_Software VARCHAR(100),
									  descripcion_Metodo_Pago_Software VARCHAR(100)
)
BEGIN
    INSERT INTO metodosPagoSoftware (nombreMetodoPagoSoftware, descripcionMetodoPagoSoftware)
    VALUES (nombre_Metodo_Pago_Software, descripcion_Metodo_Pago_Software);
END//

CALL insertar_metodo_pago('Tarjeta de Crédito', 'Pago mediante tarjeta de crédito con cobertura internacional.');

-- 2.consultar
DELIMITER //

CREATE PROCEDURE consultar_metodos_pago(IN idMetodoPagoSoftware INT)
BEGIN
    SELECT 
        metodosPagoSoftware.idMetodoPagoSoftware,
        metodosPagoSoftware.nombreMetodoPagoSoftware,
        metodosPagoSoftware.descripcionMetodoPagoSoftware,
        pagosSoftware.idPagosSoftware,
        pagosSoftware.subTotalPagosSoftware,
        pagosSoftware.impuestoPagosSoftware,
        pagosSoftware.fechaPagosSoftware,
        pagosSoftware.totalPagosSoftware,
        pagosSoftware.verificacionPago,
        pagosSoftware.facturaPago,
        licencias.idLicencia,
        licencias.nombreLicencia,
        licencias.descripcionLicencia
    FROM 
        metodosPagoSoftware
    INNER JOIN 
        pagosSoftware ON metodosPagoSoftware.idMetodoPagoSoftware = pagosSoftware.idMediosPagoFk
    INNER JOIN 
        licencias ON pagosSoftware.idLicenciaFk = licencias.idLicencia
    WHERE 
        metodosPagoSoftware.idMetodoPagoSoftware = idMetodoPagoSoftware;
END//

CALL consultar_metodos_pago(1);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- rentaSoftware
-- 1.crear
DELIMITER //

CREATE PROCEDURE registrar_renta_software(
    IN Estado_Renta_Software TINYINT(1),
    IN Prueba_Gratuita_Renta_Software TINYINT(1),
    IN Duracion_Licencia DATETIME,
    IN IdEmpresa_FumigadoraFk INT(11)
)
BEGIN
    INSERT INTO rentaSoftware (estadoRentaSoftware, pruebaGratuitaRentaSoftware, duracionRenta, idEmpresaFumigadoraFk)
    VALUES (Estado_Renta_Software, Prueba_Gratuita_Renta_Software, Duracion_Licencia, IdEmpresa_FumigadoraFk);
END //

CALL registrar_renta_software(1, 0, '2024-08-01 00:00:00', 1);

-- 2.consultar
DELIMITER //

CREATE PROCEDURE consultar_renta_software(id_RentaSoftware int)
BEGIN
    select rentasoftware.estadoRentaSoftware, 
    rentasoftware.pruebaGratuitaRentaSoftware, 
    rentasoftware.duracionRenta, 
    
    empresafumigadora.nombreEmpresaFumigadora,
    empresafumigadora.direccionEmpresaFumigadora,
    empresafumigadora.departamentoEmpresaFumigadora,
    empresafumigadora.contrasenaEmpresaFumigadora,
    empresafumigadora.descripcionEmpresaFumigadora,
    empresafumigadora.telefonoEmpresaFumigadora,
    empresafumigadora.gmailEmpresaFumigadora,
    empresafumigadora.nombreEncargadoEmpresaFumigadora,
    empresafumigadora.gmailEncargadoEmpresaFumigadora,
    empresafumigadora.telefonoEncargadoEmpresaFumigadora,
    empresafumigadora.fotoEncargadoEmpresaFumigadora,
    
    pagossoftware.facturaPago,
    pagossoftware.fechaPagosSoftware,
    pagossoftware.totalPagosSoftware,
    pagossoftware.verificacionPago,
    pagossoftware.subTotalPagosSoftware,
    pagossoftware.impuestoPagosSoftware
    from empresafumigadora 
    inner join rentasoftware on rentasoftware.idEmpresaFumigadoraFk = empresafumigadora.idEmpresaFumigadora
    inner join pagossoftware on pagossoftware.idRentaSoftwareFk = rentasoftware.idRentaSoftware
    where empresafumigadora.idEmpresaFumigadora = id_RentaSoftware;
END //

CALL consultar_renta_software(1);

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- PAGOS SOFTWARE
-- 1.cosultar
Delimiter //
create procedure consultarpago(idPagos_Software int)
begin 
	select pagossoftware.totalPagosSoftware,
		   pagossoftware.verificacionPago,
           pagossoftware.facturaPago,
           rentasoftware.estadoRentaSoftware,
           rentasoftware.duracionRenta,
           metodospagosoftware.nombreMetodoPagoSoftware
		   from  rentasoftware
    inner join pagossoftware on rentasoftware.idRentaSoftware = pagossoftware.idRentaSoftwareFk
    inner join metodospagosoftware on pagossoftware.idMediosPagoFk = metodospagosoftware.idMetodoPagoSoftware
    where rentasoftware.idRentaSoftware = idPagos_Software;
end
//

call consultarpago(1);

-- 2.crear
Delimiter //
create procedure registrarPagos(subTotal_PagosSoftware float,
								impuesto_PagosSoftware float,
								fecha_PagosSoftware datetime,
								total_PagosSoftware float,
								numTarjeta_PagosSoftware bigint,
								verificacion_Pago boolean,
                                factura_pago text,
								id_RentaSoftwareFk int,
								id_LicenciaFk int,
								id_MediosPagoFk int)
begin 
	insert into pagosSoftware (subTotalPagosSoftware, 
							   impuestoPagosSoftware, 
                               fechaPagosSoftware, 
                               totalPagosSoftware, 
                               numTarjetaPagosSoftware, 
                               verificacionPago, 
                               facturaPago,
                               idRentaSoftwareFk, 
                               idLicenciaFk, 
                               idMediosPagoFk)
	values (subTotal_PagosSoftware,
			impuesto_PagosSoftware,
			fecha_PagosSoftware,
			total_PagosSoftware,
			numTarjeta_PagosSoftware,
			verificacion_Pago,
            factura_pago,
			id_RentaSoftwareFk,
			id_LicenciaFk,
			id_MediosPagoFk);
end
//
call registrarPagos(100.00, 0.10, '2024-08-01 09:00:00', 110.00, 1234567890123456, TRUE, ' asdhahgsdfhgasd', 1, 1, 1);
