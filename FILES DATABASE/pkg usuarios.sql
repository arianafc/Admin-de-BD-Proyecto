-- CABECERA DEL PAQUETE
CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_USUARIOS_PKG AS
  PROCEDURE FIDE_USUARIOS_TB_GET_USERS_SP (DATOS OUT SYS_REFCURSOR, P_ROL IN NUMBER);
  PROCEDURE FIDE_USUARIO_TB_GET_BY_USUARIO_SP (p_usuario IN VARCHAR2, datos OUT SYS_REFCURSOR);
  PROCEDURE FIDE_USUARIO_TB_GET_BY_CEDULA_SP (p_cedula IN VARCHAR2, datos OUT SYS_REFCURSOR);
  PROCEDURE FIDE_USUARIO_TB_ELIMINAR_SP (p_cedula IN VARCHAR2);
  PROCEDURE FIDE_USUARIO_TB_MODIFICAR_SP (p_cedula IN NUMBER, p_nombre IN VARCHAR2, p_apellido1 IN VARCHAR2, p_apellido2 IN VARCHAR2, p_email IN VARCHAR2, p_id_rol IN NUMBER
);

END FIDE_LOS_JAULES_USUARIOS_PKG;
/


-- CUERPO DEL PAQUETE
CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_USUARIOS_PKG AS

PROCEDURE FIDE_USUARIOS_TB_GET_USERS_SP (DATOS OUT SYS_REFCURSOR, P_ROL IN NUMBER) AS
BEGIN
  OPEN DATOS FOR
    SELECT 
        U.CEDULA,
        U.NOMBRE || ' ' || U.APELLIDO1 || ' ' || U.APELLIDO2 AS NOMBRE_COMPLETO,
        U.NOMBRE,
        U.APELLIDO1,
        U.APELLIDO2,
        U.FECHA_INGRESO, 
        U.FECHA_BAJA, 
        R.DESCRIPCION AS ROL, 
        E.DESCRIPCION AS ESTADO, 
        EM.EMAIL,
        U.USUARIO
    FROM FIDE_USUARIOS_TB U
    INNER JOIN FIDE_ROLES_TB R ON U.ID_ROL = R.ID_ROL
    INNER JOIN FIDE_ESTADO_TB E ON U.ID_ESTADO = E.ID_ESTADO
    LEFT JOIN FIDE_EMAIL_TB EM 
        ON U.CEDULA = EM.CEDULA AND EM.ID_ESTADO = 1
    WHERE U.ID_ESTADO = 1 AND U.ID_ROL = P_ROL;
END;

