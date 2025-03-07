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
    <link rel="stylesheet" href="./css/index.css">
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
                        <span class="highlight">Bienvenidos a Club Los Jaúles</span>
                        <h2 class="text-white mt-2">disfrutá del bienestar <br> que te ofrecemos</h2>
                        <h3 class="text-white fw-bold">Los Jaúles</h3>
                        <p class="btn text-light">Conocé nuestras membresías</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="container-fluid d-flex space-between beneficios">
        <div class="card beneficios-card text-center">
            <img class="svg" src="img/piscina.svg">
            <b>PISCINA</b>
        </div>
        <div class="card beneficios-card text-center">
        <img class="svg" src="img/aireLibre.svg">
            <b >AREAS VERDES</b>
        </div>
        <div class="card beneficios-card text-center">
        <img  class="svg" src="img/gym.svg">
            <b>GIMNASIO</b>
        </div>
        <div class="card beneficios-card text-center">
        <img class="svg" src="img/salones.svg">
            <b>SALONES</b>
        </div>
    </div>

    <?php incluir_footer()?>
</body>

</html>