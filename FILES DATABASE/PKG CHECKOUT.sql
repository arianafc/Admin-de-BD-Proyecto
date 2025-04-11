CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_CHECKOUT_PKG AS
PROCEDURE FIDE_METODO_PAGO_TB_GET_METODOS_SP (DATOS OUT SYS_REFCURSOR);
FUNCTION FIDE_CHECKOUT_TB_TOTAL_SP(P_CARRITO IN NUMBER) RETURN NUMBER;
PROCEDURE FIDE_CHECKOUT_TB_EJECUTAR_SP(P_CARRITO IN NUMBER, P_CEDULA IN NUMBER, P_METODO_PAGO IN NUMBER);

END FIDE_LOS_JAULES_CHECKOUT_PKG;

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_CHECKOUT_PKG AS
PROCEDURE FIDE_METODO_PAGO_TB_GET_METODOS_SP (DATOS OUT SYS_REFCURSOR)AS
BEGIN
    OPEN DATOS FOR
    SELECT ID_METODO_PAGO, DESCRIPCION, ID_ESTADO FROM FIDE_METODO_PAGO_TB;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'No hay metodos de pago.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Error al obtener el metodo de pago: ' || SQLERRM);
END FIDE_METODO_PAGO_TB_GET_METODOS_SP;

FUNCTION FIDE_CHECKOUT_TB_TOTAL_SP(P_CARRITO IN NUMBER) RETURN NUMBER
AS
V_TOTAL NUMBER;
BEGIN
    SELECT SUM(PRECIO*CANTIDAD) AS TOTAL INTO V_TOTAL FROM FIDE_CARRITO_ITEMS_TB WHERE ID_CARRITO = P_CARRITO;
    RETURN V_TOTAL*1.13;
 EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20003, 'Error al calcular el total del carrito: ' || SQLERRM);
    END FIDE_CHECKOUT_TB_TOTAL_SP;

PROCEDURE FIDE_CHECKOUT_TB_EJECUTAR_SP(P_CARRITO IN NUMBER, P_CEDULA IN NUMBER, P_METODO_PAGO IN NUMBER)
AS
V_TOTAL NUMBER;
V_ORDEN NUMBER;
V_MEMBRESIA NUMBER;
V_NUMBER NUMBER;
V_DIAS NUMBER;
V_CONTAR NUMBER;
BEGIN
    V_TOTAL := FIDE_LOS_JAULES_CHECKOUT_PKG.FIDE_CHECKOUT_TB_TOTAL_SP(P_CARRITO);
    INSERT INTO FIDE_ORDENES_TB (CEDULA, TOTAL, ID_ESTADO, ID_METODO_PAGO) VALUES (P_CEDULA, V_TOTAL, 6, P_METODO_PAGO);
    V_NUMBER := ID_ORDEN_SEQ.CURRVAL;
    FOR CUR IN (SELECT ID_RESERVA, ID_TIPO_MEMBRESIA, CANTIDAD, PRECIO FROM FIDE_CARRITO_ITEMS_TB
    WHERE ID_CARRITO = P_CARRITO) LOOP
        UPDATE FIDE_RESERVAS_TB SET ID_ESTADO = 4 WHERE ID_RESERVA = CUR.ID_RESERVA;
        INSERT INTO FIDE_ORDEN_ITEMS_TB (ID_ORDEN, ID_RESERVA, ID_TIPO_MEMBRESIA, CANTIDAD, PRECIO)
            VALUES (V_NUMBER, CUR.ID_RESERVA, CUR.ID_TIPO_MEMBRESIA, CUR.CANTIDAD, CUR.PRECIO);
    END LOOP;
    
    COMMIT;
    
    
        
    SELECT ID_TIPO_MEMBRESIA INTO V_MEMBRESIA FROM FIDE_CARRITO_ITEMS_TB
    WHERE ID_CARRITO = P_CARRITO AND ID_TIPO_MEMBRESIA IS NOT NULL;
    
    IF V_MEMBRESIA IS NOT NULL THEN
    
        --SE ACTUALIZA LAS MEMBRESIAS ACTUALES QUE TIENE A UN ESTADO 0
        --PORQUE SOLO PUEDE TENER UNA MEMBRESIA ACTIVA
        
        UPDATE FIDE_MEMBRESIAS_TB SET ID_ESTADO = 0 WHERE CEDULA = P_CEDULA 
        AND ID_ESTADO = 1;
        
        SELECT DURACION_DIAS INTO V_DIAS 
        FROM FIDE_TIPO_MEMBRESIAS_TB 
        WHERE ID_TIPO_MEMBRESIA = V_MEMBRESIA;
        
        IF(V_DIAS = 1) THEN    
            INSERT INTO FIDE_MEMBRESIAS_TB (CEDULA, FECHA_INICIO, ID_ESTADO, FECHA_FIN, ID_TIPO_MEMBRESIA) VALUES
            (P_CEDULA, SYSDATE, 1, SYSDATE, V_MEMBRESIA);
            COMMIT;
        ELSE 
            INSERT INTO FIDE_MEMBRESIAS_TB (CEDULA, FECHA_INICIO, ID_ESTADO, FECHA_FIN, ID_TIPO_MEMBRESIA) VALUES
                (P_CEDULA, SYSDATE, 1, (SYSDATE + V_DIAS), V_MEMBRESIA);
            COMMIT;
    END IF;
    END IF;
    
    --CREACION DE FACTURA
    INSERT INTO FIDE_FACTURA_TB (ID_ORDEN, FECHA_EMISION, SUBTOTAL, TOTAL, IVA)
    VALUES (V_NUMBER, SYSDATE,(V_TOTAL*0.87) , V_TOTAL, (V_TOTAL*0.13));
    
    --ANALIZAMOS Y AGREGAMOS A LAS PARTICIONES
  
     EXECUTE IMMEDIATE 'ANALYZE TABLE FIDE_FACTURA_TB COMPUTE STATISTICS';
    
    DELETE FIDE_CARRITO_ITEMS_TB WHERE ID_CARRITO = P_CARRITO;
    COMMIT;
EXCEPTION 
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20099, 'Error inesperado: ' || SQLERRM);
END FIDE_CHECKOUT_TB_EJECUTAR_SP;

END FIDE_LOS_JAULES_CHECKOUT_PKG;


commit;


SELECT FIDE_LOS_JAULES_CHECKOUT_PKG.FIDE_CHECKOUT_TB_TOTAL_SP(10) FROM DUAL;