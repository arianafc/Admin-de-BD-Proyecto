CREATE OR REPLACE PACKAGE FIDE_LOS_JAULES_FACTURAS_PKG AS
PROCEDURE FIDE_FACTURAS_TB_GET_ALL_USER_SP(P_CURSOR OUT SYS_REFCURSOR, P_CEDULA IN NUMBER);
END FIDE_LOS_JAULES_FACTURAS_PKG;

CREATE OR REPLACE PACKAGE BODY FIDE_LOS_JAULES_FACTURAS_PKG AS
PROCEDURE FIDE_FACTURAS_TB_GET_ALL_USER_SP(P_CURSOR OUT SYS_REFCURSOR, P_CEDULA IN NUMBER) AS
BEGIN
    OPEN P_CURSOR FOR 
    SELECT F.ID_FACTURA, F.ID_ORDEN, F.FECHA_EMISION, F.SUBTOTAL, F.TOTAL, F.IVA, M.DESCRIPCION
    FROM FIDE_FACTURA_TB F
    INNER JOIN FIDE_ORDENES_TB O
    ON F.ID_ORDEN = O.ID_ORDEN
    INNER JOIN FIDE_METODO_PAGO_TB M
    ON O.ID_METODO_PAGO = M.ID_METODO_PAGO
    WHERE O.CEDULA = P_CEDULA;

END FIDE_FACTURAS_TB_GET_ALL_USER_SP;
END FIDE_LOS_JAULES_FACTURAS_PKG;

UPDATE FIDE_MEMBRESIAS_TB SET ID_ESTADO = 0 WHERE ID_TIPO_MEMBRESIA = 1;
commit