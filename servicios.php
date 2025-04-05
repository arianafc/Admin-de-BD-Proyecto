<!DOCTYPE html>
<html lang="en">
<?php 

require_once 'fragmentos.php';
session_start();
?>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Los Jaules - Club Campestre</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/servicios.css">
    <link rel="stylesheet" href="./css/alojamiento.css">
    <?php incluir_css()?>
   
</head>

<header>
<?php incluir_navbar()?>
    </header>

    <div class="hero-section d-flex align-items-center justify-content-center text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="content-box">
                        <span class="highlight">Conviertete en Socio y</span>
                        <h2 class="text-white mt-2">disfrutá del bienestar <br> que te ofrecemos</h2>
                        <h3 class="text-white fw-bold">Los Jaúles</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid bg-light p-0">
        <h2 class="text-center servicios-titulo p-5"><b>CONOCÉ</b><br>LO QUE PODÉS DISFRUTAR</h2>
        <div class="container-fluid d-flex space-between servicios">
        <div class="card servicios-card  bg-light text-center">
            <a href="Eventos-Alojamiento.php">
        <img class="png" src="img/bienestar-relajacion.png">  </a>
        <b>Bienestar y Relajación</b>
      
        
        </div>
        <div class="card servicios-card bg-light text-center">
        <a href="Deportes.php"> <img class="png" src="img/deportivo-recreativo.png"></a>
            <b >Deportivo y Recreativo</b>
        </div>
        <div class="card servicios-card  bg-light text-center">
        <a href="Eventos-Alojamiento.php">
        <img  class="png" src="img/eventos-alojamiento.png"></a>
            <b>Eventos y Alojamiento</b>
        </div>
        <div class="card servicios-card  bg-light text-center">
        <img class="png" src="img/gastronomia.png">
            <b>Gastronomía</b>
        </div>
    </div>

    <?php incluir_footer()?>
</body>

</html>