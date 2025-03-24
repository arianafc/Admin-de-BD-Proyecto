<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Gestión de Inventario</title>
    
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
                    <h1 class="h2 titulo-Content">Gestión de Inventario</h1>
                    <div class="profile" onclick="toggleDropdown()">
                        <span>Admin ▼</span>
                        <div class="dropdown" id="dropdownMenu">
                            <a href="#"><i class="fas fa-cog"></i> Ajustes</a>
                            <a href="#"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Filtro por Categoría -->
                <div class="mb-3">
                    <button class="btn btn-outline-primary category-btn" onclick="filterCategory('todos')">Todos</button>
                    <button class="btn btn-outline-primary category-btn" onclick="filterCategory('canchaSintetica')">Cancha Sintética</button>
                    <button class="btn btn-outline-primary category-btn" onclick="filterCategory('basketball')">Basketball</button>
                    <button class="btn btn-outline-primary category-btn" onclick="filterCategory('volleyball')">Volleyball</button>
                    <button class="btn btn-outline-primary category-btn" onclick="filterCategory('gym')">Gym</button>
                    <button class="btn btn-outline-primary category-btn" onclick="filterCategory('gastronomia')">Gastronomía</button>
                    <button class="btn btn-outline-primary category-btn" onclick="filterCategory('alojamiento')">Alojamiento</button>
                </div>

                <!-- Lista de Inventarios -->
                <div id="inventoryContainer">
                    <!-- Categoría Cancha Sintética -->
                    <div class="card mb-4 category-section" id="canchaSintetica" style="display: none;">
                        <div class="card-header">
                            <h4>Cancha Sintética</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Stock</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>Pelota de Fútbol</td>
                                        <td>Pelota para fútbol en cancha sintética</td>
                                        <td>₡5,000</td>
                                        <td>20</td>
                                        <td>
                                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="editProduct(1, 'Pelota de Fútbol', 'Pelota para fútbol en cancha sintética', 5000, 20)">Editar</a>
                                            <a href="#" class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Categoría Basketball -->
                    <div class="card mb-4 category-section" id="basketball" style="display: none;">
                        <div class="card-header">
                            <h4>Basketball</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Stock</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>2</td>
                                        <td>Balón de Basketball</td>
                                        <td>Balón profesional para jugar basketball</td>
                                        <td>₡8,000</td>
                                        <td>25</td>
                                        <td>
                                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="editProduct(2, 'Balón de Basketball', 'Balón profesional para jugar basketball', 8000, 25)">Editar</a>
                                            <a href="#" class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Categoría Volleyball -->
                    <div class="card mb-4 category-section" id="volleyball" style="display: none;">
                        <div class="card-header">
                            <h4>Volleyball</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Stock</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>3</td>
                                        <td>Balón de Volleyball</td>
                                        <td>Balón profesional para jugar volleyball</td>
                                        <td>₡7,500</td>
                                        <td>15</td>
                                        <td>
                                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="editProduct(3, 'Balón de Volleyball', 'Balón profesional para jugar volleyball', 7500, 15)">Editar</a>
                                            <a href="#" class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Categoría Gym -->
                    <div class="card mb-4 category-section" id="gym" style="display: none;">
                        <div class="card-header">
                            <h4>Gym</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Stock</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>4</td>
                                        <td>Pesas</td>
                                        <td>Pesas de 5 kg para gimnasio</td>
                                        <td>₡3,000</td>
                                        <td>40</td>
                                        <td>
                                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="editProduct(4, 'Pesas', 'Pesas de 5 kg para gimnasio', 3000, 40)">Editar</a>
                                            <a href="#" class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Categoría Gastronomía -->
                    <div class="card mb-4 category-section" id="gastronomia" style="display: none;">
                        <div class="card-header">
                            <h4>Gastronomía</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Stock</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>5</td>
                                        <td>Menú Completo</td>
                                        <td>Menú completo con entrada, plato fuerte y postre</td>
                                        <td>₡15,000</td>
                                        <td>30</td>
                                        <td>
                                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="editProduct(5, 'Menú Completo', 'Menú completo con entrada, plato fuerte y postre', 15000, 30)">Editar</a>
                                            <a href="#" class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Categoría Alojamiento -->
                    <div class="card mb-4 category-section" id="alojamiento" style="display: none;">
                        <div class="card-header">
                            <h4>Alojamiento</h4>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Descripción</th>
                                        <th>Precio</th>
                                        <th>Stock</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>6</td>
                                        <td>Habitación Doble</td>
                                        <td>Habitación doble con baño privado</td>
                                        <td>₡50,000</td>
                                        <td>10</td>
                                        <td>
                                            <a href="#" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editProductModal" onclick="editProduct(6, 'Habitación Doble', 'Habitación doble con baño privado', 50000, 10)">Editar</a>
                                            <a href="#" class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Modal para Editar Producto -->
                <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editProductModalLabel">Editar Producto</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="editProductForm">
                                    <div class="mb-3">
                                        <label for="productName" class="form-label">Nombre del Producto</label>
                                        <input type="text" class="form-control" id="productName" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productDescription" class="form-label">Descripción</label>
                                        <textarea class="form-control" id="productDescription" rows="3" required></textarea>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productPrice" class="form-label">Precio (₡)</label>
                                        <input type="number" class="form-control" id="productPrice" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="productStock" class="form-label">Stock</label>
                                        <input type="number" class="form-control" id="productStock" required>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                <button type="button" class="btn btn-primary" onclick="saveProductChanges()">Guardar Cambios</button>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Bootstrap JS y dependencias -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <script>
        // Función para cambiar la visibilidad del menú desplegable
        function toggleDropdown() {
            const dropdownMenu = document.getElementById('dropdownMenu');
            dropdownMenu.style.display = dropdownMenu.style.display === 'none' ? 'block' : 'none';
        }

        // Función para filtrar inventario por categoría
        function filterCategory(category) {
            const allCategories = document.querySelectorAll('.category-section');
            allCategories.forEach(section => {
                section.style.display = (category === 'todos' || section.id === category) ? 'block' : 'none';
            });
        }

        // Función para editar producto (simulada)
        function editProduct(id, name, description, price, stock) {
            document.getElementById('productName').value = name;
            document.getElementById('productDescription').value = description;
            document.getElementById('productPrice').value = price;
            document.getElementById('productStock').value = stock;
        }

        // Función para guardar los cambios del producto (simulada)
        function saveProductChanges() {
            alert('Cambios guardados!');
        }
    </script>
</body>

</html>

