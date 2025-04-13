CREATE SEQUENCE ID_TIPO_INSTALACION_SEQ INCREMENT BY 1 START WITH 1
MAXVALUE 99999 MINVALUE 0;

CREATE OR REPLACE TRIGGER FIDE_TIPO_INSTALACION_TB_INSERTAR_TG
    BEFORE INSERT ON FIDE_TIPO_INSTALACION_TB
    FOR EACH ROW
    BEGIN
        SELECT ID_TIPO_INSTALACION_SEQ.NEXTVAL INTO :NEW.ID_TIPO_INSTALACION FROM DUAL;
END FIDE_TIPO_INSTALACION_TB_INSERTAR_TG;


INSERT INTO FIDE_TIPO_INSTALACION_TB (DESCRIPCION, ID_ESTADO) VALUES ('Área Recreativa', 1);
INSERT INTO FIDE_TIPO_INSTALACION_TB (DESCRIPCION, ID_ESTADO) VALUES ('Cabañas', 1);
INSERT INTO FIDE_TIPO_INSTALACION_TB (DESCRIPCION, ID_ESTADO) VALUES ('Ranchos', 1);
INSERT INTO FIDE_TIPO_INSTALACION_TB (DESCRIPCION, ID_ESTADO) VALUES ('Salones', 1);
INSERT INTO FIDE_TIPO_INSTALACION_TB (DESCRIPCION, ID_ESTADO) VALUES ('Ejercicio', 1);
INSERT INTO FIDE_TIPO_INSTALACION_TB (DESCRIPCION, ID_ESTADO) VALUES ('Gastronomía', 1);

COMMIT;