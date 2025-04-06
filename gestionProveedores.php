<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Gestión de Proveedores</title>

    <!-- Enlace al archivo CSS externo -->
    <link rel="stylesheet" href="css/dashboard.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="js/java.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="sidebar">
                <nav id="sidebar" class="sidebar py-3 d-md-block">
                    <div class="sidebar-header text-center">
                        <h4 class="tituloAdmin">CLUB LOS JAÚLES CAMPESTRE</h4>
                    </div>
                    <hr>
                    <div class="opciones">
                        <a href="dashboard.php" id="dashboard">Dashboard</a>
                        <a href="gestionUsuarios.php" id="gestionUsuarios">Gestión de Usuarios</a>
                        <a href="gestionProveedores.php" id="gestionProveedores" class="active">Gestión de Proveedores</a>
                        <a href="gestionProductos.php" id="gestionProductos">Gestión de Productos</a>
                        <a href="gestionInventario.php" id="gestionInventario">Gestión de Inventario</a>
                        <a href="gestionCotizaciones.php" id="gestionCotizaciones">Gestión de Membresías</a>
                        <a href="gestionEmpleados.php" id="gestionEmpleados">Gestión de Empleados</a>
                    </div>
                </nav>
                <!-- Botón de menú -->
                <button class="btn btn-toggle d-md-none m-3" id="menu-toggle">☰</button>
            </div>
            <!-- Contenido -->
            <main id="content" class="col-md-10 ms-sm-auto px-md-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 titulo-Content">Gestión de Proveedores</h1>
                    <div class="profile" onclick="toggleDropdown()">
                        <span>Admin ▼</span>
                        <div class="dropdown" id="dropdownMenu">
                            <a href="#"><i class="fas fa-cog"></i> Ajustes</a>
                            <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Tabla de Proveedores -->
                <div class="card mt-4">
                    <div class="card-header">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProveedorModal">Agregar Proveedor</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered" id="tablaProveedores">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Cédula</th>
                                    <th>Teléfono</th>
                                    <th>Email</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Aquí va el contenido dinámico desde JS o PHP -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal para agregar proveedor -->
                <div class="modal fade" id="addProveedorModal" tabindex="-1" aria-labelledby="addProveedorModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addProveedorModalLabel">Agregar Proveedor</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="nombreProveedor" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="nombreProveedor" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="cedulaProveedor" class="form-label">Cédula</label>
                                        <input type="text" class="form-control" id="cedulaProveedor" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="telefonoProveedor" class="form-label">Teléfono</label>
                                        <input type="number" class="form-control" id="telefonoProveedor" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="emailProveedor" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="emailProveedor">
                                    </div>
                                    <div class="mb-3">
                                        <label for="estadoProveedor" class="form-label">Estado</label>
                                        <select class="form-select" id="estadoProveedor" required>
                                            <option value="activo">Activo</option>
                                            <option value="inactivo">Inactivo</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100">Guardar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para editar proveedor -->
                <div class="modal fade" id="editProveedorModal" tabindex="-1" aria-labelledby="editProveedorModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProveedorModalLabel">Editar Proveedor</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <input type="hidden" id="editIdProveedor">
                                    <div class="mb-3">
                                        <label for="editNombreProveedor" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="editNombreProveedor" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editCedulaProveedor" class="form-label">Cédula</label>
                                        <input type="text" class="form-control" id="editCedulaProveedor" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editTelefonoProveedor" class="form-label">Teléfono</label>
                                        <input type="number" class="form-control" id="editTelefonoProveedor" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editEmailProveedor" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="editEmailProveedor">
                                    </div>
                                    <div class="mb-3">
                                        <label for="editEstadoProveedor" class="form-label">Estado</label>
                                        <select class="form-select" id="editEstadoProveedor" required>
                                            <option value="activo">Activo</option>
                                            <option value="inactivo">Inactivo</option>
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
        function editProveedor(id, nombre, cedula, telefono, email, estado) {
            document.getElementById('editIdProveedor').value = id;
            document.getElementById('editNombreProveedor').value = nombre;
            document.getElementById('editCedulaProveedor').value = cedula;
            document.getElementById('editTelefonoProveedor').value = telefono;
            document.getElementById('editEmailProveedor').value = email;
            document.getElementById('editEstadoProveedor').value = estado;
        }
    </script>
</body>

</html>
