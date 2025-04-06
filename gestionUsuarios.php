<?php
require_once 'fragmentos.php';
session_start();

if (!isset($_SESSION['usuario'])) {
    header('Location: login.php'); 
    exit;
}

require 'data/conexion.php';

try {
    // Obtener los datos de los usuarios
    $stid = oci_parse($conn, "BEGIN FIDE_LOS_JAULES_USUARIOS_PKG.FIDE_USUARIOS_TB_GET_USERS_SP(:datos); END;");
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stid, ":datos", $cursor, -1, OCI_B_CURSOR);
    
    oci_execute($stid);
    oci_execute($cursor);

    // Inicializar un array para almacenar los usuarios
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Gestión de Usuarios</title>
    <link rel="stylesheet" href="css/dashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <?php sidebar() ?>

            <!-- Contenido -->
            <main id="content" class="col-md-10 ms-sm-auto px-md-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 titulo-Content">Gestión de Usuarios</h1>
                    <div class="profile" onclick="toggleDropdown()">
                        <span>Admin ▼</span>
                        <div class="dropdown" id="dropdownMenu">
                            <a href="#"><i class="fas fa-cog"></i> Ajustes</a>
                            <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Tabla de Usuarios -->
                <div class="card mt-4">
                    <div class="card-header">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#addUserModal">Agregar Usuario</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
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
                                            <a href="#" class="btn btn-warning" data-toggle="modal" data-target="#editUserModal" onclick="editUser('<?php echo $usuario['CEDULA']; ?>', '<?php echo $usuario['NOMBRE']; ?>', '<?php echo $usuario['EMAIL']; ?>', '<?php echo $usuario['ROL']; ?>')">Editar</a>
                                            <a href="#" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este usuario?')">Eliminar</a>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal para agregar usuario -->
                <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addUserModalLabel">Agregar Usuario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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

                <!-- Modal para editar usuario -->
                <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editUserModalLabel">Editar Usuario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
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
    </script>
</body>
</html>

