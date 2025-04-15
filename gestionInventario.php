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
                    <h1 class="h2 titulo-Content">Gestión de Proveedores</h1>
                    <div class="profile position-relative" onclick="toggleDropdown()">
                        <span>ADMIN ▼</span>
                        <div class="dropdown position-absolute bg-white shadow border rounded mt-1 p-2 d-none" id="dropdownMenu" style="min-width: 150px;">
                            <a class="dropdown-item" href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Tabla de Inventario -->
                <div class="card mt-4">
                    <div class="card-header">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addInventarioModal">Agregar Inventario</button>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered" id="tablaInventario">
                            <!-- Aquí se cargan los datos del inventario -->
                        </table>
                    </div>
                </div>

                <!-- Modal para agregar inventario -->
                <div class="modal fade" id="addInventarioModal" tabindex="-1" aria-labelledby="addInventarioModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addInventarioModalLabel">Agregar Inventario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formAgregarInventario">
                                    <div class="mb-3">
                                        <label for="idInventario" class="form-label">ID Inventario</label>
                                        <input type="number" class="form-control" id="idInventario" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="cantidad" class="form-label">Cantidad</label>
                                        <input type="number" class="form-control" id="cantidad" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="idProducto" class="form-label">ID Producto</label>
                                        <input type="number" class="form-control" id="idProducto" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="cantidadMinima" class="form-label">Cantidad Mínima</label>
                                        <input type="number" class="form-control" id="cantidadMinima" required>
                                    </div>

                                    <!-- Añadir un campo oculto para enviar el parámetro requerido -->
                                    <input type="hidden" name="param" value="valor_requerido">  <!-- Reemplaza con el valor adecuado -->

                                    <button type="submit" class="btn btn-primary w-100">Guardar</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal para editar inventario -->
                <div class="modal fade" id="editInventarioModal" tabindex="-1" aria-labelledby="editInventarioModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editInventarioModalLabel">Editar Inventario</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form id="formEditarInventario">
                                    <input type="hidden" id="editIdInventario">
                                    <div class="mb-3">
                                        <label for="editIdInventarioDisplay" class="form-label">ID Inventario</label>
                                        <input type="text" class="form-control" id="editIdInventarioDisplay" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editCantidad" class="form-label">Cantidad</label>
                                        <input type="number" class="form-control" id="editCantidad" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editIdProducto" class="form-label">ID Producto</label>
                                        <input type="number" class="form-control" id="editIdProducto" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="editCantidadMinima" class="form-label">Cantidad Mínima</label>
                                        <input type="number" class="form-control" id="editCantidadMinima" required>
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
        function editInventario(idInventario, idProducto, cantidad, cantidadMinima) {
            document.getElementById('editIdInventario').value = idInventario;
            document.getElementById('editIdInventarioDisplay').value = idInventario;
            document.getElementById('editCantidad').value = cantidad;
            document.getElementById('editIdProducto').value = idProducto;
            document.getElementById('editCantidadMinima').value = cantidadMinima;
        }

        $(document).ready(function () {
            cargarInventario();
        });

        function cargarInventario() {
            $.ajax({
                url: './data/getInventario.php',
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    let contenedor = $("#tablaInventario");
                    contenedor.html("");

                    if (!response.success || response.data.length === 0) {
                        contenedor.html(`<h3 class="text-center text-muted p-2">No hay productos en el inventario.</h3>`);
                    } else {
                        mostrarInventario(response.data);
                    }
                },
                error: function () {
                    alert("Error al cargar el inventario.");
                }
            });
        }

        function mostrarInventario(inventario) {
            let contenedor = $("#tablaInventario");

            let contenido = `
                <thead>
                    <tr>
                        <th>ID Inventario</th>
                        <th>ID Producto</th>
                        <th>Cantidad</th>
                        <th>Cantidad Mínima</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>`;

            inventario.forEach(item => {
                contenido += `
                    <tr>
                        <td>${item.ID_INVENTARIO}</td>
                        <td>${item.ID_PRODUCTO}</td>
                        <td>${item.CANTIDAD}</td>
                        <td>${item.CANTIDAD_MINIMA}</td>
                        <td>
                            <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editInventarioModal" 
                                onclick="editInventario(${item.ID_INVENTARIO}, ${item.ID_PRODUCTO}, ${item.CANTIDAD}, ${item.CANTIDAD_MINIMA})">
                                Editar
                            </button>
                            <button class="btn btn-danger" onclick="eliminarInventario(${item.ID_INVENTARIO})">Eliminar</button>
                        </td>
                    </tr>`;
            });

            contenido += `</tbody>`;
            contenedor.html(contenido);
        }

        function eliminarInventario(idInventario) {
            if (confirm("¿Estás seguro de que deseas eliminar este registro de inventario?")) {
                $.ajax({
                    url: './data/deleteInventario.php',
                    type: 'POST',
                    data: { ID_INVENTARIO: idInventario },
                    success: function () {
                        alert("Registro eliminado correctamente.");
                        cargarInventario();
                    },
                    error: function () {
                        alert("Error al eliminar el registro.");
                    }
                });
            }
        }

        // Agregar Inventario
        $("#formAgregarInventario").submit(function (event) {
            event.preventDefault();  // Prevenir el envío por defecto

            var data = {
                idInventario: $("#idInventario").val(),
                cantidad: $("#cantidad").val(),
                idProducto: $("#idProducto").val(),
                cantidadMinima: $("#cantidadMinima").val(),
                param: "valor_requerido"  // Cambia este valor por el que se requiere
            };

            $.ajax({
                url: './data/addInventario.php',  // Asegúrate de tener este archivo para agregar el inventario
                type: 'POST',
                data: data,
                success: function (response) {
                    if (response.success) {
                        alert("Inventario agregado correctamente");
                        $('#addInventarioModal').modal('hide');  // Cerrar modal
                        cargarInventario();  // Recargar inventario
                    } else {
                        alert(response.message);
                    }
                },
                error: function () {
                    alert("Error al agregar el inventario.");
                }
            });
        });
    </script>
</body>

</html>
