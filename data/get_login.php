<?php
session_start();
var_dump($_POST);
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
    $username = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';
    $resultado = null;

    if (empty($username) || empty($password)) {
        echo json_encode(["success" => false, "message" => "Correo y contraseña requeridos"]);
        exit;
    }

    if (!$conn) {
        echo json_encode(["success" => false, "message" => "Error de conexión a la base de datos."]);
        exit();
    }
    // Preparar la llamada al procedimiento almacenado
    $sql = "BEGIN :resultado := FIDE_LOS_JAULES_LOGIN_PKG.FIDE_LOS_JAULES_LOGIN_SP(:cedula, :contrasena); END;";
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        $error = oci_error($conn);
        echo json_encode(["success" => false, "message" => "Error en oci_parse", "detail" => $error['message']]);
        exit;
    }


    oci_bind_by_name($stmt, ":cedula", $username);
    oci_bind_by_name($stmt, ":contrasena", $password);
    oci_bind_by_name($stmt, ":resultado", $resultado, 1, SQLT_INT);
    
    if (!oci_execute($stmt)) {
        $error = oci_error($stmt);
        echo json_encode(["success" => false, "message" => "Error al ejecutar procedimiento", "detail" => $error['message']]);
        exit;
    }
    
    // Obtener el resultado
  
    if ($resultado == 1) {
        echo json_encode(["success" => true, "message" => "Bienvenido, usuario $username."]);
    } else {
        echo json_encode(["success" => false, "message" => "Datos incorrectos."]);
    }

    oci_free_statement($stmt);
    oci_close($conn);

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}
?>
