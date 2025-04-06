create or replace PACKAGE FIDE_LOS_JAULES_CARRITO_PKG AS
PROCEDURE FIDE_LOS_JAULES_CREAR_CARRITO_SP(P_CEDULA IN NUMBER, P_CARRITO OUT NUMBER);
PROCEDURE FIDE_LOS_JAULES_CARRITO_GET_USUARIO_SP(P_USERNAME IN VARCHAR2, P_CEDULA OUT NUMBER);
PROCEDURE FIDE_LOS_JAULES_AGREGAR_MEMBRESIA_SP(P_CEDULA IN NUMBER, P_ID_CARRITO IN NUMBER, P_MEMBRESIA IN NUMBER);
PROCEDURE FIDE_LOS_JAULES_AGREGAR_RESERVA_SP (P_CEDULA IN NUMBER, P_ID_CARRITO IN NUMBER, P_RESERVA IN NUMBER);
PROCEDURE FIDE_LOS_JAULES_GET_CARRITO_SP(P_CARRITO IN NUMBER, DATOS OUT SYS_REFCURSOR);
FUNCTION FIDE_LOS_JAULES_ELIMINAR_FN(P_ITEM IN NUMBER)RETURN NUMBER;

END FIDE_LOS_JAULES_CARRITO_PKG;

create or replace PACKAGE BODY FIDE_LOS_JAULES_CARRITO_PKG AS
--1.CREAR CARRITO
PROCEDURE FIDE_LOS_JAULES_CARRITO_GET_USUARIO_SP(
    P_USERNAME IN VARCHAR2, 
    P_CEDULA OUT NUMBER
) AS
BEGIN
    -- Intentar obtener la cédula del usuario
    BEGIN
        SELECT CEDULA INTO P_CEDULA 
        FROM FIDE_USUARIOS_TB 
        WHERE USUARIO = P_USERNAME;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            P_CEDULA := NULL;
            DBMS_OUTPUT.PUT_LINE('Error: No se encontró el usuario ' || P_USERNAME);

        WHEN TOO_MANY_ROWS THEN
            P_CEDULA := NULL;
            DBMS_OUTPUT.PUT_LINE('Error: Más de un usuario encontrado para ' || P_USERNAME);

        WHEN OTHERS THEN
            P_CEDULA := NULL;
            DBMS_OUTPUT.PUT_LINE('Error desconocido: ' || DBMS_UTILITY.FORMAT_ERROR_STACK);
    END;
END FIDE_LOS_JAULES_CARRITO_GET_USUARIO_SP;

    PROCEDURE FIDE_LOS_JAULES_CREAR_CARRITO_SP(P_CEDULA IN NUMBER, P_CARRITO OUT NUMBER) AS
        V_RESULTADO NUMBER;
        VSQLCODE NUMBER;
VSQLERRM VARCHAR2(600);
    BEGIN
        -- Verificar si ya existe un carrito para la cédula
        SELECT COUNT(*) INTO V_RESULTADO FROM FIDE_CARRITO_TB WHERE CEDULA = P_CEDULA;

        IF V_RESULTADO = 0 THEN
            INSERT INTO FIDE_CARRITO_TB (ID_CARRITO, CEDULA)
            VALUES (ID_CARRITO_SEQ.NEXTVAL, P_CEDULA)
            RETURNING ID_CARRITO INTO P_CARRITO;
        ELSE 
            SELECT ID_CARRITO INTO P_CARRITO FROM FIDE_CARRITO_TB WHERE 
            CEDULA = P_CEDULA;
        END IF;

    EXCEPTION
        WHEN OTHERS THEN
        VSQLCODE:= SQLCODE;
        VSQLERRM := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Error: ' || VSQLCODE || ' - ' || VSQLERRM);
    END FIDE_LOS_JAULES_CREAR_CARRITO_SP;
---2. AÑADIR ARTICULOS A CARRITO
PROCEDURE FIDE_LOS_JAULES_AGREGAR_MEMBRESIA_SP(P_CEDULA IN NUMBER, P_ID_CARRITO IN NUMBER, P_MEMBRESIA IN NUMBER)
AS
V_PRECIO NUMBER;
VSQLCODE NUMBER;
VSQLERRM VARCHAR2(600);
V_CANTIDAD NUMBER;
BEGIN
V_CANTIDAD:=1;
    SELECT COSTO INTO V_PRECIO FROM FIDE_TIPO_MEMBRESIAS_TB WHERE ID_TIPO_MEMBRESIA = P_MEMBRESIA;
    INSERT INTO FIDE_CARRITO_ITEMS_TB (ID_CARRITO, ID_TIPO_MEMBRESIA, CANTIDAD, PRECIO) VALUES (P_ID_CARRITO, P_MEMBRESIA, V_CANTIDAD, V_PRECIO*V_CANTIDAD);
    COMMIT;
 EXCEPTION
        WHEN OTHERS THEN
            VSQLCODE:= SQLCODE;
            VSQLERRM := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Error: ' || VSQLCODE || ' - ' || VSQLERRM);
            RAISE_APPLICATION_ERROR(-20002, 'No se pudo agregar la membresía: ' || SQLERRM);
