<!DOCTYPE html>
<html lang="en">
<?php
require_once 'fragmentos.php';
?>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Los Jaules - Club Campestre</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/servicios.css">
    <link rel="stylesheet" href="./css/alojamiento.css">
    <?php incluir_css() ?>
    <script src="js/java.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>


</head>

<header>
    <?php incluir_navbar() ?>
</header>
<div class="banner-container">
    <div class="banner-text"><a class="banner-text" href="nosotros.php">EVENTOS <span>Y ALOJAMIENTO</span></a></div>
    <img class="banner-img" src="img/frase.png">
</div>
<div class="container-fluid p-0 containerAlojamiento">
    <h1 class="text-center p-5"></h1>
</div>
<div class="container-fluid  p-0">
    <div class="container-fluid d-flex space-between servicios">
        <div class="card servicios-card   text-center">
            <a href="Eventos-Alojamiento.php">
                <img class="png" src="img/bienestar-relajacion.png"> </a>
            <b>Bienestar y Relajación</b>


        </div>
        <div class="card servicios-card  text-center">
            <a href="Eventos-Alojamiento.php"> <img class="png" src="img/deportivo-recreativo.png"></a>
            <b>Deportivo y Recreativo</b>
        </div>
        <div class="card servicios-card   text-center">
            <a href="Eventos-Alojamiento.php">
                <img class="png" src="img/eventos-alojamiento.png"></a>
            <b>Eventos y Alojamiento</b>
        </div>
        <div class="card servicios-card  text-center">
            <img class="png" src="img/gastronomia.png">
            <b>Gastronomía</b>
        </div>
    </div>

    <div class="bg-light   pt-5 text-center">
        <span class="text-center"><b>Cada momento tiene su espacio en Los Jaúles. Conocé nuestros ranchos de alquiler,
                los salones para eventos o nuestras acogedoras
                cabañas y creá junto a nosotros recuerdos innolvidables.</b>
        </span>
        <div class="info-container p-0">
            <div class="p-2 info-item">
                <button class="btn btnReservas" id="btnCabana">Cabañas</button>
            </div>
            <div class="separator"></div>
            <div class="info-item">

                <button class="btn btnReservas" id="btnSalones">Salones</button>
            </div>
            <div class="separator"></div>
            <div class="info-item">

                <button class="btn btnReservas" id="btnRanchos">Ranchos</button>
            </div>


        </div>
        <!-- PROGRAMAR PARA QUE ESTO SE MUESTRE SEGUN LA BD Y SEGUN LAS OPCIONES-->
        <div class="container-fluid contenedor ocultar" id="ranchos">
        </div>

        <div class="container-fluid contenedor ocultar" id="salones">
           
        </div>

        <div class="container-fluid contenedor ocultar" id="cabanas">
           
        </div>

        <div class="modal" id="myModal">
            <article class="modal-container">
                <header class="modal-container-header">
                    <h1 class="modal-container-title">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"
                            aria-hidden="true">
                            <path fill="none" d="M0 0h24v24H0z" />
                            <path fill="currentColor"
                                d="M14 9V4H5v16h6.056c.328.417.724.785 1.18 1.085l1.39.915H3.993A.993.993 0 0 1 3 21.008V2.992C3 2.455 3.449 2 4.002 2h10.995L21 8v1h-7zm-2 2h9v5.949c0 .99-.501 1.916-1.336 2.465L16.5 21.498l-3.164-2.084A2.953 2.953 0 0 1 12 16.95V11zm2 5.949c0 .316.162.614.436.795l2.064 1.36 2.064-1.36a.954.954 0 0 0 .436-.795V13h-5v3.949z" />
                        </svg>
                        Crear Reservación
                    </h1>
                    <button id="close" class="icon-button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path fill="none" d="M0 0h24v24H0z" />
                            <path fill="currentColor"
                                d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z" />
                        </svg>
                    </button>
                </header>
                <section class="modal-container-body rtf">
                    <form action="generarReserva" id="formReserva" class="form">
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="instalacionReserva"></span>
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">Fecha Inicio</span>
                            <input type="date" class="form-control" placeholder="Instalación" aria-label="Instalación"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">Fecha Fin</span>
                            <input type="date" class="form-control" placeholder="Instalación" aria-label="Instalación"
                                aria-describedby="basic-addon1">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">Hora Inicio</span>
                            <input type="time" class="form-control" placeholder="Instalación" aria-label="Instalación"
                                aria-describedby="basic-addon1" min="08:00" max="18:00">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">Hora Fin</span>
                            <input type="time" class="form-control" placeholder="Instalación" aria-label="Instalación"
                                aria-describedby="basic-addon1" min="08:00" max="18:00">
                        </div>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1">Cantidad de Personas</span>
                            <input type="number" class="form-control" placeholder="Cantidad de Personas" aria-label="Instalación"
                                aria-describedby="basic-addon1">
                        </div>
                    </form>
                </section>
                <footer class="modal-container-footer">
                    <button class="button is-ghost">Cancelar</button>
                    <button class="button is-primary" id="guardarReserva">Reservar</button>
                </footer>
            </article>
        </div>
        <?php incluir_footer() ?>
        </body>

</html>