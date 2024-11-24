-- objetos de actualizacion

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////
-- cliente
delimiter // 
create procedure actualizar_telefono_cliente( 
    in id_cliente int, 
    in nuevo_telefono bigint 
) 
begin 
    update cliente 
    set telefonocliente = nuevo_telefono 
    where idcliente = id_cliente; 
end // 


call actualizar_Telefono_Cliente(1, 1234567890);

-- sede cliente
DELIMITER //

CREATE PROCEDURE actualizar_Direccion_Sede_Cliente(
    IN id_Sede_Cliente INT,
    IN nueva_Direccion VARCHAR(40)
)
BEGIN
    UPDATE sedesCliente
    SET direccionSedeCliente = nueva_Direccion
    WHERE idSedeCliente = id_Sede_Cliente;
END //


CALL actualizar_Direccion_Sede_Cliente(1, 'Nueva Dirección 123');


-- empresa fumigadora
delimiter // 
create procedure actualizar_descripcion_empresa( 
    in id_empresafumigadora int, 
    in nueva_descripcion varchar(200) 
) 
begin 
    update empresafumigadora 
    set descripcionempresafumigadora = nueva_descripcion 
    where idempresafumigadora = id_empresafumigadora; 
end // 

call actualizar_Descripcion_Empresa(1, 'una forma de saber que tumbalacasamame de la empresa fumigadora, teniendo en cuenta la cantidad de valores asignados para esta');


-- empleado
delimiter //
create procedure actualizar_empleado(id_empleado int,
									 numeroTelefonico bigint,
                                     correoPersonal varchar(50))
begin
	update empleado 
    set numeroTelefonicoEmpleado = numeroTelefonico,
    correoPersonalEmpleado = correoPersonal
    where idEmpleado = id_empleado;
end
//
call actualizar_empleado(1,3173792233,'sarmientodiazluisangel@gmail.com');

-- servicio
delimiter //
create procedure actualizar_servicio(id_servicio int,
									 estado enum('en espera', 'finalizado'),
									 fecha_inicio datetime)
begin
	update servicio 
    set estadoServicio = estado,
    fechaInicioServicio = fecha_inicio
    where idServicio = id_servicio;
end
//

call actualizar_servicio(1, 'finalizado','2024-08-22 10:30:00');

-- clases 
Delimiter //
create procedure updateClases(id_Clases int,nombre_Clases varchar(200))
begin
update clases set
nombreClases = nombre_Clases
where idClases  = id_Clases;
end //
call updateClases(1,"Matemdátwwñiicas dAvwwqqggdaws I");


-- caracteristica
Delimiter //
create procedure updatecaracteristicas(id_Caracteristicas int,nombre_Caracteristicas varchar(200))
begin
update caracteristicas set
nombreCaracteristicas = nombre_Caracteristicas
where idCaracteristicas  = id_Caracteristicas;
end //
call updatecaracteristicas(1,"Matemdátwwñiicas dAvwwqqggdaws I");


-- detallesServicio
Delimiter //
create procedure updatedetallesservicio(id_Detalle int,valor_Detalle text)
begin
update detallesservicio set
valorDetalle = valor_Detalle
where idDetalle  = id_Detalle;
end //
call updatedetallesservicio(1,"Matemdátwwñiicas dAvwwqqggdaws I");


-- antecedentes
Delimiter //
create procedure actualizar_antecedente(id_antecedente int,
										descripcion varchar(200))
begin
	update antecedentes 
    set descripcionAntecedentes = descripcion
    where idAntecedentes = id_antecedente ; 
end
//

call actualizar_antecedente(1, 'El paciente presenta antecedentes de migrañas recurrentes que se han intensificado en los últimos meses. Es importante revisar su historial médico y ajustar su medicación para aliviar los síntomas.')

-- licencias
delimiter // 
create procedure actualizar_duracion_licencia( 
    in id_licencia int, 
    in nueva_duracion int 
) 
begin 
    update licencias 
    set duracionlicencia = nueva_duracion 
    where idlicencia = id_licencia; 
end // 

-- EJECUTAR UPDATE LICENCIAS
call actualizar_duracion_licencia(1, 362);


-- metodosPagoSoftware
delimiter // 
create procedure actualizar_nombre_metodo_pago( 
    in id_metodo_pago int, 
    in nuevo_nombre varchar(100) 
) 
begin 
    update metodospagosoftware 
    set nombremetodopagosoftware = nuevo_nombre 
    where idmetodopagosoftware = id_metodo_pago; 
end // 


call actualizar_Nombre_Metodo_Pago(1, 'Pago con Tarjeta de Crédito wazaa');

-- rentaSoftware
delimiter // 
create procedure actualizar_duracion_renta( 
    in id_renta int, 
    in nueva_duracion datetime 
) 
begin 
    update rentasoftware 
    set duracionrenta = nueva_duracion 
    where idrentasoftware = id_renta; 
end // 


call actualizar_Duracion_Renta(1, '2025-12-31 23:59:59');

-- pagosSoftware
Delimiter //
create procedure updatepagossoftware(id_PagosSoftware int,subTotal_PagosSoftware float,numTarjeta_PagosSoftware bigint(20))
begin
update pagossoftware set
subTotalPagosSoftware = subTotal_PagosSoftware,
numTarjetaPagosSoftware = numTarjeta_PagosSoftware
where idPagosSoftware  = id_PagosSoftware;
end //
call updatepagossoftware(1,55,222222322222);


