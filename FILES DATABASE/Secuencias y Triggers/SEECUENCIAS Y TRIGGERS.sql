--CREACION DE SECUENIAS Y TRIGGERS

CREATE SEQUENCE ID_REGISTRO_SEQ START WITH 1 INCREMENT BY 1;
COMMIT;

CREATE OR REPLACE TRIGGER FIDE_REGISTRO_EVENTOS_TB_INSERTAR_TG
    BEFORE INSERT ON FIDE_REGISTRO_EVENTOS_TB
    FOR EACH ROW
    BEGIN
        
        SELECT ID_REGISTRO_SEQ.NEXTVAL INTO :NEW.ID_REGISTRO FROM DUAL;
END FIDE_REGISTRO_EVENTOS_TB_INSERTAR_TG;


--CREACION DE TRIGGER QUE VALIDA QUE ANTES DE UN REGISTRO EN EVENTOS EL USUARIO LOGUEADO TENGA UNA MEMBRESIA O UN PASE PARA LA FECHA DEL EVENTO
create or replace TRIGGER FIDE_REGISTRO_EVENTOS_TB_VALIDAR_MEMBRESIAS_TB
BEFORE INSERT ON FIDE_REGISTRO_EVENTOS_TB
FOR EACH ROW
DECLARE
    V_MEMBRESIA_VALIDA NUMBER;
    V_FECHA_EVENTO DATE;
BEGIN
    -- Obtener la fecha del evento desde la tabla FIDE_EVENTOS_TB
    SELECT FECHA INTO V_FECHA_EVENTO
    FROM FIDE_EVENTOS_TB
    WHERE ID_EVENTO = :NEW.ID_EVENTO;

    -- Verificar si el usuario tiene una membresía válida para la fecha del evento
    SELECT COUNT(*) INTO V_MEMBRESIA_VALIDA
    FROM FIDE_MEMBRESIAS_TB 
    WHERE CEDULA = :NEW.CEDULA 
    AND ID_ESTADO = 1  -- Estado activo
    AND V_FECHA_EVENTO BETWEEN FECHA_INICIO AND FECHA_FIN;

    -- Si no tiene una membresía válida, lanzar un error
    IF V_MEMBRESIA_VALIDA=0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'El usuario no tiene una membresía o pase activo para validar el registro al evento');
    END IF;
END;

commit;



    