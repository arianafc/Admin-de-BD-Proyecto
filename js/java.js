



document.addEventListener("DOMContentLoaded", function () {

    cargarMembresias();
    let links = document.querySelectorAll(".opciones a");
    let currentUrl = window.location.pathname.split("/").pop(); // Obtiene el nombre del archivo actual

    links.forEach(link => {
        if (link.getAttribute("href") === currentUrl) {
            link.classList.add("active"); // Agrega la clase 'active' al enlace actual
        }
    });



    $(document).on('click', '#btnCabana', function
        () {

        this.classList.remove('btnReservas');
        this.classList.add('btnReservas-Activo');
        $("#btnSalones").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnRanchos").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#cabanas").css("display", "block");
        $("#salones").css("display", "none");
        $("#ranchos").css("display", "none");

    });

    $(document).on('click', '#btnSalones', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnRanchos").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#salones").css("display", "block");
        $("#cabanas").css("display", "none");
        $("#ranchos").css("display", "none");
    });

    $(document).on('click', '#btnRanchos', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnSalones").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#ranchos").css("display", "block");
        $("#salones").css("display", "none");
        $("#cabanas").css("display", "none");
    });

    $(document).on('click', '#btnReservar', function () {
        $("#myModal").css("display", "flex");
    })

    // When the user clicks anywhere outside of the modal, close it

    $(document).on('click', '#close', function () {
        $("#myModal").css("display", "none");
        $("#modalDeportes").css("display", "none");
        $("#modalEventos").css("display", "none");
    })


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

    function cargarMembresias() {
        fetch('./data/obtenerMembresias.php')
            .then(response => response.text())  // 🔹 Cambia a `.text()` para depurar
            .then(text => {
                console.log("Respuesta cruda del servidor:", text); // Verifica si es JSON válido
                return JSON.parse(text);  // 🔹 Intenta convertir a JSON manualmente
            })
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
                            <button class="btn btnMembresia">Adquirir Membresía</button>
                        </div>
                    </div>
                </div>
            `;
            contenedor.innerHTML += card;
        });
    }

});
























