<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

require 'conexion.php';

// Indicar que el contenido es JSON
header('Content-Type: application/json');

try {
    // Preparar la llamada al procedimiento almacenado
    $sql = "BEGIN FIDE_LOS_JAULES_EVENTOS_PKG.FIDE_EVENTOS_TB_GET_EVENTOS_ACTIVOS_SP(:cursor); END;";
    $stmt = oci_parse($conn, $sql);
    if (!$stmt) {
        $error = oci_error($conn);
        echo json_encode(["error" => "Error en oci_parse", "detalle" => $error['message']]);
        exit;
    }

    // Crear cursor y enlazarlo
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

    // Ejecutar el procedimiento
    if (!oci_execute($stmt)) {
        $error = oci_error($stmt);
        echo json_encode(["error" => "Error al ejecutar procedimiento", "detalle" => $error['message']]);
        exit;
    }

    // Ejecutar el cursor
    if (!oci_execute($cursor)) {
        $error = oci_error($cursor);
        echo json_encode(["error" => "Error al ejecutar cursor", "detalle" => $error['message']]);
        exit;
    }

    // Obtener resultados en un array
    $resultados = [];
    while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
        foreach ($fila as $key => $value) {
            if (is_string($value)) {
                $fila[$key] = utf8_encode($value); // Convertir a UTF-8
            }
        }
        $resultados[] = $fila;
    }

    // Cerrar conexiones antes de devolver JSON
    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    // Enviar respuesta JSON (array vacío si no hay eventos)
    echo json_encode($resultados, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    exit;

} catch (Exception $e) {
    echo json_encode(["error" => "Excepción en PHP", "detalle" => $e->getMessage()]);
}
