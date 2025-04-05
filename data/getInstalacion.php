<?php
require 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $tipo = $_POST['id'];

    try {
        $sql = "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_RESERVAS_TB_GET_INSTALACION_SP (:cursor, :id); END;";
        $stmt = oci_parse($conn, $sql);

        $cursor = oci_new_cursor($conn);
        oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
        oci_bind_by_name($stmt, ":id", $tipo, -1, SQLT_INT);

        if (!oci_execute($stmt)) {
            die(json_encode(["error" => "Error al ejecutar procedimiento", "detalle" => oci_error($stmt)]));
        }
    
        if (!oci_execute($cursor)) {
            die(json_encode(["error" => "Error al ejecutar cursor", "detalle" => oci_error($cursor)]));
        }
    
        $instalaciones = [];
        while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
            foreach ($fila as $key => $value) {
                if (is_string($value)) {
                    $fila[$key] = utf8_encode($value);
                }
            }
            $instalaciones[] = $fila;
        }
    
        oci_free_statement($stmt);
        oci_free_statement($cursor);
        oci_close($conn);
    
        if (empty($instalaciones)) {
            echo json_encode(["success" => false, "message" => "La instalación no existe disponibles."]);
            exit;
        }
        
        echo json_encode(["success" => true, "data" => $instalaciones], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
        exit;
        
    
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => "Excepción en PHP", "detalle" => $e->getMessage()]);
    }
}
?>

