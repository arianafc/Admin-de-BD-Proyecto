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
        max-height: 400px; /* Ajusta este valor según tu diseño */
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
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 titulo-Content">Gestión de Usuarios</h1>
                    <div class="profile position-relative" onclick="toggleDropdown()">
                        <span>ADMIN ▼</span>
                        <div class="dropdown position-absolute bg-white shadow border rounded mt-1 p-2 d-none" id="dropdownMenu" style="min-width: 150px;">
                            <a class="dropdown-item" href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>



<div class="card mt-4 shadow-sm">
    <div class="card-body">
        <h5 class="card-title mb-3">Lista de Usuarios</h5>
        <div class="table-responsive custom-scroll-table">
            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Cédula</th>
                        <th>Nombre</th>
                        <th>Usuario</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($usuarios as $usuario): ?>
                        <tr>
                            <td><?= $usuario['CEDULA']; ?></td>
                            <td><?= $usuario['NOMBRE_COMPLETO']; ?></td>
                            <td><?= $usuario['USUARIO']; ?></td>
                            <td><?= $usuario['EMAIL']; ?></td>
                            <td><?= $usuario['ROL']; ?></td>
                            <td>
                                <button class="btn btn-sm btn-warning mb-1" data-bs-toggle="modal" data-bs-target="#editUserModal"
                                    onclick="editUser('<?= $usuario['CEDULA']; ?>', '<?= $usuario['NOMBRE']; ?>', '<?= $usuario['APELLIDO1']; ?>', '<?= $usuario['APELLIDO2']; ?>', '<?= $usuario['EMAIL']; ?>', '<?= $usuario['ROL']; ?>')">
                                    Editar
                                </button>
                                <button class="btn btn-sm btn-danger" onclick="eliminarUsuario('<?= $usuario['CEDULA']; ?>')">Eliminar</button>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="card mt-4 shadow-sm">

    <div class="card-body">
    
        <h5 class="card-title mb-3">Lista de Administradores</h5>
        <button id="btnAgregarAdmin" class="btnAgregarAdministrador btn mb-5">Agregar Administrador</button>
        <div class="table-responsive custom-scroll-table">
            <table class="table table-bordered table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Usuario</th>
                        <th>Email</th>
                        <th>Rol</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($usuarios2 as $usuario2): ?>
                        <tr>
                            <td><?= $usuario2['CEDULA']; ?></td>
                            <td><?= $usuario2['NOMBRE_COMPLETO']; ?></td>
                            <td><?= $usuario2['USUARIO']; ?></td>
                            <td><?= $usuario2['EMAIL']; ?></td>
                            <td><?= $usuario2['ROL']; ?></td>
                            <td>
                                <button class="btn btn-sm btn-warning mb-1" data-bs-toggle="modal" data-bs-target="#editUserModal"
                                    onclick="editUser('<?= $usuario2['CEDULA']; ?>', '<?= $usuario2['NOMBRE']; ?>', '<?= $usuario2['APELLIDO1']; ?>', '<?= $usuario2['APELLIDO2']; ?>', '<?= $usuario2['EMAIL']; ?>', '<?= $usuario2['ROL']; ?>')">
                                    Editar
                                </button>
                                <button class="btn btn-sm btn-danger" onclick="eliminarUsuario('<?= $usuario2['CEDULA']; ?>')">Eliminar</button>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>


            <!-- Modal Editar Usuario -->
            <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Editar Usuario</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <form id="editUserForm">
                                <input type="hidden" id="editCedula" name="cedula">
                                <div class="mb-3">
                                    <label for="editNombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="editNombre" name="nombre" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editApellido1" class="form-label">Apellido 1</label>
                                    <input type="text" class="form-control" id="editApellido1" name="apellido1" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editApellido2" class="form-label">Apellido 2</label>
                                    <input type="text" class="form-control" id="editApellido2" name="apellido2">
                                </div>
                                <div class="mb-3">
                                    <label for="editRole" class="form-label">Rol</label>
                                    <select class="form-select" id="editRole" name="id_rol">
                                        <option value="2">ADMIN</option>
                                        <option value="1">CLIENTE</option>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="editEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="editEmail" name="email" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Actualizar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
function editUser(cedula, nombre, apellido1, apellido2, email, rol) {
    $('#editCedula').val(cedula);   // Asegúrate de usar el ID correcto 'editCedula'
    $('#editNombre').val(nombre);   // Asegúrate de usar el ID correcto 'editNombre'
    $('#editApellido1').val(apellido1);
    $('#editApellido2').val(apellido2);
    $('#editEmail').val(email.toLowerCase());
    $('#editRole').val(rol === 'CLIENTE' ? 1 : 2);
}

$('#editUserForm').submit(function(e) {
    e.preventDefault();

    $.ajax({
        type: 'POST',
        url: 'data/accionesUsuario.php',
        data: {
            action: 'modificar',
            cedula: $('#editCedula').val(),
            nombre: $('#editNombre').val(),
            apellido1: $('#editApellido1').val(),
            apellido2: $('#editApellido2').val(),
            email: $('#editEmail').val(),
            id_rol: $('#editRole').val()
        },
        dataType: 'json',
        success: function(response) {
            Swal.fire({
                title: response.success ? 'Éxito' : 'Error',
                text: response.message,
                icon: response.success ? 'success' : 'error',
                confirmButtonText: 'OK'
            }).then(() => {
                if (response.success) {
                    location.reload();
                }
            });
        },
        error: function(xhr, status, error) {
            Swal.fire({
                title: 'Error de conexión',
                text: error,
                icon: 'error',
                confirmButtonText: 'OK'
            });
        }
    });
});


function eliminarUsuario(cedula) {
    if (!confirm('¿Estás seguro de eliminar este usuario?')) return;

    $.ajax({
    type: 'POST',
    url: 'data/accionesUsuario.php',
    data: { 
        action: 'eliminar',
        cedula: cedula },
    dataType: 'json',
    success: function(response) {
        Swal.fire({
            icon: response.success ? 'success' : 'error',
            title: response.success ? 'Éxito' : 'Error',
            text: response.message
        }).then(() => {
            if (response.success) location.reload();
        });
    },
    error: function(xhr, status, error) {
        Swal.fire({
            icon: 'error',
            title: 'Error de conexión',
            text: error
        });
    }
});

}
</script>
</body>
</html>
