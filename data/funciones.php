<?php
require 'conexion.php';
session_start();
function actualizarMembresiaSesion($conn, $cedula) {
    $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_GET_MEMBRESIA_USUARIO_SP(:cursor, :cedula); END;");

    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
    oci_bind_by_name($stmt, ":cedula", $cedula);

    if (!oci_execute($stmt)) {
        $e = oci_error($stmt);
        throw new Exception("Error ejecutando SP: " . $e['message']);
    }

    oci_execute($cursor);

    $datos = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS);

    if ($datos) {
        $_SESSION['id_membresia'] = $datos['ID_TIPO_MEMBRESIA'];
        if($_SESSION['id_membresia'] == 1) {
            return false;
        } else {
            return true;
        }
        
    } else {
        unset($_SESSION['id_membresia']);
        return false;
    }

    oci_free_statement($stmt);
    oci_free_statement($cursor);
}
?>