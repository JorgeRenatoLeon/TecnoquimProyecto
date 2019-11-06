DROP TABLE IF EXISTS LINEA_PROYECCION;
DROP TABLE IF EXISTS PROYECCION_VENTA;
DROP TABLE IF EXISTS POLITICA_DE_STOCK;
DROP TABLE IF EXISTS DETALLE_ALMACEN_PRODUCTO;
DROP TABLE IF EXISTS DETALLE_ALMACEN_INSUMO;
DROP TABLE IF EXISTS ALMACEN;
DROP TABLE IF EXISTS LINEA_ORDEN;
DROP TABLE IF EXISTS ORDEN_PRODUCCION;
DROP TABLE IF EXISTS DETALLE_MAQUINARIA;
DROP TABLE IF EXISTS MAQUINARIA;
DROP TABLE IF EXISTS PLAN_MAESTRO_PRODUCCION;
DROP TABLE IF EXISTS PRODUCTO;
DROP TABLE IF EXISTS LINEA_INSUMO;
DROP TABLE IF EXISTS INSTRUCTIVO;
DROP TABLE IF EXISTS INSUMO;
DROP TABLE IF EXISTS TRABAJADOR;
DROP TABLE IF EXISTS USUARIO;
DROP TABLE IF EXISTS ROL;
DROP TABLE IF EXISTS MENSAJE;

CREATE TABLE ROL(
	ID_ROL INT AUTO_INCREMENT PRIMARY KEY,
    DESCRIPCION VARCHAR(50)
);

CREATE TABLE USUARIO(
	ID_USUARIO INT AUTO_INCREMENT PRIMARY KEY,
    USERNAME VARCHAR(50),
    CONTRASENA VARCHAR(50),
	ACTIVO INT
);

CREATE TABLE TRABAJADOR(
	ID_TRABAJADOR INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRES VARCHAR(100),
    APELLIDOS VARCHAR(100),
    DNI VARCHAR(8),
    CORREO VARCHAR(100),
    FK_ID_ROL INT,
    FK_ID_USUARIO INT,
    FOREIGN KEY (FK_ID_ROL) REFERENCES ROL(ID_ROL),
    FOREIGN KEY (FK_ID_USUARIO) REFERENCES USUARIO(ID_USUARIO),
    CONSTRAINT DNI_CLIENTE UNIQUE (DNI)
)ENGINE=INNODB;

CREATE TABLE INSUMO(
	ID_INSUMO INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    GRANULARIDAD FLOAT,
    COLOR VARCHAR(30),
    CANTIDAD FLOAT,
    UNIDAD VARCHAR(20),
    RESTRICCION BOOLEAN,
    ACTIVO TINYINT(1)
);

CREATE TABLE PRODUCTO(
	ID_PROD INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    GRANULARIDAD FLOAT,
    PRESENTACION VARCHAR(40),
	RESTRICCION BOOLEAN,
    ACTIVO TINYINT(1)
);
CREATE TABLE INSTRUCTIVO(
	ID_INSTRUCTIVO INT AUTO_INCREMENT PRIMARY KEY,
    ACTIVIDADES VARCHAR(200),
	FK_ID_PROD INT,
    FOREIGN KEY (FK_ID_PROD) REFERENCES PRODUCTO(ID_PROD)
);
CREATE TABLE LINEA_INSUMO(
	ID_LINEA_INS INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_INSUMO INT,
    FK_ID_INSTRUCTIVO INT,
    CANTIDAD INT,
    ESTADO INT,
    FOREIGN KEY (FK_ID_INSUMO) REFERENCES INSUMO(ID_INSUMO),
    FOREIGN KEY (FK_ID_INSTRUCTIVO) REFERENCES INSTRUCTIVO(ID_INSTRUCTIVO)
);

CREATE TABLE PLAN_MAESTRO_PRODUCCION(
	ID_PMP INT AUTO_INCREMENT PRIMARY KEY,
    PERIODO DATE,
    ESTADO INT,
    FK_ID_TRABAJADOR INT,
    FOREIGN KEY (FK_ID_TRABAJADOR) REFERENCES TRABAJADOR(ID_TRABAJADOR)
)ENGINE=INNODB;

CREATE TABLE MAQUINARIA(
	ID_MAQUINARIA INT AUTO_INCREMENT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    TIPO VARCHAR(20),
    ACTIVO TINYINT(1) 
);

