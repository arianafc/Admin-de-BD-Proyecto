



document.addEventListener("DOMContentLoaded", function () {
    

    cargarMembresias();
    cargarEventos();
   

    let links = document.querySelectorAll(".opciones a");
    let currentUrl = window.location.pathname.split("/").pop(); // Obtiene el nombre del archivo actual

    links.forEach(link => {
        if (link.getAttribute("href") === currentUrl) {
            link.classList.add("active"); // Agrega la clase 'active' al enlace actual
        }
    });




    $(document).on('click', '#btnBasket', function
        () {

        this.classList.remove('btnReservas');
        this.classList.add('btnReservas-Activo');
        $("#btnBasket").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnVolley").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#basket").css("display", "block");
        $("#sintetica").css("display", "none");
        $("#volley").css("display", "none");

    });

    $(document).on('click', '#btnVolley', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnBasket").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnSintetica").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#volley").css("display", "block");
        $("#basket").css("display", "none");
        $("#sintetica").css("display", "none");
    });

    $(document).on('click', '#btnSintetica', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnVolley").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnBasket").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#sintetica").css("display", "block");
        $("#volley").css("display", "none");
        $("#basket").css("display", "none");
    });

    $(document).on('click', '#btnReservarDeportes', function () {
        $("#modalDeportes").css("display", "flex");
    })

    $(document).on('click', '#registrarEvento', function () {
        $("#modalEventos").css("display", "flex");
    });

    //FUNCIONES DE LOS DATOS
    //======================================================USUARIOS ====================================================================
    function cargarUsuarios() {
        $.ajax({
            url: './data/getUsuarios.php',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                console.log("Usuarios obtenidos:", response);

                let contenedor = $("#tablaUsuarios");
                contenedor.html(""); // Limpiar contenido previo

                if (!response.success || response.data.length === 0) {
                    contenedor.html(`<h3 class="text-center text-muted p-2">No hay usuarios disponibles en este momento.</h3>`);
                } else {
                    mostrarUsuarios(response.data);
                }
            },
            error: function (xhr, status, error) {
                console.error("Error al obtener usuarios: ", error);
                alert("Hubo un error al cargar los usuarios. Inténtalo nuevamente.");
            }
        });
    }

    function mostrarUsuarios(usuarios) {
        let contenedor = $("#tablaUsuarios");

        let filas = "";
        usuarios.forEach(usuario => {
            filas += `
             <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Email</th>
                                    <th>Rol</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            
                <tr>
                    <td>${usuario.CEDULA}</td>
                    <td>${usuario.NOMBRE}</td>
                    <td>${usuario.EMAIL}</td>
                    <td>${usuario.ROL}</td>
                    <td>
                        <button class="btn btn-warning" data-toggle="modal" data-target="#editUserModal" onclick="editUser(${usuario.CEDULA}, '${usuario.NOMBRE}', '${usuario.EMAIL}', '${usuario.ROL}')">Editar</button>
                        <button class="btn btn-danger" onclick="eliminarUsuario(${usuario.CEDULA})">Eliminar</button>
                    </td>
                </tr>
            `;
        });

        contenedor.html(filas);
    }




    //=================================================================EVENTOS==========================================================
    function cargarEventos() {
        fetch('./data/getEventos.php')
            .then(response => response.json())
            .then(data => {
                console.log("Eventos Obtenidos:", data);
                let contenedor = document.getElementById("container-eventos");
                contenedor.innerHTML = ""; // Limpiar contenido previo

                if (data.length === 0) {
                    console.log("No hay eventos disponibles.");
                    contenedor.innerHTML = `<h3 class="text-center text-muted p-2">No hay eventos disponibles en este momento.</h3>`;
                } else {
                    mostrarEventos(data);
                }
            })
            .catch(error => console.error("Error al obtener eventos: ", error));
    }

    function mostrarEventos(eventos) {
        let contenedor = $("#container-eventos");
        contenedor.html(""); // Limpiar antes de agregar
    
        $.post('./data/validarMembresia.php', function(data) {
            let tieneMembresia = data.success;
            let tipoMembresia = data.tipo_membresia;
        
            eventos.forEach(evento => {
                let puedeRegistrarse = tipoMembresia != null; // Todos con membresía pueden registrarse
                let puedeReservarInstalaciones = tipoMembresia != 1; // Solo si no es Pase Diario
        
                let boton = "";
                if (puedeRegistrarse) {
                    boton = `<button class="btn btnReservar-Activo" id="registrarEventos" data-id="${evento.ID_EVENTO}">Registrarme</button>`;
                } else {
                    boton = `<button class="btn btnReservar-Activo" id="registroInvitado" data-id="${evento.ID_EVENTO}">Ingresar como Invitado</button>`;
                }
        
                let card = `
                    <div class="col-sm-4 pt-2">
                        <div class="card eventosCard text-center">
                            <div class="card-body">
                                <h5 class="card-title">${evento.NOMBRE}</h5>
                                <hr>
                                <p class="card-text">${evento.DESCRIPCION}</p>
                                <p class="card-text"><strong>Fecha:</strong> ${evento.FECHA}</p>
                                <p class="card-text"><strong>Hora:</strong> ${evento.HORA}</p>
                                <p class="card-text"><strong>Cupos:</strong> ${evento.CAPACIDAD}</p>
                                <p class="card-text"><strong>Lugar:</strong> ${evento.INSTALACION}</p>
                                ${boton}
                            </div>
                        </div>
                    </div>
                `;
                contenedor.append(card);
            });
        }, 'json')
        .fail(function(error) {
            console.error('Error al validar la membresía:', error);
            alert("Hubo un error al validar la membresía.");
        });
    }
    


    $(document).on('click', '#registroInvitado', function () {
        let idEvento = $(this).data('id');
    
        Swal.fire({
            title: 'Registrar como Invitado',
            html: `
                <input id="cedulaMiembroInput" class="swal2-input" placeholder="Cédula del miembro" />
            `,
            confirmButtonText: 'Registrar',
            showCancelButton: true,
            cancelButtonText: 'Cancelar',
            preConfirm: () => {
                const cedulaMiembro = document.getElementById('cedulaMiembroInput').value.trim();
    
                if (!cedulaMiembro) {
                    Swal.showValidationMessage('Por favor, ingresa la cédula del miembro.');
                    return false;
                }
    
                return cedulaMiembro;
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const cedulaMiembro = result.value;
               
                $.post('./data/registroEvento.php', {
                    action: 'addInvitado',
                    id_evento: idEvento,
                    cedulaMiembro: cedulaMiembro
                }, function (response) {
                  
                    if (response.success) {
                        Swal.fire({
                            icon: 'success',
                            title: '¡Éxito!',
                            text: response.message,
                        });
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: response.message,
                        });
                    }
                }, 'json').fail(function (xhr) {
                    let errorMsg = 'Ocurrió un error inesperado.';
    
                    if (xhr.responseText) {
                        try {
                            const res = JSON.parse(xhr.responseText);
                            if (res.message) errorMsg = res.message;
                        } catch (e) {
                            console.warn('Respuesta no es JSON válido:', xhr.responseText);
                        }
                    }
    
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: errorMsg
                    });
                });
            }
        });
    });
    



    $(document).on('click', '#registrarEventos', function(){
        let idEvento = $(this).data('id');
        $.post('./data/registroEvento.php', {id_evento: idEvento, action: 'addMiembro'}, function(response){
            try {
                // Intentar convertir la respuesta a JSON
                const data = JSON.parse(response);
                console.log(data);  // Verifica lo que el servidor está enviando
    
                // Mostrar mensaje según el resultado
                if (data.success) {
                    Swal.fire({
                        title: "Registro de Eventos",
                        text: data.message,
                        icon: "info",
                        confirmButtonText: "Aceptar",
                        timer: 3000 
                    }).then(() => {
                        location.reload();
                    });
    
                } else {
                    Swal.fire({
                        title: "Error",
                        text: data.message,
                        icon: "error",
                        confirmButtonText: "Aceptar"
                    });
                }
            } catch (e) {
                console.error('Error al analizar la respuesta JSON:', e);
                Swal.fire({
                    title: "Error",
                    text: "Ya te encuentras registrado en este evento.",
                    icon: "info",
                    confirmButtonText: "Aceptar"
                });
            }
        });
    });
    

    document.getElementById("registrarEventos").addEventListener("click", function () {
        let id_evento = this.getAttribute("data-id"); // Obtener el ID_EVENTO del botón
        console.log("ID del evento:", id_evento);

        // Aquí puedes llamar a la función registrarEventos y pasar el ID del evento
        registrarEventos(id_evento);
    });

    function registrarEventos(id_evento) {
        let cedula = "<?php echo $_SESSION['cedula'] ?? ''; ?>"; 
        fetch('./data/registroEvento.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `cedula=${cedula}&id_evento=${id_evento}&fecha_registro=${fecha_registro}`
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("Registro exitoso");
                } else {
                    alert(data.message); // Muestra el mensaje del trigger en caso de error
                }
            })
            .catch(error => {
                console.error('Error en la solicitud:', error);
            });
    };

    $(document).on('click', '#registrarEventos', function () {
        let idEvento = $(this).data("id");
        let idInvitado = ""; // Si es null, enviamos vacío
        let fechaRegistro = new Date().toISOString().slice(0, 10); // Fecha actual (YYYY-MM-DD)
        $.post("./data/registroEvento.php", {
            id_invitado: idInvitado,
            id_evento: idEvento,
            fecha_registro: fechaRegistro
        }, function (data) {
            if (data.success) {
                alert("Muchas gracias por registrarse. Te esperamos!");
            } else {
                alert(data.message);
                $("#modalEventos").css("display", "flex");
            }
        }, "json").fail(function () {
            alert("Error en la solicitud.");
        });
    });


    //=================================================RESERVAS (SERVICIOS) ======================================================================================


   
    //============================================================================================================================================================
    //MEMBRESIAS

    function cargarMembresias() {
        fetch('./data/obtenerMembresia.php')
            .then(response => response.json())  // 🔹 Cambia a `.text()` para depura
            .then(data => {
                console.log("Membresías obtenidas:", data);
                if (data.length === 0) {
                    console.log("No hay membresías disponibles.");
                } else {
                    mostrarMembresias(data);
                }
            })
            .catch(error => console.error("Error al obtener membresías:", error));
    }

    function mostrarMembresias(membresias) {
        let contenedor = document.getElementById("contenedor-membresias");

        membresias.forEach(membresia => {
            let card = `
                <div class="col-sm-4 p-5">
                    <div class="card eventosCard text-center">
                        <div class="card-body">
                            <h5 class="card-title">${membresia.NOMBRE}</h5>
                            <hr>
                            <img class="membresiaIMG" src="img/membresia.svg">
                            <p><strong>Costo:</strong> ${membresia.COSTO}</p>
                            <p><strong>Invitados:</strong> ${membresia.NUM_INVITADOS}</p>
                            <p><strong>Duración:</strong> ${membresia.DURACION_DIAS} días</p>
                            <hr>
                            <button class="btn btnMembresia" data-id=${membresia.ID_TIPO_MEMBRESIA} id="adquirirMembresia">Adquirir Membresía</button>
                            <button class="btn btnMembresia m-1" id="verDetalleMembresia" data-id=${membresia.ID_TIPO_MEMBRESIA}>Ver detalle</button>
                        </div>
                    </div>
                </div>
            `;
            contenedor.innerHTML += card;
        });

        document.querySelectorAll("#verDetalleMembresia").forEach(boton => {
            boton.addEventListener("click", function () {
                let id = this.getAttribute("data-id");
                obtenerMembresiaPorID(id);
            });
        });
    }

    $(document).on('click', '#verDetalleMembresia', function () {
        $("#modalMembresias").css("display", "flex");
    })

    $(document).on('click', '#closeModalMembresias', function () {
        $("#modalMembresias").css("display", "none");
    })


    function obtenerMembresiaPorID(id) {
        fetch("./data/getMembresia.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ id: id })
        })
            .then(response => response.json())
            .then(data => {
                console.log("Membresía obtenida:", data);
                if (data.length > 0) {
                    // Ahora obtenemos los beneficios antes de mostrar el modal
                    obtenerBeneficiosMembresias(id, data[0]);
                } else {
                    alert("No se encontró la membresía.");
                }
            })
            .catch(error => console.error("Error al obtener la membresía:", error));
    }

    function mostrarMembresia(producto, beneficios) {
        let contenedor = document.getElementById("modalMembresias");

        if (!contenedor) {
            console.warn("⚠️ ADVERTENCIA: #modalMembresias no existe, se creará dinámicamente.");
            contenedor = document.createElement("div");
            contenedor.id = "modalMembresias";
            contenedor.classList.add("modal");
            document.body.appendChild(contenedor);
        }

        let beneficiosHTML = beneficios.length > 0
            ? beneficios.map(b => `<li>${b.DESCRIPCION}</li>`).join("")
            : "<li>No hay beneficios disponibles.</li>";

        contenedor.innerHTML = `
            <article class="modal-container">
                <header class="modal-container-header">
                    <h1 class="modal-container-title text-center">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"
                            aria-hidden="true">
                            <path fill="none" d="M0 0h24v24H0z" />
                            <path fill="currentColor"
                                d="M14 9V4H5v16h6.056c.328.417.724.785 1.18 1.085l1.39.915H3.993A.993.993 0 0 1 3 21.008V2.992C3 2.455 3.449 2 4.002 2h10.995L21 8v1h-7zm-2 2h9v5.949c0 .99-.501 1.916-1.336 2.465L16.5 21.498l-3.164-2.084A2.953 2.953 0 0 1 12 16.95V11zm2 5.949c0 .316.162.614.436.795l2.064 1.36 2.064-1.36a.954.954 0 0 0 .436-.795V13h-5v3.949z" />
                        </svg>
                        ${producto.NOMBRE}
                    </h1>
                    <button id="closeModalMembresias" class="icon-button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path fill="none" d="M0 0h24v24H0z" />
                            <path fill="currentColor"
                                d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z" />
                        </svg>
                    </button>
                </header>
                <section class="modal-container-body">
                    <p class="text-center"><strong>${producto.DESCRIPCION}</strong></p>
                    <p>1. Costo: ${producto.COSTO}</p>
                    <p>2. Tipo: Anual (${producto.DURACION_DIAS} días)</p>
                    <p>3. Invitados: ${producto.NUM_INVITADOS}</p>
                    <p>4. Beneficios:</p>
                    <ul id="contenedor-beneficios">
                        ${beneficiosHTML}
                    </ul>
                </section>
            
            </article>
        `;

        contenedor.style.display = "block";

        // Agregar evento para cerrar el modal
        document.getElementById("closeModalMembresias").addEventListener("click", () => {
            contenedor.style.display = "none";
        });
    }
    function obtenerBeneficiosMembresias(id, producto) {
        fetch("./data/beneficios.php", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ id: id })
        })
            .then(response => response.json())
            .then(beneficios => {
                console.log("Beneficios obtenidos:", beneficios);
                mostrarMembresia(producto, beneficios);
            })
            .catch(error => console.error("Error al obtener los beneficios:", error));
    }

});



























