CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_EVENTOS_PKG AS
PROCEDURE FIDE_EVENTOS_TB_GET_EVENTOS_ACTIVOS_SP (DATOS OUT SYS_REFCURSOR);
PROCEDURE FIDE_EVENTOS_TB_GET_EVENTO_SP (DATOS OUT SYS_REFCURSOR, P_ID IN NUMBER);
FUNCTION FIDE_EVENTOS_TB_INSERTAR_REGISTRO_MIEMBRO_FN (P_CEDULA IN NUMBER, P_ID_EVENTO IN NUMBER) RETURN NUMBER;
FUNCTION FIDE_EVENTOS_TB_VALIDAR_MEMBRESIA_FN (P_CEDULA IN NUMBER) RETURN NUMBER;

END FIDE_LOS_JAULES_EVENTOS_PKG;

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_EVENTOS_PKG AS

--VALIDAR SI EL USUARIO TIENE UNA MEMBRESIA ACTIVA QUE PERMITA REGISTRARSE EN LOS EVENTOS
FUNCTION FIDE_EVENTOS_TB_VALIDAR_MEMBRESIA_FN (P_CEDULA IN NUMBER) RETURN NUMBER
AS
V_CONTAR NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_CONTAR FROM FIDE_MEMBRESIAS_TB 
    WHERE CEDULA = P_CEDULA AND ID_ESTADO = 1;
    
    IF V_CONTAR = 1 THEN
        RETURN 1;
    ELSE 
        RETURN 0;
    END IF;

END FIDE_EVENTOS_TB_VALIDAR_MEMBRESIA_FN;

--OBTIENE LOS EVENTOS ACTIVOS EN EL FE
PROCEDURE FIDE_EVENTOS_TB_GET_EVENTOS_ACTIVOS_SP (DATOS OUT SYS_REFCURSOR) 
AS
BEGIN
    OPEN DATOS FOR
    SELECT E.ID_EVENTO, E.NOMBRE, E.DESCRIPCION,TO_CHAR(hora, 'HH:MI AM') AS HORA, E.FECHA, E.ID_ESTADO, E.ID_INSTALACION, E.CAPACIDAD, I.NOMBRE AS INSTALACION
    FROM FIDE_EVENTOS_TB E
    INNER JOIN FIDE_INSTALACIONES_TB I
    ON E.ID_INSTALACION = I.ID_INSTALACION
    WHERE E.ID_ESTADO = 1;
END FIDE_EVENTOS_TB_GET_EVENTOS_ACTIVOS_SP;

--OBTIENE LOS DETALLES DEL EVENTOS 
PROCEDURE FIDE_EVENTOS_TB_GET_EVENTO_SP (DATOS OUT SYS_REFCURSOR, P_ID IN NUMBER) 
AS
BEGIN
    OPEN DATOS FOR
    SELECT E.ID_EVENTO, E.NOMBRE, E.DESCRIPCION, E.HORA, E.FECHA, E.ID_ESTADO, E.ID_INSTALACION, E.CAPACIDAD, I.NOMBRE AS INSTALACION
    FROM FIDE_EVENTOS_TB E
    INNER JOIN FIDE_INSTALACIONES_TB I
    ON E.ID_INSTALACION = I.ID_INSTALACION
    WHERE E.ID_EVENTO = P_ID;
END FIDE_EVENTOS_TB_GET_EVENTO_SP;

    
FUNCTION FIDE_EVENTOS_TB_INSERTAR_REGISTRO_MIEMBRO_FN (P_CEDULA IN NUMBER, P_ID_EVENTO IN NUMBER) RETURN NUMBER
AS
    V_SQL VARCHAR2(500);
    V_TIENE_MEMBRESIA NUMBER;
    V_TIPO_MEMBRESIA NUMBER;
    V_FECHA_FIN DATE;
    V_FECHA_EVENTO DATE;
    V_CAPACIDAD NUMBER;
BEGIN
    -- Validar si tiene membresía activa
    V_TIENE_MEMBRESIA := FIDE_EVENTOS_TB_VALIDAR_MEMBRESIA_FN(P_CEDULA);

    SELECT FECHA, CAPACIDAD INTO V_FECHA_EVENTO, V_CAPACIDAD
    FROM FIDE_EVENTOS_TB
    WHERE ID_EVENTO = P_ID_EVENTO;

    IF V_CAPACIDAD <= 0 THEN
        RETURN 4; -- No hay cupo
    END IF;

    IF V_TIENE_MEMBRESIA = 1 THEN
        SELECT ID_TIPO_MEMBRESIA, FECHA_FIN INTO V_TIPO_MEMBRESIA, V_FECHA_FIN 
        FROM FIDE_MEMBRESIAS_TB 
        WHERE CEDULA = P_CEDULA AND ID_ESTADO = 1;

        IF V_FECHA_FIN >= V_FECHA_EVENTO THEN
            V_SQL := 'INSERT INTO FIDE_REGISTRO_EVENTOS_TB (CEDULA, ID_EVENTO, FECHA_REGISTRO) VALUES (:1,:2,:3)';
            EXECUTE IMMEDIATE V_SQL USING P_CEDULA, P_ID_EVENTO, SYSDATE;

            UPDATE FIDE_EVENTOS_TB SET CAPACIDAD = CAPACIDAD - 1 WHERE ID_EVENTO = P_ID_EVENTO;
            COMMIT;

            RETURN 1; -- Éxito
        ELSE
            RETURN 2; -- Membresía expira antes del evento
        END IF;
    ELSE 
        RETURN 3; -- No tiene membresía activa
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Error en el registro del evento: ' || SQLERRM);

          
END FIDE_EVENTOS_TB_INSERTAR_REGISTRO_MIEMBRO_FN;

END FIDE_LOS_JAULES_EVENTOS_PKG;

SET SERVEROUTPUT ON
COMMIT;

