DROP PROCEDURE IF EXISTS INSERTAR_ALMACEN;
DROP PROCEDURE IF EXISTS ACTUALIZAR_ALMACEN;
DROP PROCEDURE IF EXISTS ELIMINAR_ALMACEN;
DROP PROCEDURE IF EXISTS LISTAR_ALMACEN;
DROP PROCEDURE IF EXISTS INSERTAR_ROL;
DROP PROCEDURE IF EXISTS ACTUALIZAR_ROL;
DROP PROCEDURE IF EXISTS LISTAR_ROL;
DROP PROCEDURE IF EXISTS INSERTAR_USUARIO;
DROP PROCEDURE IF EXISTS ACTUALIZAR_USUARIO;
DROP PROCEDURE IF EXISTS ELIMINAR_USUARIO;
DROP PROCEDURE IF EXISTS LISTAR_USUARIO;
DROP PROCEDURE IF EXISTS INSERTAR_MAQUINARIA;
DROP PROCEDURE IF EXISTS ACTUALIZAR_MAQUINARIA;
DROP PROCEDURE IF EXISTS ELIMINAR_MAQUINARIA;
DROP PROCEDURE IF EXISTS LISTAR_MAQUINARIA;
DROP PROCEDURE IF EXISTS INSERTAR_TRABAJADOR;
DROP PROCEDURE IF EXISTS ACTUALIZAR_TRABAJADOR;
DROP PROCEDURE IF EXISTS LISTAR_TRABAJADOR;
DROP PROCEDURE IF EXISTS INSERTAR_INSUMO;
DROP PROCEDURE IF EXISTS ACTUALIZAR_INSUMO;
DROP PROCEDURE IF EXISTS ELIMINAR_INSUMO;
DROP PROCEDURE IF EXISTS LISTAR_INSUMO;
DROP PROCEDURE IF EXISTS INSERTAR_INSTRUCTIVO;
DROP PROCEDURE IF EXISTS ACTUALIZAR_INSTRUCTIVO;
DROP PROCEDURE IF EXISTS INSERTAR_PROYECCION;
DROP PROCEDURE IF EXISTS ACTUALIZAR_PROYECCION;
DROP PROCEDURE IF EXISTS ELIMINAR_PROYECCION;
DROP PROCEDURE IF EXISTS LISTAR_PROYECCION;
DROP PROCEDURE IF EXISTS INSERTAR_LINEA_INSUMO;
DROP PROCEDURE IF EXISTS ACTUALIZAR_LINEA_INSUMO;
DROP PROCEDURE IF EXISTS LISTAR_LINEA_INSUMO;
DROP PROCEDURE IF EXISTS INSERTAR_PRODUCTO;
DROP PROCEDURE IF EXISTS ACTUALIZAR_PRODUCTO;
DROP PROCEDURE IF EXISTS ELIMINAR_PRODUCTO;
DROP PROCEDURE IF EXISTS LISTAR_PRODUCTOS;
DROP PROCEDURE IF EXISTS INSERTAR_PLAN;
DROP PROCEDURE IF EXISTS ACTUALIZAR_PLAN;
DROP PROCEDURE IF EXISTS LISTAR_PLAN;
DROP PROCEDURE IF EXISTS INSERTAR_DET_MAQUINARIA;
DROP PROCEDURE IF EXISTS ACTUALIZAR_DET_MAQUINARIA;
DROP PROCEDURE IF EXISTS LISTAR_DET_MAQUINARIA;
DROP PROCEDURE IF EXISTS INSERTAR_ORDEN;
DROP PROCEDURE IF EXISTS ACTUALIZAR_ORDEN;
DROP PROCEDURE IF EXISTS LISTAR_ORDEN_POR_FECHA;
DROP PROCEDURE IF EXISTS LISTAR_ORDEN_POR_PLAN;
DROP PROCEDURE IF EXISTS INSERTAR_LINEA_ORDEN;
DROP PROCEDURE IF EXISTS ACTUALIZAR_LINEA_ORDEN;
DROP PROCEDURE IF EXISTS LISTAR_LINEA_ORDEN;
DROP PROCEDURE IF EXISTS INSERTAR_DETALLE_INSUMO;
DROP PROCEDURE IF EXISTS ACTUALIZAR_DETALLE_INSUMO;
DROP PROCEDURE IF EXISTS LISTAR_DETALLE_INSUMO;
DROP PROCEDURE IF EXISTS ACTUALIZAR_DETALLE_PRODUCTO;
DROP PROCEDURE IF EXISTS LISTAR_DETALLE_PRODUCTO;
DROP PROCEDURE IF EXISTS INSERTAR_POLITICA;
DROP PROCEDURE IF EXISTS ACTUALIZAR_POLITICA;
DROP PROCEDURE IF EXISTS LISTAR_POLITICA;
DROP PROCEDURE IF EXISTS INSERTAR_LINEA_PROYECCION;
DROP PROCEDURE IF EXISTS ACTUALIZAR_LINEA_PROYECCION;
DROP PROCEDURE IF EXISTS LISTAR_LINEA_PROYECCION;
DROP PROCEDURE IF EXISTS INSERTAR_DETALLE_PRODUCTO;
DROP PROCEDURE IF EXISTS VERIFICAR_USUARIO;
DROP PROCEDURE IF EXISTS INSERTAR_MENSAJE;
DROP PROCEDURE IF EXISTS ELIMINAR_MENSAJE;
DROP PROCEDURE IF EXISTS LISTAR_MENSAJES;


