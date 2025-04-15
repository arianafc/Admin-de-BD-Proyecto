<?php
require_once 'fragmentos.php';
session_start();

if (!isset($_SESSION['usuario'])) {
    header('Location: login.php');
    exit;
}

require 'data/conexion.php';

try {
    $rol = 1;
    $stid = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIOS_TB_GET_USERS_SP(:datos, :rol); END;");
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ":datos", $cursor, -1, OCI_B_CURSOR);
    oci_bind_by_name($stid, ":rol", $rol);

    oci_execute($stid);
    oci_execute($cursor);

    $usuarios = [];
    while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
        foreach ($fila as $key => $value) {
            if (is_string($value)) {
                $fila[$key] = utf8_encode($value);
            }
        }
        $usuarios[] = $fila;
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
    exit;
}

try {
    $rol = 2;
    $stid = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIOS_TB_GET_USERS_SP(:datos, :rol); END;");
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ":datos", $cursor, -1, OCI_B_CURSOR);
    oci_bind_by_name($stid, ":rol", $rol);

    oci_execute($stid);
    oci_execute($cursor);

    $usuarios2 = [];
    while ($fila = oci_fetch_array($cursor, OCI_ASSOC + OCI_RETURN_NULLS)) {
        foreach ($fila as $key => $value) {
            if (is_string($value)) {
                $fila[$key] = utf8_encode($value);
            }
        }
        $usuarios2[] = $fila;
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
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/admin.js"></script>
    <?php incluir_css() ?>
    <style>
        .custom-scroll-table {
            max-height: 700px;
            /* Ajusta este valor según tu diseño */
            overflow-y: auto;
        }
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <?php sidebar(); ?>
            <!-- Contenido -->
            <main id="content" class="col-md-10 ms-sm-auto px-md-4 content">
                <div
                    class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 titulo-Content">Gestión de Reservaciones</h1>
                    <div class="profile position-relative" onclick="toggleDropdown()">
                        <span>ADMIN ▼</span>
                        <div class="dropdown position-absolute bg-white shadow border rounded mt-1 p-2 d-none"
                            id="dropdownMenu" style="min-width: 150px;">
                            <a class="dropdown-item" href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>



                <div class="card mt-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Lista de Usuarios</h5>
                        <div class="table-responsive custom-scroll-table">
                            <table class="table table-bordered table-hover align-middle text-center theadTabla">
                                <thead class="table-dark mi-color-personalizado">
                                    <tr>
                                        <th>Núm Reservación</th>
                                        <th>Cédula</th>
                                        <th>Nombre</th>
                                        <th>Instalación</th>
                                        <th>Fecha Inicio</th>
                                        <th>Hora Inicio</th>
                                        <th>Fecha Fin</th>
                                        <th>Hora Fin</th>
                                        <th>N° Personas</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaReservas">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

            
    </div>

 
</body>

</html>