CREATE TABLE DETALLE_MAQUINARIA(
	ID_DET_MAQ INT AUTO_INCREMENT PRIMARY KEY,
	ESTADO INT,
    FECHA DATE,
    FK_ID_PMP INT,
    FK_ID_MAQUINARIA INT,
	FOREIGN KEY (FK_ID_MAQUINARIA) REFERENCES MAQUINARIA(ID_MAQUINARIA),
	FOREIGN KEY (FK_ID_PMP) REFERENCES PLAN_MAESTRO_PRODUCCION(ID_PMP)
);

CREATE TABLE ORDEN_PRODUCCION(
	ID_ORDENPROD INT AUTO_INCREMENT PRIMARY KEY,
    FECHA DATE,
    FK_ID_PMP INT,
	FOREIGN KEY (FK_ID_PMP) REFERENCES PLAN_MAESTRO_PRODUCCION(ID_PMP)
);

CREATE TABLE LINEA_ORDEN(
	ID_LINEAORD INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_PROD INT,
    FK_ORDEN_PROD INT,
    CANT_PROD INT,
    ESTADO_CALIDAD INT,
	FOREIGN KEY (FK_ID_PROD) REFERENCES PRODUCTO(ID_PROD),
	FOREIGN KEY (FK_ORDEN_PROD) REFERENCES ORDEN_PRODUCCION(ID_ORDENPROD)
);

CREATE TABLE ALMACEN(
	ID_ALMACEN INT AUTO_INCREMENT PRIMARY KEY,
	FK_ID_TRABAJADOR INT,
    DIRECCION VARCHAR(100),
    TIPO VARCHAR(20),
	ACTIVO INT, 
	FOREIGN KEY (FK_ID_TRABAJADOR) REFERENCES TRABAJADOR(ID_TRABAJADOR)
);

CREATE TABLE DETALLE_ALMACEN_INSUMO(
	ID_DET_ALM_INS INT AUTO_INCREMENT PRIMARY KEY,
	FK_ID_INSUMO INT,
	FK_ID_ALMACEN INT,
    NUM_LOTE INT,
    PERIODO DATE,
    STOCK INT,
	CALIDAD INT,
	FOREIGN KEY (FK_ID_INSUMO) REFERENCES INSUMO(ID_INSUMO),
	FOREIGN KEY (FK_ID_ALMACEN) REFERENCES ALMACEN(ID_ALMACEN)
);

CREATE TABLE DETALLE_ALMACEN_PRODUCTO(
	ID_DET_ALM_PROD INT AUTO_INCREMENT PRIMARY KEY,
	FK_ID_PRODUCTO INT,
	FK_ID_ALMACEN INT,
    NUM_LOTE INT,
    PERIODO DATE,
    STOCK INT,
	CALIDAD INT,
	FOREIGN KEY (FK_ID_PRODUCTO) REFERENCES PRODUCTO(ID_PROD),
	FOREIGN KEY (FK_ID_ALMACEN) REFERENCES ALMACEN(ID_ALMACEN)
);

CREATE TABLE POLITICA_DE_STOCK(
	ID_PLT_STOCK INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_PROD INT,
    CANT_MAX INT,
    CANT_MIN INT,
	FOREIGN KEY (FK_ID_PROD) REFERENCES PRODUCTO(ID_PROD)
);

CREATE TABLE PROYECCION_VENTA(
	ID_PROY_VENTA INT AUTO_INCREMENT PRIMARY KEY,
    PERIODO DATE,
	ACTIVO INT
);

CREATE TABLE LINEA_PROYECCION(
	ID_LIN_PROY INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_PROD INT,
    CANT INT,
    FK_ID_PROY_VENTA INT,
	FOREIGN KEY (FK_ID_PROD) REFERENCES PRODUCTO(ID_PROD),
	FOREIGN KEY (FK_ID_PROY_VENTA) REFERENCES PROYECCION_VENTA(ID_PROY_VENTA)
);

CREATE TABLE MENSAJE(
	ID_MENSAJE INT AUTO_INCREMENT PRIMARY KEY,
    FECHA_ENVIO DATE,
    ID_EMISOR INT,
    ID_RECEPTOR INT,
    DESCRIPCION VARCHAR(150),
    ACTIVO INT
);