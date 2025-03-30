<?php
require 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_SESSION['cedula'])) {
        echo json_encode(["success" => false, "message" => "Error: No se ha iniciado sesión."]);
        exit;
    }
    
    $cedula = $_SESSION['cedula']; 
    $id_invitado = empty($_POST['id_invitado']) ? NULL : $_POST['id_invitado'];
    $id_evento = $_POST['id_evento'];
    $fecha_registro = $_POST['fecha_registro'];

    try {
        $sql = "BEGIN FIDE_LOS_JAULES_EVENTOS_PKG.FIDE_EVENTOS_TB_INSERTAR_REGISTRO_SP(:cedula, :id_invitado, :id_evento, :fecha_registro); END;";
        $stmt = oci_parse($conn, $sql);

        oci_bind_by_name($stmt, ":cedula", $cedula);
        oci_bind_by_name($stmt, ":id_invitado", $id_invitado);
        oci_bind_by_name($stmt, ":id_evento", $id_evento);
        oci_bind_by_name($stmt, ":fecha_registro", $fecha_registro);

        if (!oci_execute($stmt)) {
            $error = oci_error($stmt);

            // Si es el error de membresía, lo mostramos en el mensaje
            if (strpos($error['message'], '-20001') !== false) {
                echo json_encode(["success" => false, "message" => "Error: El usuario no tiene una membresía o pase activo."]);
            } else {
                echo json_encode(["success" => false, "message" => "Error al registrar el evento", "detalle" => $error['message']]);
            }
        } else {
            echo json_encode(["success" => true, "message" => "Registro exitoso."]);
        }

        oci_free_statement($stmt);
        oci_close($conn);
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => "Excepción en PHP", "detalle" => $e->getMessage()]);
    }
}
?>
