<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

require 'conexion.php';

// Encabezado JSON
header('Content-Type: application/json');

try {
    // Preparar la llamada al procedimiento almacenado de productos
    $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PRODUCTOS_TB_GET_ALL_PRODUCTOS_SP(:cursor); END;";
    $stmt = oci_parse($conn, $sql);
    if (!$stmt) {
        $error = oci_error($conn);
        die(json_encode(["error" => "Error en oci_parse", "detalle" => $error['message']]));
    }

    // Crear cursor y enlazarlo
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

    // Ejecutar procedimiento
    if (!oci_execute($stmt)) {
        $error = oci_error($stmt);
        die(json_encode(["error" => "Error al ejecutar procedimiento", "detalle" => $error['message']]));
    }

    // Ejecutar el cursor
    if (!oci_execute($cursor)) {
        $error = oci_error($cursor);
        die(json_encode(["error" => "Error al ejecutar cursor", "detalle" => $error['message']]));
    }

    // Obtener resultados
    $productos = [];
    while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
        foreach ($fila as $key => $value) {
            if (is_string($value)) {
                $fila[$key] = utf8_encode($value);
            }
        }
        $productos[] = $fila;
    }

    // Liberar recursos
    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    // Validar y devolver resultados
    if (empty($productos)) {
        die(json_encode(["error" => "No hay productos registrados."]));
    }

    echo json_encode($productos, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    exit;

} catch (Exception $e) {
    echo json_encode(["error" => "Excepción en PHP", "detalle" => $e->getMessage()]);
}
