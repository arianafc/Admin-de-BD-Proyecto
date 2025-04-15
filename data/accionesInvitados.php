<?php
require 'conexion.php';
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json; charset=utf-8');

$action = $_POST['action'] ?? '';

switch ($action) {

    case 'agregar_invitado':
        $cedulaInvitado = $_POST['cedulaInvitado'] ?? null;
        $cedulaMiembro = $_SESSION['cedula']; // Se toma desde sesión
    
        if (!$cedulaInvitado) {
            echo json_encode([
                "success" => false,
                "message" => "Cédula del invitado es obligatoria."
            ]);
            break;
        }
    
        $resultado = '';
        $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_INVITADOS_PKG.FIDE_INVITADOS_TB_AGREGAR_INVITADO_SP(:cedula, :cedula_miembro, :resultado); END;");
        oci_bind_by_name($stmt, ":cedula", $cedulaInvitado);
        oci_bind_by_name($stmt, ":cedula_miembro", $cedulaMiembro);
        oci_bind_by_name($stmt, ":resultado", $resultado, 200);
    
        oci_execute($stmt);
    
        // Validamos si el resultado trae algún mensaje
        $mensaje = trim($resultado) !== '' ? $resultado : 'Invitado agregado correctamente';
    
        echo json_encode([
            "success" => true,
            "message" => $mensaje
        ]);
        break;
    
    // CASE para eliminar invitado
    case 'eliminar_invitado':
        $idInvitado = $_POST['idInvitado'] ?? null;
    
        if (!$idInvitado) {
            echo json_encode([
                "success" => false,
                "message" => "ID del invitado es obligatorio."
            ]);
            break;
        }
    
        $resultado = '';
        $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_INVITADOS_PKG.FIDE_INVITADOS_TB_ELIMINAR_INVITADO_SP(:id_invitado, :resultado); END;");
        oci_bind_by_name($stmt, ":id_invitado", $idInvitado);
        oci_bind_by_name($stmt, ":resultado", $resultado, 200);
    
        oci_execute($stmt);
    
        echo json_encode([
            "success" => true,
            "message" => "Invitado eliminado correctamente."
        ]);
        break;
    
    // CASE para obtener invitados
    case 'obtener_invitados':
        $cedulaMiembro = $_SESSION['cedula'];
    
        if (!$cedulaMiembro) {
            echo json_encode([
                "success" => false,
                "message" => "Cédula del miembro es obligatoria."
            ]);
            break;
        }
    
        $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_INVITADOS_PKG.FIDE_INVITADOS_TB_GET_SP(:cursor, :cedula); END;");
        $cursor = oci_new_cursor($conn);
        oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
        oci_bind_by_name($stmt, ":cedula", $cedulaMiembro);
    
        oci_execute($stmt);
        oci_execute($cursor);
    
        $invitados = [];
        while (($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) != false) {
            $invitados[] = $row;
        }
    
        echo json_encode([
            "success" => true,
            "data" => $invitados
        ]);
        break;
    
                                    
    default:
        echo json_encode(["success" => false, "message" => "Acción no válida."]);
        break;
}
?>
