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
    <title>Gestión de Proveedores y Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/admin2.js"></script>
    <?php incluir_css() ?>
    <style>
    .custom-scroll-table {
        max-height: 400px;
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
                    <h1 class="h2 titulo-Content">Gestión de Proveedores y Productos</h1>
                    <div class="profile position-relative" onclick="toggleDropdown()">
                        <span>ADMIN ▼</span>
                        <div class="dropdown position-absolute bg-white shadow border rounded mt-1 p-2 d-none" id="dropdownMenu" style="min-width: 150px;">
                            <a class="dropdown-item" href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Lista de Proveedores -->
                <div class="card mt-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Lista de Proveedores</h5>
                        <button id="btnAgregarProveedor" class="btnAgregarAdministrador btn mb-5">Agregar Proveedor</button>
                        <div class="table-responsive custom-scroll-table">
                            <table class="table table-bordered table-hover align-middle text-center mi-tabla-personalizada">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Teléfono</th>
                                        <th>Email</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaProveedores">
                                    <!-- Proveedores dinámicos -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <br>

                <!-- Productos -->
                <div class="row">
                    <!-- Columna izquierda: Productos Disponibles -->
                    <div class="col-md-6">
                        <h5 class="card-title mb-3">Productos Disponibles</h5>
                        <button id="btnAgregarProducto" class="btnAgregarAdministrador btn mb-5">Agregar Producto</button>
                        <div class="table-responsive custom-scroll-table">
                            <table class="table table-bordered table-hover align-middle text-center mi-tabla-personalizada">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Precio</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaProductosDisponibles">
                                    <!-- Productos dinámicos -->
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Columna derecha: Productos Asignados -->
                    <div class="col-md-6">
                        <h5 class="card-title mb-3">Productos Asignados</h5>
                        <div class="table-responsive custom-scroll-table">
                            <table class="table table-bordered table-hover align-middle text-center mi-tabla-personalizada">
                                <thead>
                                    <tr>
                                        <th>Nombre Producto</th>
                                        <th>Proveedor</th>
                                        <th>Precio</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tbody id="tablaProductosAsignados">
                                    <!-- Productos asignados dinámicos -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <script>
                    document.addEventListener("DOMContentLoaded", function() {
                        // Cargar proveedores
                        $.post("./data/getProveedores.php", function (data) {
                            const tbody = document.getElementById("tablaProveedores");
                            tbody.innerHTML = "";

                            if (data.success && Array.isArray(data.data)) {
                                data.data.forEach(p => {
                                    const tr = document.createElement("tr");
                                    tr.innerHTML = `
                                        <td>${p.NOMBRE}</td>
                                        <td>${p.TELEFONO}</td>
                                        <td>${p.EMAIL}</td>
                                        <td>
                                            <button class="btn btn-sm btn-primary" id="btnModificarProveedor" data-id="${p.ID_PROVEEDOR}">Editar</button>
                                            <button class="btn btn-sm btn-danger" id="btnEliminarProveedor" data-id="${p.ID_PROVEEDOR}">Eliminar</button>
                                        </td>
                                    `;
                                    tbody.appendChild(tr);
                                });
                            } else {
                                tbody.innerHTML = `<tr><td colspan="4">${data.message || 'Error al cargar proveedores'}</td></tr>`;
                            }
                        }, "json").fail(function () {
                            const tbody = document.getElementById("tablaProveedores");
                            tbody.innerHTML = `<tr><td colspan="4">Error al conectar con el servidor</td></tr>`;
                        });

                        // Cargar productos disponibles
                        fetch('./data/obtenerProductos.php')
                            .then(response => response.json())
                            .then(data => {
                                const tbody = document.getElementById("tablaProductosDisponibles");
                                tbody.innerHTML = "";
                                if (Array.isArray(data)) {
                                    data.forEach(p => {
                                        const tr = document.createElement("tr");
                                        tr.innerHTML = `
                                            <td>${p.NOMBRE}</td>
                                            <td>${p.COSTO}</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" id="btnModificarProducto" data-id=${p.ID_PRODUCTO}>Editar</button>
                                                <button class="btn btn-sm btn-danger" id="btnEliminarProducto" data-id=${p.ID_PRODUCTO}>Eliminar</button>
                                            </td>
                                        `;
                                        tbody.appendChild(tr);
                                    });
                                } else {
                                    tbody.innerHTML = `<tr><td colspan="4">${data.error || 'Error al cargar productos'}</td></tr>`;
                                }
                            })
                            .catch(error => {
                                console.error("Error:", error);
                                const tbody = document.getElementById("tablaProductosDisponibles");
                                tbody.innerHTML = `<tr><td colspan="4">Error al conectar con el servidor</td></tr>`;
                            });

                        // Cargar productos asignados (si es necesario)
                        fetch('./data/obtenerProductosAsignados.php')
                            .then(response => response.json())
                            .then(data => {
                                const tbody = document.getElementById("tablaProductosAsignados");
                                tbody.innerHTML = "";
                                if (Array.isArray(data)) {
                                    data.forEach(p => {
                                        const tr = document.createElement("tr");
                                        tr.innerHTML = `
                                            <td>${p.NOMBRE}</td>
                                            <td>${p.PROVEEDOR_NOMBRE}</td>
                                            <td>${p.PRECIO}</td>
                                            <td>
                                                <button class="btn btn-sm btn-primary" id="btnModificarProductoAsignado" data-id=${p.ID_PRODUCTO}>Editar</button>
                                                <button class="btn btn-sm btn-danger" id="btnEliminarProductoAsignado" data-id=${p.ID_PRODUCTO}>Eliminar</button>
                                            </td>
                                        `;
                                        tbody.appendChild(tr);
                                    });
                                } else {
                                    tbody.innerHTML = `<tr><td colspan="4">${data.error || 'Error al cargar productos asignados'}</td></tr>`;
                                }
                            })
                            .catch(error => {
                                console.error("Error:", error);
                                const tbody = document.getElementById("tablaProductosAsignados");
                                tbody.innerHTML = `<tr><td colspan="4">Error al conectar con el servidor</td></tr>`;
                            });
                    });
                </script>

            </main>
        </div>
    </div>
</body>
</html>
