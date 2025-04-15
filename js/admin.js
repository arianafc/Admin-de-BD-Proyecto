document.addEventListener("DOMContentLoaded", function () {

    //AGREGAR ADMINISTRADOR
    $(document).on('click', '#btnAgregarAdmin', function(){
        console.log('hola');
        Swal.fire({
            title: 'Registrar Administrador',
            html: `
                <input type="text" id="cedulaAdmin" class="swal2-input" placeholder="ID Empleado">
                <input type="text" id="nombreAdmin" class="swal2-input" placeholder="Nombre">
                <input type="text" id="apellido1Admin" class="swal2-input" placeholder="Primer Apellido">
                <input type="text" id="apellido2Admin" class="swal2-input" placeholder="Segundo Apellido">
                <input type="email" id="emailAdmin" class="swal2-input" placeholder="Email">
                <input type="password" id="contrasenaAdmin" class="swal2-input" placeholder="Contraseña">
                <input type="password" id="confirmarAdmin" class="swal2-input" placeholder="Confirmar Contraseña">
            `,
            confirmButtonText: 'Registrar',
            showCancelButton: true,
            preConfirm: () => {
                const cedula = document.getElementById("cedulaAdmin").value.trim();
                const nombre = document.getElementById("nombreAdmin").value.trim();
                const apellido1 = document.getElementById("apellido1Admin").value.trim();
                const apellido2 = document.getElementById("apellido2Admin").value.trim();
                const contrasena = document.getElementById("contrasenaAdmin").value;
                const confirmar = document.getElementById("confirmarAdmin").value;
                const email = document.getElementById("emailAdmin").value.toLowerCase();

                if (!cedula || !nombre || !apellido1 || !apellido2 || !contrasena || !confirmar || !email) {
                    Swal.showValidationMessage("Todos los campos son obligatorios.");
                    return false;
                }


                if (contrasena.length < 8) {
                    Swal.showValidationMessage("La contraseña debe tener al menos 8 caracteres.");
                    return false;
                }

                if (contrasena !== confirmar) {
                    Swal.showValidationMessage("Las contraseñas no coinciden.");
                    return false;
                }



                return {
                    cedula,
                    nombre,
                    apellido1,
                    apellido2,
                    contrasena,
                    email
                };
            }
        }).then(result => {
            if (result.isConfirmed && result.value) {
                const { cedula, nombre, apellido1, apellido2, contrasena, email } = result.value;

                fetch("./data/get_registro.php", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: new URLSearchParams({
                        cedula: cedula,
                        nombre: nombre,
                        apellido1: apellido1,
                        apellido2: apellido2,
                        contrasena: contrasena,
                        rol: 2,
                        email: email
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Registro exitoso",
                            text: data.usuario
                                ? `Este es el usuario: ${data.usuario}`
                                : "Administrador registrado correctamente."
                        }).then(() => location.reload());
                    } else {
                        Swal.fire("Error", data.message || "Hubo un problema al registrar.", "error");
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    Swal.fire("Error", "Error de conexión al registrar.", "error");
                });
            }
        });
    });


    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //MEMBRESIAS DASHBOARD

        $(document).on("click", "#btnAgregarMembresia", function () {
            Swal.fire({
                title: "Agregar Membresía",
                html: `
                    <input type="text" id="nombreMembresia" class="swal2-input" placeholder="Nombre">
                    <input type="number" id="costoMembresia" class="swal2-input" placeholder="Costo">
                    <input type="number" id="duracionMembresia" class="swal2-input" placeholder="Duración (días)">
                    <input type="text" id="descripcionMembresia" class="swal2-input" placeholder="Descripción">
                    <input type="number" id="numeroMembresia" class="swal2-input" placeholder="N° de Invitados">
                `,
                showCancelButton: true,
                confirmButtonText: "Registrar",
                preConfirm: () => {
                    const nombre = document.getElementById("nombreMembresia").value.trim();
                    const costo = document.getElementById("costoMembresia").value.trim();
                    const duracion = document.getElementById("duracionMembresia").value.trim();
                    const descripcion = document.getElementById("descripcionMembresia").value.trim();
                    const numero = document.getElementById("numeroMembresia").value.trim();
        
                    if (!nombre || !costo || !duracion || !descripcion || !numero) {
                        Swal.showValidationMessage("Todos los campos son obligatorios.");
                        return false;
                    }
        
                    return { nombre, costo, duracion, descripcion, numero };
                }
            }).then(result => {
                if (result.isConfirmed) {
                    const datos = result.value;
        
                    $.post("./data/accionesMembresias.php", {
                        action: "crear",
                        nombre: datos.nombre,
                        costo: datos.costo,
                        duracion: datos.duracion,
                        descripcion: datos.descripcion,
                        numero: datos.numero
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













        $(document).on("click", "#btnEliminarMembresia", function () {
            const id = $(this).data("id");
        
            Swal.fire({
                title: "¿Estás seguro?",
                text: "Esta acción desactivará la membresía.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#d33",
                cancelButtonColor: "#3085d6",
                confirmButtonText: "Sí, desactivar",
                cancelButtonText: "Cancelar"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.post("./data/accionesMembresias.php", {
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
        


        $(document).on("click", "#btnModificarMembresia", function () {
            const id = $(this).data("id");
           
        
            fetch("./data/getMembresia.php", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ id: id })
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    Swal.fire("Error", data.error, "error");
                    return;
                }
        
                const m = data[0]; // Tomamos el primer registro del cursor
        
                Swal.fire({
                    title: "Modificar Membresía",
                    html: `
                        <input type="text" id="nombre" class="swal2-input" placeholder="Nombre" value="${m.NOMBRE || ''}">
                        <input type="number" id="costo" class="swal2-input" placeholder="Costo" value="${m.COSTO || 0}">
                        <input type="number" id="duracion" class="swal2-input" placeholder="Duración (días)" value="${m.DURACION_DIAS || 0}">
                        <input type="text" id="descripcion" class="swal2-input" placeholder="Descripción" value="${m.DESCRIPCION || ''}">
                        <input type="number" id="numero" class="swal2-input" placeholder="Número de Invitados" value="${m.NUM_INVITADOS || 0}">
                    `,
                    confirmButtonText: "Guardar cambios",
                    showCancelButton: true,
                    preConfirm: () => {
                        const nombre = document.getElementById("nombre").value.trim();
                        const costo = document.getElementById("costo").value;
                        const duracion = document.getElementById("duracion").value;
                        const descripcion = document.getElementById("descripcion").value.trim();
                        const numero = document.getElementById("numero").value;
        
                        if (!nombre || !costo || !duracion || !descripcion || !numero) {
                            Swal.showValidationMessage("Todos los campos son obligatorios.");
                            return false;
                        }
        
                        return { id, nombre, costo, duracion, descripcion, numero };
                    }
                }).then(result => {
                    if (result.isConfirmed && result.value) {
                        const { id, nombre, costo, duracion, descripcion, numero } = result.value;
                        console.log({ nombre, descripcion, costo, duracion, numero });
                        $.post("./data/accionesMembresias.php", {
                            action: "modificar",
                            id: id,
                            nombre: nombre,
                            costo: costo,
                            duracion: duracion,
                            descripcion: descripcion,
                            numero: numero
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
                Swal.fire("Error", "No se pudo obtener la membresía.", "error");
            });
        });
        


        fetch('./data/accionesMembresias.php', {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({ action: "obtener_beneficios" })
        })
        .then(response => response.json())
        .then(data => {
            if (!data.success) {
                console.error("Error al obtener beneficios:", data.message);
                return;
            }
    
            const tabla = document.getElementById("tablaBeneficiosDisponibles");
            tabla.innerHTML = ""; // Limpiar la tabla primero
    
            data.data.forEach(beneficio => {
                const fila = document.createElement("tr");
    
                fila.innerHTML = `
                    <td>${beneficio.DESCRIPCION}</td>
                    <td>
                        <button class="btn btn-sm btn-success me-1" id="agregarBeneficio" data-id="${beneficio.ID_BENEFICIO}" >Agregar</button>
                        <button class="btn btn-sm btn-warning me-1" data-id="${beneficio.ID_BENEFICIO}" id="editarBeneficio" >Editar</button>
                        <button class="btn btn-sm btn-danger" data-id="${beneficio.ID_BENEFICIO}" id="eliminarBeneficio">Eliminar</button>
                    </td>
                `;
    
                tabla.appendChild(fila);
            });
        })
        .catch(error => {
            console.error("Error al cargar los beneficios:", error);
        });


        function cargarBeneficiosMembresias() {
            $.post('./data/accionesMembresias.php', { action: 'listar_beneficios_membresias' }, function(response) {
                if (response.success) {
                    const tbody = $('#tablaBeneficiosMembresias');
                    tbody.empty();
        
                    response.data.forEach(item => {
                        const row = `
                            <tr>
                                <td>${item.NOMBRE}</td>
                                <td>${item.DESCRIPCION}</td>
                                <td>
                                    <button class="btn btn-danger btn-sm eliminar-beneficio"
                                        data-id="${item.ID_BENEFICIO_MEMBRESIAS}">
                                        Eliminar
                                    </button>
                                </td>
                            </tr>`;
                        tbody.append(row);
                    });
                } else {
                    Swal.fire("Error", response.message, "error");
                }
            }, 'json');
        }


        cargarBeneficiosMembresias();


        $(document).on('click', '.eliminar-beneficio', function () {
            const id = $(this).data('id');
        
            Swal.fire({
                title: "¿Estás seguro?",
                text: "Este beneficio será eliminado de la membresía.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonText: "Sí, eliminar",
                cancelButtonText: "Cancelar"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.post('./data/accionesMembresias.php', {
                        action: 'eliminar_beneficio_asignado',
                        id: id
                    }, function (response) {
                        if (response.success) {
                            Swal.fire("Eliminado", response.message, "success");
                            cargarBeneficiosMembresias(); // refresca la tabla
                        } else {
                            Swal.fire("Error", response.message, "error");
                        }
                    }, 'json');
                }
            });
        });
        


        $(document).on('click', '#agregarBeneficio', function () {
            const idBeneficio = $(this).data('id');
        
            $.post('./data/accionesMembresias.php', { action: 'obtener_membresias' }, function (response) {
                if (!response.success) {
                    Swal.fire("Error", "No se pudo cargar las membresías.", "error");
                    return;
                }
        
                const opciones = response.data.map(m => `<option value="${m.ID_TIPO_MEMBRESIA}">${m.NOMBRE}</option>`).join('');
        
                Swal.fire({
                    title: 'Asignar beneficio',
                    html:
                        `<label>Selecciona una membresía:</label>
                         <select id="selectMembresia" class="swal2-input">
                            ${opciones}
                         </select>`,
                    showCancelButton: true,
                    confirmButtonText: 'Asignar',
                    cancelButtonText: 'Cancelar',
                    preConfirm: () => {
                        const idMembresia = document.getElementById('selectMembresia').value;
                        if (!idMembresia) {
                            Swal.showValidationMessage("Debes seleccionar una membresía");
                        }
                        return idMembresia;
                    }
                }).then(result => {
                    if (result.isConfirmed) {
                        const idMembresia = result.value;
        
                        $.post('./data/accionesMembresias.php', {
                            action: 'asociar_beneficio_membresia',
                            id_beneficio: idBeneficio,
                            id_membresia: idMembresia
                        }, function (res) {
                            if (res.success) {
                                Swal.fire("Agregado", res.message, "success");
                                cargarBeneficiosMembresias(); // opcional
                            } else {
                                Swal.fire("Error", res.message, "error");
                            }
                        }, 'json');
                    }
                });
            }, 'json');
        });
        

        $(document).on('click', '#eliminarBeneficio', function () {
            const idBeneficio = $(this).data('id');
        
            Swal.fire({
                title: '¿Eliminar beneficio?',
                text: "Esta acción también lo inactivará de la tabla principal.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.post('./data/accionesMembresias.php', {
                        action: 'eliminar_beneficio',
                        id_beneficio: idBeneficio
                    }, function (res) {
                        if (res.success) {
                            Swal.fire('Eliminado', res.message, 'success');
                            cargarBeneficios(); // Puedes refrescar tu tabla aquí
                            location.reload();
                        } else {
                            Swal.fire('Error', res.message, 'error');
                        }
                    }, 'json');
                }
            });
        });
        



        $(document).on('click', '#editarBeneficio', function () {
            const idBeneficio = $(this).data('id');
            const descripcionActual = $(this).data('descripcion');
        
            Swal.fire({
                title: 'Editar Beneficio',
                input: 'text',
                inputLabel: 'Nueva descripción',
                inputValue: descripcionActual,
                showCancelButton: true,
                confirmButtonText: 'Guardar',
                cancelButtonText: 'Cancelar',
                inputValidator: (value) => {
                    if (!value) return 'Debes ingresar una descripción válida';
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    const nuevaDescripcion = result.value;
        
                    $.post('./data/accionesMembresias.php', {
                        action: 'editar_beneficio',
                        id_beneficio: idBeneficio,
                        descripcion: nuevaDescripcion
                    }, function (res) {
                        if (res.success) {
                            Swal.fire('Actualizado', res.message, 'success');
                            cargarBeneficios(); // actualiza la tabla si lo necesitas
                        } else {
                            Swal.fire('Error', res.message, 'error');
                        }
                    }, 'json');
                }
            });
        });
        

        $('#btnAgregarNuevoBeneficio').on('click', function () {
            Swal.fire({
                title: 'Agregar Beneficio',
                input: 'text',
                inputLabel: 'Descripción del beneficio',
                inputPlaceholder: 'Ej: Acceso a piscina',
                showCancelButton: true,
                confirmButtonText: 'Agregar',
                cancelButtonText: 'Cancelar',
                inputValidator: (value) => {
                    if (!value) return 'La descripción no puede estar vacía';
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    const descripcion = result.value;
        
                    $.post('./data/accionesMembresias.php', {
                        action: 'agregar_beneficio',
                        descripcion: descripcion
                    }, function (res) {
                        if (res.success) {
                            Swal.fire('Agregado', res.message, 'success');
                            cargarBeneficios();
                        } else {
                            Swal.fire('Error', res.message, 'error');
                        }
                    }, 'json');
                }
            });
        });
        
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////// RESERVAS



function cargarReservas() {
    $.post('./data/accionesInstalaciones.php', { action: 'getReservas' }, function(response) {
        if (response.success) {
            const tabla = $('#tablaReservas');
            tabla.empty();

            const hoy = new Date();
            hoy.setHours(0, 0, 0, 0); // Para comparar solo la fecha

            response.data.forEach(reserva => {
                const nombreCompleto = `${reserva.NOMBRE_USUARIO} ${reserva.APELLIDO1_USUARIO} ${reserva.APELLIDO2_USUARIO}`;

                const fechaInicio = new Date(reserva.FECHA_INICIO); 
                fechaInicio.setHours(0, 0, 0, 0); // Igualar formato

                let botonEliminar = '';
                if (fechaInicio >= hoy) {
                    botonEliminar = `
                        <td>
                            <button class="btn btn-danger btn-sm eliminar-reserva" id="cancelarReserva" data-id="${reserva.ID_RESERVA}">
                                Eliminar
                            </button>
                        </td>`;
                } else {
                    botonEliminar = `<td></td>`; // O podrías ocultarlo o poner algo como "No disponible"
                }

                const fila = `
                    <tr>
                        <td>${reserva.ID_RESERVA}</td>
                        <td>${reserva.CEDULA}</td>
                        <td>${nombreCompleto}</td>
                        <td>${reserva.NOMBRE}</td>
                        <td>${reserva.FECHA_INICIO}</td>
                        <td>${reserva.HORA_INICIO}</td>
                        <td>${reserva.FECHA_FIN}</td>
                        <td>${reserva.HORA_FIN}</td>
                        <td>${reserva.NUMERO_PERSONAS}</td>
                        <td>${reserva.ESTADO}</td>
                        ${botonEliminar}
                    </tr>`;
                tabla.append(fila);
            });
        } else {
            Swal.fire("Error", response.message, "error");
        }
    }, 'json')
    .fail(function(jqXHR, textStatus, errorThrown) {
        console.error('Error al cargar reservas:', textStatus, errorThrown);
        Swal.fire("Error", "No se pudieron cargar las reservas.", "error");
    });
}



cargarReservas();

$(document).on('click', '#cancelarReserva', function () {
    const idReserva = $(this).data('id');

    Swal.fire({
        title: "¿Estás seguro?",
        text: "Esta acción cancelará la reserva.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "Sí, cancelar",
        cancelButtonText: "No"
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: './data/accionesInstalaciones.php',
                method: 'POST',
                contentType: 'application/json',
                data: JSON.stringify({
                    action: 'cancelar_reserva',
                    id_reserva: idReserva
                }),
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        Swal.fire({
                            title: "Reserva cancelada",
                            text: "Se debe contactar al cliente para la devolución del dinero.",
                            icon: "success"
                        });
                        cargarReservas(); // Recarga la tabla de reservas
                    } else {
                        Swal.fire("Error", response.message, "error");
                    }
                },
                error: function (xhr, status, error) {
                    Swal.fire("Error", "No se pudo cancelar la reserva.", "error");
                    console.error(error);
                }
            });
        }
    });
});
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//INSTALACIONES
function cargarInstalaciones() {
    $.post('./data/accionesInstalaciones.php', { action: 'listar_instalaciones' }, function(response) {
        if (response.success) {
            const tbody = $('#tablaInstalaciones');
            tbody.empty();

            response.data.forEach(instalacion => {
                const fila = `
                    <tr>
                        <td>${instalacion.NOMBRE}</td>
                        <td>₡${parseFloat(instalacion.COSTO).toLocaleString()}</td>
                        <td>${instalacion.CATEGORIA}</td>
                        <td>${instalacion.CAPACIDAD}</td>
                        <td>${instalacion.DESCRIPCION}</td>
                        <td>
                            <button class="btn btn-warning btn-sm editar-instalacion" id="btnEditarInstalacion" data-id="${instalacion.ID_INSTALACION}">
                                Editar
                            </button>
                            <button class="btn btn-danger btn-sm eliminar-instalacion" id="btnEliminarInstalacion" data-id="${instalacion.ID_INSTALACION}">
                                Eliminar
                            </button>
                        </td>
                    </tr>`;
                tbody.append(fila);
            });
        } else {
            Swal.fire("Error", response.message, "error");
        }
    }, 'json');
}

cargarInstalaciones();

function cargarTiposInstalacion() {
    $.post('./data/accionesInstalaciones.php', { action: 'listarTipos' }, function(response) {
        if (response.success) {
            const tbody = $('#tablaTipos');
            tbody.empty();

            response.data.forEach(tipo => {
                const fila = `
                    <tr>
                        <td>${tipo.DESCRIPCION}</td>
                        <td>${tipo.ESTADO}</td>
                        <td>
                            <button class="btn btn-warning btn-sm editar-categoria" id="btnEditarCategoria" data-id="${tipo.ID_TIPO_INSTALACION}">
                                Editar
                            </button>
                            <button class="btn btn-danger btn-sm eliminar-categoria" id="btnEliminarCategoria" data-id="${tipo.ID_TIPO_INSTALACION}">
                                Eliminar
                            </button>
                        </td>
                    </tr>`;
                tbody.append(fila);
            });
        } else {
            Swal.fire("Error", response.message, "error");
        }
    }, 'json');
}

cargarTiposInstalacion();


function mostrarFormularioAgregarInstalacion(categorias) {
    let opciones = categorias.map(c => `<option value="${c.ID_TIPO_INSTALACION}">${c.DESCRIPCION}</option>`).join('');

    Swal.fire({
        title: 'Agregar Instalación',
        html: `
            <input type="text" id="nombreInstalacion" class="swal2-input" placeholder="Nombre">
            <input type="number" id="costoInstalacion" class="swal2-input" placeholder="Costo">
            <input type="number" id="capacidadInstalacion" class="swal2-input" placeholder="Capacidad">
            <select id="categoriaInstalacion" class="swal2-input">
                <option value="" disabled selected>Selecciona una categoría</option>
                ${opciones}
            </select>
        `,
        confirmButtonText: 'Agregar',
        showCancelButton: true,
        focusConfirm: false,
        preConfirm: () => {
            const nombre = $('#nombreInstalacion').val().trim();
            const costo = $('#costoInstalacion').val();
            const capacidad = $('#capacidadInstalacion').val();
            const idTipo = $('#categoriaInstalacion').val();

            if (!nombre || !costo || !capacidad || !idTipo) {
                Swal.showValidationMessage('Todos los campos son obligatorios');
                return false;
            }

            return { nombre, costo, capacidad, id_tipo: idTipo };
        }
    }).then(result => {
        if (result.isConfirmed) {
            agregarInstalacion(result.value);
        }
    });
}




$('#btnAgregarInstalacion').on('click', function() {
    $.post('./data/accionesInstalaciones.php', { action: 'listarTiposActivos' }, function(response) {
        if (response.success) {
            mostrarFormularioAgregarInstalacion(response.data);
        } else {
            Swal.fire("Error", response.message, "error");
        }
    }, 'json');
});



function agregarInstalacion(data) {
    $.post('./data/accionesInstalaciones.php', {
        action: 'agregar_instalacion',
        nombre: data.nombre,
        costo: data.costo,
        capacidad: data.capacidad,
        id_tipo: data.id_tipo
    }, function(response) {
        if (response.success) {
            Swal.fire("Éxito", response.message, "success");
            cargarInstalaciones(); // Recarga la tabla si quieres
        } else {
            Swal.fire("Error", response.message, "error");
        }
    }, 'json');
}


$('#btnAgregarCategoría').on('click', function () {
    Swal.fire({
        title: 'Agregar Categoría',
        html: `
            <input type="text" id="nombreCategoria" class="swal2-input" placeholder="Nombre de la categoría">
        `,
        confirmButtonText: 'Agregar',
        showCancelButton: true,
        focusConfirm: false,
        preConfirm: () => {
            const nombre = $('#nombreCategoria').val().trim();
            if (!nombre) {
                Swal.showValidationMessage('Debes ingresar un nombre');
                return false;
            }
            return { nombre };
        }
    }).then(result => {
        if (result.isConfirmed) {
            agregarCategoria(result.value.nombre);
        }
    });
});

function agregarCategoria(nombre) {
    $.post('./data/accionesInstalaciones.php', {
        action: 'agregar_categoria',
        nombre: nombre
    }, function (response) {
        if (response.success) {
            Swal.fire("Éxito", response.message, "success");
            cargarCategorias(); 
        } else {
            Swal.fire("Error", response.message, "error");
        }
    }, 'json');
}


$(document).on('click', '#btnEliminarCategoria', function () {
    const idCategoria = $(this).data('id');

    Swal.fire({
        title: '¿Estás seguro?',
        text: 'Esta acción desactivará la categoría y todas sus instalaciones.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post('./data/accionesInstalaciones.php', {
                action: 'eliminar_categoria',
                id: idCategoria
            }, function (response) {
                if (response.success) {
                    Swal.fire('Eliminado', response.message, 'success');
                    cargarCategorias(); 
                    location.reload();
                } else {
                    Swal.fire('Error', response.message, 'error');
                }
            }, 'json');
        }
    });
});

$(document).on('click', '#btnEliminarInstalacion', function () {
    const idCategoria = $(this).data('id');

    Swal.fire({
        title: '¿Estás seguro?',
        text: 'Esta acción desactivará la categoría y todas sus instalaciones.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post('./data/accionesInstalaciones.php', {
                action: 'eliminarInstalacion',
                id: idCategoria
            }, function (response) {
                Swal.fire({
                    title: response.success ? 'Eliminado' : 'Error',
                    text: response.message,
                    icon: response.success ? 'success' : 'error'
                }).then(() => {
                    if (response.success) {
                        location.reload();
                    }
                });
            }, 'json');
        }
    });
});