END FIDE_LOS_JAULES_AGREGAR_MEMBRESIA_SP;

--2.2. AÑADIR RESERVAS A CARRITO
PROCEDURE FIDE_LOS_JAULES_AGREGAR_RESERVA_SP(P_CEDULA IN NUMBER, P_ID_CARRITO IN NUMBER, P_RESERVA IN NUMBER)
AS
V_PRECIO NUMBER;
V_CANTIDAD NUMBER;
VSQLCODE NUMBER;
VSQLERRM VARCHAR2(600);
V_FECHA_INICIO DATE;
V_FECHA_FIN DATE;
BEGIN

    SELECT R.COSTO INTO V_PRECIO FROM 
    FIDE_RESERVAS_TB J
    INNER JOIN FIDE_INSTALACIONES_TB R ON
    J.ID_INSTALACION = R.ID_INSTALACION
    WHERE ID_RESERVA = P_RESERVA;
    --CALCULAR CANTIDAD DE NOCHES
    SELECT FECHA_INICIO, FECHA_FIN INTO V_FECHA_INICIO, V_FECHA_FIN
    FROM FIDE_RESERVAS_TB
    WHERE ID_RESERVA = P_RESERVA;
    
    V_CANTIDAD := V_FECHA_FIN - V_FECHA_INICIO;
    
    INSERT INTO FIDE_CARRITO_ITEMS_TB (ID_CARRITO, ID_RESERVA, CANTIDAD, PRECIO) VALUES (P_ID_CARRITO, P_RESERVA, V_CANTIDAD, V_PRECIO);
    COMMIT;
 EXCEPTION
        WHEN OTHERS THEN
                VSQLCODE:= SQLCODE;
                VSQLERRM := SQLERRM;
            DBMS_OUTPUT.PUT_LINE('Error: ' || VSQLCODE || ' - ' || VSQLERRM);
END FIDE_LOS_JAULES_AGREGAR_RESERVA_SP;
------------------------------------------------------------------
----3. GET CARRITO
PROCEDURE FIDE_LOS_JAULES_GET_CARRITO_SP(P_CARRITO IN NUMBER, DATOS OUT SYS_REFCURSOR)
AS
BEGIN
    OPEN DATOS FOR
    SELECT CI.ID_ITEM, CI.CANTIDAD, CI.PRECIO, M.ID_TIPO_MEMBRESIA, R.ID_RESERVA, M.NOMBRE MEMBRESIA, I.NOMBRE AS RESERVA, (PRECIO*CANTIDAD) AS TOTAL
    FROM FIDE_CARRITO_ITEMS_TB CI
    LEFT JOIN FIDE_TIPO_MEMBRESIAS_TB M ON CI.ID_TIPO_MEMBRESIA = M.ID_TIPO_MEMBRESIA
    LEFT JOIN FIDE_RESERVAS_TB R ON CI.ID_RESERVA = R.ID_RESERVA
    LEFT JOIN FIDE_INSTALACIONES_TB I ON I.ID_INSTALACION = R.ID_INSTALACION
    WHERE CI.ID_CARRITO = P_CARRITO;
END  FIDE_LOS_JAULES_GET_CARRITO_SP;

--4. ELIMINAR CARRITO
FUNCTION FIDE_LOS_JAULES_ELIMINAR_FN(P_ITEM IN NUMBER)
RETURN NUMBER
AS
    V_RESERVA FIDE_CARRITO_ITEMS_TB.ID_RESERVA%TYPE;
BEGIN

    SELECT ID_RESERVA INTO V_RESERVA 
    FROM FIDE_CARRITO_ITEMS_TB
    WHERE ID_ITEM = P_ITEM;

    IF V_RESERVA IS NOT NULL THEN
        DELETE FROM FIDE_CARRITO_ITEMS_TB WHERE ID_ITEM = P_ITEM;
        DELETE FROM FIDE_RESERVAS_TB WHERE ID_RESERVA = V_RESERVA;
        COMMIT;
           RETURN 0;
    ELSE
        DELETE FROM FIDE_CARRITO_ITEMS_TB WHERE ID_ITEM = P_ITEM;
        COMMIT;
        RETURN 1;
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20001, 'ERROR: ' || SQLERRM);
END FIDE_LOS_JAULES_ELIMINAR_FN;

END FIDE_LOS_JAULES_CARRITO_PKG;

COMMIT;

SET SERVEROUTPUT ON

TRUNCATE TABLE FIDE_CARRITO_ITEMS_TB
EXEC FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_GET_CARRITO_SP(1233, 10, 1);