#---------------------------------------------------------------------------------------------------------------------------------------------------#


DELIMITER $
CREATE PROCEDURE INSERTAR_ALMACEN(
	OUT _ID_ALMACEN INT,
	IN _FK_ID_TRABAJADOR INT,
	IN _DIRECCION VARCHAR(100),
	IN _TIPO VARCHAR(20)
)	
	
BEGIN
	INSERT INTO ALMACEN (FK_ID_TRABAJADOR,DIRECCION,TIPO,ACTIVO) VALUES (_ID_TRABAJADOR,_DIRECCION,_TIPO,1);
	SET _ID_ALMACEN = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_ALMACEN(
	IN _ID_ALMACEN INT,
	IN _ID_TRABAJADOR INT,
	IN _DIRECCION VARCHAR(100),
	IN _TIPO VARCHAR(20)
)
BEGIN
	UPDATE ALMACEN SET ID_TRABAJADOR = _ID_TRABAJADOR , DIRECCION = _DIRECCION, TIPO = _TIPO  WHERE ID_ALMACEN = _ID_ALMACEN;
END$


	
CREATE PROCEDURE ELIMINAR_ALMACEN(
	IN _ID_ALMACEN INT
)
BEGIN
	UPDATE ALMACEN SET ACTIVO = 0 WHERE ID_ALMACEN = _ID_ALMACEN;
END$




CREATE PROCEDURE LISTAR_ALMACEN(
	IN _TIPO VARCHAR(20))
BEGIN
	SELECT * FROM ALMACEN WHERE ACTIVO = 1 AND TIPO LIKE CONCAT('%', _TIPO,'%');
END$
	

#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_ROL(
	OUT _ID_ROL INT,
	IN _DESCRIPCION VARCHAR(50)
)	
BEGIN
	INSERT INTO ROL (DESCRIPCION) VALUES (_DESCRIPCION);
	SET _ID_ROL = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_ROL(
	IN _ID_ROL INT,
	IN _DESCRIPCION VARCHAR(50)
)
BEGIN
	UPDATE ROL SET DESCRIPCION = _DESCRIPCION   WHERE ID_ROL = _ID_ROL;
END$




CREATE PROCEDURE LISTAR_ROL(
	IN _DESCRIPCION VARCHAR(50)
)
BEGIN
	SELECT * FROM ROL WHERE  DESCRIPCION LIKE CONCAT('%', _DESCRIPCION,'%');
END$


#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_USUARIO(
	OUT _ID_USUARIO INT,
	IN _USERNAME VARCHAR(50),
    IN _CONTRASENA VARCHAR(50)
)	
	
BEGIN
	INSERT INTO USUARIO (USERNAME, CONTRASENA,ACTIVO) VALUES (_USERNAME, _CONTRASENA,1);
	SET _ID_USUARIO = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_USUARIO(
	IN _ID_USUARIO INT,
	IN _USERNAME VARCHAR(50),
    IN _CONTRASENA VARCHAR(50)
)
BEGIN
	UPDATE USUARIO SET USERNAME = _USERNAME, CONTRASENA = _CONTRASENA    WHERE ID_USUARIO = _ID_USUARIO;
END$

CREATE PROCEDURE ELIMINAR_USUARIO(
	IN _ID_USUARIO INT
)
BEGIN
	UPDATE USUARIO SET ACTIVO = 0 WHERE ID_USUARIO = _ID_USUARIO;
END$


