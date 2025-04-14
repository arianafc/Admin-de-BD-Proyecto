<?php
require_once 'fragmentos.php';
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['usuario'])) {
    header('Location: login.php'); 
    exit;
}

require 'data/conexion.php';

// Inicializar el array de proveedores
$proveedores = [];

// Obtener los datos de los proveedores usando el paquete
try {
    $stid = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_GET_PROVEEDORES_SP(:datos); END;");
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ":datos", $cursor, -1, OCI_B_CURSOR);
    
    oci_execute($stid);
    oci_execute($cursor);

    // Inicializar un array para almacenar los proveedores
    while ($proveedor = oci_fetch_assoc($cursor)) {
        $proveedores[] = $proveedor;
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
    exit;
}

// Verificar si se ha enviado el formulario para agregar un proveedor
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
    // Obtener los valores del formulario
    $nombre = $_POST['nombre'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];

    try {
        // Preparar la llamada al procedimiento para insertar el proveedor
        $stid = oci_parse($conn, 'BEGIN FIDE_LOS_JAULES_PROVEEDORES_PKG.FIDE_PROVEEDORES_TB_INSERTAR_PROVEEDOR_SP(:nombre, :email, :telefono); END;');
        
        // Vincular los parámetros
        oci_bind_by_name($stid, ':nombre', $nombre);
        oci_bind_by_name($stid, ':email', $email);
        oci_bind_by_name($stid, ':telefono', $telefono);
        
        // Ejecutar el procedimiento
        $execution = oci_execute($stid);
        
        if ($execution) {
            echo "<script>alert('Proveedor agregado exitosamente');</script>";
        } else {
            echo "<script>alert('Hubo un error al agregar el proveedor');</script>";
        }

        // Cerrar la declaración
        oci_free_statement($stid);

        // Redirigir a la misma página para recargar la lista de proveedores
        header('Location: gestionProveedores.php');
        exit;
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage();
        exit;
    }
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
    <script src="js/java.js"></script>
    <?php incluir_css() ?>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <?php sidebar(); ?>
            <!-- Contenido -->
            <main id="content" class="col-md-10 ms-sm-auto px-md-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 titulo-Content">Gestión de Proveedores</h1>
                    <div class="profile position-relative" onclick="toggleDropdown()">
                        <span>ADMIN ▼</span>
                        <div class="dropdown position-absolute bg-white shadow border rounded mt-1 p-2 d-none" id="dropdownMenu" style="min-width: 150px;">
                            <a class="dropdown-item" href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Tabla de Proveedores -->
                <div class="card mt-4">
                    <div class="card-header">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProviderModal">Agregar Proveedor</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Correo</th>
                                    <th>Teléfono</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                // Mostrar los proveedores
                                foreach ($proveedores as $proveedor) {
                                    echo "<tr>
                                        <td>" . htmlspecialchars($proveedor['ID_PROVEEDOR']) . "</td>
                                        <td>" . htmlspecialchars($proveedor['NOMBRE']) . "</td>
                                        <td>" . htmlspecialchars($proveedor['EMAIL']) . "</td>
                                        <td>" . htmlspecialchars($proveedor['TELEFONO']) . "</td>
                                        <td>
                                            <a href='#' class='btn btn-warning' data-bs-toggle='modal' data-bs-target='#editProviderModal' onclick='editProvider(" . $proveedor['ID_PROVEEDOR'] . ", \"" . htmlspecialchars($proveedor['NOMBRE']) . "\", \"" . htmlspecialchars($proveedor['EMAIL']) . "\", \"" . htmlspecialchars($proveedor['TELEFONO']) . "\")'>Editar</a>
                                            <a href='#' class='btn btn-danger' onclick='return confirm(\"¿Estás seguro de eliminar este proveedor?\")'>Eliminar</a>
                                        </td>
                                    </tr>";
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal para agregar proveedor -->
                <div class="modal fade" id="addProviderModal" tabindex="-1" aria-labelledby="addProviderModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addProviderModalLabel">Agregar Proveedor</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="gestionProveedores.php">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="email" class="form-label">Correo</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="telefono" class="form-label">Teléfono</label>
                                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                                    </div>
                                    <button type="submit" name="submit" class="btn btn-primary">Agregar Proveedor</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
