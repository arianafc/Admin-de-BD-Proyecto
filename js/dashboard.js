//==================GESTION PROVEEDORES=====================

$(document).ready(function () {
    cargarProveedores();
});

// Función para cargar proveedores desde el servidor
function cargarProveedores() {
    $.ajax({
        url: './data/getProveedores.php',  // Archivo PHP que obtiene los datos de proveedores
        type: 'POST',
        dataType: 'json',
        success: function (response) {
            console.log("Proveedores obtenidos:", response);

            let contenedor = $("#tablaProveedores");
            contenedor.html(""); // Limpiar contenido previo

            if (!response.success || response.data.length === 0) {
                contenedor.html(`<h3 class="text-center text-muted p-2">No hay proveedores disponibles en este momento.</h3>`);
            } else {
                mostrarProveedores(response.data);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error al obtener proveedores: ", error);
            alert("Hubo un error al cargar los proveedores. Inténtalo nuevamente.");
        }
    });
}

// Función para mostrar los proveedores en la tabla
function mostrarProveedores(proveedores) {
    let contenedor = $("#tablaProveedores");

    let contenido = `
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>`;

    proveedores.forEach(proveedor => {
        contenido += `
            <tr>
                <td>${proveedor.ID_PROVEEDOR}</td>
                <td>${proveedor.NOMBRE}</td>
                <td>${proveedor.TELEFONO}</td>
                <td>${proveedor.EMAIL ? proveedor.EMAIL : 'No registrado'}</td>
                <td>${proveedor.ESTADO}</td>
                <td>
                    <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#editProveedorModal" 
                        onclick="editProveedor(${proveedor.ID_PROVEEDOR}, '${proveedor.NOMBRE}', '${proveedor.TELEFONO}', '${proveedor.EMAIL}', ${proveedor.ID_ESTADO})">
                        Editar
                    </button>
                    <button class="btn btn-danger" onclick="eliminarProveedor(${proveedor.ID_PROVEEDOR})">Eliminar</button>
                </td>
            </tr>`;
    });

    contenido += `</tbody>`;
    contenedor.html(contenido);
}

// Función para editar un proveedor (carga datos en el modal)
function editProveedor(id, nombre, telefono, email, estado) {
    $("#editIdProveedor").val(id);
    $("#editNombreProveedor").val(nombre);
    $("#editTelefonoProveedor").val(telefono);
    $("#editEmailProveedor").val(email ? email : '');
    $("#editEstadoProveedor").val(estado);
}

// Función para eliminar un proveedor
function eliminarProveedor(id) {
    if (confirm("¿Estás seguro de que deseas eliminar este proveedor?")) {
        $.ajax({
            url: './data/deleteProveedor.php',
            type: 'POST',
            data: { ID_PROVEEDOR: id },
            success: function (response) {
                alert("Proveedor eliminado correctamente.");
                cargarProveedores();
            },
            error: function () {
                alert("Error al eliminar el proveedor.");
            }
        });
    }
}






//==================GESTION PRODUCTOS=====================









//==================GESTION INVENTARIO=====================


$(document).ready(function () {
    cargarInventario();
});

// Función para cargar inventario desde el servidor
function cargarInventario() {
    $.ajax({
        url: './data/getInventario.php',  // Archivo PHP que obtiene los datos del inventario
        type: 'POST',
        dataType: 'json',
        success: function (response) {
            console.log("Inventario obtenido:", response);

            let contenedor = $("#tablaInventario");
            contenedor.html(""); // Limpiar contenido previo

            if (!response.success || response.data.length === 0) {
                contenedor.html(`<h3 class="text-center text-muted p-2">No hay productos en el inventario.</h3>`);
            } else {
                mostrarInventario(response.data);
            }
        },
        error: function (xhr, status, error) {
            console.error("Error al obtener inventario: ", error);
            alert("Hubo un error al cargar el inventario. Inténtalo nuevamente.");
        }
    });
}

// Función para mostrar el inventario en la tabla
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

// Función para editar un inventario (carga datos en el modal)
function editInventario(idInventario, idProducto, cantidad, cantidadMinima) {
    $("#editIdInventario").val(idInventario);
    $("#editIdProducto").val(idProducto);
    $("#editCantidad").val(cantidad);
    $("#editCantidadMinima").val(cantidadMinima);
}

// Función para eliminar un registro de inventario
function eliminarInventario(idInventario) {
    if (confirm("¿Estás seguro de que deseas eliminar este registro de inventario?")) {
        $.ajax({
            url: './data/deleteInventario.php',
            type: 'POST',
            data: { ID_INVENTARIO: idInventario },
            success: function (response) {
                alert("Registro eliminado correctamente.");
                cargarInventario();
            },
            error: function () {
                alert("Error al eliminar el registro de inventario.");
            }
        });
    }
}


//==================GESTION MEMBRESIAS=====================






//==================GESTION EMPLEADOS=====================







