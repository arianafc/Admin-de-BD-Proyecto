<?php
session_start();
require 'conexion.php';


header('Content-Type: application/json; charset=UTF-8');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $action = $_POST['action'] ?? '';

    switch ($action) {
        case 'reservar':
            $cedula = $_SESSION['cedula'];
            $fecha_inicio = isset($_POST['fecha_inicio']) ? strval($_POST['fecha_inicio']) : '';
            $fecha_fin = isset($_POST['fecha_fin']) ? strval($_POST['fecha_fin']) : '';
            $id_instalacion = $_POST['id_instalacion'] ?? '';
            $num_personas = $_POST['num_personas'] ?? '';
            $idCarrito = $_SESSION['id_carrito'];
            $resultado = null;

            $fecha_inicio = date("Y-m-d", strtotime($fecha_inicio));
            $fecha_fin = date("Y-m-d", strtotime($fecha_fin));

            $sql = "BEGIN :resultado := FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_RESERVAS_TB_CREAR_RESERVA_SP(:cedula, TO_DATE(:fecha_inicio, 'YYYY-MM-DD'), 
                    TO_DATE(:fecha_fin, 'YYYY-MM-DD'),
                    :id_instalacion, :num_personas, :idCarrito); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ':cedula', $cedula);
            oci_bind_by_name($stmt, ':fecha_inicio', $fecha_inicio);
            oci_bind_by_name($stmt, ':fecha_fin', $fecha_fin);
            oci_bind_by_name($stmt, ':id_instalacion', $id_instalacion);
            oci_bind_by_name($stmt, ':num_personas', $num_personas);
            oci_bind_by_name($stmt, ':idCarrito', $idCarrito);
            oci_bind_by_name($stmt, ":resultado", $resultado, 32, SQLT_INT);

            if (!oci_execute($stmt)) {
                $e = oci_error($stmt);
                error_log("OCI Error: " . $e['message']);
                echo json_encode([
                    "success" => false,
                    "message" => $e['message']
                ]);
                exit();
            }

            switch ($resultado) {
                case 0:
                    echo json_encode(["success" => false, "message" => "ERROR: La fecha de inicio debe ser antes de la fecha de fin."]);
                    break;
                case 1:
                    echo json_encode(["success" => false, "message" => "ERROR: La instalación deseada ya se encuentra reservada."]);
                    break;
                case 2:
                    echo json_encode(["success" => false, "message" => "ERROR: La cantidad de personas excede la capacidad máxima de la instalación."]);
                    break;
                default:
                    echo json_encode([
                        "success" => true,
                        "message" => "Tu pre-reserva se ha realizado correctamente. Finaliza tu pago y completa tu reserva."
                    ]);
                    break;
            }

            oci_free_statement($stmt);
            break;

        default:
            echo json_encode(["success" => false, "message" => "Acción no reconocida."]);
            break;
    }

    oci_close($conn);
}
?>
