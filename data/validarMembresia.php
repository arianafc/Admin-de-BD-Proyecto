<?php
require 'conexion.php';
require_once 'funciones.php';

header('Content-Type: application/json');

$cedula = $_SESSION['cedula']; 

if (empty($cedula)) {
    echo json_encode(['success' => false, 'message' => 'Cédula no encontrada en la sesión']);
    exit;
}

try {
    $tieneMembresia = actualizarMembresiaSesion($conn, $cedula);

    if (isset($_SESSION['id_membresia'])) {
        $tipo = $_SESSION['id_membresia'];
    } else {
        $tipo = null;
    }

    echo json_encode([
        'success' => $tieneMembresia,
        'tipo_membresia' => $tipo
    ]);

} catch (Exception $e) {
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}

?>