CREATE PROCEDURE LISTAR_USUARIO(
	IN _USERNAME VARCHAR(50)
)
BEGIN
	SELECT * FROM USUARIO WHERE  USERNAME LIKE CONCAT('%', _USERNAME,'%');
END$


#---------------------------------------------------------------------------------------------------------------------------------------------------#

CREATE PROCEDURE INSERTAR_MAQUINARIA(
	OUT _ID_MAQUINARIA INT,
    IN _NOMBRE VARCHAR(50),
    IN _TIPO VARCHAR(20)    
)	
BEGIN
	INSERT INTO MAQUINARIA (NOMBRE, TIPO,ACTIVO) VALUES (_NOMBRE, _TIPO,1);
	SET _ID_MAQUINARIA = last_insert_id();
END$

CREATE PROCEDURE ACTUALIZAR_MAQUINARIA(
	IN _ID_MAQUINARIA INT,
    IN _NOMBRE VARCHAR(50),
    IN _TIPO VARCHAR(20)
)
BEGIN
	UPDATE MAQUINARIA SET NOMBRE = _NOMBRE, TIPO = _TIPO WHERE ID_MAQUINARIA = _ID_MAQUINARIA;
END$

CREATE PROCEDURE ELIMINAR_MAQUINARIA(
	IN _ID_MAQUINARIA INT
)
BEGIN
	UPDATE MAQUINARIA SET ACTIVO = 0 WHERE ID_MAQUINARIA = _ID_MAQUINARIA;
END$


CREATE PROCEDURE LISTAR_MAQUINARIA(
	IN _NOMBRE VARCHAR(50)
)
BEGIN
	SELECT * FROM MAQUINARIA WHERE  NOMBRE LIKE CONCAT('%', _NOMBRE,'%') 
    AND ACTIVO=1;
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#

CREATE PROCEDURE INSERTAR_TRABAJADOR(
	OUT _ID_TRABAJADOR INT,
	IN _NOMBRES VARCHAR(100),
    IN _APELLIDOS VARCHAR(100),
    IN _DNI VARCHAR(8),
    IN _CORREO VARCHAR(100),
    IN _FK_ID_ROL INT,
    IN _FK_ID_USUARIO INT
)	
	
BEGIN
	INSERT INTO TRABAJADOR (NOMBRE,APELLIDOS,DNI,CORREO,FK_ID_ROL, FK_ID_USUARIO) VALUES (_NOMBRE,_APELLIDOS,_DNI,
	_CORREO,_FK_ID_ROL,_FK_ID_USUARIO);
	SET _ID_TRABAJADOR = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_TRABAJADOR(
	IN _ID_TRABAJADOR INT,
	IN _NOMBRES VARCHAR(100),
    IN _APELLIDOS VARCHAR(100),
    IN _DNI VARCHAR(8),
    IN _CORREO VARCHAR(100),
    IN _FK_ID_ROL INT,
    IN _FK_ID_USUARIO INT
)
BEGIN
	UPDATE TRABAJADOR SET NOMBRES = _NOMBRES , APELLIDOS = _APELLIDOS, DNI = _DNI,
	CORREO = _CORREO, FK_ID_ROL = _FK_ID_ROL, FK_ID_USUARIO = _FK_ID_USUARIO 
	WHERE ID_TRABAJADOR = _ID_TRABAJADOR;
END$



CREATE PROCEDURE LISTAR_TRABAJADOR(
	IN _NOMBRES VARCHAR(100)
)
BEGIN
	SELECT * FROM TRABAJADOR 
	inner join USUARIO on TRABAJADOR.FK_ID_USUARIO=USUARIO.ID_USUARIO 
	inner join ROL on TRABAJADOR.FK_ID_ROL=ROL.ID_ROL
    WHERE NOMBRES LIKE CONCAT('%', _NOMBRES,'%');
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#
CREATE PROCEDURE INSERTAR_INSUMO(
	OUT _ID_INSUMO INT ,
    IN _NOMBRE VARCHAR(50),
    IN _GRANULARIDAD FLOAT,
    IN _COLOR VARCHAR(30),
    IN _CANTIDAD FLOAT,
    IN _UNIDAD VARCHAR(20),
	IN _RESTRICCION BOOLEAN
)	
	
