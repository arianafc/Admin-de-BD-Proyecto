<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

require 'conexion.php';

// Aplicar encabezado para JSON
header('Content-Type: application/json'); 

try {
    $jsonInput = file_get_contents("php://input");
    $data = json_decode($jsonInput, true);

    if (!isset($data['id'])) {
        die(json_encode(["error" => "ID del proveedor no proporcionado"]));
    }

    $idProveedor = intval($data['id']);

    // Preparar la llamada al procedimiento almacenado
    $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PRODUCTOS_PROVEEDOR_TB_GET_PRODUCTOS_SP(:cursor, :pid); END;";
    $stmt = oci_parse($conn, $sql);
    if (!$stmt) {
        $error = oci_error($conn);
        die(json_encode(["error" => "Error en oci_parse", "detalle" => $error['message']]));
    }

    // Crear cursor y enlazarlo
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
    oci_bind_by_name($stmt, ":pid", $idProveedor, -1, SQLT_INT);

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

    // Cerrar conexiones
    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    // Validar resultados
    if (empty($productos)) {
        die(json_encode(["error" => "No hay productos asociados a este proveedor."]));
    }

    // Devolver datos
    $json = json_encode($productos, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    if ($json === false) {
        die(json_encode(["error" => "Error al convertir a JSON", "detalle" => json_last_error_msg()]));
    }

    echo $json;
    exit;

} catch (Exception $e) {
    echo json_encode(["error" => "Excepción en PHP", "detalle" => $e->getMessage()]);
}
