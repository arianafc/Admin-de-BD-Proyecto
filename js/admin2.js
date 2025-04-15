///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//PROVEEDORES DASHBOARD

// AGREGAR PROVEEDOR
$(document).on("click", "#btnAgregarProveedor", function () {
    Swal.fire({
        title: "Agregar Proveedor",
        html: `
            <input type="text" id="nombre" class="swal2-input" placeholder="Nombre">
            <input type="text" id="telefono" class="swal2-input" placeholder="Teléfono">
            <input type="email" id="email" class="swal2-input" placeholder="Correo electrónico">
        `,
        confirmButtonText: "Guardar",
        showCancelButton: true,
        preConfirm: () => {
            const nombre = document.getElementById("nombre").value.trim();
            const telefono = document.getElementById("telefono").value.trim();
            const email = document.getElementById("email").value.trim();

            if (!nombre || !telefono || !email) {
                Swal.showValidationMessage("Todos los campos son obligatorios.");
                return false;
            }

            return { nombre, telefono, email };
        }
    }).then(result => {
        if (result.isConfirmed && result.value) {
            const { nombre, telefono, email } = result.value;

            $.post("./data/accionesProveedores.php", {
                action: "agregar",
                nombre: nombre,
                telefono: telefono,
                email: email
            }, function (response) {
                if (response.success) {
                    Swal.fire("Éxito", response.message, "success").then(() => location.reload());
                } else {
                    Swal.fire("Error", response.message, "error");
                }
            }, "json").fail(() => {
                Swal.fire("Error", "No se pudo conectar al servidor.", "error");
            });
        }
    });
});


$(document).on("click", "#btnEliminarProveedor", function () {
    const id = $(this).data("id");

    Swal.fire({
        title: "¿Estás seguro?",
        text: "Esta acción desactivará al proveedor.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Sí, desactivar",
        cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
            $.post("./data/accionesProveedores.php", {
                action: 'eliminar',
                id: id
            }, function (response) {
                if (response.success) {
                    Swal.fire("Desactivado", response.message, "success").then(() => location.reload());
                } else {
                    Swal.fire("Error", response.message, "error");
                }
            }, "json").fail(() => {
                Swal.fire("Error", "No se pudo conectar al servidor.", "error");
            });
        }
    });
});
// Evento para abrir modal de modificación
$(document).on("click", "#btnModificarProveedor", function () {
    const id = $(this).data("id");

    fetch("./data/getProveedores.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: id })
    })
    .then(response => response.json())
    .then(data => {
        if (data.error || !data[0]) {
            Swal.fire("Error", data.error || "Proveedor no encontrado", "error");
            return;
        }

        const proveedor = data[0];

        Swal.fire({
            title: "Modificar Proveedor",
            html: `
                <input type="text" id="nombre" class="swal2-input" placeholder="Nombre" value="${proveedor.NOMBRE || ''}">
                <input type="text" id="telefono" class="swal2-input" placeholder="Teléfono" value="${proveedor.TELEFONO || ''}">
                <input type="email" id="email" class="swal2-input" placeholder="Email" value="${proveedor.EMAIL || ''}">
            `,
            confirmButtonText: "Guardar cambios",
            showCancelButton: true,
            preConfirm: () => {
                const nombre = document.getElementById("nombre").value.trim();
                const telefono = document.getElementById("telefono").value.trim();
                const email = document.getElementById("email").value.trim();

                if (!nombre || !telefono || !email) {
                    Swal.showValidationMessage("Todos los campos son obligatorios.");
                    return false;
                }

                return { id, nombre, telefono, email };
            }
        }).then(result => {
            if (result.isConfirmed && result.value) {
                const { id, nombre, telefono, email } = result.value;

                $.post("./data/accionesProveedores.php", {
                    action: "modificar",
                    id: id,
                    nombre: nombre,
                    telefono: telefono,
                    email: email
                }, function (response) {
                    if (response.success) {
                        Swal.fire("Éxito", response.message, "success").then(() => location.reload());
                    } else {
                        Swal.fire("Error", response.message, "error");
                    }
                }, "json").fail(() => {
                    Swal.fire("Error", "No se pudo conectar al servidor.", "error");
                });
            }
        });
    })
    .catch(error => {
        console.error("Error:", error);
        Swal.fire("Error", "No se pudo obtener el proveedor.", "error");
    });
});