BEGIN
	INSERT INTO INSUMO (NOMBRE,GRANULARIDAD,COLOR,CANTIDAD,UNIDAD,RESTRICCION,ACTIVO) VALUES (_NOMBRE, _GRANULARIDAD ,_COLOR,
	_CANTIDAD,_UNIDAD,_RESTRICCION,1);
	SET _ID_INSUMO = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_INSUMO(
	IN _ID_INSUMO INT ,
    IN _NOMBRE VARCHAR(50),
    IN _GRANULARIDAD FLOAT,
    IN _COLOR VARCHAR(30),
    IN _CANTIDAD FLOAT,
    IN _UNIDAD VARCHAR(20),
	IN _RESTRICCION BOOLEAN
)
BEGIN
	UPDATE INSUMO SET NOMBRE = _NOMBRE , GRANULARIDAD = _GRANULARIDAD, COLOR = _COLOR,
	CANTIDAD = _CANTIDAD, UNIDAD = _UNIDAD, RESTRICCION = _RESTRICCION
	WHERE ID_INSUMO = _ID_INSUMO;
END$

CREATE PROCEDURE ELIMINAR_INSUMO(
	IN _ID_INSUMO INT
)
BEGIN
	UPDATE INSUMO SET ACTIVO = 0 WHERE ID_INSUMO = _ID_INSUMO;
END$

CREATE PROCEDURE LISTAR_INSUMO(
	IN _NOMBRE VARCHAR(50)
)
BEGIN
	SELECT * FROM INSUMO WHERE NOMBRE LIKE CONCAT('%', _NOMBRE,'%')
    AND ACTIVO=1;
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#


CREATE PROCEDURE INSERTAR_INSTRUCTIVO(
	OUT _ID_INSTRUCTIVO INT ,
    IN _ACTIVIDADES VARCHAR(200),
	IN _FK_ID_PROD INT
)		
BEGIN
	INSERT INTO INSTRUCTIVO (ACTIVIDADES,FK_ID_PROD) VALUES (_ACTIVIDADES,_FK_ID_PROD);
	SET _ID_INSTRUCTIVO = last_insert_id();
END$

CREATE PROCEDURE ACTUALIZAR_INSTRUCTIVO(
	IN _ID_INSTRUCTIVO INT ,
    IN _ACTIVIDADES VARCHAR(200),
	IN _FK_ID_PROD INT
)
BEGIN
	UPDATE INSTRUCTIVO SET ACTIVIDADES = _ACTIVIDADES,FK_ID_PROD=_FK_ID_PROD
	WHERE ID_INSTRUCTIVO = _ID_INSTRUCTIVO;
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#

CREATE PROCEDURE INSERTAR_PROYECCION(
	OUT _ID_PROY_VENTA INT,
    IN _PERIODO DATE
)	
	
BEGIN
	INSERT INTO PROYECCION_VENTA (PERIODO,ACTIVO) VALUES (_PERIODO,1);
	SET _ID_PROY_VENTA = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_PROYECCION(
	IN _ID_PROY_VENTA INT,
    IN _PERIODO DATE
)
BEGIN
	UPDATE PROYECCION_VENTA SET PERIODO = _PERIODO 
	WHERE ID_PROY_VENTA = _ID_PROY_VENTA;
END$


CREATE PROCEDURE ELIMINAR_PROYECCION(
	IN _ID_PROY_VENTA INT
)
BEGIN
	UPDATE PROYECCION_VENTA SET ACTIVO = 0 WHERE ID_PROY_VENTA = _ID_PROY_VENTA;
END$


CREATE PROCEDURE LISTAR_PROYECCION(
	IN _PERIODO DATE
)
BEGIN
	SELECT * FROM PROYECCION_VENTA WHERE PERIODO LIKE CONCAT('%',_PERIODO,'%');
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_LINEA_INSUMO(
	OUT _ID_LINEA_INS INT,
    IN _FK_ID_INSUMO INT,
    IN _FK_ID_INSTRUCTIVO INT,
    IN _CANTIDAD INT,
    IN _ESTADO INT
)	
	
BEGIN
	INSERT INTO LINEA_INSUMO (FK_ID_INSUMO, FK_ID_INSTRUCTIVO, CANTIDAD,ESTADO)
	VALUES (_FK_ID_INSUMO, _FK_ID_INSTRUCTIVO,_CANTIDAD, _ESTADO);
	SET _ID_LINEA_INS = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_LINEA_INSUMO(
	IN _ID_LINEA_INS INT,
    IN _FK_ID_INSUMO INT,
    IN _FK_ID_INSTRUCTIVO INT,
    IN _CANTIDAD INT,
    IN _ESTADO INT
)
BEGIN
	UPDATE LINEA_INSUMO SET FK_ID_INSUMO = _FK_ID_INSUMO, FK_ID_INSTRUCTIVO = _FK_ID_INSTRUCTIVO,
	CANTIDAD = _CANTIDAD , ESTADO = _ESTADO
	WHERE ID_LINEA_INS = _ID_LINEA_INS;
