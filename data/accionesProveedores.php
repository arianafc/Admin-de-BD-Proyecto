<?php
require 'conexion.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json; charset=utf-8');

$action = $_POST['action'] ?? '';

switch ($action) {

    case 'agregar':
        $nombre = trim($_POST['nombre'] ?? '');
        $telefono = trim($_POST['telefono'] ?? '');
        $email = trim($_POST['email'] ?? '');

        if (!$nombre || !$telefono || !$email) {
            echo json_encode(["success" => false, "message" => "Todos los campos son obligatorios."]);
            break;
        }

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_INSERTAR_SP(
                        :p_nombre, :p_telefono, :p_email
                    ); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ':p_nombre', $nombre);
            oci_bind_by_name($stmt, ':p_telefono', $telefono);
            oci_bind_by_name($stmt, ':p_email', $email);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode(["success" => false, "message" => "Error al crear el proveedor: " . $e['message']]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Proveedor agregado correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

    case 'modificar':
        $id = $_POST['id'] ?? null;
        $nombre = trim($_POST['nombre'] ?? '');
        $telefono = trim($_POST['telefono'] ?? '');
        $email = trim($_POST['email'] ?? '');

        if (!$id || !$nombre || !$telefono || !$email) {
            echo json_encode(["success" => false, "message" => "Todos los campos son requeridos."]);
            exit;
        }

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_MODIFICAR_SP(
                        :p_id, :p_nombre, :p_telefono, :p_email
                    ); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ":p_id", $id);
            oci_bind_by_name($stmt, ":p_nombre", $nombre);
            oci_bind_by_name($stmt, ":p_telefono", $telefono);
            oci_bind_by_name($stmt, ":p_email", $email);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode(["success" => false, "message" => "Error al modificar el proveedor: " . $e['message']]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Proveedor actualizado correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

    case 'eliminar':
        $id = $_POST['id'] ?? null;

        if (!$id) {
            echo json_encode(["success" => false, "message" => "ID del proveedor no proporcionado."]);
            break;
        }

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_ELIMINAR_PROVEEDOR_SP(:p_id); END;";
            $stmt = oci_parse($conn, $sql);
            oci_bind_by_name($stmt, ':p_id', $id);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode(["success" => false, "message" => "Error al eliminar el proveedor: " . $e['message']]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Proveedor eliminado correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

    case 'obtener':
        try {
            $sql = "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_GET_ALL_SP(:cursor); END;";
            $stmt = oci_parse($conn, $sql);

            $cursor = oci_new_cursor($conn);
            oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);

            oci_execute($stmt);
            oci_execute($cursor);

            $proveedores = [];
            while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                foreach ($row as $key => $val) {
                    if (is_string($val)) {
                        $row[$key] = utf8_encode($val);
                    }
                }
                $proveedores[] = $row;
            }

            oci_free_statement($stmt);
            oci_free_statement($cursor);

            echo json_encode(["success" => true, "data" => $proveedores]);
        } catch (Exception $e) {
            echo json_encode(["success" => false, "message" => "Error: " . $e->getMessage()]);
        }
        break;

    default:
        echo json_encode(["success" => false, "message" => "Acción no válida."]);
        break;
}
