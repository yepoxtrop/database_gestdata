-- RELACIONES

-- Cliente a sede cliente
alter table sedesCliente
add constraint cliente_sedeCliente
foreign key(idClienteFk) references cliente(idCliente);

-- Sede cliente a historial antecedentes
alter table historialAntecedentes
add constraint sedeCliente_historialAntecedentes
foreign key(idSedeClienteFk) references sedesCliente(idSedeCliente);

-- Antecedentes a historial antecedentes
alter table historialAntecedentes
add constraint antecedentes_historialAntecedentes
foreign key(idAntecedentesFk) references antecedentes(idAntecedentes);

-- Sede cliente a servicio
alter table servicio
add constraint sedeCliente_servicio
foreign key(idSedeClienteFk) references sedesCliente(idSedeCliente);

-- Empleado a servicio
alter table servicio
add constraint empleado_servicio
foreign key(idEmpleadoFk) references empleado(idEmpleado);

-- Empresa fumigadora a empleado
alter table empleado
add constraint empresaFumigadora_empleado
foreign key(idEmpresaFumigadoraFk) references empresaFumigadora(idEmpresaFumigadora);

-- Empresa fumigadora a renta software
alter table rentaSoftware
add constraint empresaFumigadora_rentaSoftware
foreign key(idEmpresaFumigadoraFk) references empresaFumigadora(idEmpresaFumigadora);

-- Renta software a pagos software
alter table pagosSoftware
add constraint rentaSoftware_pagosSoftware
foreign key(idRentaSoftwareFk) references rentaSoftware(idRentaSoftware);

-- Licencia a pagos software
alter table pagosSoftware
add constraint licencia_pagosSoftware
foreign key(idLicenciaFk) references licencias(idLicencia);

-- Metodos pago a pagos software
alter table pagosSoftware
add constraint metodosPago_pagosSoftware
foreign key(idMediosPagoFk) references metodosPagoSoftware(idMetodoPagoSoftware);

-- Servicio a detalles servicio
alter table detallesServicio
add constraint servicio_detallesServicio
foreign key(idServicioFk) references servicio(idServicio);

-- Caracteristicas a a detalles servicio
alter table detallesServicio
add constraint caracteristicas_detallesServicio
foreign key(idCaracteristicaFk) references caracteristicas(idCaracteristicas);

-- Clave a caracteristicas
alter table caracteristicas
add constraint clases_caracteristicas
foreign key(idClasesFk) references clases(idClases);
