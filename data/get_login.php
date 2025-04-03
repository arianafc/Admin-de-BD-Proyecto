<?php
session_start();
require 'conexion.php';

header('Content-Type: application/json');

try {
    
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
        exit;
    }

    // Llamada al procedimiento de login
    $sql = "BEGIN :resultado := FIDE_LOS_JAULES_LOGIN_PKG.FIDE_LOS_JAULES_LOGIN_SP(:username, :contrasena); END;";
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "Error en oci_parse"]);
        exit;
    }

    oci_bind_by_name($stmt, ":username", $username);
    oci_bind_by_name($stmt, ":contrasena", $password);
    oci_bind_by_name($stmt, ":resultado", $resultado, 32, SQLT_INT);

    if (!oci_execute($stmt)) {
        echo json_encode(["success" => false, "message" => "Error al ejecutar procedimiento"]);
        exit;
    }

    oci_free_statement($stmt);

    if ($resultado != 1) {
        echo json_encode(["success" => false, "message" => "Datos incorrectos."]);
        exit;
    }

    // Obtener datos del usuario
    $sql = "BEGIN FIDE_LOS_JAULES_LOGIN_PKG.FIDE_LOS_JAULES_GET_USUARIOS_SP(:username, :cursor); END;";
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "Error en oci_parse"]);
        exit;
    }

    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":username", $username);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

    if (!oci_execute($stmt) || !oci_execute($cursor)) {
        echo json_encode(["success" => false, "message" => "Error al obtener datos del usuario"]);
        exit;
    }

    $usuario = oci_fetch_assoc($cursor);

    if (!$usuario) {
        echo json_encode(["success" => false, "message" => "Usuario no encontrado"]);
        exit;
    }

    // Guardar en sesión
    $_SESSION['cedula'] = $usuario['CEDULA'];
    $_SESSION['nombre'] = $usuario['NOMBRE'];
    $_SESSION['apellido1'] = $usuario['APELLIDO1'];
    $_SESSION['apellido2'] = $usuario['APELLIDO2'];
    $_SESSION['id_estado'] = $usuario['ID_ESTADO'];
    $_SESSION['id_rol'] = $usuario['ID_ROL'];
    $_SESSION['id_asociado'] = $usuario['ID_ASOCIADO'];
    $_SESSION['usuario'] = $username;

    // Asegurar que la cédula no está vacía antes de llamar el procedimiento del carrito
    if (!isset($_SESSION['cedula']) || empty($_SESSION['cedula'])) {
        echo json_encode(["success" => false, "message" => "Error: La cédula no está disponible en la sesión"]);
        exit;
    }

    // Llamada al procedimiento del carrito
    $carrito = "BEGIN FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_CREAR_CARRITO_SP(:cedula, :idCarrito); END;";
    $ejecutar = oci_parse($conn, $carrito);

    $cedulaCarrito = $_SESSION['cedula'];
    $idCarrito = null;

    oci_bind_by_name($ejecutar, ":cedula", $cedulaCarrito);
    oci_bind_by_name($ejecutar, ":idCarrito", $idCarrito, 32);

    if (oci_execute($ejecutar)) {
        $_SESSION['id_carrito'] = $idCarrito;
    } else {
        $_SESSION['id_carrito'] = null;
    }

    // Liberar recursos
    oci_free_statement($stmt);
    oci_free_statement($ejecutar);
    oci_free_statement($cursor);
    oci_close($conn);

    // Enviar URL de redirección en JSON
    if ($_SESSION['id_rol'] == 1) {
        echo json_encode(["success" => true, "redirect" => "./index.php"]);
    } elseif ($_SESSION['id_rol'] == 2) {
        echo json_encode(["success" => true, "redirect" => "./dashboard.php"]);
    } else {
        echo json_encode(["success" => false, "message" => "Rol de usuario no válido."]);
    }

    exit;

} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}
?>





?>