END$



CREATE PROCEDURE LISTAR_LINEA_INSUMO(
	IN _ID_LINEA_INS INT
)
BEGIN
	SELECT * FROM LINEA_INSUMO WHERE ID_LINEA_INS = _ID_LINEA_INS;
END$



#---------------------------------------------------------------------------------------------------------------------------------------------------#

CREATE PROCEDURE INSERTAR_PRODUCTO(
	OUT _ID_PROD INT ,
    IN _NOMBRE VARCHAR(50),
    IN _GRANULARIDAD FLOAT,
    IN _PRESENTACION VARCHAR(40),
	IN _RESTRICCION BOOLEAN
)	
BEGIN
	INSERT INTO PRODUCTO (NOMBRE, GRANULARIDAD, PRESENTACION,RESTRICCION,ACTIVO)
	VALUES (_NOMBRE,_GRANULARIDAD,_PRESENTACION,_RESTRICCION,1);
	SET _ID_PROD = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_PRODUCTO(
	IN _ID_PROD INT ,
    IN _NOMBRE VARCHAR(50),
    IN _GRANULARIDAD FLOAT,
    IN _PRESENTACION VARCHAR(40),
	IN _RESTRICCION BOOLEAN
)
BEGIN
	UPDATE PRODUCTO SET NOMBRE = _NOMBRE, GRANULARIDAD = _GRANULARIDAD,
	PRESENTACION = _PRESENTACION ,	RESTRICCION =_RESTRICCION
	WHERE ID_PROD = _ID_PROD;
END$


CREATE PROCEDURE ELIMINAR_PRODUCTO(
	IN _ID_PROD INT
)
BEGIN
	UPDATE PRODUCTO SET ACTIVO = 0 WHERE ID_PROD = _ID_PROD;
END$

CREATE PROCEDURE LISTAR_PRODUCTOS(
	IN _NOMBRE VARCHAR(50)
)
BEGIN
	SELECT * FROM PRODUCTO WHERE NOMBRE LIKE CONCAT('%', _NOMBRE,'%')
    AND ACTIVO=1;
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#


CREATE PROCEDURE INSERTAR_PLAN(
	OUT _ID_PMP INT,
    IN _PERIODO DATE,
    IN _ESTADO INT,
    IN _FK_ID_TRABAJADOR INT

)
	
BEGIN
	INSERT INTO PLAN_MAESTRO_PRODUCCION (PERIODO, ESTADO, FK_ID_TRABAJADOR)
	VALUES (_PERIODO, _ESTADO, _FK_ID_TRABAJADOR);
	SET _ID_PMP = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_PLAN(
	IN _ID_PMP INT,
    IN _PERIODO DATE,
    IN _ESTADO INT,
    IN _FK_ID_TRABAJADOR INT
)
BEGIN
	UPDATE PLAN_MAESTRO_PRODUCCION SET PERIODO = _PERIODO, ESTADO = _ESTADO,
	FK_ID_TRABAJADOR = _FK_ID_TRABAJADOR 
	WHERE ID_PMP = _ID_PMP;
END$



CREATE PROCEDURE LISTAR_PLAN(
	IN _PERIODO DATE
)
BEGIN
	SELECT * FROM PLAN_MAESTRO_PRODUCCION WHERE PERIODO LIKE CONCAT('%',_PERIODO,'%');
END$




#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_DET_MAQUINARIA(
	OUT _ID_DET_MAQ INT ,
	IN _ESTADO INT,
    IN _FECHA DATE,
    IN _FK_ID_PMP INT,
    IN _FK_ID_MAQUINARIA INT
)
	
BEGIN
	INSERT INTO DETALLE_MAQUINARIA (ESTADO, FECHA, FK_ID_PMP,FK_ID_MAQUINARIA)
	VALUES (_ESTADO,_FECHA,_FK_ID_PMP,_FK_ID_MAQUINARIA);
	SET _ID_DET_MAQ = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_DET_MAQUINARIA(
	IN _ID_DET_MAQ INT ,
	IN _ESTADO INT,
    IN _FECHA DATE,
    IN _FK_ID_PMP INT,
    IN _FK_ID_MAQUINARIA INT
)
BEGIN
	UPDATE DETALLE_MAQUINARIA SET ESTADO = _ESTADO, FECHA = _FECHA,
	FK_ID_PMP = _FK_ID_PMP , FK_ID_MAQUINARIA = _FK_ID_MAQUINARIA
	WHERE ID_DET_MAQ = _ID_DET_MAQ;
