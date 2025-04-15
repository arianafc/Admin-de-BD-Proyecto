<?php
require 'conexion.php';

error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json; charset=utf-8');

$action = $_POST['action'] ?? '';

switch ($action) {

    case 'getReservas':
        try {
            $sql = "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_RESERVAS_TB_GET_SP(:cursor); END;";
            $stmt = oci_parse($conn, $sql);
    
            $cursor = oci_new_cursor($conn);
            oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
    
            if (!oci_execute($stmt)) {
                $e = oci_error($stmt);
                echo json_encode(["success" => false, "message" => "Error al ejecutar el procedimiento: " . $e['message']]);
                break;
            }
    
            oci_execute($cursor);
            $reservas = [];
    
            while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                foreach ($row as $key => $val) {
                    if (is_string($val)) {
                        $row[$key] = utf8_encode($val); // Asegura codificación correcta
                    }
                }
                $reservas[] = $row;
            }
    
            oci_free_statement($stmt);
            oci_free_statement($cursor);
    
            echo json_encode(["success" => true, "data" => $reservas]);
        } catch (Exception $e) {
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;
        case 'cancelar_reserva':
            if (isset($input['id_reserva'])) {
                $idReserva = $input['id_reserva'];
    
                try {
                    $stmt = oci_parse($conn, "BEGIN FIDE_RESERVAS_TB_CANCELAR_SP(:id); END;");
                    oci_bind_by_name($stmt, ":id", $idReserva);
                    oci_execute($stmt);
    
                    $response['success'] = true;
                    $response['message'] = 'Reserva cancelada correctamente.';
                } catch (Exception $e) {
                    $response['message'] = 'Error al cancelar reserva: ' . $e->getMessage();
                }
            } else {
                $response['message'] = 'ID de reserva no proporcionado.';
            }
            break;
            case 'listar_instalaciones':
                try {
                    $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_INSTALACIONES_TB_GET_SP(:cursor); END;");
                    $cursor = oci_new_cursor($conn);
        
                    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
                    oci_execute($stmt);
                    oci_execute($cursor);
                    $datos = [];
            
                    while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                        foreach ($row as $key => $val) {
                            if (is_string($val)) {
                                $row[$key] = utf8_encode($val); // Asegura codificación correcta
                            }
                        }
                        $datos[] = $row;
                    }
            
        
                    oci_free_statement($stmt);
                    oci_free_statement($cursor);
        
                    $response['success'] = true;
                    $response['data'] = $datos;
                    echo json_encode(["success" => true, "data" => $datos]);
                } catch (Exception $e) {
                    $response['message'] = 'Error al listar instalaciones: ' . $e->getMessage();
                }
                break;
            case 'listarTipos':
                try {
                    $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_TIPO_INSTALACIONES_TB_GET_SP (:cursor); END;");
                    $cursor = oci_new_cursor($conn);
            
                    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
                    oci_execute($stmt);
                    oci_execute($cursor);
            
                    $datos = [];
            
                    while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                        foreach ($row as $key => $val) {
                            if (is_string($val)) {
                                $row[$key] = utf8_encode($val); // Codificación para evitar problemas de acentos
                            }
                        }
                        $datos[] = $row;
                    }
            
                    oci_free_statement($stmt);
                    oci_free_statement($cursor);
            
                    $response['success'] = true;
                    $response['data'] = $datos;
                    echo json_encode(["success" => true, "data" => $datos]);
            
                } catch (Exception $e) {
                    echo json_encode(["success" => false, "message" => 'Error al listar tipos de instalaciones: ' . $e->getMessage()]);
                }
                break;

                case 'agregar_instalacion':
                    try {
                        $idTipo = $_POST['id_tipo'];
                        $nombre = $_POST['nombre'];
                        $costo = $_POST['costo'];
                        $capacidad = $_POST['capacidad'];
                
                        $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_INSTALACIONES_TB_AGREGAR_SP(:id_tipo, :nombre, :costo, :capacidad); END;");
                
                        oci_bind_by_name($stmt, ':id_tipo', $idTipo);
                        oci_bind_by_name($stmt, ':nombre', $nombre);
                        oci_bind_by_name($stmt, ':costo', $costo);
                        oci_bind_by_name($stmt, ':capacidad', $capacidad);
                
                        oci_execute($stmt);
                
                        echo json_encode([
                            "success" => true,
                            "message" => "Instalación agregada correctamente."
                        ]);
                    } catch (Exception $e) {
                        echo json_encode([
                            "success" => false,
                            "message" => "Error al agregar la instalación: " . $e->getMessage()
                        ]);
                    }
                    break;
                    case 'agregar_categoria':
                        try {
                            $nombre = $_POST['nombre'];
                    
                            $stmt = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_RESERVAS_PKG.FIDE_TIPO_INSTALACIONES_TB_ADD_SP(:nombre); END;");
                    
                            oci_bind_by_name($stmt, ':nombre', $nombre);
                    
                            oci_execute($stmt);
                    
                            echo json_encode([
                                "success" => true,
                                "message" => "Categoría agregada correctamente."
                            ]);
                        } catch (Exception $e) {
                            echo json_encode([
                                "success" => false,
                                "message" => "Error al agregar la categoría: " . $e->getMessage()
                            ]);
                        }
                        break;
                    

    default:
        echo json_encode(["success" => false, "message" => "Acción no válida."]);
        break;
}
?>
