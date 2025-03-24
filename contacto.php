<!DOCTYPE html>
<html lang="es">

<?php
require_once 'fragmentos.php';
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Los Jaúles - Contáctenos</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    <?php incluir_css(); ?>
</head>

<body>
    <?php incluir_navbar(); ?>
    <main>
        <section class="contact-section">
            <div class="contact-form text-center">
                <img src="img/logo_jauales.png" alt="Logo Los Jaúles">
                <h3 class="contacto-title-form">¿TIENES ALGUNA CONSULTA?</h3>
                <form id="contactoForm" class="form-contacto" action="#">
                    <input type="text" id="nombreConsulta" name="nombre" placeholder="Nombre" required>
                    <input type="text" id="apellidoConsulta" name="apellidos" placeholder="Apellido" required>
                    <input type="email" id="emailConsulta" name="email" placeholder="Email" required>
                    <textarea id="mensajeConsulta" name="mensaje" placeholder="Mensaje"></textarea>
                    <button type="submit" class="btn btn-primary mt-2" id="enviarConsulta">ENVIAR</button>
                </form>
            </div>
        </section>

        <section class="info-location text-center">
            <div class="contact-info">
                <h2>INFORMACIÓN DE CONTACTO</h2>
                <p>Teléfono: +506 8888 9999</p>
                <p>Email: contacto@losjauales.cr</p>
                <p>Dirección: Alajuela, Costa Rica</p>
                <p>Horario: Lunes a Domingo, 7:00 am - 7:00 pm</p>
            </div>
            <div class="location-map">
                <h2>UBICACIÓN</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3929.33381722045!2d-83.99967310321041!3d9.989259800000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8fa0e65d9208c69d%3A0x393491301a3e3fa5!2sClub%20Los%20Ja%C3%BAles!5e0!3m2!1ses-419!2scr!4v1742523468787!5m2!1ses-419!2scr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>
    </main>
    <hr>
    <?php incluir_footer(); ?>
</body>

</html>