<?php

function obtenerTipoMembresias()
{
    include 'conexion.php'; // Usa la variable de conexión definida en conexion.php

    if (!$conn) {
        echo json_encode(["error" => "No se pudo conectar a la base de datos"]);
        exit;
    }

    $sql = "BEGIN FIDE_TIPO_MEMBRESIAS_TB_OBTENER_MEMBRESIAS_SP(:cursor); END;";
    $ejecutar = oci_parse($conn, $sql);

    if (!$ejecutar) {
        echo json_encode(["error" => "Error en oci_parse", "detalle" => oci_error($conn)]);
        exit;
    }

    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($ejecutar, ":cursor", $cursor, -1, OCI_B_CURSOR);

    if (!oci_execute($ejecutar) || !oci_execute($cursor)) {
        echo json_encode(["error" => "Error al ejecutar el procedimiento", "detalle" => oci_error($ejecutar)]);
        exit;
    }

    $membresias = [];
    while ($row = oci_fetch_assoc($cursor)) {
        $membresias[] = $row;
    }

    if (empty($membresias)) {
        die(json_encode(["error" => "No hay membresías disponibles"]));
    }

    header('Content-Type: application/json');


    return json_encode($membresias);

       
    oci_free_statement($cursor);
    oci_free_statement($ejecutar);
    oci_close($conn);
}
?>
