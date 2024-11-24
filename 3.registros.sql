
-- cliente
select *from cliente;

-- sede cliente

select *from sedesCliente;

-- empresa fumigadora 

-- empleado

-- servicio
select *from servicio;

-- clases
insert into clases (nombreClases) VALUES
('MEDIDAS PREVENTIVAS'),
('REPORTE DE SERVICIO'),
('OBSERVACIONES');
select *from clases;

describe servicio;
-- caracteristicas
insert into caracteristicas (nombreCaracteristicas, idClasesFk) VALUES
('Área disponible para el tratamiento.', 1),
('Área se encuyentra libre de personal ajeno a la tarea.', 1),
('Material sensible a contaminación, se encuentra protegido.', 1),
('Se contemplan materiales idóneos y buen estado para la contención química.', 1),
('Previo a los tratamientos se informo a los entes externos(Bomberos, policia, etc)', 1),
('Están infomradas áreas adyacentes, sobre el tratamiento a realizar.', 1),
('Se ha identificado, ubicado los equipos de emergencia y en buen estado para su uso.', 1),
('Áreas libres de fuentes de ignición y sensores o alarmas desactivadas.', 1),
('De ser acompañado por el cliente, cuenta sus EPP idóneos.', 1),
('Aplicador cuenta con los elementos de protección personal.', 1),
('Se realiza señalización en el área a tratar', 1),
('Numero RGSP', 2),
('Ingrediente activo', 2),
('Nombre comercial', 2),
('Disolución y/o aplicación', 2),
('Cantidad aplicada', 2),
('Método de aplicación', 2),
('Tipo de control', 2),
('Organismos objetivos', 2),
('Sitio de aplicación', 2),
('Hora de tratamiento(Incio)', 2),
('Hora de tratamiento(Final)', 2),
('Presencia de plaga(Incio)', 2),
('Observaciones generales', 3),
('Tiempo de cuarentena', 2),
('Observaciones en mejoras de limpipeza', 3),
('Observaciones en mejoras de infraestructura', 3),
('Observaciones de malas practicas del personal', 3),
('Identificación de riesgos en SST', 3);

select *from caracteristicas;
describe caracteristicas;


-- detalles de servicio
/*
INSERT INTO detallesServicio (valorDetalle, idCaracteristicaFk, idServicioFk) VALUES
('El area trata si se encontraba disponible para el tratamiento', 1, 16),
('El area a tratar se encontraba en condiciones aptas, sin personal de la empresa que interfiriera en las actividades de fumigación', 2, 16),
('Material propio de la empresa cliente se protegió de la forma más apta para evitar complicaciones', 3, 16),
('Hubo una exitosa identificaciòn de los pertinentes riesgos sst', 21, 16),
('Si aplica, si se pudo completar la coeciòn de material idonea para dichas acciones', 4, 16),
('Si se le proporcionò informaciòn del proceso a las utoridades competentes', 5, 16),
('No aplica, legalmente no se le informa a otras areas del proceso a desarrollar', 6, 16),
('La sede de la empresa no cuenta con el material necesario para prevenir o atender emergencias posibles', 7, 16),
('Làs areas cuenta con la ventilación necesaria para realizar el servicio', 8, 16);
*/

select *from servicio;

