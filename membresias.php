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
    <link rel="stylesheet" href="./css/membresias.css">
    <?php incluir_css() ?>
    <script src="js/java.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>


</head>

<header>
    <?php incluir_navbar() ?>
</header>
<div class="banner-container">
    <div class="banner-text"><a class="banner-text" href="nosotros.php">NUESTRAS <span>MEMBRESÍAS</span></a></div>
    <img class="banner-img" src="img/frase.png">
</div>
<div class="container-fluid p-0 containerAlojamiento">
    <h1 class="text-center p-5"></h1>
</div>
<div class="container">
<div class="row" id="contenedor-membresias">
  <!-- <div class="col-sm-4 p-5">
    <div class="card eventosCard text-center">
      <div class="card-body ">
        <h5 class="card-title" id="NombreMembresia">s</h5>
        <hr>
        <img class="membresiaIMG" src="img/membresia.svg">
        <p id="CostoMembresia"></p>
        <p id="NumInvitadosMembresia"></p>
        <p id="DuracionDias"></p>
        <hr>
        <button href="#" class="btn btnMembresia" id="adquirirMembresia">Adquirir Membresía</button>
      </div>
    </div>
  </div> -->
</div></div>



<hr>
<div class="container-fluid  p-0">
    <h2 class="text-center pt-5">DISFRUTA DE NUESTROS SERVICIOS <b>SIEMPRE</b></h2><BR>
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


   
    <?php incluir_footer() ?>
    </body>

</html>