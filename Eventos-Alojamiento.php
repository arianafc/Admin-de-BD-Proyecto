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
        <div class="container-fluid contenedor" id="ranchos">
            <div class="row align-items-center">
              
                <div class="col-md-6 p-0">
                    <img src="img/GYM-HOME.jpg" class="img-fluid w-100" alt="Rancho Escondido">
                </div>
                <div class="col-md-6 p-5">
                    <p>Disponemos de dos modalidades de ranchos para que podás disfrutar del Club en familia y con
                        amigos.</p>
                    <h3 class="textoRancho">Nombre Rancho</h3>
                    <p>Capacidad máxima de 30 personas.</p>
                    <p><strong>Costo de reservación:</strong>
                        Costo.
                    </p>
                    <a href="#" class="btn btn-custom">Reservar</a>
                </div>
            </div>
        </div>

        <?php incluir_footer() ?>
        </body>

</html>