<?php
require_once 'conexion.php';

$cedula = $_POST['cedula'];
$nombre = $_POST['nombre'];
$apellido1 = $_POST['apellido1'];
$apellido2 = $_POST['apellido2'];
$id_rol = (int)$_POST['id_rol'];
$email = $_POST['email'];
try {
    $sql = "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIO_TB_MODIFICAR_SP(
        :p_cedula, :p_nombre, :p_apellido1, :p_apellido2, 
        :p_email, :p_id_rol); END;";
    
    $stmt = oci_parse($conn, $sql);
    
    oci_bind_by_name($stmt, ':p_cedula', $cedula);
    oci_bind_by_name($stmt, ':p_nombre', $nombre);
    oci_bind_by_name($stmt, ':p_apellido1', $apellido1);
    oci_bind_by_name($stmt, ':p_apellido2', $apellido2);
    oci_bind_by_name($stmt, ':p_email', $email);
    oci_bind_by_name($stmt, ':p_id_rol', $id_rol);
    if (!oci_execute($stmt)) {
        $e = oci_error($stmt);
        throw new Exception($e['message']);
    }

    echo json_encode(["success" => true, "message" => "Usuario actualizado correctamente."]);
} catch (Exception $e) {
    echo json_encode(["success" => false, "message" => $e->getMessage()]);
}

?>
