<?php
require 'conexion.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json; charset=utf-8');

$action = $_POST['action'] ?? '';

switch ($action) {

    case 'agregar':
        $nombre = trim($_POST['nombre'] ?? '');
        $descripcion = trim($_POST['descripcion'] ?? '');
        $precio = $_POST['precio'] ?? null;

        if (!$nombre || !$descripcion || !$precio) {
            echo json_encode(["success" => false, "message" => "Todos los campos son obligatorios."]);
            break;
        }

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_PRODUCTOS_PKG.FIDE_PRODUCTOS_TB_INSERTAR_SP(
                        :p_nombre, :p_descripcion, :p_precio
                    ); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ':p_nombre', $nombre);
            oci_bind_by_name($stmt, ':p_descripcion', $descripcion);
            oci_bind_by_name($stmt, ':p_precio', $precio);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode(["success" => false, "message" => "Error al agregar el producto: " . $e['message']]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Producto agregado correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

        case 'agregar':
            $nombre = trim($_POST['nombre'] ?? '');
            $precio = $_POST['precio'] ?? null;
        
            if (!$nombre || !$precio) {
                echo json_encode(["success" => false, "message" => "Todos los campos son obligatorios."]);
                break;
            }
        
            try {
                $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PRODUCTOS_TB_INSERTAR_PRODUCTO_SP(
                            :p_nombre, :p_precio
                        ); END;";
                $stmt = oci_parse($conn, $sql);
        
                oci_bind_by_name($stmt, ':p_nombre', $nombre);
                oci_bind_by_name($stmt, ':p_precio', $precio);
        

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode(["success" => false, "message" => "Error al modificar el producto: " . $e['message']]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Producto actualizado correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

    case 'eliminar':
        $id = $_POST['id'] ?? null;

        if (!$id) {
            echo json_encode(["success" => false, "message" => "ID del producto no proporcionado."]);
            break;
        }

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PRODUCTOS_TB_ELIMINAR_PRODUCTO_SP(:p_id); END;";
            $stmt = oci_parse($conn, $sql);
            oci_bind_by_name($stmt, ':p_id', $id);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode(["success" => false, "message" => "Error al eliminar el producto: " . $e['message']]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Producto eliminado correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

    case 'obtener':
        try {
            $sql = "BEGIN FIDE_LOS_JAULES_PRODUCTOS_PKG.FIDE_PRODUCTOS_TB_GET_ALL_SP(:cursor); END;";
            $stmt = oci_parse($conn, $sql);

            $cursor = oci_new_cursor($conn);
            oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

            oci_execute($stmt);
            oci_execute($cursor);

            $productos = [];
            while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                foreach ($row as $key => $val) {
                    if (is_string($val)) {
                        $row[$key] = utf8_encode($val);
                    }
                }
                $productos[] = $row;
            }

            oci_free_statement($stmt);
            oci_free_statement($cursor);

            echo json_encode(["success" => true, "data" => $productos]);

        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;
}
