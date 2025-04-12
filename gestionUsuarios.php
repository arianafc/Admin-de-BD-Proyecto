<?php
require_once 'fragmentos.php';
session_start();

if (!isset($_SESSION['usuario'])) {
    header('Location: login.php');
    exit;
}

require 'data/conexion.php';

try {
    $stid = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIOS_TB_GET_USERS_SP(:datos); END;");
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ":datos", $cursor, -1, OCI_B_CURSOR);

    oci_execute($stid);
    oci_execute($cursor);

    $usuarios = [];
    while ($usuario = oci_fetch_assoc($cursor)) {
        $usuarios[] = $usuario;
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
    <title>Dashboard - Gestión de Usuarios</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/dashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="js/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <?php sidebar() ?>

        <main id="content" class="col-md-10 ms-sm-auto px-md-4 content">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="h2 titulo-Content">Gestión de Usuarios</h1>
                <div class="profile" onclick="toggleDropdown()">
                    <span>Admin ▼</span>
                    <div class="dropdown" id="dropdownMenu">
                        <a href="#"><i class="fas fa-cog"></i> Ajustes</a>
                        <a href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                    </div>
                </div>
            </div>

            <div class="card mt-4">
                <div class="card-header">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">Agregar Usuario</button>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Cédula</th>
                                <th>Nombre</th>
                                <th>Email</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($usuarios as $usuario): ?>
                                <tr>
                                    <td><?php echo $usuario['CEDULA']; ?></td>
                                    <td><?php echo $usuario['NOMBRE']; ?></td>
                                    <td><?php echo $usuario['EMAIL']; ?></td>
                                    <td><?php echo $usuario['ROL']; ?></td>
                                    <td>
                                        <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editUserModal"
                                            onclick="editUser('<?php echo $usuario['CEDULA']; ?>', '<?php echo $usuario['NOMBRE']; ?>', '<?php echo $usuario['EMAIL']; ?>', '<?php echo $usuario['ROL']; ?>')">
                                            Editar
                                        </button>
                                        <button class="btn btn-danger" onclick="eliminarUsuario('<?php echo $usuario['CEDULA']; ?>')">Eliminar</button>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal Agregar Usuario -->
            <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addUserModalLabel">Agregar Usuario</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="mb-3">
                                    <label for="userName" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="userName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="userEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="userEmail" required>
                                </div>
                                <div class="mb-3">
                                    <label for="userRole" class="form-label">Rol</label>
                                    <select class="form-select" id="userRole">
                                        <option value="admin">Administrador</option>
                                        <option value="user">Usuario</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Guardar</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Editar Usuario -->
            <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editUserModalLabel">Editar Usuario</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <input type="hidden" id="editId">
                                <div class="mb-3">
                                    <label for="editName" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="editName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editEmail" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="editEmail" required>
                                </div>
                                <div class="mb-3">
                                    <label for="editRole" class="form-label">Rol</label>
                                    <select class="form-select" id="editRole">
                                        <option value="admin">Administrador</option>
                                        <option value="user">Usuario</option>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Actualizar</button>
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
    function editUser(id, name, email, role) {
        document.getElementById('editId').value = id;
        document.getElementById('editName').value = name;
        document.getElementById('editEmail').value = email;
        document.getElementById('editRole').value = role;
    }

    function eliminarUsuario(cedula) {
        if (!confirm('¿Estás seguro de eliminar este usuario?')) return;

        $.ajax({
            type: 'POST',
            url: 'data/eliminar_usuario.php',
            data: { cedula: cedula },
            dataType: 'json',
            success: function(response) {
                if (response.success) {
                    alert(response.message);
                    location.reload();
                } else {
                    alert("Error: " + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert("Error de conexión: " + error);
            }
        });
    }

    function toggleDropdown() {
        document.getElementById('dropdownMenu').classList.toggle('show');
    }

    window.onclick = function(event) {
        if (!event.target.matches('.profile span')) {
            var dropdowns = document.getElementsByClassName("dropdown");
            for (var i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }
</script>
</body>
</html>
