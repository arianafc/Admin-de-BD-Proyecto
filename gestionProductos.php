<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Gestión de Productos</title>
    
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
                    <h1 class="h2 titulo-Content">Gestión de Productos</h1>
                    <div class="profile" onclick="toggleDropdown()">
                        <span>Admin ▼</span>
                        <div class="dropdown" id="dropdownMenu">
                            <a href="#"><i class="fas fa-cog"></i> Ajustes</a>
                            <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Tabla de Productos -->
                <div class="card mt-4">
                    <div class="card-header">
                        <button class="btn btn-primary" data-toggle="modal" data-target="#addProductModal">Agregar Producto</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Descripción</th>
                                    <th>Categoría</th>
                                    <th>Precio</th>
                                    <th>Stock</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Balón de Basketball</td>
                                    <td>Balón de Basketball Profesional</td>
                                    <td>Basketball</td>
                                    <td>₡8.000</td>
                                    <td>25</td>
                                    <td>
                                        <a href="#" class="btn btn-warning" data-toggle="modal" data-target="#editProductModal" onclick="editProduct(1, 'Balón de Basketball Profesional', 'Balón de Basketball Profesional', 'Basketball', 8.000, 25)">Editar</a>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este producto?')">Eliminar</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Toallas de Baño</td>
                                    <td>Toallas de Baño de algodón</td>
                                    <td>Toallas</td>
                                    <td>₡15.000</td>
                                    <td>30</td>
                                    <td>
                                        <a href="#" class="btn btn-warning" data-toggle="modal" data-target="#editProductModal" onclick="editProduct(2, 'Toalla de Baño', 'Toalla de Baño de algodón', 'Toallas', 15.000, 30)">Editar</a>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este producto?')">Eliminar</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Sabanas</td>
                                    <td>Sabanas Algodón de alta calidad</td>
                                    <td>Sabanas</td>
                                    <td>₡25.000</td>
                                    <td>20</td>
                                    <td>
                                        <a href="#" class="btn btn-warning" data-toggle="modal" data-target="#editProductModal" onclick="editProduct(3, 'Sabanas', 'Sabanas Algodón de alta calidad', 'Sabanas', 25.000, 20)">Editar</a>
                                        <a href="#" class="btn btn-danger" onclick="return confirm('¿Estás seguro de eliminar este producto?')">Eliminar</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal para agregar producto -->
                <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addProductModalLabel">Agregar Producto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="mb-3">
                                        <label for="productName" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="productName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productDescription" class="form-label">Descripción</label>
                                        <input type="text" class="form-control" id="productDescription" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productCategory" class="form-label">Categoría</label>
                                        <select class="form-select" id="productCategory" required>
                                            <option value="golf">Golf</option>
                                            <option value="tenis">Tenis</option>
                                            <option value="futbol">Fútbol</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productPrice" class="form-label">Precio</label>
                                        <input type="number" class="form-control" id="productPrice" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productStock" class="form-label">Stock</label>
                                        <input type="number" class="form-control" id="productStock" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100">Guardar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para editar producto -->
                <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProductModalLabel">Editar Producto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <input type="hidden" id="editId">
                                    <div class="mb-3">
                                        <label for="editProductName" class="form-label">Nombre</label>
                                        <input type="text" class="form-control" id="editProductName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProductDescription" class="form-label">Descripción</label>
                                        <input type="text" class="form-control" id="editProductDescription" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProductCategory" class="form-label">Categoría</label>
                                        <select class="form-select" id="editProductCategory" required>
                                            <option value="golf">Golf</option>
                                            <option value="tenis">Tenis</option>
                                            <option value="futbol">Fútbol</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProductPrice" class="form-label">Precio</label>
                                        <input type="number" class="form-control" id="editProductPrice" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editProductStock" class="form-label">Stock</label>
                                        <input type="number" class="form-control" id="editProductStock" required>
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
        function editProduct(id, name, description, category, price, stock) {
            document.getElementById('editId').value = id;
            document.getElementById('editProductName').value = name;
            document.getElementById('editProductDescription').value = description;
            document.getElementById('editProductCategory').value = category;
            document.getElementById('editProductPrice').value = price;
            document.getElementById('editProductStock').value = stock;
        }
    </script>
</body>

</html>