END$



CREATE PROCEDURE LISTAR_DET_MAQUINARIA(
	IN _FK_ID_PMP INT
)
BEGIN
	SELECT * FROM DETALLE_MAQUINARIA WHERE FK_ID_PMP = _FK_ID_PMP;
END$




#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_ORDEN(
	OUT _ID_ORDENPROD INT ,
    IN _FECHA DATE,
    IN _FK_ID_PMP INT

)
	
BEGIN
	INSERT INTO ORDEN_PRODUCCION (FECHA,FK_ID_PMP)
	VALUES (_FECHA,_FK_ID_PMP);
	SET _ID_ORDENPROD = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_ORDEN(
	IN _ID_ORDENPROD INT ,
    IN _FECHA DATE,
    IN _FK_ID_PMP INT
)
BEGIN
	UPDATE ORDEN_PRODUCCION SET FECHA = _FECHA, FK_ID_PMP = _FK_ID_PMP
	WHERE ID_ORDENPROD = _ID_ORDENPROD;
END$



CREATE PROCEDURE LISTAR_ORDEN_POR_FECHA(
	IN _FECHA DATE
)
BEGIN
	SELECT * FROM ORDEN_PRODUCCION WHERE FECHA LIKE CONCAT('%', _FECHA,'%');
END$

CREATE PROCEDURE LISTAR_ORDEN_POR_PLAN(
	IN _FK_ID_PMP INT
)
BEGIN
	SELECT * FROM ORDEN_PRODUCCION WHERE FECHA LIKE CONCAT('%', _FECHA,'%');
END$


#---------------------------------------------------------------------------------------------------------------------------------------------------#




CREATE PROCEDURE INSERTAR_LINEA_ORDEN(
	OUT _ID_LINEAORD INT,
    IN _FK_ID_PROD INT,
    IN _FK_ORDEN_PROD INT,
    IN _CANT_PROD INT,
    IN _ESTADO_CALIDAD INT
)
	
BEGIN
	INSERT INTO LINEA_ORDEN (FK_ID_PROD,FK_ORDEN_PROD,CANT_PROD,ESTADO_CALIDAD)
	VALUES (_FK_ID_PROD,_FK_ORDEN_PROD,_CANT_PROD,_ESTADO_CALIDAD);
	SET _ID_LINEAORD = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_LINEA_ORDEN(
	IN _ID_LINEAORD INT,
    IN _FK_ID_PROD INT,
    IN _FK_ORDEN_PROD INT,
    IN _CANT_PROD INT,
    IN _ESTADO_CALIDAD INT
)
BEGIN
	UPDATE LINEA_ORDEN SET FK_ID_PROD = _FK_ID_PROD, FK_ORDEN_PROD = _FK_ORDEN_PROD,
	CANT_PROD = _CANT_PROD, ESTADO_CALIDAD = _ESTADO_CALIDAD
	WHERE ID_LINEAORD = _ID_LINEAORD;
END$



CREATE PROCEDURE LISTAR_LINEA_ORDEN(
	IN _ID_LINEAORD INT
)
BEGIN
	SELECT L.ID_LINEAORD AS ID_LINEAORD, P.NOMBRE AS NOMBRE,L.CANT_PROD AS CANT_PROD, O.FECHA AS FECHA FROM LINEA_ORDEN L INNER JOIN PRODUCTO P, ORDENPROD O WHERE FECHA LIKE CONCAT('%', _FECHA,'%') AND P.ID_PROD= L.FK_ID_PROD AND O.ID_ORDENPROD = L.FK_ORDEN_PROD;
END$

CREATE PROCEDURE ELIMINAR_LINEA_ORDEN_PROD(
	OUT _ID_LINEAORD INT
)
BEGIN
	DELETE FROM LINEA_ORDEN WHERE LINEA_ORDEN.ID_LINEAORD = _ID_LINEAORD;
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_DETALLE_INSUMO(
	OUT _ID_DET_ALM_INS INT ,
	IN _FK_ID_INSUMO INT,
	IN _FK_ID_ALMACEN INT,
    IN _NUM_LOTE INT,
    IN _PERIODO DATE,
    IN _STOCK INT,
	IN _CALIDAD INT

)
	
