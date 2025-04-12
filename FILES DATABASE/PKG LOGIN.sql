CREATE TABLE FIDE_CLAVE_ENCRIPTAR_TB (
    ID_CLAVE NUMBER CONSTRAINT ID_CLAVE_PK PRIMARY KEY,
    CLAVE RAW(32)
) TABLESPACE FIDE_LOS_JAULES_TBS;

INSERT INTO FIDE_CLAVE_ENCRIPTAR_TB(ID_CLAVE, CLAVE)
VALUES (1, UTL_RAW.CAST_TO_RAW('12345678901234567890123456789012'));

---------------------------------------------------

CREATE SEQUENCE SEQ_USUARIO
START WITH 1 
INCREMENT BY 1;

---------------------------------------------------

CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_ENCRIPTACION_PKG AS
    PROCEDURE FIDE_ENCRIPTAR_CONTRASENA_SP(
        P_CEDULA NUMBER,
        P_NOMBRE VARCHAR2,
        P_APELLIDO1 VARCHAR2,
        P_APELLIDO2 VARCHAR2,
        P_CONTRASENA VARCHAR2
    );
END FIDE_LOS_JAULES_ENCRIPTACION_PKG;
/

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_ENCRIPTACION_PKG AS
    PROCEDURE FIDE_ENCRIPTAR_CONTRASENA_SP(
        P_CEDULA NUMBER,
        P_NOMBRE VARCHAR2,
        P_APELLIDO1 VARCHAR2,
        P_APELLIDO2 VARCHAR2,
        P_CONTRASENA VARCHAR2
    ) AS
        L_KEY RAW(32);
        L_ENCRIPTED_DATA RAW(2000);
    BEGIN
        IF NOT ADMINISTRATOR.FIDE_VERIFICA_CONTRASENA(P_NOMBRE, P_CONTRASENA, '') THEN
            RAISE_APPLICATION_ERROR(-20001, 'La contraseña no cumple con los requisitos.');
        END IF;

        SELECT CLAVE INTO L_KEY
        FROM FIDE_CLAVE_ENCRIPTAR_TB
        WHERE ID_CLAVE = 1;

        L_ENCRIPTED_DATA := DBMS_CRYPTO.Encrypt(
            SRC => UTL_RAW.CAST_TO_RAW(P_CONTRASENA),
            TYP => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
            KEY => L_KEY
        );

        INSERT INTO ADMINISTRATOR.FIDE_USUARIOS_TB(
            CEDULA, 
            NOMBRE, 
            APELLIDO1, 
            APELLIDO2, 
            CONTRASENA, 
            ID_ROL, 
            ID_ESTADO,
            FECHA_INGRESO,
            USUARIO
        )
        VALUES (
            P_CEDULA, 
            P_NOMBRE, 
            P_APELLIDO1, 
            P_APELLIDO2, 
            L_ENCRIPTED_DATA, 
            1, 
            1, 
            SYSDATE,
            SUBSTR(P_NOMBRE, 1, 1) || P_APELLIDO1 || SEQ_USUARIO.NEXTVAL
        );

        COMMIT;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'No se encontró la clave de encriptación.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'ERROR EN ENCRIPTACIÓN: ' || SQLERRM);
    END;
END FIDE_LOS_JAULES_ENCRIPTACION_PKG;
/

----------------------------------------------------------------

CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_DESENCRIPTACION_CONTRASENA_PKG AS
    PROCEDURE FIDE_DESENCRIPTAR_CONTRASENA_SP(
        P_CEDULA IN NUMBER,
        P_CONTRASENA OUT VARCHAR2
    );
END;
/

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_DESENCRIPTACION_CONTRASENA_PKG AS
    PROCEDURE FIDE_DESENCRIPTAR_CONTRASENA_SP(
        P_CEDULA IN NUMBER,
        P_CONTRASENA OUT VARCHAR2
    ) AS
        L_KEY RAW(32);
        L_ENCRIPTED_DATA RAW(2000);
        L_DESENCRIPTED_DATA RAW(2000);
    BEGIN
        SELECT CLAVE INTO L_KEY
        FROM FIDE_CLAVE_ENCRIPTAR_TB
        WHERE ID_CLAVE = 1;

        SELECT CONTRASENA INTO L_ENCRIPTED_DATA
        FROM FIDE_USUARIOS_TB
        WHERE CEDULA = P_CEDULA;

        L_DESENCRIPTED_DATA := DBMS_CRYPTO.Decrypt(
            SRC => L_ENCRIPTED_DATA,
            TYP => DBMS_CRYPTO.ENCRYPT_AES256 + DBMS_CRYPTO.CHAIN_CBC + DBMS_CRYPTO.PAD_PKCS5,
            KEY => L_KEY
        );

        P_CONTRASENA := UTL_RAW.CAST_TO_VARCHAR2(L_DESENCRIPTED_DATA);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'Datos no encontrados.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'ERROR EN DESENCRIPTACIÓN: ' || SQLERRM);
    END;
END;
/

------------------------------------------------------

CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_LOGIN_PKG AS
    FUNCTION FIDE_LOS_JAULES_LOGIN_SP(P_USUARIO IN VARCHAR2, P_CONTRASENA IN VARCHAR2) RETURN NUMBER;
    PROCEDURE FIDE_LOS_JAULES_GET_USUARIOS_SP(P_USERNAME IN VARCHAR2, DATOS OUT SYS_REFCURSOR);
END;
/

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_LOGIN_PKG AS

    PROCEDURE FIDE_LOS_JAULES_GET_USUARIOS_SP(P_USERNAME IN VARCHAR2, DATOS OUT SYS_REFCURSOR)
    AS
    BEGIN
        OPEN DATOS FOR 
        SELECT U.CEDULA, U.NOMBRE, U.APELLIDO1, U.APELLIDO2, U.ID_ESTADO, U.ID_ROL
        FROM FIDE_USUARIOS_TB U
        WHERE U.USUARIO = P_USERNAME;
    END;

    FUNCTION FIDE_LOS_JAULES_LOGIN_SP(P_USUARIO IN VARCHAR2, P_CONTRASENA IN VARCHAR2) RETURN NUMBER
    AS
        V_CONTRASENA VARCHAR2(100);
        V_CEDULA NUMBER;
        V_ESTADO NUMBER;
    BEGIN
        SELECT CEDULA, ID_ESTADO INTO V_CEDULA, V_ESTADO
        FROM FIDE_USUARIOS_TB
        WHERE USUARIO = P_USUARIO;

        IF V_ESTADO != 1 THEN
            RETURN 0; -- Usuario inactivo
        END IF;

        FIDE_LOS_JAULES_DESENCRIPTACION_CONTRASENA_PKG.FIDE_DESENCRIPTAR_CONTRASENA_SP(V_CEDULA, V_CONTRASENA);

        IF V_CONTRASENA = P_CONTRASENA THEN
            RETURN 1; -- Éxito
        ELSE
            RETURN 0; -- Contraseña incorrecta
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            RETURN 0;
    END;

END;
/

-------------------------------------------

DECLARE
    V_RESULTADO NUMBER;
BEGIN
    V_RESULTADO := FIDE_LOS_JAULES_LOGIN_PKG.FIDE_LOS_JAULES_LOGIN_SP('AFallas1', '123456789');
    
    IF V_RESULTADO = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Login exitoso.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Login fallido.');
    END IF;
END;
