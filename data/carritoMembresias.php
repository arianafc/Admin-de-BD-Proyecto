<?php
session_start();
require 'conexion.php';

header('Content-Type: application/json');

try {
    if (!isset($_SESSION['cedula'])) {
        die(json_encode(["error" => "El usuario no ha iniciado sesión."]));
    }

    // Obtener datos del formulario
    $cedula = $_SESSION['cedula'];
    $idCarrito = $_SESSION['id_carrito'];
   
    $action = $_POST['action'];

    if (!$conn) {
        echo json_encode(["success" => false, "message" => "Error de conexión a la base de datos."]);
        exit;
    }
switch($action) {
    case 'agregarMembresia':
        $membresia= $_POST['idMembresia'];
        $sql = "BEGIN FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_AGREGAR_MEMBRESIA_SP(:cedula, :idCarrito, :idMembresia); END;";
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "Error en oci_parse"]);
        exit;
    }

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
        $carrito = $_SESSION['id_carrito'];
        $sql = 'BEGIN FIDE_LOS_JAULES_CARRITO_PKG.FIDE_LOS_JAULES_GET_CARRITO_SP(:carrito, :cursor); END;';
        $stmt = oci_parse($conn, $sql);

        $cursor = oci_new_cursor($conn);

        oci_bind_by_name($stmt, ':carrito', $carrito);
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

    default:
        echo json_encode(["success" => false, "message" => "Acción no válida"]);
        break;
        oci_close($conn);
        exit;
    
    } } 
    catch (Exception $e) {
        echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
    }
    ?>
        












