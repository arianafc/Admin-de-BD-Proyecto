<?php
require 'conexion.php';
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json; charset=utf-8');

$action = $_POST['action'] ?? '';

switch ($action) {

    case 'obtenerFacturasUsuario':
        $cedula = $_SESSION['cedula'] ?? null;
    
        if (!$cedula) {
            echo json_encode([
                "success" => false,
                "message" => "La cédula es obligatoria."
            ]);
            break;
        }
    
        try {
            $sql = "BEGIN FIDE_LOS_JAULES_FACTURAS_PKG.FIDE_FACTURAS_TB_GET_ALL_USER_SP(:p_cursor, :p_cedula); END;";
            $stmt = oci_parse($conn, $sql);
    
            $cursor = oci_new_cursor($conn);
    
            oci_bind_by_name($stmt, ':p_cursor', $cursor, -1, OCI_B_CURSOR);
            oci_bind_by_name($stmt, ':p_cedula', $cedula);
    
            if (!oci_execute($stmt)) {
                $e = oci_error($stmt);
                echo json_encode([
                    "success" => false,
                    "message" => "Error al ejecutar el procedimiento: " . $e['message']
                ]);
                break;
            }
    
            oci_execute($cursor);
    
            $facturas = [];
            while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                $facturas[] = $row;
            }
    
            echo json_encode([
                "success" => true,
                "data" => $facturas
            ]);
    
            oci_free_statement($stmt);
            oci_free_statement($cursor);
            exit;
    
        } catch (Exception $e) {
            echo json_encode([
                "success" => false,
                "message" => "Excepción: " . $e->getMessage()
            ]);
            exit;
        }
    
        break;
    
                                                    
                                    
    default:
        echo json_encode(["success" => false, "message" => "Acción no válida."]);
        break;
}
?>
