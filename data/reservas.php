<?php
session_start();
require 'conexion.php';
header('Content-Type: application/json');


try {
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $cedula = $_SESSION['cedula'];
        $fecha_inicio = isset($_POST['fecha_inicio']) ? strval($_POST['fecha_inicio']) : '';
        $fecha_fin = isset($_POST['fecha_fin']) ? strval($_POST['fecha_fin']) : '';
        $id_instalacion = $_POST['id_instalacion'] ?? '';
        $num_personas = $_POST['num_personas'] ?? '';
        $resultado = null;
        $idCarrito = $_SESSION['id_carrito'];

        $fecha_inicio = date("Y-m-d", strtotime($fecha_inicio));
        $fecha_fin = date("Y-m-d", strtotime($fecha_fin));

        $sql = "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_RESERVAS_TB_CREAR_RESERVA_SP(:cedula, TO_DATE(:fecha_inicio, 'YYYY-MM-DD'), 
                TO_DATE(:fecha_fin, 'YYYY-MM-DD'),
                :id_instalacion, :num_personas, :idCarrito, :resultado); END;";
        $stmt = oci_parse($conn, $sql);

        oci_bind_by_name($stmt, ':cedula', $cedula);
        oci_bind_by_name($stmt, ':fecha_inicio', $fecha_inicio);
        oci_bind_by_name($stmt, ':fecha_fin', $fecha_fin);
        oci_bind_by_name($stmt, ':id_instalacion', $id_instalacion);
        oci_bind_by_name($stmt, ':num_personas', $num_personas);
        oci_bind_by_name($stmt, ':resultado', $resultado, 4000);
        oci_bind_by_name($stmt, ':idCarrito', $idCarrito);

        if (!oci_execute($stmt)) {
            $e = oci_error($stmt);
            $mensajeOracle = $e['message'] ?? 'Error desconocido';
            $mensajeLimpio = preg_replace('/^ORA-\d+: /', '', $mensajeOracle); 
            echo json_encode([
                "success" => false,
                "message" => trim($mensajeLimpio)
            ]);
        } else {
            echo json_encode([
                "success" => true,
                "message" => trim($resultado)
            ]);
        }
        
        
        
        oci_free_statement($stmt);
        oci_close($conn);

    }
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}

?>