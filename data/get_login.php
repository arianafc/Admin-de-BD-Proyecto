<?php
session_start();
require 'conexion.php';

// Indicar que el contenido es JSON
header('Content-Type: application/json');

try {
    // Verificar si se enviaron datos por POST
    if ($_SERVER["REQUEST_METHOD"] !== "POST") {
        echo json_encode(["success" => false, "message" => "Método no permitido"]);
        exit;
    }

    // Obtener datos del formulario
    $email = $_POST['email'] ?? '';
    $password = $_POST['password'] ?? '';

    if (empty($email) || empty($password)) {
        echo json_encode(["success" => false, "message" => "Correo y contraseña requeridos"]);
        exit;
    }

    // Preparar la llamada al procedimiento almacenado
    $sql = "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_VALIDAR_LOGIN_SP(:email, :password, :cursor); END;";
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        $error = oci_error($conn);
        echo json_encode(["success" => false, "message" => "Error en oci_parse", "detail" => $error['message']]);
        exit;
    }

    // Crear cursor y enlazarlo
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":email", $email);
    oci_bind_by_name($stmt, ":password", $password);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

    // Ejecutar el procedimiento
    if (!oci_execute($stmt)) {
        $error = oci_error($stmt);
        echo json_encode(["success" => false, "message" => "Error al ejecutar procedimiento", "detail" => $error['message']]);
        exit;
    }

    // Ejecutar el cursor
    if (!oci_execute($cursor)) {
        $error = oci_error($cursor);
        echo json_encode(["success" => false, "message" => "Error al ejecutar cursor", "detail" => $error['message']]);
        exit;
    }

    // Obtener resultados
    $usuario = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS);

    // Cerrar conexiones
    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    if ($usuario) {
        $_SESSION['user'] = $usuario['EMAIL'];
        $_SESSION['nombre'] = $usuario['NOMBRE'];

        echo json_encode(["success" => true, "message" => "Inicio de sesión exitoso"]);
    } else {
        echo json_encode(["success" => false, "message" => "Correo o contraseña incorrectos"]);
    }
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}
?>
