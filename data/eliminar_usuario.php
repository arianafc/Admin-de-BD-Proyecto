<?php
header('Content-Type: application/json');
require 'conexion.php';

$response = ['success' => false, 'message' => 'Error desconocido'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['cedula'])) {
    $cedula = $_POST['cedula'];

    try {
        $stid = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIO_TB_ELIMINAR_SP(:cedula); END;");
        oci_bind_by_name($stid, ":cedula", $cedula);

        if (oci_execute($stid)) {
            $response = ['success' => true, 'message' => 'Usuario eliminado correctamente'];
        } else {
            $e = oci_error($stid);
            $response = ['success' => false, 'message' => 'Error al ejecutar: ' . $e['message']];
        }
    } catch (Exception $e) {
        $response = ['success' => false, 'message' => 'Excepción: ' . $e->getMessage()];
    }
} else {
    $response = ['success' => false, 'message' => 'Solicitud inválida'];
}

echo json_encode($response);