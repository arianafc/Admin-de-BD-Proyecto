<?php
require_once 'fragmentos.php';
session_start();

// Verificar si el usuario está logueado
if (!isset($_SESSION['usuario'])) {
    header('Location: login.php'); 
    exit;
}

require 'data/conexion.php';

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
                    <h1 class="h2 titulo-Content">Gestión de Productos</h1>
                    <div class="profile position-relative" onclick="toggleDropdown()">
                        <span>ADMIN ▼</span>
                        <div class="dropdown position-absolute bg-white shadow border rounded mt-1 p-2 d-none" id="dropdownMenu" style="min-width: 150px;">
                            <a class="dropdown-item" href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Tabla de Productos -->
                <div class="card mt-4">
                    <div class="card-header">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductoModal">Agregar Producto</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered" id="tablaProductos">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Costo</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Aquí se cargan los productos desde PHP o JS -->
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal: Agregar Producto -->
                      
            <!-- Modal: Agregar Producto -->
<div class="modal fade" id="addProductoModal" tabindex="-1" aria-labelledby="addProductoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-primary">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="addProductoModalLabel">Agregar Producto</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <form id="formAgregarProducto" method="POST" action="guardarProducto.php">
                <div class="modal-body">

                    <div class="mb-3">
                        <label for="idProducto" class="form-label">ID del Producto</label>
                        <input type="number" class="form-control" id="idProducto" name="idProducto" placeholder="Ej: 101" required>
                    </div>

                    <div class="mb-3">
                        <label for="nombreProducto" class="form-label">Nombre del Producto</label>
                        <input type="text" class="form-control" id="nombreProducto" name="nombreProducto" placeholder="Ej: Club Sandwich" required>
                    </div>

                    <div class="mb-3">
                        <label for="costoProducto" class="form-label">Costo</label>
                        <input type="number" step="0.01" class="form-control" id="costoProducto" name="costoProducto" placeholder="Ej: 12500.00" required>
                    </div>

                    <div class="mb-3">
                        <label for="estadoProducto" class="form-label">Estado</label>
                        <select class="form-select" id="estadoProducto" name="estadoProducto" required>
                            <option selected disabled value="">Seleccione estado</option>
                            <option value="1">Activo</option>
                            <option value="2">Inactivo</option>
                        </select>
                    </div>

                    <!-- Simulación de campo Acciones (informativo) -->
                    <div class="mb-3">
                        <label class="form-label">Acciones</label>
                        <input type="text" class="form-control bg-light" value="Se agregará el producto al sistema" readonly>
                    </div>

                </div>
                <div class="modal-footer d-flex justify-content-between">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar Producto</button>
                </div>
            </form>
        </div>
    </div>
</div>


                <!-- Modal: Editar Producto -->
              <!-- Modal: Editar Producto -->
<div class="modal fade" id="editProductoModal" tabindex="-1" aria-labelledby="editProductoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-warning">
            <div class="modal-header bg-warning text-white">
                <h5 class="modal-title" id="editProductoModalLabel">Editar Producto</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Cerrar"></button>
            </div>
            <form id="formEditarProducto" method="POST" action="php/editarProducto.php">
                <div class="modal-body">
                    <input type="hidden" id="editIdProducto" name="editIdProducto">

                    <div class="mb-3">
                        <label for="editNombreProducto" class="form-label">Nombre del Producto</label>
                        <input type="text" class="form-control" id="editNombreProducto" name="editNombreProducto" required>
                    </div>

                    <div class="mb-3">
                        <label for="editCostoProducto" class="form-label">Costo</label>
                        <input type="number" step="0.01" class="form-control" id="editCostoProducto" name="editCostoProducto" required>
                    </div>

                    <div class="mb-3">
                        <label for="editEstadoProducto" class="form-label">Estado</label>
                        <select class="form-select" id="editEstadoProducto" name="editEstadoProducto" required>
                            <option value="1">Activo</option>
                            <option value="2">Inactivo</option>
                        </select>
                    </div>

                    <!-- Campo de acciones informativo -->
                    <div class="mb-3">
                        <label class="form-label">Acciones</label>
                        <input type="text" class="form-control bg-light" value="Se actualizará la información del producto" readonly>
                    </div>
                </div>

                <div class="modal-footer d-flex justify-content-between">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-warning text-white">Actualizar Producto</button>
                </div>
            </form>
        </div>
    </div>
</div>

            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function editProducto(id, nombre, costo, estado) {
            document.getElementById('editIdProducto').value = id;
            document.getElementById('editNombreProducto').value = nombre;
            document.getElementById('editCostoProducto').value = costo;
            document.getElementById('editEstadoProducto').value = estado;
        }
    </script>
</body>

</html>
