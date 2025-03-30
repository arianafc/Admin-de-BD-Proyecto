<?php
require 'conexion.php';

    try {
        $sql = "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIOS_TB_GET_USERS_SP(:cursor); END;";
        $stmt = oci_parse($conn, $sql);

        $cursor = oci_new_cursor($conn);
        oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

        if (!oci_execute($stmt)) {
            die(json_encode(["error" => "Error al ejecutar procedimiento", "detalle" => oci_error($stmt)]));
        }
    
        if (!oci_execute($cursor)) {
            die(json_encode(["error" => "Error al ejecutar cursor", "detalle" => oci_error($cursor)]));
        }
    
        $usuarios = [];
        while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
            foreach ($fila as $key => $value) {
                if (is_string($value)) {
                    $fila[$key] = utf8_encode($value);
                }
            }
            $usuarios[] = $fila;
        }
    
        oci_free_statement($stmt);
        oci_free_statement($cursor);
        oci_close($conn);
    
        if (empty($usuarios)) {
            echo json_encode(["success" => false, "message" => "No hay usuarios registrados."]);
            exit;
        }
        
        echo json_encode(["success" => true, "data" => $usuarios], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
        exit;
        
    
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => "Excepción en PHP", "detalle" => $e->getMessage()]);
    }

?>

