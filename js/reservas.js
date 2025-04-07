document.addEventListener("DOMContentLoaded", function () {

    let idInstalacion;

    $(document).on('click', '#btnCabana', function
        () {
            console.log('cabana');
        let tipo = 2;
        let container = document.getElementById("cabanas");
        this.classList.remove('btnReservas');
        this.classList.add('btnReservas-Activo');
        $("#btnSalones").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnRanchos").removeClass('btnReservas-Activo').addClass('btnReservas');
    
        $("#cabanas").css("display", "block");
        $("#salones, #ranchos").css("display", "none");
    
        container.innerHTML = "";
    
        $.post("./data/getInstalaciones.php", {
            tipo: tipo,
        }, function (data) {
            if (data.success) {
                data.data.forEach(instalacion => {
                    let card = ` 
                    <div class="row align-items-center">
    
                <div class="col-md-6 p-0">
                    <img src="img/GYM-HOME.jpg" class="img-fluid w-100" alt="Rancho Escondido">
                </div>
                <div class="col-md-6 p-5">
                    <p>Disponemos de dos modalidades de ranchos para que podás disfrutar del Club en familia y con
                        amigos.</p>
                    <h3 class="textoRancho">${instalacion.NOMBRE}</h3>
                    <p>Capacidad máxima de ${instalacion.CAPACIDAD} personas.</p>
                    <p><strong>Costo de reservación: </strong>
                    ${instalacion.COSTO}
                    </p>
                    <p><b>IMPORTANTE: </b>El Check-in se realiza a las 12:00 pm, y el Check-Out a las 3:00 pm</p>
                    <a href="#" class="btn btn-custom" data-id="${instalacion.ID_INSTALACION}" id="btnReservarCabana">Reservar</a>
                </div>
            </div>`;
                    container.innerHTML += card;
                }
                )
            } else {
                alert(data.message);
                container.innerHTML = "";
            }
        }, "json").fail(function () {
            alert("Error en la solicitud.");
        });
    });
    
    $(document).on('click', '#btnReservarCabana', function () {
        idInstalacion = $(this).data('id');
       mostrarFormularioReserva();
      
    });
    
    function mostrarFormularioReserva() {
        Swal.fire({
            title: 'Reserva de Cabaña',
            html: `
                <form id="formReserva">
                    <div class="swal2-input-group">
                        <div class="mb-3">
                        <label>Día de Ingreso</label>
                        <input type="date" id="fechaInicio" class="swal2-input" placeholder="Fecha Inicio" required>
                        </div>
                         <div class="mb-3">
                         <label>Día de Salida</label>
                        <input type="date" id="fechaFin" class="swal2-input" placeholder="Fecha Fin" required>
                        </div>
                         <div class="mb-3">
                        <label>Número de Personas</label>
                        <input type="number" id="personas" class="swal2-input" placeholder="Número de Personas" required min="1">
                       </div>
                    </div>
                </form>
            `,
            showCancelButton: true,
            confirmButtonText: 'Reservar',
            preConfirm: () => {
                const fechaInicio = document.getElementById('fechaInicio').value;
                const fechaFin = document.getElementById('fechaFin').value;
                const personas = document.getElementById('personas').value;
    
                if (!fechaInicio || !fechaFin || !personas) {
                    Swal.showValidationMessage('Por favor, complete todos los campos.');
                    return false;
                }
    
                if (new Date(fechaInicio) > new Date(fechaFin)) {
                    Swal.showValidationMessage('La fecha de inicio no puede ser posterior a la fecha de fin.');
                    return false;
                }
    
                return { fechaInicio, fechaFin, personas };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { fechaInicio, fechaFin, personas } = result.value;
                $.post('./data/reservas.php', {
                    fecha_inicio: fechaInicio,
                    fecha_fin: fechaFin,
                    num_personas: personas,
                    id_instalacion: idInstalacion
                }, function(response) {
                    console.log(response);
                    if (response.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Éxito",
                            text: response.message
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: response.message
                        });
                    }
                });
            }
        });
    }
    
    //--------------------------------------------------E D I T A R

    
























    
    $(document).on('click', '#btnSalones', function () {
        let tipo = 4;
        let contenedor = document.getElementById("salones");
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnRanchos").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#salones").css("display", "block");
        $("#cabanas, #ranchos").css("display", "none");
        contenedor.innerHTML = "";
        $.post("./data/getInstalaciones.php", {
            tipo: tipo,
        }, function (data) {
            if (data.success) {
                data.data.forEach(instalacion => {
                    let card = ` 
                    <div class="row align-items-center">
    
                <div class="col-md-6 p-0">
                    <img src="img/GYM-HOME.jpg" class="img-fluid w-100" alt="Rancho Escondido">
                </div>
                <div class="col-md-6 p-5">
                    <p>Disponemos de dos modalidades de ranchos para que podás disfrutar del Club en familia y con
                        amigos.</p>
                    <h3 class="textoRancho">${instalacion.NOMBRE}</h3>
                    <p>Capacidad máxima de ${instalacion.CAPACIDAD} personas.</p>
                    <p><strong>Costo de reservación: </strong>
                    ${instalacion.COSTO}
                    </p>
                    <p><b>IMPORTANTE: </b>El Check-in se realiza a las 12:00 pm, y el Check-Out a las 3:00 pm</p>
                    <a href="#" class="btn btn-custom" data-id="${instalacion.ID_INSTALACION}" id="btnReservarCabana">Reservar</a>
                </div>
            </div>`;
                    contenedor.innerHTML += card;
                }
                )
            } else {
                $("#cabanas", "#ranchos").css("display", "none");
                contenedor.innerHTML = "<h3 class='p-3'>NO HAY SALONES DISPONIBLES</h3>";
            }
        }, "json").fail(function () {
            alert("Error en la solicitud.");
        });
    
    });
    
    $(document).on('click', '#btnRanchos', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnSalones").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#ranchos").css("display", "block");
        $("#salones").css("display", "none");
        $("#cabanas").css("display", "none");
    
        let tipo = 3;
        let contenedor = document.getElementById("ranchos");
    
        contenedor.innerHTML = "";
        $.post("./data/getInstalaciones.php", {
            tipo: tipo,
        }, function (data) {
            if (data.success) {
                data.data.forEach(instalacion => {
                    let card = ` 
                    <div class="row align-items-center">
    
                <div class="col-md-6 p-0">
                    <img src="img/GYM-HOME.jpg" class="img-fluid w-100" alt="Rancho Escondido">
                </div>
                <div class="col-md-6 p-5">
                    <p>Disponemos de dos modalidades de ranchos para que podás disfrutar del Club en familia y con
                        amigos.</p>
                    <h3 class="textoRancho">${instalacion.NOMBRE}</h3>
                    <p>Capacidad máxima de ${instalacion.CAPACIDAD} personas.</p>
                    <p><strong>Costo de reservación: </strong>
                    ${instalacion.COSTO}
                    </p>
                    <p><b>IMPORTANTE: </b>El Check-in se realiza a las 12:00 pm, y el Check-Out a las 3:00 pm</p>
                    <a href="#" class="btn btn-custom" data-id="${instalacion.ID_INSTALACION}" id="btnReservarCabana">Reservar</a>
                </div>
            </div>`;
                    contenedor.innerHTML += card;
                }
                )
            } else {
    
                contenedor.innerHTML = "<h3 class='p-3'>NO HAY RANCHOS DISPONIBLES</h3>";
            }
        }, "json").fail(function () {
            alert("Error en la solicitud.");
        });
    
    });
    
    $(document).on('click', '#btnReservar', function () {
        $("#myModal").css("display", "flex");
    })
    
    // When the user clicks anywhere outside of the modal, close it
    
    $(document).on('click', '#close', function () {
        $("#myModal").css("display", "none");
        $("#modalDeportes").css("display", "none");
        $("#modalEventos").css("display", "none");
    });
    
    
    
    

    
});
    
    
    
    
    

