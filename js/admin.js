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
        

});