<?php
require 'conexion.php';
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json; charset=utf-8');

$action = $_POST['action'] ?? '';

switch ($action) {

    case 'obtenerReservasUsuario':
        $cedula = $_SESSION['cedula'] ?? null;
    
        if (!$cedula) {
            echo json_encode(["success" => false, "message" => "La cédula es obligatoria."]);
            break;
        }
    
        try {
            $sql = "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_RESERVAS_TB_USUARIO_SP(:p_cursor, :p_cedula); END;";
            $stmt = oci_parse($conn, $sql);
    
            // Crear el cursor
            $cursor = oci_new_cursor($conn);
    
            // Enlazar parámetros
            oci_bind_by_name($stmt, ':p_cursor', $cursor, -1, OCI_B_CURSOR);
            oci_bind_by_name($stmt, ':p_cedula', $cedula);
    
            // Ejecutar el procedimiento y el cursor
            if (!oci_execute($stmt)) {
                $e = oci_error($stmt);
                echo json_encode(["success" => false, "message" => "Error al ejecutar el procedimiento: " . $e['message']]);
                break;
            }
    
            oci_execute($cursor);
    
            $result = [];
            while ($row = oci_fetch_assoc($cursor)) {
                foreach ($row as $key => $val) {
                    if (is_string($val)) {
                        $row[$key] = utf8_encode($val);
                    }
                }
                $result[] = $row;
            }
    
            echo json_encode([
                "success" => true,
                "data" => $result
            ]);
    
            oci_free_statement($stmt);
            oci_free_statement($cursor);
            exit;
    
        } catch (Exception $e) {
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
            exit;
        }
    
        break;
    
                                                    
                                    
    default:
        echo json_encode(["success" => false, "message" => "Acción no válida."]);
        break;
}
?>
