<?php
require 'conexion.php';
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
header('Content-Type: application/json; charset=utf-8');

$action = $_POST['action'] ?? '';

switch ($action) {

    case 'modificar':
        $id = $_POST['id'] ?? null;
        $nombre = trim($_POST['nombre'] ?? '');
        $descripcion = trim($_POST['descripcion'] ?? '');
        $costo = $_POST['costo'] ?? '';
        $duracion = $_POST['duracion'] ?? '';
        $numeroInvitados = $_POST['numero'] ?? '';

        if (!$id || !$nombre || !$costo || !$duracion || $descripcion === '' || $numeroInvitados === '') {
            echo json_encode(["success" => false, "message" => "Todos los campos son requeridos."]);
            exit;
        }

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_MODIFICAR_MEMBRESIA_SP(
                        :id, :nombre, :costo, :duracion, :descripcion, :numero
                    ); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ":id", $id);
            oci_bind_by_name($stmt, ":nombre", $nombre);
            oci_bind_by_name($stmt, ":costo", $costo);
            oci_bind_by_name($stmt, ":duracion", $duracion);
            oci_bind_by_name($stmt, ":descripcion", $descripcion);
            oci_bind_by_name($stmt, ":numero", $numeroInvitados);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode([
                    "success" => false,
                    "message" => strpos($e['message'], 'ORA-20001') !== false
                        ? "Error específico de Oracle: " . $e['message']
                        : "Error al modificar la membresía: " . $e['message']
                ]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Membresía actualizada correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

    case 'eliminar':
        if (!isset($_POST['id'])) {
            echo json_encode(["success" => false, "message" => "ID de membresía no proporcionado."]);
            break;
        }

        $idMembresia = (int)$_POST['id'];

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_ELIMINAR_MEMBRESIA_SP(:p_id); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ':p_id', $idMembresia);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode([
                    "success" => false,
                    "message" => strpos($e['message'], 'ORA-20001') !== false
                        ? "Error personalizado: " . $e['message']
                        : "Error al eliminar la membresía: " . $e['message']
                ]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Membresía desactivada correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

    case 'crear':
        $nombre = trim($_POST['nombre'] ?? '');
        $costo = $_POST['costo'] ?? '';
        $duracion = $_POST['duracion'] ?? '';
        $descripcion = trim($_POST['descripcion'] ?? '');
        $numero = $_POST['numero'] ?? '';

        if (!$nombre || !$costo || !$duracion || !$descripcion || !$numero) {
            echo json_encode(["success" => false, "message" => "Todos los campos son obligatorios."]);
            break;
        }

        try {
            $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_CREAR_MEMBRESIA_SP(
                        :p_nombre, :p_costo, :p_duracion, :p_descripcion, :p_numero
                    ); END;";
            $stmt = oci_parse($conn, $sql);

            oci_bind_by_name($stmt, ':p_nombre', $nombre);
            oci_bind_by_name($stmt, ':p_costo', $costo);
            oci_bind_by_name($stmt, ':p_duracion', $duracion);
            oci_bind_by_name($stmt, ':p_descripcion', $descripcion);
            oci_bind_by_name($stmt, ':p_numero', $numero);

            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                oci_rollback($conn);
                $e = oci_error($stmt);
                if (ob_get_length()) ob_clean();

                echo json_encode([
                    "success" => false,
                    "message" => strpos($e['message'], 'ORA-20001') !== false
                        ? "Error personalizado: " . $e['message']
                        : "Error al crear la membresía: " . $e['message']
                ]);
                exit;
            }

            oci_commit($conn);
            oci_free_statement($stmt);
            echo json_encode(["success" => true, "message" => "Membresía agregada correctamente."]);
        } catch (Exception $e) {
            if (ob_get_length()) ob_clean();
            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
        }
        break;

        case 'obtener_beneficios':
            try {
                $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_TIPO_MEMBRESIAS_TB_GET_ALL_BENEFICIOS_SP(:cursor); END;";
                $stmt = oci_parse($conn, $sql);
        
                $cursor = oci_new_cursor($conn);
                oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
        
                if (!oci_execute($stmt)) {
                    $e = oci_error($stmt);
                    throw new Exception("Error al ejecutar el procedimiento: " . $e['message']);
                }
        
                if (!oci_execute($cursor)) {
                    $e = oci_error($cursor);
                    throw new Exception("Error al abrir el cursor: " . $e['message']);
                }
        
                $beneficios = [];
                while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                    foreach ($row as $key => $val) {
                        if (is_string($val)) {
                            $row[$key] = utf8_encode($val); // Codificar correctamente las tildes
                        }
                    }
                    $beneficios[] = $row;
                }
        
                oci_free_statement($stmt);
                oci_free_statement($cursor);
        
                echo json_encode(["success" => true, "data" => $beneficios]);
            } catch (Exception $e) {
                echo json_encode(["success" => false, "message" => $e->getMessage()]);
            }
            break;
            case 'listar_beneficios_membresias':
                try {
                    $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_TIPO_MEMBRESIAS_TB_GET_BENEFICIOS_MEMBRESIAS_SP(:cursor); END;";
                    $stmt = oci_parse($conn, $sql);
            
                    $cursor = oci_new_cursor($conn);
                    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
            
                    oci_execute($stmt);
                    oci_execute($cursor);
            
                    $beneficios = [];
                    while ($row = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
                        foreach ($row as $key => $value) {
                            if (is_string($value)) {
                                $row[$key] = utf8_encode($value);
                            }
                        }
                        $beneficios[] = $row;
                    }
            
                    echo json_encode(["success" => true, "data" => $beneficios]);
                    
                    oci_free_statement($stmt);
                    oci_free_statement($cursor);
                } catch (Exception $e) {
                    echo json_encode(["success" => false, "message" => "Error: " . $e->getMessage()]);
                }
                break;
                case 'eliminar_beneficio_asignado':
                    $idBeneficio = $_POST['id'] ?? null;
                
                    if (!$idBeneficio) {
                        echo json_encode(["success" => false, "message" => "ID no proporcionado."]);
                        break;
                    }
                
                    try {
                        $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_ELIMINAR_BENEFICIO_ASIGNADO_SP(:p_id); END;";
                        $stmt = oci_parse($conn, $sql);
                
                        oci_bind_by_name($stmt, ':p_id', $idBeneficio);
                
                        if (!oci_execute($stmt)) {
                            $e = oci_error($stmt);
                            echo json_encode(["success" => false, "message" => "Error al eliminar: " . $e['message']]);
                            break;
                        }
                
                        echo json_encode(["success" => true, "message" => "Beneficio eliminado correctamente."]);
                
                        oci_free_statement($stmt);
                    } catch (Exception $e) {
                        echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                    }
                    break;
                
                    case 'asociar_beneficio_membresia':
                        $idBeneficio = $_POST['id_beneficio'] ?? null;
                        $idMembresia = $_POST['id_membresia'] ?? null;
                    
                        if (!$idBeneficio || !$idMembresia) {
                            echo json_encode(["success" => false, "message" => "Datos incompletos."]);
                            break;
                        }
                    
                        try {
                            $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_TIPO_MEMBRESIAS_TB_ASOCIAR_BENEFICIOS_SP(:p_beneficio, :p_membresia); END;";
                            $stmt = oci_parse($conn, $sql);
                    
                            oci_bind_by_name($stmt, ':p_beneficio', $idBeneficio);
                            oci_bind_by_name($stmt, ':p_membresia', $idMembresia);
                    
                            if (!oci_execute($stmt)) {
                                $e = oci_error($stmt);
                                echo json_encode(["success" => false, "message" => "Error al asociar beneficio: " . $e['message']]);
                                break;
                            }
                    
                            echo json_encode(["success" => true, "message" => "Beneficio asociado correctamente."]);
                    
                            oci_free_statement($stmt);
                        } catch (Exception $e) {
                            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                        }
                        break;
                        case 'obtener_membresias':
                            try {
                                $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_TIPO_MEMBRESIAS_TB_OBTENER_MEMBRESIAS_SP(:cursor); END;";
                                $stmt = oci_parse($conn, $sql);
                        
                                $cursor = oci_new_cursor($conn);
                                oci_bind_by_name($stmt, ':cursor', $cursor, -1, OCI_B_CURSOR);
                        
                                oci_execute($stmt);
                                oci_execute($cursor);
                        
                                $result = [];
                                while ($row = oci_fetch_assoc($cursor)) {
                                    foreach ($row as $key => $val) {
                                        if (is_string($val)) {
                                            $row[$key] = utf8_encode($val);
                                        }
                                    }
                                    $result[] = $row;
                                }
                        
                                oci_free_statement($stmt);
                                oci_free_statement($cursor);
                        
                                echo json_encode(["success" => true, "data" => $result]);
                            } catch (Exception $e) {
                                echo json_encode(["success" => false, "message" => "Error: " . $e->getMessage()]);
                            }
                            break;
                            case 'eliminar_beneficio':
                                $idBeneficio = $_POST['id_beneficio'] ?? null;
                            
                                if (!$idBeneficio) {
                                    echo json_encode(["success" => false, "message" => "ID del beneficio no proporcionado."]);
                                    break;
                                }
                            
                                try {
                                    $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_ELIMINAR_BENEFICIO_SP(:p_id); END;";
                                    $stmt = oci_parse($conn, $sql);
                            
                                    oci_bind_by_name($stmt, ":p_id", $idBeneficio);
                            
                                    if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                                        oci_rollback($conn);
                                        $e = oci_error($stmt);
                                        echo json_encode(["success" => false, "message" => "Error al eliminar beneficio: " . $e['message']]);
                                        break;
                                    }
                            
                                    oci_commit($conn);
                                    echo json_encode(["success" => true, "message" => "Beneficio eliminado correctamente."]);
                                } catch (Exception $e) {
                                    echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                                }
                            
                                break;
                                case 'editar_beneficio':
                                    $idBeneficio = $_POST['id_beneficio'] ?? null;
                                    $descripcion = $_POST['descripcion'] ?? '';
                                
                                    if (!$idBeneficio || trim($descripcion) === '') {
                                        echo json_encode(["success" => false, "message" => "Datos incompletos para editar."]);
                                        break;
                                    }
                                
                                    try {
                                        $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_EDITAR_BENEFICIO(:p_id, :p_descripcion); END;";
                                        $stmt = oci_parse($conn, $sql);
                                
                                        oci_bind_by_name($stmt, ":p_id", $idBeneficio);
                                        oci_bind_by_name($stmt, ":p_descripcion", $descripcion);
                                
                                        if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                                            oci_rollback($conn);
                                            $e = oci_error($stmt);
                                            echo json_encode(["success" => false, "message" => "Error al editar beneficio: " . $e['message']]);
                                            break;
                                        }
                                
                                        oci_commit($conn);
                                        echo json_encode(["success" => true, "message" => "Beneficio editado correctamente."]);
                                    } catch (Exception $e) {
                                        echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                                    }
                                
                                    break;
                                    case 'agregar_beneficio':
                                        $descripcion = $_POST['descripcion'] ?? '';
                                    
                                        if (trim($descripcion) === '') {
                                            echo json_encode(["success" => false, "message" => "La descripción es obligatoria."]);
                                            break;
                                        }
                                    
                                        try {
                                            $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_BENEFICIOS_TB_AGREGAR_SP(:p_descripcion); END;";
                                            $stmt = oci_parse($conn, $sql);
                                            oci_bind_by_name($stmt, ":p_descripcion", $descripcion);
                                    
                                            if (!oci_execute($stmt, OCI_NO_AUTO_COMMIT)) {
                                                oci_rollback($conn);
                                                $e = oci_error($stmt);
                                                echo json_encode(["success" => false, "message" => "Error al agregar beneficio: " . $e['message']]);
                                                break;
                                            }
                                    
                                            oci_commit($conn);
                                            echo json_encode(["success" => true, "message" => "Beneficio agregado correctamente."]);
                                        } catch (Exception $e) {
                                            echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                                        }
                                    
                                        break;
                                        case 'obtenerMembresiaUsuario':
                                            $cedula = $_SESSION['cedula'] ?? null;
                                        
                                            if (!$cedula) {
                                                echo json_encode(["success" => false, "message" => "La cédula es obligatoria."]);
                                                break;
                                            }
                                        
                                            try {
                                                $sql = 'BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_GET_MEMBRESIA_USUARIO_SP(:p_cursor, :p_cedula); END;';
                                                $stmt = oci_parse($conn, $sql);
                                        
                                                // Crear cursor
                                                $cursor = oci_new_cursor($conn);
                                        
                                                // Enlazar parámetros
                                                oci_bind_by_name($stmt, ':p_cursor', $cursor, -1, OCI_B_CURSOR);
                                                oci_bind_by_name($stmt, ':p_cedula', $cedula);
                                        
                                                // Ejecutar el procedimiento y el cursor
                                                if (!oci_execute($stmt)) {
                                                    $e = oci_error($stmt);
                                                    echo json_encode(["success" => false, "message" => "Error al ejecutar el procedimiento: " . $e['message']]);
                                                    break;
                                                }
                                        
                                                oci_execute($cursor);
                                        
                                                $result = [];
                                                while ($row = oci_fetch_assoc($cursor)) {
                                                    foreach ($row as $key => $val) {
                                                        if (is_string($val)) {
                                                            $row[$key] = utf8_encode($val);
                                                        }
                                                    }
                                                    // Agregamos el estado en base al ID_ESTADO
                                                    $row['ESTADO'] = ($row['ID_ESTADO'] == 1) ? 'Activa' : 'Inactiva';
                                                    $result[] = $row;
                                                }
                                        
                                                if (!empty($result)) {
                                                    echo json_encode(["success" => true, "data" => $result]);
                                                } else {
                                                    echo json_encode(["success" => false, "message" => "No se encontró membresía activa."]);
                                                }
                                        
                                                oci_free_statement($stmt);
                                                oci_free_statement($cursor);
                                                exit;
                                        
                                            } catch (Exception $e) {
                                                echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                                            }
                                        
                                            break;
                                        
                                            case 'actualizarFechaInicio':
                                                $idMembresia = $_POST['id_membresia'] ?? null;
                                                $nuevaFecha = $_POST['nueva_fecha'] ?? null;
                                            
                                                if (!$idMembresia || !$nuevaFecha) {
                                                    echo json_encode(["success" => false, "message" => "Datos incompletos."]);
                                                    break;
                                                }
                                            
                                                try {
                                                    $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_ACTUALIZAR_PASE_DIARIO_SP(:p_id, TO_DATE(:p_fecha, 'YYYY-MM-DD'), :p_resultado); END;";
                                                    $stmt = oci_parse($conn, $sql);
                                            
                                                    oci_bind_by_name($stmt, ':p_id', $idMembresia);
                                                    oci_bind_by_name($stmt, ':p_fecha', $nuevaFecha);
                                                    oci_bind_by_name($stmt, ':p_resultado', $resultado, 200);
                                            
                                                    oci_execute($stmt);
                                            
                                                    $success = strpos($resultado, 'correctamente') !== false;
                                            
                                                    echo json_encode([
                                                        "success" => $success,
                                                        "message" => $resultado
                                                    ]);
                                            
                                                    oci_free_statement($stmt);
                                                    exit;
                                            
                                                } catch (Exception $e) {
                                                    echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                                                    exit;
                                                }
                                            
                                                break;
                                                case 'cancelarMembresia':
                                                    $idMembresia = $_POST['id_membresia'] ?? null;
                                                
                                                    if (!$idMembresia) {
                                                        echo json_encode(["success" => false, "message" => "ID de membresía no proporcionado."]);
                                                        break;
                                                    }
                                                
                                                    try {
                                                        $sql = "BEGIN FIDE_LOS_JAULES_MEMBRESIAS_PKG.FIDE_MEMBRESIAS_TB_CANCELAR_SP(:p_id_membresia, :p_resultado); END;";
                                                        $stmt = oci_parse($conn, $sql);
                                                
                                                        oci_bind_by_name($stmt, ':p_id_membresia', $idMembresia);
                                                        oci_bind_by_name($stmt, ':p_resultado', $resultado, 200);
                                                
                                                        oci_execute($stmt);
                                                
                                                        echo json_encode([
                                                            "success" => strpos($resultado, 'exitosamente') !== false,
                                                            "message" => $resultado
                                                        ]);
                                                
                                                        oci_free_statement($stmt);
                                                        exit;
                                                
                                                    } catch (Exception $e) {
                                                        echo json_encode(["success" => false, "message" => "Excepción: " . $e->getMessage()]);
                                                        exit;
                                                    }
                                                
                                                    break;
                                                    
                                    
    default:
        echo json_encode(["success" => false, "message" => "Acción no válida."]);
        break;
}
?>
