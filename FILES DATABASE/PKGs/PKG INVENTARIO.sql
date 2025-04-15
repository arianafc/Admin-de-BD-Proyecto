----------PKG INVENTARIO
CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_INVENTARIO_PKG AS
    PROCEDURE ADD_UPDATE_INVENTARIO_SP(
        p_id_inventario IN NUMBER,
        p_cantidad IN NUMBER,
        p_id_producto IN NUMBER,
        p_cantidad_minima IN NUMBER
    );
---------eliminar inventario
    PROCEDURE DELETE_INVENTARIO_SP(
        p_id_inventario IN NUMBER
    );

---------obtener inventarios
    PROCEDURE GET_INVENTARIO_SP(
        p_cursor OUT SYS_REFCURSOR
    );
END FIDE_LOS_JAULES_INVENTARIO_PKG;
/

------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_INVENTARIO_PKG AS
    PROCEDURE ADD_UPDATE_INVENTARIO_SP(
        p_id_inventario IN NUMBER,
        p_cantidad IN NUMBER,
        p_id_producto IN NUMBER,
        p_cantidad_minima IN NUMBER
    ) AS
    BEGIN
        IF p_id_inventario IS NULL THEN
-----------insert inventario  nuevo
            INSERT INTO FIDE_INVENTARIO_TB (CANTIDAD, ID_PRODUCTO, CANTIDAD_MINIMA)
            VALUES (p_cantidad, p_id_producto, p_cantidad_minima);
        ELSE
------------actualizar inventario 
            UPDATE FIDE_INVENTARIO_TB
            SET CANTIDAD = p_cantidad,
                CANTIDAD_MINIMA = p_cantidad_minima
            WHERE ID_INVENTARIO = p_id_inventario;
        END IF;
        COMMIT;
    END ADD_UPDATE_INVENTARIO_SP;

    PROCEDURE DELETE_INVENTARIO_SP(p_id_inventario IN NUMBER) AS
    BEGIN
        DELETE FROM FIDE_INVENTARIO_TB
        WHERE ID_INVENTARIO = p_id_inventario;
        COMMIT;
    END DELETE_INVENTARIO_SP;
    PROCEDURE GET_INVENTARIO_SP(p_cursor OUT SYS_REFCURSOR) AS
    BEGIN
        OPEN p_cursor FOR
        SELECT ID_INVENTARIO, CANTIDAD, ID_PRODUCTO, CANTIDAD_MINIMA
        FROM FIDE_INVENTARIO_TB;
    END GET_INVENTARIO_SP;

END FIDE_LOS_JAULES_INVENTARIO_PKG;
/
