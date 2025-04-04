CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_RESERVAS_PKG AS
PROCEDURE FIDE_RESERVAS_TB_INSTALACIONES_SP (DATOS OUT SYS_REFCURSOR, P_TIPO IN NUMBER);
PROCEDURE FIDE_RESERVAS_TB_GET_INSTALACION_SP (DATOS OUT SYS_REFCURSOR, P_ID IN NUMBER);
PROCEDURE FIDE_RESERVAS_TB_CREAR_RESERVA_SP (
    P_CEDULA IN NUMBER,
    P_FECHA_INICIO  IN date,
    P_FECHA_FIN    IN date,
    P_ID_INSTALACION IN NUMBER,
    P_NUM_PERSONAS  IN NUMBER,
    P_ID_CARRITO IN NUMBER,
    P_RESULTADO     OUT VARCHAR2
);

END FIDE_LOS_JAULES_RESERVAS_PKG ;

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_RESERVAS_PKG AS
PROCEDURE FIDE_RESERVAS_TB_INSTALACIONES_SP (DATOS OUT SYS_REFCURSOR, P_TIPO IN NUMBER)
AS
BEGIN  
    OPEN DATOS FOR
    SELECT I.ID_INSTALACION, I.NOMBRE, I.COSTO, I.ID_TIPO_INSTALACION, I.CAPACIDAD, T.DESCRIPCION
    FROM FIDE_INSTALACIONES_TB I INNER JOIN FIDE_TIPO_INSTALACION_TB T
    ON I.ID_TIPO_INSTALACION = T.ID_TIPO_INSTALACION
    WHERE I.ID_ESTADO = 1 AND I.ID_TIPO_INSTALACION = P_TIPO;
END FIDE_RESERVAS_TB_INSTALACIONES_SP;

PROCEDURE FIDE_RESERVAS_TB_GET_INSTALACION_SP (DATOS OUT SYS_REFCURSOR, P_ID IN NUMBER)
AS
BEGIN
    OPEN DATOS FOR
     SELECT I.ID_INSTALACION, I.NOMBRE, I.COSTO, I.ID_TIPO_INSTALACION, I.CAPACIDAD, T.DESCRIPCION
    FROM FIDE_INSTALACIONES_TB I INNER JOIN FIDE_TIPO_INSTALACION_TB T
    ON I.ID_TIPO_INSTALACION = T.ID_TIPO_INSTALACION
    WHERE I.ID_INSTALACION = P_ID;
END FIDE_RESERVAS_TB_GET_INSTALACION_SP;


--GENERAR RESERVA
PROCEDURE FIDE_RESERVAS_TB_CREAR_RESERVA_SP (
    P_CEDULA IN NUMBER,
    P_FECHA_INICIO  IN date,
    P_FECHA_FIN    IN date,
    P_ID_INSTALACION IN NUMBER,
    P_NUM_PERSONAS  IN NUMBER,
    P_ID_CARRITO IN NUMBER,
    P_RESULTADO     OUT VARCHAR2
) 
AS
    V_CONTADOR NUMBER;
    V_CAPACIDAD_MAX NUMBER;
    V_RESERVA NUMBER;
BEGIN
    IF P_FECHA_INICIO >= P_FECHA_FIN THEN
        P_RESULTADO := 'ERROR: La fecha de inicio debe ser antes de la fecha de fin.';
        RETURN;
    END IF;
    
     SELECT COUNT(*) INTO v_contador
    FROM FIDE_RESERVAS_TB
    WHERE ID_Instalacion = p_id_instalacion
    AND ID_Estado = 3 
    AND (
        (Fecha_Inicio < p_fecha_fin AND Fecha_Fin > p_fecha_inicio)
    );

    IF V_CONTADOR > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'ERROR: LA CABAÑA YA SE ENCUENTRA RESERVADA');
    END IF;
    
    SELECT CAPACIDAD INTO V_CAPACIDAD_MAX FROM FIDE_INSTALACIONES_TB
    WHERE ID_INSTALACION = P_ID_INSTALACION;
    
    IF P_NUM_PERSONAS > V_CAPACIDAD_MAX THEN
        RAISE_APPLICATION_ERROR(-20001, 'ERROR: La cantidad de personas excede la capacidad máxima de la instalación');
        RETURN;
    END IF;
    INSERT INTO FIDE_RESERVAS_TB (ID_Reserva, Cedula, Fecha_Inicio, Fecha_Fin,  Hora_Fin, Hora_Inicio, ID_Instalacion, ID_Estado, Num_Personas)
    VALUES (ID_RESERVA_SEQ.NEXTVAL, P_CEDULA, P_FECHA_INICIO, P_FECHA_FIN, TO_TIMESTAMP('12:00:00', 'HH24:MI:SS'),  TO_TIMESTAMP('15:00', 'HH24:MI:SS'), P_ID_INSTALACION, 3, P_NUM_PERSONAS);
    
    V_RESERVA := ID_RESERVA_SEQ.CURRVAL;
    Begin
    FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_AGREGAR_RESERVA_SP(P_CEDULA, P_ID_CARRITO, V_RESERVA);
    end;
    COMMIT;
    
    P_RESULTADO := 'Reservación realizada con éxito.';
    
EXCEPTION
    WHEN OTHERS THEN
        P_RESULTADO := 'LO SENTIMOS: ' || SQLERRM;
END FIDE_RESERVAS_TB_CREAR_RESERVA_SP;

END FIDE_LOS_JAULES_RESERVAS_PKG ;

INSERT INTO FIDE_ESTADO_TB VALUES (3, 'PENDIENTE');
INSERT INTO FIDE_ESTADO_TB VALUES (4, 'RESERVADA');
INSERT INTO FIDE_ESTADO_TB VALUES (5, 'CANCELADA');
COMMIT;

SET SERVEROUTPUT ON

DECLARE
    V_RESULTADO VARCHAR2(300);
BEGIN
    BEGIN
        FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_RESERVAS_TB_CREAR_RESERVA_SP (
            1233,                          -- Cedula
            TO_DATE('2025-04-05', 'YYYY-MM-DD'),                   -- Fecha Inicio
            TO_DATE('2025-04-06',  'YYYY-MM-DD'),                -- Fecha Fin
            2,                             -- ID Instalación
            1,                             -- Número de Personas
            V_RESULTADO                    -- Resultado
        );
        DBMS_OUTPUT.PUT_LINE(V_RESULTADO);
    END;
END;


SELECT * FROM NLS_SESSION_PARAMETERS WHERE PARAMETER = 'NLS_DATE_FORMAT';