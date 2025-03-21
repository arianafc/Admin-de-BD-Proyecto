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
    <link rel="stylesheet" href="./css/eventos.css">
    <?php incluir_css()?>
   
</head>

<header>
<?php incluir_navbar()?>
    </header>

    <div class="container-fluid eventos">
        <img src="img/Banner-de-eventos.png" class="imgEventos">
        <br>
        <h2 class="eventosText text-center"><b>DISFRUTA DE LAS MEJORES</b> <span class="eventosHighlight">ACTIVIDADES QUE CLUB JAÚLES TE OFRECE</span></h2>
    </div>

<div class="container p-2">
<div class="row">
  <div class="col-sm-6 pt-2">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title ">Special title treatment</h5>
        <hr>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div>
  <div class="col-sm-6">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">Special title treatment</h5>
        <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
        <a href="#" class="btn btn-primary">Go somewhere</a>
      </div>
    </div>
  </div>
</div>
</div>
 

</h3>
    <br>

    </div>
    <?php incluir_footer()?>
</body>

</html>