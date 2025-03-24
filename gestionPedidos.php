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
                        <a href="gestionProveedores.php" id="gestionProveedores">Gestión de Proveedores</a>
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
                        <button class="btn btn-primary" data-toggle="modal" data-target="#addProviderModal">Agregar Proveedor</button>
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
                                <tr>
                                    <td>1</td>
                                    <td>Proveedor A</td>
                                    <td>proveedorA@example.com</td>
                                    <td>123-456-7890</td>
                                    <td>
                                        <a href="#" class="btn btn-warning" data-toggle="modal" data-target="#editProviderModal" onclick="editProvider(1, 'Proveedor A', 'proveedorA@example.com', '123-456-7890')">Editar</a>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este proveedor?')">Eliminar</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Proveedor B</td>
                                    <td>proveedorB@example.com</td>
                                    <td>987-654-3210</td>
                                    <td>
                                        <a href="#" class="btn btn-warning" data-toggle="modal" data-target="#editProviderModal" onclick="editProvider(2, 'Proveedor B', 'proveedorB@example.com', '987-654-3210')">Editar</a>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este proveedor?')">Eliminar</a>
                                    </td>
                                </tr>
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
                                <form>
                                    <div class="mb-3">
                                        <label for="providerName" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="providerName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="providerEmail" class="form-label">Correo</label>
                                        <input type="email" class="form-control" id="providerEmail" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="providerPhone" class="form-label">Teléfono</label>
                                        <input type="text" class="form-control" id="providerPhone" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100">Guardar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para editar proveedor -->
                <div class="modal fade" id="editProviderModal" tabindex="-1" aria-labelledby="editProviderModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProviderModalLabel">Editar Proveedor</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <input type="hidden" id="editId">
                                    <div class="mb-3">
                                        <label for="editProviderName" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="editProviderName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProviderEmail" class="form-label">Correo</label>
                                        <input type="email" class="form-control" id="editProviderEmail" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProviderPhone" class="form-label">Teléfono</label>
                                        <input type="text" class="form-control" id="editProviderPhone" required>
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
        function editProvider(id, name, email, phone) {
            document.getElementById('editId').value = id;
            document.getElementById('editProviderName').value = name;
            document.getElementById('editProviderEmail').value = email;
            document.getElementById('editProviderPhone').value = phone;
        }
    </script>
</body>

</html>
