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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/miperfil.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
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
                        <button class="btn btn-edit"><i class="fas fa-user"></i><a href="reservaciones.php">Reservaciones</a></button>
                        <button class="btn btn-logout"><i class="fas fa-sign-out-alt"></i> <a href="ordenes.php">Facturas</a></button>
                        <button class="btn btn-edit"><i class="fas fa-sign-out-alt"></i> <a href="miPerfil.php">Membresías</a></button>
                        <button class="btn btn-edit"><i class="fas fa-sign-out-alt"></i> <a href="invitados.php">Invitados</a></button>
                    </div>
                </div>
            </div>

            <div class="col-md-8 profile-membership">
    <div class="card membership-card">
        <h3>Tus Reservaciones</h3>
        <table id="tablaReservasUsuario" style="width: 100%; border-collapse: collapse; text-align: left;">
    <thead>
        <tr>
            <th>Instalación</th>
            <th>Fecha Inicio</th>
            <th>Fecha Fin</th>
            <th>Hora Inicio</th>
            <th>Hora Fin</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
       
    </tbody>
</table>
    </div>

  
</div>

        </div>
    </div>

    <?php incluir_footer(); ?>
</body>
</html>
