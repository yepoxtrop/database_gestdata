-- TRIGGERS
-- 1.clases
create table Guardado(
id_Clases int ,
    nombre_Clases varchar(200)
);

DELIMITER //
create trigger copia_de_seguridad
before update on clases
for each row
begin
insert into Guardado (id_Clases,nombre_Clases)
  values(OLD.idClases,OLD.nombreClases);
end //



-- 2.empleados
create table actualizaciones_empleado(
	id_Empleado int,
    nombres_Empleado varchar(50),
    apellidos_Empleado varchar(50),
    numero_TelefonicoEmpleado bigint,
    correo_EmpresarialEmpleado varchar(50),
    correo_PersonalEmpleado varchar(50),
    contrasena_Empleado varchar(20),
    idEmpresa_FumigadoraFk int
);
describe   actualizaciones_empleado;
select *from actualizaciones_empleado

Delimiter //
create trigger guardar_datos_antiguos
before update on empleado for each row
begin
	insert into actualizaciones_empleado(id_Empleado,
										nombres_Empleado,
										apellidos_Empleado,
										numero_TelefonicoEmpleado,
										correo_EmpresarialEmpleado,
										correo_PersonalEmpleado,
										contrasena_Empleado,
										idEmpresa_FumigadoraFk)
	values(old.idEmpleado,
		   old.nombresEmpleado,
           old.apellidosEmpleado,
           old.numeroTelefonicoEmpleado,
           old.correoEmpresarialEmpleado,
           old.correoPersonalEmpleado,
           old.contrasenaEmpleado,
           old.idEmpresaFumigadoraFk);
end
//

call actualizar_empleado(1,3173795656,'slsarmiento73@soy.sena.edu.co');


-- CLIENTES ACTUALIZADO
CREATE TABLE auditoria_cliente (
    idAuditoria INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    nombreComercialCliente VARCHAR(50),
    razonSocialCliente VARCHAR(50),
    telefonoCliente BIGINT(20),
    gmailCliente VARCHAR(65),
    direccionCliente VARCHAR(50),
    descripcionCliente VARCHAR(200),
    logoCliente TEXT,
    contrasenaCliente VARCHAR(20),
    fechaCambio DATETIME,
    operacion VARCHAR(10)
);


DELIMITER //
CREATE TRIGGER Despues_Actualizar_Cliente
AFTER UPDATE ON cliente
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_cliente (
        idCliente,
        nombreComercialCliente,
        razonSocialCliente,
        telefonoCliente,
        gmailCliente,
        direccionCliente,
        descripcionCliente,
        logoCliente,
        contrasenaCliente,
        fechaCambio,
        operacion
    )
    VALUES (
        OLD.idCliente,
        OLD.nombreComercialCliente,
        OLD.razonSocialCliente,
        OLD.telefonoCliente,
        OLD.gmailCliente,
        OLD.direcionCliente, 
        OLD.descripcionCliente,
        OLD.logoCliente,
        OLD.contrasenaCliente,
        NOW(),
        'UPDATE'
    );
END //


UPDATE cliente
SET direcionCliente = 'Nueva Dirección'
WHERE idCliente = 20;


SELECT * FROM auditoria_cliente WHERE idCliente = 20;



-- LICENCIAS ELIMINADAS  

CREATE TABLE licenciasAnteriores (
    idLicencia_anterior INT,
    nombreLicencia_anterior VARCHAR(50),
    descripcionLicencia_anterior VARCHAR(100),
    duracionLicencia_anterior INT,
    fechaEliminacion_anterior DATETIME
);


delimiter //
CREATE TRIGGER after_licencias_update
AFTER UPDATE ON licencias
FOR EACH ROW
BEGIN
    INSERT INTO licenciasanteriores (
        idLicencia_anterior, 
        nombreLicencia_anterior, 
        descripcionLicencia_anterior, 
        duracionLicencia_anterior, 
        fechaEliminacion_anterior
    )
    VALUES (
        OLD.idLicencia, 
        OLD.nombreLicencia, 
        OLD.descripcionLicencia, 
        OLD.duracionLicencia, 
        NOW()
    );
END //



INSERT INTO licencias (nombreLicencia, descripcionLicencia, duracionLicencia)
VALUES ('Licencia Provisional', 'Licencia temporal con todas las características necesarias para pruebas iniciales y evaluación.', 15);


UPDATE licencias
SET nombreLicencia = 'Licencia Provisional Actualizada',
    descripcionLicencia = 'Esta licencia ha sido actualizada para incluir más características avanzadas y extender su duración.',
    duracionLicencia = 30
WHERE nombreLicencia = 'Licencia Provisional';


select * from licenciasanteriores