PROCEDURE FIDE_USUARIO_TB_GET_BY_USUARIO_SP (p_usuario IN VARCHAR2, datos OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN datos FOR
      SELECT 
        U.CEDULA,
        U.NOMBRE,
        U.APELLIDO1,
        U.APELLIDO2,
        U.USUARIO,
        U.FECHA_INGRESO,
        U.FECHA_BAJA,
        R.DESCRIPCION AS ROL,
        E.DESCRIPCION AS ESTADO,
        EM.EMAIL
      FROM FIDE_USUARIOS_TB U
      INNER JOIN FIDE_ROLES_TB R ON U.ID_ROL = R.ID_ROL
      INNER JOIN FIDE_ESTADO_TB E ON U.ID_ESTADO = E.ID_ESTADO
      LEFT JOIN FIDE_EMAIL_TB EM ON U.CEDULA = EM.CEDULA
      WHERE U.USUARIO = p_usuario;
  END;

PROCEDURE FIDE_USUARIO_TB_GET_BY_CEDULA_SP (p_cedula IN VARCHAR2, datos OUT SYS_REFCURSOR) AS
  BEGIN
    OPEN datos FOR
      SELECT 
        U.CEDULA, 
        U.NOMBRE, 
        U.APELLIDO1, 
        U.APELLIDO2, 
        EM.EMAIL,
        U.USUARIO,
        R.DESCRIPCION AS ROL, 
        E.DESCRIPCION AS ESTADO
      FROM FIDE_USUARIOS_TB U
      INNER JOIN FIDE_ROLES_TB R ON U.ID_ROL = R.ID_ROL
      INNER JOIN FIDE_ESTADO_TB E ON U.ID_ESTADO = E.ID_ESTADO
      LEFT JOIN FIDE_EMAIL_TB EM ON U.CEDULA = EM.CEDULA
      WHERE U.CEDULA = p_cedula AND EM.ID_ESTADO = 1;
  END;

PROCEDURE FIDE_USUARIO_TB_ELIMINAR_SP (p_cedula IN VARCHAR2) AS
  V_CONTAR NUMBER;
  BEGIN
    UPDATE FIDE_USUARIOS_TB SET ID_ESTADO = 0, FECHA_BAJA = SYSDATE
    WHERE CEDULA = p_cedula;
    
    SELECT COUNT(ID_MEMBRESIA) INTO V_CONTAR FROM FIDE_MEMBRESIAS_TB WHERE CEDULA = P_CEDULA 
    AND ID_ESTADO = 1;
    
    IF V_CONTAR > 0 THEN
        UPDATE FIDE_MEMBRESIAS_TB SET ID_ESTADO = 0
        WHERE CEDULA = P_CEDULA AND ID_ESTADO = 1;
    END IF;
    
    UPDATE FIDE_EMAIL_TB SET ID_ESTADO = 0 WHERE CEDULA = P_CEDULA AND ID_ESTADO = 1;
    UPDATE FIDE_TELEFONOS_TB SET ID_ESTADO = 0 WHERE CEDULA = P_CEDULA AND ID_ESTADO = 1;
    UPDATE FIDE_DIRECCIONES_TB SET ID_ESTADO = 0  WHERE CEDULA = P_CEDULA AND ID_ESTADO = 1;
    
    COMMIT;
  END;
  
PROCEDURE FIDE_USUARIO_TB_MODIFICAR_SP (
  p_cedula      IN NUMBER,
  p_nombre      IN VARCHAR2,
  p_apellido1   IN VARCHAR2,
  p_apellido2   IN VARCHAR2,
  p_email       IN VARCHAR2,
  p_id_rol      IN NUMBER
) AS
  v_count NUMBER;
  v_contar number;
BEGIN
  -- 1. Actualiza los datos básicos
  UPDATE FIDE_USUARIOS_TB
  SET 
    NOMBRE = p_nombre,
    APELLIDO1 = p_apellido1,
    APELLIDO2 = p_apellido2,
    ID_ROL = p_id_rol
  WHERE CEDULA = p_cedula;

  -- 2. Verifica si el nuevo correo ya está en uso por otro usuario activo
  SELECT COUNT(*) INTO v_count
  FROM FIDE_EMAIL_TB
  WHERE EMAIL = p_email AND ID_ESTADO = 1 AND CEDULA != p_cedula;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'El correo electrónico ya está registrado con otro usuario.');
  END IF;

  -- 3. Actualiza el correo existente
  SELECT COUNT(EMAIL) INTO V_CONTAR FROM FIDE_EMAIL_TB
  WHERE CEDULA = P_CEDULA AND ID_ESTADO = 1;
  IF V_CONTAR = 0 THEN
    INSERT INTO FIDE_EMAIL_TB(CEDULA, EMAIL, ID_ESTADO) VALUES
    (P_CEDULA, LOWER(P_EMAIL), 1);
    COMMIT;
  ELSE
  UPDATE FIDE_EMAIL_TB
  SET EMAIL = p_email
  WHERE CEDULA = p_cedula AND ID_ESTADO = 1;
    END IF;
    

  COMMIT;
END FIDE_USUARIO_TB_MODIFICAR_SP;

END FIDE_LOS_JAULES_USUARIOS_PKG;

CREATE SEQUENCE ID_EMAIL_SEQ INCREMENT BY 1 START WITH 1
MAXVALUE 99999 MINVALUE 0;

create or replace TRIGGER FIDE_EMAIL_TB_INSERTAR_TG
    BEFORE INSERT ON FIDE_EMAIL_TB
    FOR EACH ROW
    BEGIN
        SELECT ID_EMAIL_SEQ.NEXTVAL INTO :NEW.ID_EMAIL FROM DUAL;
END FIDE_EMAIL_TB_INSERTAR_TG;

ALTER TABLE FIDE_EMAIL_TB 
ADD (
    ID_ESTADO NUMBER,
    CONSTRAINT FIDE_EMAIL_TB_ESTADO 
        FOREIGN KEY (ID_ESTADO) 
        REFERENCES FIDE_ESTADO_TB (ID_ESTADO)
);
COMMIT

ALTER TABLE FIDE_DIRECCIONES_TB 
ADD (
    ID_ESTADO NUMBER,
    CONSTRAINT FIDE_DIRECCIONES_TB_ESTADO 
        FOREIGN KEY (ID_ESTADO) 
        REFERENCES FIDE_ESTADO_TB (ID_ESTADO)
);



CREATE UNIQUE INDEX FIDE_EMAIL_UNIQUE_IDX 
ON FIDE_EMAIL_TB (EMAIL, ID_ESTADO);


ALTER TABLE FIDE_EMAIL_TB DROP CONSTRAINT FIDE_EMAIL_TB_EMAIL_UNIQUE;