<?php
session_start();
require 'conexion.php';  // Asegúrate de que la conexión está correctamente configurada

header('Content-Type: application/json');

try {
    // Verifica que la conexión se ha establecido
    if (!$conn) {
        echo json_encode(["success" => false, "message" => "Error de conexión a la base de datos."]);
        exit;
    }

    // Obtén el parámetro que quieras usar en el procedimiento (ajustar según lo que necesites)
    $param_value = $_POST['param'] ?? '';  // Ejemplo, reemplaza 'param' con el nombre real

    // Si el parámetro está vacío, devolver un error
    if (empty($param_value)) {
        echo json_encode(["success" => false, "message" => "El parámetro es requerido"]);
        exit;
    }

    // Llamada al procedimiento
    $sql = 'BEGIN FIDE_LOS_JAULES_INVENTARIO_PKG.GET_INVENTARIO_SP(:param, :cursor); END;';
    $stmt = oci_parse($conn, $sql);

    if (!$stmt) {
        echo json_encode(["success" => false, "message" => "Error en oci_parse"]);
        exit;
    }

    // Crear un cursor para obtener los resultados
    $cursor = oci_new_cursor($conn);

    // Enlazar parámetros
    oci_bind_by_name($stmt, ':param', $param_value);
    oci_bind_by_name($stmt, ':cursor', $cursor, -1, OCI_B_CURSOR);

    // Ejecutar la sentencia
    if (!oci_execute($stmt)) {
        echo json_encode(["success" => false, "message" => "Error al ejecutar el procedimiento"]);
        exit;
    }

    // Ejecutar el cursor para obtener los resultados
    $inventario = [];
    if (oci_execute($cursor)) {
        while ($row = oci_fetch_assoc($cursor)) {
            $inventario[] = $row;  // Agregar cada fila al array de inventario
        }
    } else {
        echo json_encode(["success" => false, "message" => "Error al obtener datos del inventario"]);
        exit;
    }

    // Liberar recursos
    oci_free_statement($stmt);
    oci_free_statement($cursor);
    oci_close($conn);

    // Enviar la respuesta en formato JSON
    echo json_encode(["success" => true, "data" => $inventario], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);

} catch (Exception $e) {
    // Si ocurre un error, devolver el mensaje de error
    echo json_encode(["success" => false, "message" => "Excepción en PHP", "detail" => $e->getMessage()]);
}
?>
