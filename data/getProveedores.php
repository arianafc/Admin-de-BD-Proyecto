<?php
require 'conexion.php';
$input = json_decode(file_get_contents("php://input"), true);

try {
    if (isset($input['id'])) {
        $id = (int)$input['id'];

        $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_GET_PROVEEDOR_SP(:p_cursor, :p_id); END;";
        $stmt = oci_parse($conn, $sql);
        $cursor = oci_new_cursor($conn);

        oci_bind_by_name($stmt, ":p_cursor", $cursor, -1, OCI_B_CURSOR);
        oci_bind_by_name($stmt, ":p_id", $id);

        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);
            echo json_encode(["error" => "Error al ejecutar procedimiento: " . $e['message']]);
            exit;
        }

        oci_execute($cursor);

        $resultado = [];
        while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
            foreach ($fila as $key => $value) {
                if (is_string($value)) {
                    $fila[$key] = utf8_encode($value);
                }
            }
            $resultado[] = $fila;
        }

        echo json_encode($resultado, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

        oci_free_statement($stmt);
        oci_free_statement($cursor);
        oci_close($conn);
    } else {
        // Si no se pasa ID, ejecutar el GET_ALL
        $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_GET_ALL_SP(:cursor); END;";
        $stmt = oci_parse($conn, $sql);
        $cursor = oci_new_cursor($conn);

        oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

        if (!oci_execute($stmt)) {
            $error = oci_error($stmt);
            die(json_encode(["success" => false, "message" => "Error al ejecutar procedimiento", "detalle" => $error['message']]));
        }

        oci_execute($cursor);

        $proveedores = [];
        while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
            foreach ($fila as $key => $value) {
                if (is_string($value)) {
                    $fila[$key] = utf8_encode($value);
                }
            }
            $proveedores[] = $fila;
        }

        oci_free_statement($stmt);
        oci_free_statement($cursor);
        oci_close($conn);

        echo json_encode(["success" => true, "data" => $proveedores], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    }

} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
