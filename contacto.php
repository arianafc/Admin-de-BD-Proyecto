<!DOCTYPE html>
<html lang="en">
<?php 
require_once 'fragmentos.php';
?>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Los Jaúles - Contáctenos</title>
    <style>
  

        .contact-section {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px;
            background-color: white;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            max-width: 1000px;
            justify-content: space-between;
            gap: 20px;
            align-items: center;
        }

        .form {
            flex: 1;
            padding: 30px;
            background: #f9f9f9;
            border-radius: 10px;
            text-align: center;
        }

        .form input, .form textarea, .form button {
            width: calc(100% - 24px);
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        .form button {
            background: #002a80;
            color: white;
            border: none;
            cursor: pointer;
            display: block;
            margin: 10px auto;
        }

        .form button:hover {
            background:rgb(0, 18, 53);
        }

        .image {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .image img {
            max-width: 450px;
            width: 100%;
            border-radius: 0;
            box-shadow: none;
        }

        .info {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 40px 20px;
            background: #f1f1f1;
        }

        .contact-info, .location {
            flex: 1;
            padding: 20px;
            background: white;
            border-radius: 8px;
            text-align: center;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }
            .image {
                margin-top: 20px;
            }
            .info {
                flex-direction: column;
            }
        }
    </style>
    <?php incluir_css(); ?>
</head>
<body>
    <?php incluir_navbar(); ?>
    <main>
        <section class="contact-section">
            <div class="container">
                <div class="form">
                    <h3>¿TIENES ALGUNA CONSULTA?</h3>
                    <form id="contactoForm" action="#">
                        <input type="text" name="nombre" placeholder="Nombre" required>
                        <input type="text" name="apellidos" placeholder="Apellido" required>
                        <input type="email" name="email" placeholder="Email" required>
                        <textarea name="mensaje" placeholder="Mensaje" rows="4" required></textarea>
                        <button type="submit">ENVIAR</button>
                    </form>
                </div>
                <div class="image">
                    <img src="img/logo_jaules.png" alt="Logo Los Jaúles">
                </div>
            </div>
        </section>
        <section class="info">
            <div class="location">
                <h2>UBICACIÓN</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3929.332891464378!2d-83.99702307496892!3d9.989336440115535!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8fa0e65d9208c69d%3A0x393491301a3e3fa5!2sClub%20Los%20Ja%C3%BAles!5e0!3m2!1ses-419!2scr!4v1742872327056!5m2!1ses-419!2scr" width="100%" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
            <div class="contact-info">
                <h2>INFORMACIÓN DE CONTACTO</h2>
                <p>Teléfono: +506 8888 9999</p>
                <p>Email: contacto@losjauales.cr</p>
                <p>Dirección: Alajuela, Costa Rica</p>
                <p>Horario: Lunes a Domingo, 7:00 am - 7:00 pm</p>
            </div>
        </section>
    </main>
    <?php incluir_footer(); ?>
</body>
</html>