-- antecedentes
INSERT INTO antecedentes (descripcionAntecedentes, nivelGravedadAntecedentes) VALUES
('Paciente ha mostrado signos de ansiedad severa durante las últimas semanas. Se recomienda una evaluación psicológica más profunda para determinar el nivel de impacto en su vida diaria y desarrollar un plan de tratamiento adecuado.', 'alta'),
('El paciente presenta antecedentes de migrañas recurrentes que se han intensificado en los últimos meses. Es importante revisar su historial médico y ajustar su medicación para aliviar los síntomas.', 'media'),
('Paciente ha tenido episodios ocasionales de dolor en el pecho que se describen como leves y no han sido persistentes. Se sugiere realizar un chequeo cardiovascular para descartar cualquier problema serio.', 'baja'),
('El paciente ha estado lidiando con episodios de insomnio intermitente que afectan su calidad de vida. Se recomienda una evaluación para determinar las posibles causas y considerar intervenciones para mejorar su sueño.', 'media'),
('Paciente con antecedentes de diabetes tipo 2 que ha experimentado fluctuaciones en los niveles de glucosa. Es crucial monitorear su dieta y tratamiento para mantener un control adecuado de su condición.', 'alta'),
('El paciente tiene antecedentes de alergias estacionales que afectan su bienestar durante ciertos períodos del año. Es importante gestionar estos síntomas con medicación preventiva y cambios en el estilo de vida.', 'baja'),
('Paciente ha presentado síntomas de depresión leve durante el último año. Se recomienda seguir un plan de tratamiento psicológico y, si es necesario, considerar opciones farmacológicas.', 'media'),
('El paciente ha sufrido una lesión deportiva reciente que ha resultado en un esguince leve. Es importante seguir las indicaciones de rehabilitación para una recuperación completa y prevenir futuros problemas.', 'baja'),
('Paciente ha tenido antecedentes de hipertensión arterial que ha sido tratada con éxito con medicación. Es fundamental continuar con el monitoreo regular de la presión arterial y seguir las recomendaciones médicas.', 'media'),
('El paciente presenta antecedentes de asma que se han controlado bien con el uso de inhaladores. Es recomendable continuar con el seguimiento regular para ajustar el tratamiento si es necesario.', 'baja'),
('Paciente ha experimentado una pérdida de peso significativa en los últimos meses sin causa aparente. Se debe realizar una evaluación exhaustiva para identificar posibles causas subyacentes.', 'alta'),
('El paciente ha tenido episodios recurrentes de dolores articulares que afectan su movilidad. Se recomienda realizar estudios adicionales para determinar la causa y ajustar el tratamiento según sea necesario.', 'media'),
('Paciente con antecedentes de problemas digestivos que incluyen dolor abdominal y cambios en los hábitos intestinales. Es importante realizar pruebas diagnósticas para identificar la causa y adaptar el tratamiento.', 'alta'),
('El paciente ha mostrado signos de fatiga crónica que afectan su capacidad para realizar actividades diarias. Es esencial llevar a cabo una evaluación completa para determinar las causas y tratar adecuadamente.', 'media'),
('Paciente ha tenido antecedentes de infecciones recurrentes de las vías urinarias que requieren tratamiento con antibióticos. Se debe considerar una evaluación para identificar posibles problemas subyacentes.', 'baja'),
('Paciente ha tenido antecedentes de colesterol elevado que se maneja con dieta y medicación. Es importante continuar con el monitoreo regular para prevenir complicaciones cardiovasculares.', 'media'),
('El paciente ha experimentado episodios ocasionales de mareos que podrían estar relacionados con problemas de equilibrio. Es recomendable realizar estudios para determinar la causa y tratar los síntomas.', 'baja'),
('Paciente con antecedentes de problemas de salud mental, incluyendo ansiedad y estrés crónico. Es fundamental implementar un plan de tratamiento integral que incluya apoyo psicológico y cambios en el estilo de vida.', 'alta'),
('El paciente ha tenido antecedentes de úlceras gástricas que se han tratado con éxito con medicación. Se recomienda continuar con el seguimiento regular para evitar posibles recaídas y ajustar el tratamiento según sea necesario.', 'media');

select *from antecedentes;

-- historial antecedentes

select *from historialAntecedentes;

-- licencias
INSERT INTO licencias (nombreLicencia, descripcionLicencia, duracionLicencia) VALUES
('Membresía Platino', 'Es ideal para pequeñas empresas de gestión de plagas que buscan mejorar la eficiencia operativa básica. Incluye las herramientas esenciales para registrar y gestionar la información de los servicios, programación de citas, y almacenamiento de reportes.', 180),
('Membresía Gold', 'Está diseñada para empresas medianas que requieren funcionalidades avanzadas de gestión y análisis de datos. Esta licencia incluye más capacidad de almacenamiento y funciones adicionales que mejoran la eficiencia en la operación.', 270),
('Membresía Rubi', 'Es la opción más completa para grandes empresas de gestión de plagas. Ofrece acceso ilimitado a todas las funcionalidades del software, incluyendo la personalización de todo tipo de flujo de trabajo y el almacenamiento masivo de datos.', 365);

select *from licencias;

-- metodos pagos
INSERT INTO metodosPagoSoftware (nombreMetodoPagoSoftware, descripcionMetodoPagoSoftware) VALUES
('Tarjeta de Crédito Paypal', 'Pago mediante tarjeta de crédito con cobertura nacional.');

select *from metodosPagoSoftware;

-- renta
select * from rentaSoftware;

-- pagosSoftware
select * from pagosSoftware;