// Cargar tabla de proveedores
fetch('./data/accionesProveedores.php', {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: new URLSearchParams({ action: "listar_proveedores" })
})
.then(response => response.json())
.then(data => {
    if (!data.success) {
        console.error("Error al obtener proveedores:", data.message);
        return;
    }

    const tabla = document.getElementById("tablaProveedores");
    tabla.innerHTML = "";

    data.data.forEach(proveedor => {
        const fila = document.createElement("tr");

        fila.innerHTML = `
            <td>${proveedor.NOMBRE}</td>
            <td>${proveedor.TELEFONO}</td>
            <td>${proveedor.EMAIL}</td>
            <td>
                <button class="btn btn-sm btn-warning me-1" data-id="${proveedor.ID_PROVEEDOR}" id="btnModificarProveedor">Editar</button>
                <button class="btn btn-sm btn-danger" data-id="${proveedor.ID_PROVEEDOR}" id="btnEliminarProveedor">Eliminar</button>
            </td>
        `;

        tabla.appendChild(fila);
    });
})
.catch(error => {
    console.error("Error al cargar proveedores:", error);
});

///////////////////////////productos////////////////////////
// AGREGAR PRODUCTO
$(document).on("click", "#btnAgregarProducto", function () {
    Swal.fire({
        title: "Agregar Producto",
        html: `
            <input type="text" id="nombre" class="swal2-input" placeholder="Nombre del producto">
            <input type="number" id="costo" class="swal2-input" placeholder="Precio">
        `,
        confirmButtonText: "Guardar",
        showCancelButton: true,
        preConfirm: () => {
            const nombre = document.getElementById("nombre").value.trim();
            const costo = document.getElementById("costo").value.trim();

            if (!nombre || !costo) {
                Swal.showValidationMessage("Todos los campos son obligatorios.");
                return false;
            }

            return { nombre, costo };
        }
    }).then(result => {
        if (result.isConfirmed && result.value) {
            const { nombre, costo } = result.value;

            $.post("./data/accionesProductos.php", {
                action: "agregar",
                nombre: nombre,
                costo: costo
            }, function (response) {
                if (response.success) {
                    Swal.fire("Éxito", response.message, "success").then(() => location.reload());
                } else {
                    Swal.fire("Error", response.message, "error");
                }
            }, "json").fail(() => {
                Swal.fire("Error", "No se pudo conectar al servidor.", "error");
            });
        }
    });
});

// MODIFICAR PRODUCTO
$(document).on("click", "#btnModificarProducto", function () {
    const id = $(this).data("id");

    fetch("./data/obtenerProductos.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ id: id })
    })
    .then(response => response.json())
    .then(data => {
        if (data.error || !data[0]) {
            Swal.fire("Error", data.error || "Producto no encontrado", "error");
            return;
        }

        const producto = data[0];

        Swal.fire({
            title: "Modificar Producto",
            html: `
                <input type="text" id="nombre" class="swal2-input" placeholder="Nombre" value="${producto.NOMBRE || ''}">
                <input type="number" id="costo" class="swal2-input" placeholder="Precio" value="${producto.COSTO || ''}">
            `,
            confirmButtonText: "Guardar cambios",
            showCancelButton: true,
            preConfirm: () => {
                const nombre = document.getElementById("nombre").value.trim();
                const costo = document.getElementById("costo").value.trim();

                if (!nombre || !costo) {
                    Swal.showValidationMessage("Todos los campos son obligatorios.");
                    return false;
                }

                return { nombre, costo };
            }
        }).then(result => {
            if (result.isConfirmed && result.value) {
                const { nombre, costo } = result.value;

                $.post("./data/accionesProductos.php", {
                    action: "modificar",
                    id: id,
                    nombre: nombre,
                    costo: costo
                }, function (response) {
                    if (response.success) {
                        Swal.fire("Éxito", response.message, "success").then(() => location.reload());
                    } else {
                        Swal.fire("Error", response.message, "error");
                    }
                }, "json").fail(() => {
                    Swal.fire("Error", "No se pudo conectar al servidor.", "error");
                });
            }
        });
    });
});

// ELIMINAR PRODUCTO
$(document).on("click", "#btnEliminarProducto", function () {
    const id = $(this).data("id");

    Swal.fire({
        title: "¿Estás seguro?",
        text: "Esta acción desactivará el producto.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#3085d6",
        confirmButtonText: "Sí, desactivar",
        cancelButtonText: "Cancelar"
    }).then((result) => {
        if (result.isConfirmed) {
            $.post("./data/accionesProductos.php", {
                action: 'eliminar',
                id: id
            }, function (response) {
                if (response.success) {
                    Swal.fire("Desactivado", response.message, "success").then(() => location.reload());
                } else {
                    Swal.fire("Error", response.message, "error");
                }
            }, "json").fail(() => {
                Swal.fire("Error", "No se pudo conectar al servidor.", "error");
            });
        }
    });
});
