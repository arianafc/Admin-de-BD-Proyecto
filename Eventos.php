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
    <link rel="stylesheet" href="./css/alojamiento.css">
    <?php incluir_css()?>
    <script src="js/java.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
</head>

<header>
<?php incluir_navbar()?>
    </header>

    <div class="container-fluid eventos">
        <img src="img/Banner-de-eventos.png" class="imgEventos">
        <br>
        <h2 class="eventosText text-center"><b>DISFRUTA DE LAS MEJORES</b> <span class="eventosHighlight">ACTIVIDADES QUE CLUB JAÚLES TE OFRECE</span></h2>
    </div>

<div class="container p-2" id="container-eventos">

</div>

  <div class="modal" id="modalEventos">
            <article class="modal-container">
                <header class="modal-container-header">
                    <h1 class="modal-container-title text-center">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"
                            aria-hidden="true">
                            <path fill="none" d="M0 0h24v24H0z" />
                            <path fill="currentColor"
                                d="M14 9V4H5v16h6.056c.328.417.724.785 1.18 1.085l1.39.915H3.993A.993.993 0 0 1 3 21.008V2.992C3 2.455 3.449 2 4.002 2h10.995L21 8v1h-7zm-2 2h9v5.949c0 .99-.501 1.916-1.336 2.465L16.5 21.498l-3.164-2.084A2.953 2.953 0 0 1 12 16.95V11zm2 5.949c0 .316.162.614.436.795l2.064 1.36 2.064-1.36a.954.954 0 0 0 .436-.795V13h-5v3.949z" />
                        </svg>
                        Registro de Evento
                    </h1>
                    <button id="close" class="icon-button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                            <path fill="none" d="M0 0h24v24H0z" />
                            <path fill="currentColor"
                                d="M12 10.586l4.95-4.95 1.414 1.414-4.95 4.95 4.95 4.95-1.414 1.414-4.95-4.95-4.95 4.95-1.414-1.414 4.95-4.95-4.95-4.95L7.05 5.636z" />
                        </svg>
                    </button>
                </header>
                <section class="modal-container-body ">
                    <p class="text-center">Ingreso como Invitado</p>
                    <form id="formInvitado">
                        <div class="mb-3">
                            <label>Ingresa tu número de cedula:</label>
                            <input id="cedulaInvitado" type="text">
                        </div>
                        <div class="mb-3">
                            <label>Ingresa el número de cédula del miembro:</label>
                            <input id="cedulaMiembro" type="text">
                        </div>
                    </form>
                </section>
                
                <footer class="modal-container-footer">
                    <button class="button is-ghost" id="close">Cancelar</button>
                    <button class="button is-primary" id="guardarRegistroInvitado">Registrarse</button>
                </footer>
            </article>
        </div>



</div>
</div>
 

</h3>
    <br>

    </div>
    <?php incluir_footer()?>
</body>

</html>