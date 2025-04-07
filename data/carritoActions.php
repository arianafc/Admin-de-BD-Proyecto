<?php
session_start();
require 'conexion.php';

header('Content-Type: application/json');

try {
    if (!isset($_SESSION['cedula'])) {
        die(json_encode(["error" => "El usuario no ha iniciado sesión."]));
    }

    if (!isset($_POST['action'])) {
        echo json_encode(["success" => false, "message" => "No se recibió ninguna acción."]);
        exit;
    }

    $cedula = $_SESSION['cedula'];
    $idCarrito = $_SESSION['id_carrito'];
    $action = $_POST['action'];

    if (!$conn) {
        echo json_encode(["success" => false, "message" => "Error de conexión a la base de datos."]);
        exit;
    }

    switch ($action) {

        case 'agregarMembresia':
            $membresia = $_POST['idMembresia'];
            $sql = "BEGIN FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_AGREGAR_MEMBRESIA_SP(:cedula, :idCarrito, :idMembresia); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ":cedula", $cedula);
            oci_bind_by_name($stmt, ":idCarrito", $idCarrito);
            oci_bind_by_name($stmt, ":idMembresia", $membresia);

            if (!oci_execute($stmt)) {
                echo json_encode(["success" => false, "message" => "Error al ejecutar procedimiento"]);
                exit;
            }

            echo json_encode(["success" => true, "message" => "Membresía agregada correctamente al carrito"]);
            oci_free_statement($stmt);
            break;

        case 'verCarrito':
            $sql = 'BEGIN FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_GET_CARRITO_SP(:carrito, :cursor); END;';
            $stmt = oci_parse($conn, $sql);
            $cursor = oci_new_cursor($conn);

            oci_bind_by_name($stmt, ':carrito', $idCarrito);
            oci_bind_by_name($stmt, ':cursor', $cursor, -1, OCI_B_CURSOR);

            if (!oci_execute($stmt) || !oci_execute($cursor)) {
                echo json_encode(["success" => false, "message" => "Error al obtener los datos del carrito"]);
                exit;
            }

            $items = [];
            while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                foreach ($fila as $key => $value) {
                    if (is_string($value)) {
                        $fila[$key] = utf8_encode($value);
                    }
                }
                $items[] = $fila;
            }

            echo json_encode(["success" => true, "data" => $items]);
            oci_free_statement($stmt);
            oci_free_statement($cursor);
            break;

        case 'eliminar':
            $idItem = $_POST['id_item'];
            $resultado = null;
            $sql = "BEGIN :resultado := FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_ELIMINAR_FN(:idItem); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ":idItem", $idItem);
            oci_bind_by_name($stmt, ":resultado", $resultado);

            if (!oci_execute($stmt)) {
                echo json_encode(["success" => false, "message" => "Error al ejecutar procedimiento"]);
                exit;
            }

            if ($resultado == 0) {
                echo json_encode(["success" => true, "message" => "Reserva eliminada con éxito."]);
            } else {
                echo json_encode(["success" => true, "message" => "Membresía eliminada con éxito."]);
            }

            oci_free_statement($stmt);
            break;

        case 'editar':
            $fecha_inicio = date("Y-m-d", strtotime($_POST['fecha_inicio'] ?? ''));
            $fecha_fin = date("Y-m-d", strtotime($_POST['fecha_fin'] ?? ''));
            $num_personas = $_POST['num_personas'] ?? '';
            $idItem = $_POST['idItem'];
            $resultado = null;

            $sql = "BEGIN :resultado := FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_RESERVAS_TB_ACTUALIZAR_RESERVA_SP(:id, TO_DATE(:fecha_inicio, 'YYYY-MM-DD'), 
                    TO_DATE(:fecha_fin, 'YYYY-MM-DD'), :num_personas); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ":id", $idItem);
            oci_bind_by_name($stmt, ":fecha_inicio", $fecha_inicio);
            oci_bind_by_name($stmt, ":fecha_fin", $fecha_fin);
            oci_bind_by_name($stmt, ":num_personas", $num_personas);
            oci_bind_by_name($stmt, ":resultado", $resultado, 32, SQLT_INT);

            if (!oci_execute($stmt)) {
                $e = oci_error($stmt);
                echo json_encode(["success" => false, "message" => $e['message']]);
                exit;
            }

            switch ($resultado) {
                case 0:
                    echo json_encode(["success" => false, "message" => "ERROR: La fecha de inicio debe ser antes de la fecha de fin."]);
                    break;
                case 1:
                    echo json_encode(["success" => false, "message" => "ERROR: La instalación ya está reservada."]);
                    break;
                case 2:
                    echo json_encode(["success" => false, "message" => "ERROR: Excede la capacidad máxima."]);
                    break;
                default:
                    echo json_encode(["success" => true, "message" => "Reserva actualizada correctamente."]);
                    break;
            }

            oci_free_statement($stmt);
            break;

        case 'obtenerMetodos':
            $sql = "BEGIN FIDE_LOS_JAULES_CHECKOUT_PKG.FIDE_METODO_PAGO_TB_GET_METODOS_SP(:cursor); END;";
            $stmt = oci_parse($conn, $sql);
            $cursor = oci_new_cursor($conn);

            oci_bind_by_name($stmt, ':cursor', $cursor, -1, OCI_B_CURSOR);

            if (!oci_execute($stmt) || !oci_execute($cursor)) {
                echo json_encode(["success" => false, "message" => "Error al obtener los métodos de pago"]);
                exit;
            }

            $metodos = [];
            while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                foreach ($fila as $key => $value) {
                    if (is_string($value)) {
                        $fila[$key] = utf8_encode($value);
                    }
                }
                $metodos[] = $fila;
            }

            echo json_encode(["success" => true, "data" => $metodos]);
            oci_free_statement($stmt);
            oci_free_statement($cursor);
            break;

        case 'totalCarrito':
            $total = null;
            $sql = "BEGIN :total := FIDE_LOS_JAULES_CHECKOUT_PKG.FIDE_CHECKOUT_TB_TOTAL_SP(:idCarrito); END;";
            $stid = oci_parse($conn, $sql);

            oci_bind_by_name($stid, ":total", $total, 32);
            oci_bind_by_name($stid, ":idCarrito", $idCarrito, 32);

            if (!oci_execute($stid)) {
                $e = oci_error($stid);
                echo json_encode(["success" => false, "message" => "Error al obtener total", "detail" => $e['message']]);
            } else {
                echo $total;
            }

            oci_free_statement($stid);
            break;
        case 'checkout':
            $metodoPago = $_POST['idMetodoPago'];

            $sql = 'BEGIN FIDE_LOS_JAULES_CHECKOUT_PKG.FIDE_CHECKOUT_TB_EJECUTAR_SP(:carrito, :cedula, :metodoPago); END;';
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ":carrito", $idCarrito, 32);
            oci_bind_by_name($stmt, ":cedula", $cedula, 32);
            oci_bind_by_name($stmt, ":metodoPago", $metodoPago, 32);

            if (!oci_execute($stmt)) {
                $e = oci_error($stmt);
                echo json_encode(["success" => false, "message" => "Error al ejecutar el pago", "detail" => $e['message']]);
            } else {
                echo json_encode(["success" => true, "message" => "Gracias por tu compra"]);
            }
            oci_free_statement($stmt);

            break;

        default:
            echo json_encode(["success" => false, "message" => "Acción no válida"]);
            break;
    }

    oci_close($conn);
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}

?>