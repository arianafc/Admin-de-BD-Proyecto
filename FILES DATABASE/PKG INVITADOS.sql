CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_INVITADOS_PKG AS
PROCEDURE FIDE_INVITADOS_TB_AGREGAR_INVITADO_SP (P_CEDULA IN NUMBER, P_CEDULA_MIEMBRO IN NUMBER, P_RESULTADO OUT VARCHAR2);
PROCEDURE FIDE_INVITADOS_TB_ELIMINAR_INVITADO_SP (P_ID_INVITADO IN NUMBER, P_RESULTADO OUT VARCHAR2);
PROCEDURE FIDE_INVITADOS_TB_GET_SP(P_CURSOR OUT SYS_REFCURSOR, P_CEDULA IN NUMBER);
END FIDE_LOS_JAULES_INVITADOS_PKG;

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_INVITADOS_PKG AS
PROCEDURE FIDE_INVITADOS_TB_AGREGAR_INVITADO_SP (P_CEDULA IN NUMBER, P_CEDULA_MIEMBRO IN NUMBER, P_RESULTADO OUT VARCHAR2) AS
V_CONTAR NUMBER;
V_NUM_INVITADOS NUMBER;
V_INVITADOS_PERMITIDOS NUMBER;
V_MEMBRESIA NUMBER;
BEGIN

    SELECT COUNT(*) INTO V_MEMBRESIA 
    FROM FIDE_MEMBRESIAS_TB
    WHERE CEDULA = P_CEDULA_MIEMBRO AND ID_ESTADO = 1;
    
    IF V_MEMBRESIA = 0 THEN
     P_RESULTADO := 'No tienes una membresía activa';
    RETURN;
    END IF;


    SELECT COUNT(*) INTO V_NUM_INVITADOS FROM FIDE_INVITADOS_TB 
    WHERE CEDULA_MIEMBRO = P_CEDULA_MIEMBRO AND ID_ESTADO = 1;
    
    SELECT T.NUM_INVITADOS INTO V_INVITADOS_PERMITIDOS
    FROM FIDE_MEMBRESIAS_TB M
    INNER JOIN FIDE_TIPO_MEMBRESIAS_TB T ON M.ID_TIPO_MEMBRESIA = T.ID_TIPO_MEMBRESIA
    WHERE M.CEDULA = P_CEDULA_MIEMBRO AND M.ID_ESTADO = 1 AND ROWNUM = 1;
    
    IF V_NUM_INVITADOS < V_INVITADOS_PERMITIDOS THEN

    SELECT COUNT(*) INTO V_CONTAR
    FROM FIDE_INVITADOS_TB
    WHERE CEDULA = P_CEDULA AND CEDULA_MIEMBRO = P_CEDULA_MIEMBRO AND ID_ESTADO = 1;

    
    IF V_CONTAR > 0 THEN
    P_RESULTADO := 'El invitado ya ha sido registrado';
    RETURN;
    ELSE 
    INSERT INTO FIDE_INVITADOS_TB (CEDULA, FECHA_REGISTRO, ID_ESTADO, CEDULA_MIEMBRO) VALUES
    (P_CEDULA, SYSDATE, 1, P_CEDULA_MIEMBRO);
    COMMIT;
    END IF;

    ELSE 
      P_RESULTADO := 'Haz alcanzado el limite de invitados permitidos';
    RETURN;
    END IF;
EXCEPTION 
WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, SQLERRM);
END FIDE_INVITADOS_TB_AGREGAR_INVITADO_SP;





PROCEDURE FIDE_INVITADOS_TB_ELIMINAR_INVITADO_SP (P_ID_INVITADO IN NUMBER, P_RESULTADO OUT VARCHAR2)
AS
BEGIN
    UPDATE FIDE_INVITADOS_TB SET ID_ESTADO = 0 WHERE ID_INVITADO = P_ID_INVITADO;
    COMMIT;
EXCEPTION 
WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20001, SQLERRM);
END FIDE_INVITADOS_TB_ELIMINAR_INVITADO_SP;


PROCEDURE FIDE_INVITADOS_TB_GET_SP(P_CURSOR OUT SYS_REFCURSOR, P_CEDULA IN NUMBER) AS
BEGIN
    OPEN P_CURSOR FOR
    SELECT CEDULA, FECHA_REGISTRO, ID_INVITADO, CEDULA_MIEMBRO FROM FIDE_INVITADOS_TB
    WHERE ID_ESTADO = 1;

END FIDE_INVITADOS_TB_GET_SP;

END FIDE_LOS_JAULES_INVITADOS_PKG;

COMMIT;