$(document).on('click', '#btnEditarInstalacion', function () {
    const idInstalacion = $(this).data('id');

    // Obtener datos de la instalación
    $.post('./data/accionesInstalaciones.php', { action: 'getInstalacion', id: idInstalacion }, function (instalacionData) {
        const instalacion = instalacionData[0];

        // Obtener categorías activas
        $.post('./data/accionesInstalaciones.php', { action: 'listarTiposActivos' }, function (response) {
            if (response.success && Array.isArray(response.data)) {
                mostrarFormularioEditarInstalacion(instalacion, response.data);
            } else {
                Swal.fire('Error', 'No se pudieron cargar las categorías', 'error');
            }
        }, 'json');
    }, 'json');
});

// Función para construir y mostrar el formulario
function mostrarFormularioEditarInstalacion(instalacion, categorias) {
    let opciones = categorias.map(c => `
        <option value="${c.ID_TIPO_INSTALACION}" ${c.ID_TIPO_INSTALACION == instalacion.ID_TIPO_INSTALACION ? 'selected' : ''}>
            ${c.DESCRIPCION}
        </option>`).join('');

    Swal.fire({
        title: 'Editar Instalación',
        html: `
            <input id="swal-nombre" class="swal2-input" placeholder="Nombre" value="${instalacion.NOMBRE}">
            <input id="swal-costo" type="number" class="swal2-input" placeholder="Costo" value="${instalacion.COSTO}">
            <input id="swal-capacidad" type="number" class="swal2-input" placeholder="Capacidad" value="${instalacion.CAPACIDAD}">
            <select id="swal-tipo" class="swal2-input">
                <option value="" disabled>Selecciona tipo</option>
                ${opciones}
            </select>
            <select id="swal-estado" class="swal2-input">
                <option value="1" ${instalacion.ID_ESTADO == 1 ? 'selected' : ''}>Activo</option>
                <option value="0" ${instalacion.ID_ESTADO == 0 ? 'selected' : ''}>Inactivo</option>
            </select>
        `,
        confirmButtonText: 'Guardar',
        showCancelButton: true,
        focusConfirm: false,
        preConfirm: () => {
            const nombre = $('#swal-nombre').val().trim();
            const costo = parseFloat($('#swal-costo').val());
            const capacidad = parseInt($('#swal-capacidad').val());
            const tipo = $('#swal-tipo').val();
            const id_estado = $('#swal-estado').val();

            if (!nombre || isNaN(costo) || isNaN(capacidad) || !tipo || id_estado === null) {
                Swal.showValidationMessage('Todos los campos son obligatorios');
                return false;
            }

            if (costo <= 0 || capacidad <= 0) {
                Swal.showValidationMessage('Costo y capacidad deben ser mayores a cero');
                return false;
            }

            return {
                id: instalacion.ID_INSTALACION,
                nombre,
                costo,
                capacidad,
                tipo,
                id_estado
            };
        }
    }).then(result => {
        if (result.isConfirmed) {
            $.post('./data/accionesInstalaciones.php', {
                action: 'editarInstalacion',
                id: result.value.id,
                nombre: result.value.nombre,
                costo: result.value.costo,
                capacidad: result.value.capacidad,
                tipo: result.value.tipo,
                id_estado: result.value.id_estado
            }, function (response) {
                Swal.fire({
                    icon: response.success ? 'success' : 'error',
                    title: response.success ? '¡Actualizado!' : 'Error',
                    text: response.message
                }).then(() => {
                    if (response.success) {
                        location.reload();
                    }
                });
            }, 'json');
        }
    });
}