BEGIN
	INSERT INTO DETALLE_ALMACEN_INSUMO (FK_ID_INSUMO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)
	VALUES ( _FK_ID_INSUMO, _FK_ID_ALMACEN, _NUM_LOTE, _PERIODO, _STOCK, _CALIDAD);
	SET _ID_DET_ALM_INS = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_DETALLE_INSUMO(
	IN _ID_DET_ALM_INS INT ,
	IN _FK_ID_INSUMO INT,
	IN _FK_ID_ALMACEN INT,
    IN _NUM_LOTE INT,
    IN _PERIODO DATE,
    IN _STOCK INT,
	IN _CALIDAD INT
)
BEGIN
	UPDATE DETALLE_ALMACEN_INSUMO SET FK_ID_INSUMO = _FK_ID_INSUMO, FK_ID_ALMACEN = _FK_ID_ALMACEN,
	NUM_LOTE = _NUM_LOTE, PERIODO = _PERIODO, STOCK = _STOCK, CALIDAD = _CALIDAD
	WHERE ID_DET_ALM_INS = _ID_DET_ALM_INS;
END$



CREATE PROCEDURE LISTAR_DETALLE_INSUMO(
	IN _ID_DET_ALM_INS INT
)
BEGIN
	SELECT * FROM DETALLE_ALMACEN_INSUMO WHERE ID_DET_ALM_INS =_ID_DET_ALM_INS;
END$





#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_DETALLE_PRODUCTO(
	OUT _ID_DET_ALM_PROD INT,
	IN _FK_ID_PRODUCTO INT,
	IN _FK_ID_ALMACEN INT,
    IN _NUM_LOTE INT,
    IN _PERIODO DATE,
    IN _STOCK INT,
	IN _CALIDAD INT

)
	
BEGIN
	INSERT INTO DETALLE_ALMACEN_PRODUCTO (FK_ID_PRODCUTO,FK_ID_ALMACEN,NUM_LOTE,PERIODO, STOCK,CALIDAD)
	VALUES ( _FK_ID_INSUMO, _FK_ID_ALMACEN, _NUM_LOTE, _PERIODO, _STOCK, _CALIDAD);
	SET _ID_DET_ALM_PROD = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_DETALLE_PRODUCTO(
	IN _ID_DET_ALM_PROD INT ,
	IN _FK_ID_PRODUCTO INT,
	IN _FK_ID_ALMACEN INT,
    IN _NUM_LOTE INT,
    IN _PERIODO DATE,
    IN _STOCK INT,
	IN _CALIDAD INT
)
BEGIN
	UPDATE DETALLE_ALMACEN_PRODUCTO SET FK_ID_PRODUCTO = _FK_ID_PRODUCTO, FK_ID_ALMACEN = _FK_ID_ALMACEN,
	NUM_LOTE = _NUM_LOTE, PERIODO = _PERIODO, STOCK = _STOCK, CALIDAD = _CALIDAD
	WHERE ID_DET_ALM_INS = _ID_DET_ALM_INS;
END$



CREATE PROCEDURE LISTAR_DETALLE_PRODUCTO(
	IN _ID_DET_ALM_PROD INT
)
BEGIN
	SELECT * FROM DETALLE_ALMACEN_PRODUCTO WHERE ID_DET_ALM_PROD =_ID_DET_ALM_PROD;
END$



#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_POLITICA(
	OUT _ID_PLT_STOCK INT,
    IN _FK_ID_PROD INT,
    IN _CANT_MAX INT,
    IN _CANT_MIN INT

)
	
BEGIN
	INSERT INTO POLITICA_DE_STOCK (FK_ID_PROD,CANT_MAX,CANT_MIN)
	VALUES (_FK_ID_PROD,_CANT_MAX,_CANT_MIN);
	SET _ID_PLT_STOCK = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_POLITICA(
	IN _ID_PLT_STOCK INT,
    IN _FK_ID_PROD INT,
    IN _CANT_MAX INT,
    IN _CANT_MIN INT
)
BEGIN
	UPDATE POLITICA_DE_STOCK SET FK_ID_PROD = _FK_ID_PROD, CANT_MAX = _CANT_MAX,
	CANT_MIN = _CANT_MIN
	WHERE ID_PLT_STOCK = _ID_PLT_STOCK;
END$



CREATE PROCEDURE LISTAR_POLITICA()
BEGIN
	SELECT P.ID_PLT_STOCK AS ID_PLT_STOCK , PR.NOMBRE AS NOMBRE, P.CANT_MAX AS CANT_MAX, P.CANT_MIN AS CANT_MIN FROM POLITICA_DE_STOCK P INNER JOIN PRODUCTO PR WHERE P.FK_ID_PROD = PR.ID_PROD;
