<?php
require 'conexion.php';  // Asegúrate de que la conexión está correctamente configurada

try {
    // Llamada al procedimiento FIDE_PROVEEDORES_TB_GET_PROVEEDORES_SP
    $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_GET_PROVEEDORES_SP(:cursor); END;";

    // Parsear la sentencia SQL
    $stmt = oci_parse($conn, $sql);

    // Crear un cursor de Oracle
    $cursor = oci_new_cursor($conn);

    // Vincula el cursor a la sentencia SQL
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

    // Ejecutar la sentencia SQL
    if (!oci_execute($stmt)) {
        $error = oci_error($stmt);
        die(json_encode(["success" => false, "message" => "Error al ejecutar procedimiento", "detalle" => $error['message']]));
    }

    // Ejecutar el cursor para obtener los resultados
    $proveedores = [];
    while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
        // Asegurarse de que los datos estén codificados correctamente
        foreach ($fila as $key => $value) {
            if (is_string($value)) {
                $fila[$key] = utf8_encode($value);
            }
        }
        $proveedores[] = $fila;  // Agregar la fila al array de proveedores
    }

    // Liberar recursos y cerrar la conexión
    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    // Devolver la respuesta en formato JSON
    echo json_encode(["success" => true, "data" => $proveedores], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (Exception $e) {
    // Si ocurre una excepción, devolver el mensaje de error en formato JSON
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}
?>
