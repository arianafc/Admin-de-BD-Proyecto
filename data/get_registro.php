<?php
session_start();
require 'conexion.php';

header('Content-Type: application/json');

try {
    // Obtener datos del formulario
    $cedula = $_POST['cedula'] ?? '';
    $nombre = $_POST['nombre'] ?? '';
    $apellido1 = $_POST['apellido1'] ?? '';
    $apellido2 = $_POST['apellido2'] ?? '';
    $contrasena = $_POST['contrasena'] ?? '';

    if (empty($cedula) || empty($nombre) || empty($apellido1) || empty($apellido2) || empty($contrasena)) {
        echo json_encode(["success" => false, "message" => "Todos los campos son requeridos."]);
        exit;
    }

    if (!$conn) {
        echo json_encode(["success" => false, "message" => "Error de conexión a la base de datos."]);
        exit;
    }

    $sql = "BEGIN FIDE_LOS_JAULES_ENCRIPTACION_PKG.FIDE_ENCRIPTAR_CONTRASENA_SP(
                :cedula, :nombre, :apellido1, :apellido2, :contrasena
            ); END;";
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "Error al preparar la sentencia SQL."]);
        exit;
    }

    oci_bind_by_name($stmt, ":cedula", $cedula);
    oci_bind_by_name($stmt, ":nombre", $nombre);
    oci_bind_by_name($stmt, ":apellido1", $apellido1);
    oci_bind_by_name($stmt, ":apellido2", $apellido2);
    oci_bind_by_name($stmt, ":contrasena", $contrasena);

    if (!oci_execute($stmt)) {
        $e = oci_error($stmt);
        echo json_encode(["success" => false, "message" => "Error al ejecutar el procedimiento", "detail" => $e['message']]);
        exit;
    }

    oci_free_statement($stmt);
    oci_close($conn);

    echo json_encode(["success" => true, "message" => "Usuario registrado exitosamente."]);
    exit;

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}
?>