$(document).on('click', '#btnEditarCategoria', function () {
    const idCategoria = $(this).data('id');

    // Paso 1: Obtener los datos actuales de la categoría
    $.post('./data/accionesInstalaciones.php', {
        action: 'getTipoInstalacion',
        id: idCategoria
    }, function (response) {
        if (Array.isArray(response) && response.length > 0) {
            const categoria = response[0];

            // Paso 2: Mostrar formulario en modal (SweetAlert2)
            Swal.fire({
                title: 'Editar Categoría',
                html: `
                    <input id="nombreCategoria" class="swal2-input" placeholder="Nombre" value="${categoria.NOMBRE}">
                    <select id="estadoCategoria" class="swal2-input">
                        <option value="1" ${categoria.ID_ESTADO == 1 ? 'selected' : ''}>Activo</option>
                        <option value="0" ${categoria.ID_ESTADO == 0 ? 'selected' : ''}>Inactivo</option>
                    </select>
                `,
                confirmButtonText: 'Guardar cambios',
                showCancelButton: true,
                preConfirm: () => {
                    const nombre = document.getElementById('nombreCategoria').value;
                    const estado = document.getElementById('estadoCategoria').value;

                    if (!nombre) {
                        Swal.showValidationMessage('El nombre no puede estar vacío');
                        return false;
                    }

                    return { nombre, estado };
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    const { nombre, estado } = result.value;
            
                    $.post('./data/accionesInstalaciones.php', {
                        action: 'editar_categoria',
                        id: idCategoria,
                        nombre: nombre,
                        id_estado: estado
                    }, function (res) {
                        if (res.success) {
                            Swal.fire('Éxito', res.message, 'success').then(() => {
                              
                                location.reload();

                            });
                        } else {
                            Swal.fire('Error', res.message, 'error');
                        }
                    }, 'json');
                }
            });
            

        } else {
            Swal.fire('Error', 'No se pudo obtener la categoría.', 'error');
        }
    }, 'json');
});























});