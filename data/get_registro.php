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

    // Validación de campos vacíos
    if (empty($cedula) || empty($nombre) || empty($apellido1) || empty($apellido2) || empty($contrasena)) {
        echo json_encode(["success" => false, "message" => "Todos los campos son requeridos."]);
        exit;
    }

    if (!$conn) {
        echo json_encode(["success" => false, "message" => "Error de conexión a la base de datos."]);
        exit;
    }

    // Encriptar la contraseña (en la base de datos) usando el paquete
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

    // Ejecutar el procedimiento de encriptación de la contraseña
    if (!oci_execute($stmt)) {
        $e = oci_error($stmt);
        echo json_encode(["success" => false, "message" => "Error al ejecutar el procedimiento", "detail" => $e['message']]);
        exit;
    }

    // Procedimiento para obtener el usuario por cédula
    $sqlUsuario = "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIO_TB_GET_BY_CEDULA_SP(:cedula, :datos); END;";
    $stmtUsuario = oci_parse($conn, $sqlUsuario);
    $cursor = oci_new_cursor($conn);

    oci_bind_by_name($stmtUsuario, ":cedula", $cedula);
    oci_bind_by_name($stmtUsuario, ":datos", $cursor, -1, OCI_B_CURSOR);

    // Ejecutar el procedimiento para obtener los datos del usuario
    if (!oci_execute($stmtUsuario) || !oci_execute($cursor)) {
        echo json_encode(["success" => false, "message" => "No se pudo obtener el nombre de usuario."]);
        exit;
    }

    $row = oci_fetch_assoc($cursor);
    oci_free_statement($stmtUsuario);
    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    // Si se obtiene el nombre de usuario
    if ($row && isset($row['USUARIO'])) {
        echo json_encode([
            "success" => true,
            "message" => "Usuario registrado exitosamente.",
            "usuario" => $row['USUARIO'] // Nombre de usuario
        ]);
    } else {
        echo json_encode([
            "success" => true,
            "message" => "Usuario registrado, pero no se pudo recuperar el nombre de usuario."
        ]);
    }

    exit;

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}
?>
