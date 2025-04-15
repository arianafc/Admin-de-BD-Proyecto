<?php
require 'conexion.php';  // Asegúrate de que la conexión está correctamente configurada

try {
    // Llamada al procedimiento que devuelve todos los proveedores
    $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_GET_ALL_SP(:cursor); END;";

    $stmt = oci_parse($conn, $sql);
    $cursor = oci_new_cursor($conn);

    // Vincular el cursor
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

    // Ejecutar el procedimiento
    if (!oci_execute($stmt)) {
        $error = oci_error($stmt);
        die(json_encode(["success" => false, "message" => "Error al ejecutar procedimiento", "detalle" => $error['message']]));
    }

    // ✅ ¡Esto es lo que faltaba!
    oci_execute($cursor);

    $proveedores = [];
    while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
        foreach ($fila as $key => $value) {
            if (is_string($value)) {
                $fila[$key] = utf8_encode($value);
            }
        }
        $proveedores[] = $fila;
    }

    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    echo json_encode(["success" => true, "data" => $proveedores], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
?>
