<?php
require_once 'fragmentos.php';
session_start();

if (!isset($_SESSION['usuario'])) {
    header('Location: login.php');
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
            max-height: 400px;
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
                    <h1 class="h2 titulo-Content">Gestión de Instalaciones</h1>
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
                        <h5 class="card-title mb-3">Nuestras Instalaciones</h5>
                        <button id="btnAgregarInstalacion" class="btnAgregarAdministrador btn mb-5">Agregar Instalación</button>
                        <div class="table-responsive custom-scroll-table">
                            <table class="table table-bordered table-hover align-middle text-center theadTabla">
                                <thead class="table-dark mi-color-personalizado">
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Costo</th>
                                        <th>Categoría</th>
                                        <th>Capacidad</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaInstalaciones">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

                <div class="card mt-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Nuestras Categorías</h5>
                        <button id="btnAgregarCategoría" class="btnAgregarAdministrador btn mb-5">Agregar Categoría</button>
                        <div class="table-responsive custom-scroll-table">
                            <table class="table table-bordered table-hover align-middle text-center theadTabla">
                                <thead class="table-dark mi-color-personalizado">
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaTipos">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>

            
    </div>

 
</body>

</html>