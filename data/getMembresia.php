<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

require 'conexion.php';
header('Content-Type: application/json');

try {
    // Leer el JSON recibido
    $jsonInput = file_get_contents("php://input");
    $data = json_decode($jsonInput, true);

    if (!isset($data['id'])) {
        die(json_encode(["error" => "ID no proporcionado"]));
    }

    $idMembresias = intval($data['id']);

    // Debug: Escribir en un log para verificar
    file_put_contents("debug.log", "ID recibido en PHP: $idMembresias" . PHP_EOL, FILE_APPEND);

    $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_TIPO_MEMBRESIAS_TB_GET_MEMBRESIA_SP(:cursor, :vid); END;";
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        die(json_encode(["error" => "Error en oci_parse", "detalle" => oci_error($conn)]));
    }

    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
    oci_bind_by_name($stmt, ":vid", $idMembresias, -1, SQLT_INT);

    if (!oci_execute($stmt)) {
        die(json_encode(["error" => "Error al ejecutar procedimiento", "detalle" => oci_error($stmt)]));
    }

    if (!oci_execute($cursor)) {
        die(json_encode(["error" => "Error al ejecutar cursor", "detalle" => oci_error($cursor)]));
    }

    $membresia = [];
    while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
        foreach ($fila as $key => $value) {
            if (is_string($value)) {
                $fila[$key] = utf8_encode($value);
            }
        }
        $membresia[] = $fila;
    }

    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    if (empty($membresia)) {
        die(json_encode(["error" => "La membresía no pudo ser obtenida."]));
    }

    echo json_encode($membresia, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    exit;

} catch (Exception $e) {
    echo json_encode(["error" => "Excepción en PHP", "detalle" => $e->getMessage()]);
}