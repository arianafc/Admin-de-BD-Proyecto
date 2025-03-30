CREATE TABLE FIDE_CLAVE_ENCRIPTAR(
    ID_CLAVE NUMBER CONSTRAINT ID_CLAVE_PK PRIMARY KEY,
    CLAVE RAW(32)
); 
-----------------------------------------------------------------------
INSERT INTO FIDE_CLAVE_ENCRIPTAR(ID_CLAVE, CLAVE)
VALUES(1, UTL_RAW.CAST_TO_RAW('12345678901234567890123456789012'));
-----------------------------------------------------------------------
CREATE OR REPLACE PACKAGE PKG_ENCRIPTACION AS
    PROCEDURE FIDE_ENCRIPTAR_CONTRASENA_SP(
        P_CEDULA NUMBER,   
        P_NOMBRE VARCHAR2,
        P_APELLIDO1 VARCHAR2,
        P_APELLIDO2 VARCHAR2,
        P_CONTRASENA VARCHAR2
    );
END PKG_ENCRIPTACION;
/ 
-----------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY PKG_ENCRIPTACION AS
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
        IF NOT FIDE_VERIFICA_CONTRASENA(P_NOMBRE, P_CONTRASENA, '') THEN
            RAISE_APPLICATION_ERROR(-20001, 'La contraseña no cumple con los requisitos.');
        END IF;

        SELECT CLAVE INTO L_KEY
        FROM FIDE_CLAVE_ENCRIPTAR_TB
        WHERE ID_CLAVE=1;

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
            ID_ASOCIADO, 
            ID_ESTADO,
            FECHA_INGRESO 
        )
        VALUES (
            P_CEDULA, 
            P_NOMBRE, 
            P_APELLIDO1, 
            P_APELLIDO2, 
            L_ENCRIPTED_DATA, 
            1, 
            1, 
            1, 
            SYSDATE 
        );
        
        COMMIT;  

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, 'No se encontró la clave de encriptación.');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'ERROR EN EL PROCESO DE ENCRIPTACIÓN: ' || SQLERRM);
    END FIDE_ENCRIPTAR_CONTRASENA_SP;
END PKG_ENCRIPTACION;
/