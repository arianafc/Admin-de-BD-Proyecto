DECLARE
    V_TIPO_MEMBRESIA NUMBER;
    V_FECHA_FIN DATE;
BEGIN
    SELECT ID_TIPO_MEMBRESIA, FECHA_FIN 
    INTO V_TIPO_MEMBRESIA, V_FECHA_FIN 
    FROM FIDE_MEMBRESIAS_TB 
    WHERE CEDULA = 303180660 AND ID_ESTADO = 1;

    DBMS_OUTPUT.PUT_LINE('Membresía: ' || V_TIPO_MEMBRESIA || ', Fin: ' || V_FECHA_FIN);
END;

DECLARE
    v_resultado NUMBER;
BEGIN
    v_resultado :=  FIDE_LOS_JAULES_EVENTOS_PKG.FIDE_EVENTOS_TB_VALIDAR_MEMBRESIA_FN(1233);
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_resultado);
END;

DECLARE
    v_resultado NUMBER;
BEGIN
    v_resultado :=  FIDE_LOS_JAULES_EVENTOS_PKG.FIDE_EVENTOS_TB_INSERTAR_REGISTRO_MIEMBRO_FN(1233, 1);
    DBMS_OUTPUT.PUT_LINE('Resultado: ' || v_resultado);
END;

SELECT ID_TIPO_MEMBRESIA, FECHA_FIN 
FROM FIDE_MEMBRESIAS_TB 
WHERE CEDULA = 1233 AND ID_ESTADO = 1;

INSERT INTO FIDE_TIPO_MEMBRESIAS_TB (COSTO, DURACION_DIAS, DESCRIPCION, NOMBRE, NUM_INVITADOS, ID_ESTADO) VALUES
(20000, 365, 'ANUAL', 'PREMIUM', 3, 1)
COMMIT;



-------------------------TEST


DROP TRIGGER FIDE_REGISTRO_EVENTOS_TB_VALIDAR_REGISTRO_TG


create or replace TRIGGER FIDE_REGISTRO_EVENTOS_TB_VALIDAR_REGISTRO_TG
BEFORE INSERT ON FIDE_REGISTRO_EVENTOS_TB
FOR EACH ROW
DECLARE
    V_EXISTE_REGISTRO NUMBER;
    V_CEDULA_INVITADO FIDE_INVITADOS_TB.CEDULA%TYPE;
    V_EXISTE_COMO_MIEMBRO NUMBER;
BEGIN
    -- Verificar si ya existe un registro como miembro o invitado para el evento
    SELECT COUNT(*) INTO V_EXISTE_REGISTRO
    FROM FIDE_REGISTRO_EVENTOS_TB
    WHERE (CEDULA = :NEW.CEDULA OR ID_INVITADO = :NEW.ID_INVITADO)
    AND ID_EVENTO = :NEW.ID_EVENTO;

    IF V_EXISTE_REGISTRO > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'El usuario ya está registrado en este evento.');
    END IF;

    -- Validación adicional: si es un registro como miembro, buscar si ya participó como invitado
    IF :NEW.ID_INVITADO IS NULL THEN
        -- Verificar si la cédula ya estuvo como invitado en este evento
        SELECT CEDULA INTO V_CEDULA_INVITADO
        FROM FIDE_INVITADOS_TB
        WHERE CEDULA = :NEW.CEDULA
        AND EXISTS (
            SELECT 1
            FROM FIDE_REGISTRO_EVENTOS_TB
            WHERE ID_EVENTO = :NEW.ID_EVENTO
            AND ID_INVITADO IS NOT NULL
            AND ID_INVITADO IN (
                SELECT ID_INVITADO
                FROM FIDE_INVITADOS_TB
                WHERE CEDULA = :NEW.CEDULA
            )
        );

        -- Si se encontró la cédula como invitado en el evento, bloquear el registro como miembro
        RAISE_APPLICATION_ERROR(-20003, 'Ya estás registrado como invitado en este evento. No puedes registrarte también como miembro.');
    END IF;
END;

COMMIT


-------------------------------------------------------------------------------------------------------------------
---RESERVACIONES SALONES
CREATE SEQUENCE ID_INSTALACION_SEQ INCREMENT BY 1 START WITH 1
MAXVALUE 99999 MINVALUE 0;

create or replace TRIGGER FIDE_INSTALACIONES_TB_INSERTAR_TG
    BEFORE INSERT ON FIDE_INSTALACIONES_TB
    FOR EACH ROW
    BEGIN
        SELECT ID_INSTALACION_SEQ.NEXTVAL INTO :NEW.ID_INSTALACION FROM DUAL;
END FIDE_INSTALACIONES_TB_INSERTAR_TG;
INSERT INTO FIDE_INSTALACIONES_TB (NOMBRE, COSTO, ID_TIPO_INSTALACION, CAPACIDAD, ID_ESTADO) VALUES
('SALÓN BELLAS ARTES', 120000, 4, 120, 1);
COMMIT

INSERT INTO FIDE_INSTALACIONES_TB (NOMBRE, COSTO, ID_TIPO_INSTALACION, CAPACIDAD, ID_ESTADO) VALUES
('RANCHO LOS SUEÑOS', 20000, 3, 120, 1);










