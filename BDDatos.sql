SET FOREIGN_KEY_CHECKS = 0; 
TRUNCATE TABLE basetecnoquim.MAQUINARIA;
TRUNCATE TABLE basetecnoquim.USUARIO;
TRUNCATE TABLE basetecnoquim.TRABAJADOR;
TRUNCATE TABLE basetecnoquim.ROL;
TRUNCATE TABLE basetecnoquim.PROYECCION_VENTA;
TRUNCATE TABLE basetecnoquim.INSUMO;
TRUNCATE TABLE basetecnoquim.PRODUCTO;
TRUNCATE TABLE basetecnoquim.INSTRUCTIVO;
TRUNCATE TABLE basetecnoquim.POLITICA_DE_STOCK;
TRUNCATE TABLE basetecnoquim.PLAN_MAESTRO_PRODUCCION;
TRUNCATE TABLE basetecnoquim.ALMACEN;
TRUNCATE TABLE basetecnoquim.LINEA_INSUMO;
TRUNCATE TABLE basetecnoquim.DETALLE_MAQUINARIA;
TRUNCATE TABLE basetecnoquim.ORDEN_PRODUCCION;
TRUNCATE TABLE basetecnoquim.LINEA_ORDEN;
TRUNCATE TABLE basetecnoquim.DETALLE_ALMACEN_INSUMO;
TRUNCATE TABLE basetecnoquim.DETALLE_ALMACEN_PRODUCTO;
TRUNCATE TABLE basetecnoquim.LINEA_PROYECCION;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO ROL (ID_ROL,DESCRIPCION) VALUES (1,"JEFE DE PRODUCCION");
INSERT INTO ROL (ID_ROL,DESCRIPCION) VALUES (2,"GERENTE GENERAL");
INSERT INTO ROL (ID_ROL,DESCRIPCION) VALUES (3,"JEFE DE VENTA");
INSERT INTO ROL (ID_ROL,DESCRIPCION) VALUES (4,"JEFE DE CONTROL DE CALIDAD");
INSERT INTO ROL (ID_ROL,DESCRIPCION) VALUES (5,"JEFE DE MANTENIMIENTO");
INSERT INTO ROL (ID_ROL,DESCRIPCION) VALUES (6,"JEFE DE ALMACEN");

INSERT INTO USUARIO (ID_USUARIO,USERNAME,CONTRASENA,ACTIVO) VALUES (1,'prod', '1234',1);
INSERT INTO USUARIO (ID_USUARIO,USERNAME,CONTRASENA,ACTIVO) VALUES (2,'admin', '1234',1);
INSERT INTO USUARIO (ID_USUARIO,USERNAME,CONTRASENA,ACTIVO) VALUES (3,'venta', '1234',1);
INSERT INTO USUARIO (ID_USUARIO,USERNAME,CONTRASENA,ACTIVO) VALUES (4,'calidad', '1234',1);
INSERT INTO USUARIO (ID_USUARIO,USERNAME,CONTRASENA,ACTIVO) VALUES (5,'maquinaria', '1234',1);
INSERT INTO USUARIO (ID_USUARIO,USERNAME,CONTRASENA,ACTIVO) VALUES (6,'almacen', '1234',1);


