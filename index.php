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
    <?php incluir_css(); ?>

    <script src="js/jquery-3.7.1.min.js"></script>
</head>

<header>
<?php incluir_navbar()?>
    </header>

    <div class="hero-section d-flex align-items-center justify-content-center text-center">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <div class="content-box">
                        <span class="highlight">Bienvenidos a Club Los Jaúles</span>
                        <h2 class="text-white mt-2">disfrutá del bienestar <br> que te ofrecemos</h2>
                        <h3 class="text-white fw-bold">Los Jaúles</h3>
                        <p class="btn text-light">Conocé nuestras membresías</p>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
    <div class="banner-container">
    <div class="banner-text"><a class="banner-text" href="nosotros.php">DESCUBRÍ MÁS SOBRE <span>LOS JAÚLES CLUB CAMPESTRE</span></a></div>
    <img class="banner-img" src="img/frase.png">
</div>

</h3>
    <br>

    <div class="container-fluid d-flex space-between beneficios">
        <div class="card beneficios-card bg-light text-center">
            <img class="svg" src="img/piscina.svg">
            <b>PISCINA</b>
        </div>
        <div class="card beneficios-card bg-light text-center">
        <img class="svg" src="img/aireLibre.svg">
            <b >AREAS VERDES</b>
        </div>
        <div class="card beneficios-card bg-light text-center">
        <img  class="svg" src="img/gym.svg">
            <b>GIMNASIO</b>
        </div>
        <div class="card beneficios-card bg-light text-center">
        <img class="svg" src="img/salones.svg">
            <b>SALONES</b>
        </div>
    </div>

   
    <br><br>
    <div class="container-fluid bg-light">
        <h2 class="text-center servicios-titulo p-5"><b>SERVICIOS</b><br>LO QUE PODÉS DISFRUTAR</h2>
        <div class="container-fluid d-flex space-between servicios">
        <div class="card servicios-card  bg-light text-center">
            <img class="png" src="img/bienestar-relajacion.png">
            <b>Bienestar y Relajación</b>
        </div>
        <div class="card servicios-card bg-light text-center">
        <img class="png" src="img/deportivo-recreativo.png">
            <b >Deportivo y Recreativo</b>
        </div>
        <div class="card servicios-card  bg-light text-center">
        <img  class="png" src="img/eventos-alojamiento.png">
            <b>Eventos y Alojamiento</b>
        </div>
        <div class="card servicios-card  bg-light text-center">
        <img class="png" src="img/gastronomia.png">
            <b>Gastronomía</b>
        </div>
    </div>
    </div>
    <?php incluir_footer()?>
</body>

</html>