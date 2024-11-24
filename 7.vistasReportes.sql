-- REPORTES
describe reporte_servicio;
-- 1.metodos de pago + licencias + pago software
create view reporte_pagos as
select  
    pagossoftware.idPagosSoftware as 'id pago', 
    pagossoftware.subTotalPagosSoftware as 'subtotal pago', 
    pagossoftware.fechaPagosSoftware as 'fecha pago', 
    pagossoftware.totalPagosSoftware as 'total pago', 
    pagossoftware.idPaypalPago as 'id paypal', 
    pagossoftware.verificacionPago as 'verificación pago',  
    licencias.nombrelicencia as 'nombre licencia', 
    licencias.descripcionlicencia as 'descripción licencia', 
    licencias.duracionlicencia as 'duración licencia (días)', 
    metodospagosoftware.nombreMetodoPagoSoftware as 'nombre método de pago', 
    metodospagosoftware.descripcionMetodoPagoSoftware as 'descripción método de pago' 
from  
    pagossoftware 
inner join  
    licencias on pagossoftware.idlicenciafk = licencias.idlicencia 
inner join  
    metodospagosoftware on pagossoftware.idmediospagofk = metodospagosoftware.idmetodopagosoftware; 
    
select *from reporte_pagos;

-- 2.cliente + sede cliente
create view reporte_clientes as
select  
    cliente.idcliente as 'id cliente', 
    cliente.nombrecomercialcliente as 'nombre comercial cliente', 
    cliente.telefonocliente as 'teléfono cliente', 
    cliente.gmailcliente as 'gmail cliente', 
    cliente.direcioncliente as 'dirección cliente', 
    cliente.descripcioncliente as 'descripción cliente', 
    cliente.contrasenacliente as 'contraseña cliente', 
    sedescliente.idsedecliente as 'id sede', 
    sedescliente.nitsedecliente as 'nit sede', 
    sedescliente.nombresedecliente as 'nombre sede', 
    sedescliente.direccionsedecliente as 'dirección sede',
    sedescliente.gmailsedecliente as 'gmail sede', 
    sedescliente.contrasenasedecliente as 'contraseña sede', 
    sedescliente.telefonosedecliente as 'teléfono sede', 
    sedescliente.departamentosedecliente as 'departamento sede', 
    sedescliente.nombreencargadosedecliente as 'nombre encargado sede', 
    sedescliente.telefonoencargadosedecliente as 'teléfono encargado sede', 
    sedescliente.gmailencargadosedecliente as 'gmail encargado sede' 
from  
    cliente 
inner join  
    sedescliente on cliente.idcliente = sedescliente.idclientefk; 
    
select *from reporte_clientes;

-- 3.caracteristicas + detalles de servicio + clases
-- 4.servicio + empleado + empresa fumigadora + clases + caracteristicas + detalle de servicio
create view reporte_servicio
as select servicio.idServicio,
		  servicio.descripcionServicio,
          servicio.fechaSolicitudServicio,
          servicio.fechaInicioServicio,
          servicio.fechaFinalServicio,
          servicio.nivelInfestacionDetallesServicio,
          servicio.estadoServicio,
          sedesCliente.nombreSedeCliente,
          empresaFumigadora.nombreEmpresaFumigadora,
          empleado.nombresEmpleado,
          empleado.apellidosEmpleado,
          clases.nombreClases,
          caracteristicas.nombreCaracteristicas,
          detallesServicio.valorDetalle
from servicio
inner join sedesCliente on servicio.idSedeClienteFk = sedesCliente.idSedeCliente
inner join empleado on servicio.idEmpleadoFk = empleado.idEmpleado
inner join empresaFumigadora on empresaFumigadora.idEmpresaFumigadora = empleado.idEmpresaFumigadoraFk
inner join detallesServicio on servicio.idServicio = detallesServicio.idServicioFk
inner join caracteristicas on caracteristicas.idCaracteristicas = detallesServicio.idCaracteristicaFk
inner join clases on clases.idClases = caracteristicas.idClasesFk;

select *from datos_servicio where fechaSolicitudServicio = '2024-08-22 09:00:00';
