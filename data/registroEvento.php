<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);
session_start();
require 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!isset($_SESSION['cedula'])) {
        echo json_encode(["success" => false, "message" => "Error: No se ha iniciado sesión."]);
        exit;
    }

    $cedula = $_SESSION['cedula']; 
    $action = $_POST['action'] ?? '';

    switch ($action) {
        case 'addMiembro':
            $id_evento = $_POST['id_evento'];
            $resultado = null;

            try {
                $sql = "BEGIN :resultado := FIDE_LOS_JAULES_EVENTOS_PKG.FIDE_EVENTOS_TB_INSERTAR_REGISTRO_MIEMBRO_FN(:cedula, :id_evento); END;";
                $stmt = oci_parse($conn, $sql);

                oci_bind_by_name($stmt, ":cedula", $cedula);
                oci_bind_by_name($stmt, ":id_evento", $id_evento);
                oci_bind_by_name($stmt, ":resultado", $resultado);

                if (!@oci_execute($stmt)) {
                    $error = oci_error($stmt);

                    // Extraer mensaje claro
                    if (preg_match('/ORA-\d{5}:\s*(.+)/', $error['message'], $matches)) {
                        $mensaje = trim($matches[1]);
                    } else {
                        $mensaje = "Error al registrar el evento";
                    }

                    echo json_encode([
                        "success" => false,
                        "message" => $mensaje,
                        "detalle" => $error['message']
                    ]);
                } else {
                    switch ($resultado) {
                        case 1:
                            echo json_encode(["success" => true, "message" => "Registro exitoso."]);
                            break;
                        case 2:
                            echo json_encode(["success" => false, "message" => "Lo sentimos. La membresía activa no es válida para la fecha del evento."]);
                            break;
                        case 3:
                            echo json_encode(["success" => false, "message" => "No tienes una membresía activa."]);
                            break;
                        default:
                            echo json_encode(["success" => false, "message" => "Lo sentimos. No hay cupo para el evento."]);
                            break;
                    }
                }

                oci_free_statement($stmt);
                oci_close($conn);
            } catch (Exception $e) {
                echo json_encode([
                    "success" => false,
                    "message" => "Excepción en PHP",
                    "detalle" => $e->getMessage()
                ]);
            }
            break;

        case 'addInvitado':
            $id_evento = $_POST['id_evento'];
            $cedulaMiembro = $_POST['cedulaMiembro'];
            $resultado = null;


            try {
                $sql = "BEGIN :resultado := FIDE_LOS_JAULES_EVENTOS_PKG.FIDE_EVENTOS_TB_INSERTAR_REGISTRO_INVITADO_FN(:cedulaMiembro, :cedula, :id_evento); END;";
                $stmt = oci_parse($conn, $sql);

                oci_bind_by_name($stmt, ":cedula", $cedula);
                oci_bind_by_name($stmt, ":id_evento", $id_evento);
                oci_bind_by_name($stmt, ":cedulaMiembro", $cedulaMiembro);
                oci_bind_by_name($stmt, ":resultado", $resultado);

                if (!@oci_execute($stmt)) {
                    $e = oci_error($stmt);
                    $oracleMessage = $e['message'] ?? 'Error desconocido';
            
                    preg_match('/(ORA-\d{5})/', $oracleMessage, $matches);
                    $codigo = $matches[1] ?? 'Error desconocido';
                
                  
                    switch ($codigo) {
                        case 'ORA-20002':
                            $mensaje = "Ya te encuentras registrado en este evento.";
                            break;
                        case 'ORA-20003':
                                $mensaje = "Ya estás registrado como invitado en este evento. No puedes registrarte también como miembro.";
                                break;
                        case 'ORA-20001':
                                    $mensaje = "La membresía o pase activo no es válida para el día del evento deseado";
                                    break;
                        default:
                         
                            $mensaje = preg_replace('/ORA-\d{5}:\s*/', '', $oracleMessage);
                            $mensaje = preg_replace('/\s+/', ' ', $mensaje); // Limpiar saltos de línea
                            break;
                    }
                
    
                    $mensajeFinal = "$mensaje";
                
                    echo json_encode([
                        "success" => false,
                        "message" => $mensajeFinal
                    ]);
                    exit;
            
                } else {
                    switch ($resultado) {
                        case 1:
                            echo json_encode(["success" => true, "message" => "Registro exitoso."]);
                            break;
                        case 0:
                            echo json_encode(["success" => false, "message" => "Lo sentimos. No estas registrado como invitado del miembro proporcionado."]);
                            break;
                        default:
                            echo json_encode(["success" => false, "message" => "Lo sentimos. No hay cupo para el evento."]);
                            break;
                    }
                }

                oci_free_statement($stmt);
                oci_close($conn);
            } catch (Exception $e) {
                echo json_encode([
                    "success" => false,
                    "message" => "Excepción en PHP",
                    "detalle" => $e->getMessage()
                ]);
            }

            break;

        default:
            echo json_encode([
                "success" => false,
                "message" => "Acción no reconocida"
            ]);
            break;
    }
}
?>