END$


#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_LINEA_PROYECCION(
	OUT _ID_LIN_PROY INT,
    IN _FK_ID_PROD INT,
    IN _CANT INT,
    IN _FK_ID_PROY_VENTA INT

)
	
BEGIN
	INSERT INTO LINEA_PROYECCION (FK_ID_PROD,CANT,FK_ID_PROY_VENTA)
	VALUES (_FK_ID_PROD,_CANT,_FK_ID_PROY_VENTA);
	SET _ID_LIN_PROY = last_insert_id();
END$



CREATE PROCEDURE ACTUALIZAR_LINEA_PROYECCION(
	IN _ID_LIN_PROY INT,
    IN _FK_ID_PROD INT,
    IN _CANT INT,
    IN _FK_ID_PROY_VENTA INT
)
BEGIN
	UPDATE LINEA_PROYECCION SET FK_ID_PROD = _FK_ID_PROD, CANT = _CANT,
	FK_ID_PROY_VENTA = _FK_ID_PROY_VENTA
	WHERE ID_LIN_PROY = _ID_LIN_PROY;
END$
CREATE PROCEDURE LISTAR_LINEA_PROYECCION()
BEGIN
	SELECT L.ID_LIN_PROY AS ID_LIN_PROY , P.NOMBRE AS NOMBRE, L.CANT AS CANT FROM LINEA_PROYECCION L INNER JOIN PRODUCTO P WHERE L.FK_ID_PROD = P.ID_PROD;
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#

CREATE PROCEDURE VERIFICAR_USUARIO(
	IN _USUARIO VARCHAR(50),
	IN _CONTRASENA VARCHAR(50),
	OUT _ES_VALIDO TINYINT(1),
	OUT _ID_TRABAJADOR INT
)
BEGIN
	SET _ID_TRABAJADOR = (SELECT ID_TRABAJADOR
						 FROM USUARIO
                         INNER JOIN TRABAJADOR
                         ON TRABAJADOR.FK_ID_USUARIO = USUARIO.ID_USUARIO
                         WHERE USUARIO.USERNAME  = _USUARIO
                         AND USUARIO.CONTRASENA = _CONTRASENA);
	
	SET _ES_VALIDO = 1;
	
	IF(_ID_TRABAJADOR IS NULL) THEN
		SET _ES_VALIDO = 0;
	END IF;
END$

#---------------------------------------------------------------------------------------------------------------------------------------------------#



CREATE PROCEDURE INSERTAR_MENSAJE(
	OUT _ID_MENSAJE INT,
    IN _ID_EMISOR INT,
    IN _ID_RECEPTOR INT,
	IN _DESCRIPCION VARCHAR(50),
    IN _FECHA_ENVIO DATE
)	
	
BEGIN
	INSERT INTO MENSAJE (ID_MENSAJE, FECHA_ENVIO, ID_EMISOR, ID_RECEPTOR, DESCRIPCION,ACTIVO) 
    VALUES (_ID_MENSAJE, _FECHA_ENVIO, _ID_EMISOR, _ID_RECEPTOR, _DESCRIPCION,1);
	SET _ID_MENSAJE = last_insert_id();
END$


CREATE PROCEDURE ELIMINAR_MENSAJE(
	IN _ID_MENSAJE INT
)
BEGIN
	UPDATE MENSAJE SET ACTIVO = 0 WHERE ID_MENSAJE = _ID_MENSAJE;
END$


CREATE PROCEDURE LISTAR_MENSAJES(
	IN _ID_RECEPTOR VARCHAR(50)
)
BEGIN
	SELECT MENSAJE.ID_MENSAJE, MENSAJE.FECHA_ENVIO, MENSAJE.DESCRIPCION, TRABAJADOR.NOMBRES AS NOMBRE_EMISOR, TRABAJADOR.APELLIDOS AS APELLIDO_EMISOR, ROL.ID_ROL AS ID_ROL_EMISOR, ROL.DESCRIPCION AS DESCRIPCION_ROL_EMISOR  FROM MENSAJE 
    INNER JOIN TRABAJADOR ON MENSAJE.ID_EMISOR=TRABAJADOR.ID_TRABAJADOR 
    INNER JOIN ROL ON ROL.ID_ROL=TRABAJADOR.FK_ID_ROL 
    WHERE ID_RECEPTOR LIKE CONCAT('%', _ID_RECEPTOR,'%');
END$


#---------------------------------------------------------------------------------------------------------------------------------------------------#
