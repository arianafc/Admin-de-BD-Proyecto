<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);
session_start();
require 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_SESSION['cedula'])) {
        echo json_encode(["success" => false, "message" => "Error: No se ha iniciado sesión."]);
        exit;
    }

    $cedula = $_SESSION['cedula']; 
    $id_evento = $_POST['id_evento'];
    $resultado = null;

    try {
        $sql = "BEGIN :resultado := FIDE_LOS_JAULES_EVENTOS_PKG.FIDE_EVENTOS_TB_INSERTAR_REGISTRO_MIEMBRO_FN(:cedula, :id_evento); END;";
        $stmt = oci_parse($conn, $sql);

        oci_bind_by_name($stmt, ":cedula", $cedula);
        oci_bind_by_name($stmt, ":id_evento", $id_evento);
        oci_bind_by_name($stmt, ":resultado", $resultado);

        if (!oci_execute($stmt)) {
            $error = oci_error($stmt);

            if (strpos($error['message'], 'ORA-20002') !== false) {
                // Enviar mensaje en formato JSON
                echo json_encode(["success" => false, "message" => "El usuario ya está registrado en este evento."]);
            } else {
               
                echo json_encode(["success" => false, "message" => "Error al registrar el evento", "detalle" => $error['message']]);
            }
        } else {
            if ($resultado == 1) {
                echo json_encode(["success" => true, "message" => "Registro exitoso."]);
            } else if ($resultado == 2) {
                echo json_encode(["success" => false, "message" => "La membresía expira antes de la fecha del evento."]);
            } else if ($resultado == 3) {
                echo json_encode(["success" => false, "message" => "No tienes una membresía activa."]);
            } else {
                echo json_encode(["success" => false, "message" => "Lo sentimos. No hay cupo para el evento."]);
            }
        }

        oci_free_statement($stmt);
        oci_close($conn);
    } catch (Exception $e) {
  
        echo json_encode(["success" => false, "message" => "Excepción en PHP", "detalle" => $e->getMessage()]);
    }
}
?>
