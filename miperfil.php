<?php
require_once 'fragmentos.php';
session_start();

if (!isset($_SESSION['usuario'])) {
    header('Location: login.php'); 
    exit;
}

require 'data/conexion.php';

try {
    $usuario_sesion = $_SESSION['usuario']; 

    $stid = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIO_TB_GET_BY_USUARIO_SP(:usuario, :datos); END;");
    oci_bind_by_name($stid, ":usuario", $usuario_sesion);
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ":datos", $cursor, -1, OCI_B_CURSOR);

    oci_execute($stid);
    oci_execute($cursor);

    $usuario = oci_fetch_assoc($cursor);

    if (!$usuario) {
        header('Location: login.php');
        exit;
    }

    $stid_membresia = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIO_TB_GET_MEMBRESIA_BY_USUARIO_SP(:usuario, :membresia); END;");
    oci_bind_by_name($stid_membresia, ":usuario", $usuario_sesion);
    $cursor_membresia = oci_new_cursor($conn);
    oci_bind_by_name($stid_membresia, ":membresia", $cursor_membresia, -1, OCI_B_CURSOR);

    oci_execute($stid_membresia);
    oci_execute($cursor_membresia);

    $membresia = oci_fetch_assoc($cursor_membresia);

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
    exit;
}

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/perfil.css">
    <?php incluir_css(); ?>
</head>

<body>
    <header>
        <?php incluir_navbar(); ?>
    </header>

    <div class="container-fluid profile-container">
        <div class="row">
            <div class="col-md-4 profile-info">
                <div class="card user-card">
                    <h2>Mi Perfil</h2>
                    <p><strong>Nombre Completo:</strong> <?php echo $usuario['NOMBRE'] . ' ' . $usuario['APELLIDO1'] . ' ' . $usuario['APELLIDO2']; ?></p>
                    <p><strong>Cédula:</strong> <?php echo $usuario['CEDULA']; ?></p>
                    <p><strong>Correo Electrónico:</strong> <?php echo $usuario['EMAIL']; ?></p>
                    <p><strong>Usuario:</strong> <?php echo $usuario['USUARIO']; ?></p>
                    <div class="buttons">
                        <button class="btn btn-edit"><i class="fas fa-edit"></i> Editar Perfil</button>
                        <button class="btn btn-logout"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</button>
                        <button class="btn btn-delete"><i class="fas fa-trash-alt"></i> Eliminar Cuenta</button>
                    </div>
                </div>
            </div>

            <div class="col-md-8 profile-membership">
                <div class="card membership-card">
                    <h3>Membresía</h3>
                    <?php if (!empty($membresia)): ?>
                        <table class="table">
                            <tr>
                                <th>Nombre</th>
                                <td><?php echo $membresia['NOMBRE']; ?></td>
                            </tr>
                            <tr>
                                <th>Costo</th>
                                <td><?php echo $membresia['COSTO']; ?></td>
                            </tr>
                            <tr>
                                <th>Duración (días)</th>
                                <td><?php echo $membresia['DURACION_DIAS']; ?></td>
                            </tr>
                            <tr>
                                <th>Descripción</th>
                                <td><?php echo $membresia['DESCRIPCION']; ?></td>
                            </tr>
                            <tr>
                                <th>Número de invitados</th>
                                <td><?php echo $membresia['NUM_INVITADOS']; ?></td>
                            </tr>
                            <tr>
                                <th>Estado</th>
                                <td><?php echo $membresia['ESTADO']; ?></td>
                            </tr>
                        </table>
                        <div class="cancel-btn-container">
                            <button class="btn btn-cancel-membership"><i class="fas fa-times-circle"></i> Cancelar Membresía</button>
                        </div>
                    <?php else: ?>
                        <p>No cuentas con una membresía.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <?php incluir_footer(); ?>
</body>
</html>