INSERT INTO TRABAJADOR (ID_TRABAJADOR,NOMBRES,APELLIDOS,DNI,CORREO,FK_ID_ROL, FK_ID_USUARIO) VALUES (1,"ERNESTO","SALAZAR LOPEZ","71702168","esl@tecnoquim.com",1,1);
INSERT INTO TRABAJADOR (ID_TRABAJADOR,NOMBRES,APELLIDOS,DNI,CORREO,FK_ID_ROL, FK_ID_USUARIO) VALUES (2,"ANDREA","SILVA FERNANDEZ","31458768","asf@tecnoquim.com",2,2);
INSERT INTO TRABAJADOR (ID_TRABAJADOR,NOMBRES,APELLIDOS,DNI,CORREO,FK_ID_ROL, FK_ID_USUARIO) VALUES (3,"REGINA","ROMERO VARGAS","66598246","rrv@tecnoquim.com",3,3);
INSERT INTO TRABAJADOR (ID_TRABAJADOR,NOMBRES,APELLIDOS,DNI,CORREO,FK_ID_ROL, FK_ID_USUARIO) VALUES (4,"CESAR","JARA ESPINOZA","75893456","cje@tecnoquim.com",4,4);
INSERT INTO TRABAJADOR (ID_TRABAJADOR,NOMBRES,APELLIDOS,DNI,CORREO,FK_ID_ROL, FK_ID_USUARIO) VALUES (5,"LEONARDO","AYALA ANGULO","65498275","laa@tecnoquim.com",5,5);
INSERT INTO TRABAJADOR (ID_TRABAJADOR,NOMBRES,APELLIDOS,DNI,CORREO,FK_ID_ROL, FK_ID_USUARIO) VALUES (6,"ALESSANDRA","DELGADO ESCOBEDO","59784621","ade@tecnoquim.com",6,6);


INSERT INTO ALMACEN (ID_ALMACEN,FK_ID_TRABAJADOR,DIRECCION,TIPO,ACTIVO) VALUES (1,5,"AV.LOS ROBLES 465","INSUMO",1);
INSERT INTO ALMACEN (ID_ALMACEN,FK_ID_TRABAJADOR,DIRECCION,TIPO,ACTIVO) VALUES (2,5,"AV.LOS ROBLES 487","PRODUCTO",1);


INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (1,"ESCAMADORA","ESTABILIZANTE",1);
INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (2,"CANGUILON", "SULFATO",1);
INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (3,"ZARANDA", "ESTABILIZANTE",1);
INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (4,"MOLINO", "ESTABILIZANTE",1);
INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (5,"CENTRIFUGA","SULFATO",1);
INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (6,"SECADOR", "SULFATO",1);
INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (7,"BOMBA", "ESTABILIZANTE",1);
INSERT INTO MAQUINARIA (ID_MAQUINARIA,NOMBRE, TIPO,ACTIVO) VALUES (8,"REACTOR", "ESTABILIZANTE",1);



INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (1,"2019-01-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (2,"2019-02-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (3,"2019-03-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (4,"2019-04-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (5,"2019-05-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (6,"2019-06-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (7,"2019-07-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (8,"2019-08-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (9,"2019-09-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (10,"2019-10-01",1);
INSERT INTO PROYECCION_VENTA (ID_PROY_VENTA,PERIODO,ACTIVO) VALUES (11,"2019-11-01",1);


INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (8,"Z3", 40.20 ,"AMARILLO",130,"GR",FALSE,1);
INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (1,"Z4", 50.30 ,"AZUL",40,"GR",TRUE,1);
INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (2,"L1", 30.80 ,"ROJO",200,"ML",TRUE,1);
INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (3,"L2", 20.10 ,"VERDE",30,"ML",TRUE,1);
INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (4,"ACIDO SULFURICO", 45.32 ,"AMARILLO",130,"ML",FALSE,1);
INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (5,"SODA CAUSTICA", 85.23 ,"BLANCO",72,"ML",FALSE,1);
INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (6,"ACIDO ESTEARICO", 47.62 ,"AMARILLO",70,"ML",FALSE,1);
INSERT INTO INSUMO (ID_INSUMO,NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (7,"LITARGIRIO", 40.20 ,"BLANCO",125,"GR",TRUE,1);

INSERT INTO PRODUCTO (ID_PROD,NOMBRE, GRANULARIDAD, PRESENTACION,RESTRICCION,ACTIVO) VALUES (1,"ESTABILIZANTE PB-100",26.21,"100 GR",TRUE,1);
INSERT INTO PRODUCTO (ID_PROD,NOMBRE, GRANULARIDAD, PRESENTACION,RESTRICCION,ACTIVO) VALUES (2,"ESTABILIZANTE PB-119-E",14.23,"150 GR",TRUE,1);
INSERT INTO PRODUCTO (ID_PROD,NOMBRE, GRANULARIDAD, PRESENTACION,RESTRICCION,ACTIVO) VALUES (3,"ESTABILIZANTE PB-102-A",36.52,"100 GR",FALSE,1);
INSERT INTO PRODUCTO (ID_PROD,NOMBRE, GRANULARIDAD, PRESENTACION,RESTRICCION,ACTIVO) VALUES (4,"MEZCLA ONE PACK 119M",14.56,"200 GR",FALSE,1);

INSERT INTO INSTRUCTIVO (ID_INSTRUCTIVO, ACTIVIDADES,FK_ID_PROD) VALUES (1,"Fabricacion:Purgado de agua condensada en el reactor(Soda Caustica,Z4 y L1), Centrifugado, Secado y Molienda",1);
INSERT INTO INSTRUCTIVO (ID_INSTRUCTIVO, ACTIVIDADES,FK_ID_PROD) VALUES (2,"Fabricacion:Purgado de agua condensada en el reactor(Z3,Z4,L2 y L1) y Molienda",2);
INSERT INTO INSTRUCTIVO (ID_INSTRUCTIVO, ACTIVIDADES,FK_ID_PROD) VALUES (3,"Fabricacion:Purgado de agua condensada en el reactor(Z3,Z4 y L1), Escamado y Homogenizacion",3);
INSERT INTO INSTRUCTIVO (ID_INSTRUCTIVO, ACTIVIDADES,FK_ID_PROD) VALUES (4,"Fabricacion:Purgado de agua condensada en el reactor(Z3,Z4,L2 y Soda Caustica), Escamado y Homogenizacion",4);

INSERT INTO POLITICA_DE_STOCK (ID_PLT_STOCK,FK_ID_PROD,CANT_MAX,CANT_MIN) VALUES (1,1,500,100);
INSERT INTO POLITICA_DE_STOCK (ID_PLT_STOCK,FK_ID_PROD,CANT_MAX,CANT_MIN) VALUES (2,2,1000,300);	
INSERT INTO POLITICA_DE_STOCK (ID_PLT_STOCK,FK_ID_PROD,CANT_MAX,CANT_MIN) VALUES (3,3,300,100);
INSERT INTO POLITICA_DE_STOCK (ID_PLT_STOCK,FK_ID_PROD,CANT_MAX,CANT_MIN) VALUES (4,4,600,150);

INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (1,"2019-01-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (2,"2019-02-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (3,"2019-03-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (4,"2019-04-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (5,"2019-05-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (6,"2019-06-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (7,"2019-07-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (8,"2019-08-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (9,"2019-09-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (10,"2019-10-01",0, 1);
INSERT INTO PLAN_MAESTRO_PRODUCCION (ID_PMP,PERIODO, ESTADO, FK_ID_TRABAJADOR) VALUES (11,"2019-11-01",1, 1);

INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (1,5, 1,15, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (2,1, 1,10, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (3,2, 1,4, 1);

INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (4,8, 2,15, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (5,1, 2,10, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (6,2, 2,15, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (7,3, 2,5, 1);

INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (8,8, 3,2, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (9,1, 3,4, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (10,3, 3,7, 1);

INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (11,8, 4,7, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (12,1, 4,6, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (13,2, 4,8, 1);
INSERT INTO LINEA_INSUMO (ID_LINEA_INS,FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO) VALUES (14,5, 4,4, 1);

INSERT INTO DETALLE_MAQUINARIA (ID_DET_MAQ,ESTADO, FECHA, FK_ID_PMP,FK_ID_MAQUINARIA) VALUES (1,1,"2019-03-10",3,3);
INSERT INTO DETALLE_MAQUINARIA (ID_DET_MAQ,ESTADO, FECHA, FK_ID_PMP,FK_ID_MAQUINARIA) VALUES (2,1,"2019-04-15",4,1);
INSERT INTO DETALLE_MAQUINARIA (ID_DET_MAQ,ESTADO, FECHA, FK_ID_PMP,FK_ID_MAQUINARIA) VALUES (3,1,"2019-05-11",5,2);
INSERT INTO DETALLE_MAQUINARIA (ID_DET_MAQ,ESTADO, FECHA, FK_ID_PMP,FK_ID_MAQUINARIA) VALUES (4,1,"2019-06-08",6,3);
INSERT INTO DETALLE_MAQUINARIA (ID_DET_MAQ,ESTADO, FECHA, FK_ID_PMP,FK_ID_MAQUINARIA) VALUES (5,1,"2019-07-12",7,4);

INSERT INTO ORDEN_PRODUCCION (ID_ORDENPROD,FECHA,FK_ID_PMP)	VALUES (1,"2019-05-01",5);

INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (1,1,1,40,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (2,2,1,60,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (3,3,1,25,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (4,4,1,47,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (5,2,1,85,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (6,1,1,14,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (7,1,1,68,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (8,4,1,75,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (9,2,1,58,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (10,3,1,24,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (11,1,1,89,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (12,2,1,57,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (13,3,1,47,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (14,2,1,24,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (15,1,1,38,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (16,4,1,75,0);
INSERT INTO LINEA_ORDEN (ID_LINEAORD, FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD) VALUES (17,1,1,58,0);

INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (1, 1, 1, 1, "2019-05-01", 150, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (2, 2, 1, 2, "2019-05-01", 165, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (3, 3, 1, 3, "2019-05-01", 87, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (4, 4, 1, 4, "2019-05-01", 67, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (5, 5, 1, 5, "2019-05-01", 92, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (6, 6, 1, 6, "2019-05-01", 79, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (7, 7, 1, 7, "2019-05-01", 95, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (8, 8, 1, 8, "2019-06-01", 58, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (9, 1, 1, 9, "2019-06-01", 75, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (10, 2, 1, 10, "2019-06-01", 84, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (11, 3, 1, 11, "2019-06-01", 97, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (12, 4, 1, 12, "2019-06-01", 147, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (13, 5, 1, 13, "2019-06-01", 136, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (14, 6, 1, 14, "2019-06-01", 124, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (15, 7, 1, 15, "2019-06-01", 145, 0);
INSERT INTO DETALLE_ALMACEN_INSUMO (ID_DET_ALM_INS,FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (16, 8, 1, 16, "2019-06-01", 137, 0);

INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (1, 1, 2, 1, "2019-05-01", 152, 0);
INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (2, 2, 2, 2, "2019-05-01", 58, 0);
INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (3, 3, 2, 3, "2019-05-01", 76, 0);
INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (4, 4, 2, 4, "2019-05-01", 187, 0);
INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (5, 1, 2, 5, "2019-06-01", 173, 0);
INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (6, 2, 2, 6, "2019-06-01", 164, 0);
INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (7, 3, 2, 7, "2019-06-01", 57, 0);
INSERT INTO DETALLE_ALMACEN_PRODUCTO (ID_DET_ALM_PROD,FK_ID_PRODUCTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)	VALUES (8, 4, 2, 8, "2019-06-01", 54, 0);

INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (1,1,100,5);
INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (2,2,200,5);
INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (3,3,150,5);
INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (4,4,180,5);
INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (5,1,150,6);
INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (6,2,230,6);
INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (7,3,140,6);
INSERT INTO LINEA_PROYECCION (ID_LIN_PROY,FK_ID_PROD,CANT,FK_ID_PROY_VENTA)	VALUES (8,4,160,6);