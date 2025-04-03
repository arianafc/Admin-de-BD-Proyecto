-- =============================================================
-- 1. PROCEDURE PARA CREAR UN CARRITO
-- =============================================================
CREATE OR REPLACE PROCEDURE SP_CREAR_CARRITO (
  p_id_usuario IN NUMBER,
  p_id_carrito OUT NUMBER
) AS
BEGIN
  INSERT INTO FIDE_CARRITO_TB (ID_USUARIO, FECHA_CREACION, ESTADO)
  VALUES (p_id_usuario, SYSDATE, 'ACTIVO')
  RETURNING ID_CARRITO INTO p_id_carrito;
END;
/

-- =============================================================
-- 2. PROCEDURE PARA AGREGAR ÍTEMS AL CARRITO
-- =============================================================
CREATE OR REPLACE PROCEDURE SP_AGREGAR_ITEM (
  p_id_carrito IN NUMBER,
  p_tipo IN VARCHAR2,
  p_id_origen IN NUMBER,
  p_nombre IN VARCHAR2,
  p_precio IN NUMBER
) AS
BEGIN
  IF p_tipo = 'MEMBRESIA' THEN
    INSERT INTO FIDE_CARRITO_ITEMS_TB (
      ID_CARRITO, ID_TIPO_MEMBRESIA, TIPO, NOMBRE, PRECIO
    ) VALUES (
      p_id_carrito, p_id_origen, p_tipo, p_nombre, p_precio
    );
  ELSIF p_tipo = 'RESERVA' THEN
    INSERT INTO FIDE_CARRITO_ITEMS_TB (
      ID_CARRITO, ID_RESERVA, TIPO, NOMBRE, PRECIO
    ) VALUES (
      p_id_carrito, p_id_origen, p_tipo, p_nombre, p_precio
    );
  END IF;
END;
/

-- =============================================================
-- 3. PROCEDURE PARA FINALIZAR UN CARRITO
-- =============================================================
CREATE OR REPLACE PROCEDURE SP_FINALIZAR_CARRITO (
  p_id_carrito IN NUMBER
) AS
BEGIN
  UPDATE FIDE_CARRITO_TB
  SET ESTADO = 'FINALIZADO'
  WHERE ID_CARRITO = p_id_carrito;
END;
/




-- Secuencia y trigger para autogenerar ID_CARRITO
CREATE SEQUENCE SEQ_ID_CARRITO START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TRG_ID_CARRITO
BEFORE INSERT ON FIDE_CARRITO_TB
FOR EACH ROW
BEGIN
  SELECT SEQ_ID_CARRITO.NEXTVAL INTO :NEW.ID_CARRITO FROM DUAL;
END;
/


-- Secuencia y trigger para autogenerar ID_ITEM
CREATE SEQUENCE SEQ_ID_CARRITO_ITEM START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER TRG_ID_CARRITO_ITEM
BEFORE INSERT ON FIDE_CARRITO_ITEMS_TB
FOR EACH ROW
BEGIN
  SELECT SEQ_ID_CARRITO_ITEM.NEXTVAL INTO :NEW.ID_ITEM FROM DUAL;
END;
/