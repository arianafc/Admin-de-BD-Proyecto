<?php

require_once 'fragmentos.php';
session_start();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Los Jaules - Club Campestre</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/registro.css">
    <?php incluir_css(); ?>
    <script src="js/registro.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
</head>
<body class="registro-body">
    <?php incluir_navbar(); ?>
    <main>
        <section class="register-section">
            <div class="register-container">
                <img src="img/logo_jaules.png" alt="Logo Los Jaúles">
                <h2>Registrarse</h2>
                <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>
                <form id="registro-form" method="POST">
                    <input type="text" name="cedula" id="cedulaRegistro" placeholder="Cédula" required>
                    <input type="text" name="nombre" id="nombre" placeholder="Nombre" required>
                    <input type="text" name="apellido1" id="apellido1" placeholder="Primer Apellido" required>
                    <input type="text" name="apellido2" id="apellido2" placeholder="Segundo Apellido" required>
                    <input type="email" name="email" id="email" placeholder="Email" required>
                    <input type="password" name="password" id="contrasenaRegistro" placeholder="Contraseña" required>
                    <input type="password" name="confirm_password" id="confirmarContrasena" placeholder="Confirmar Contraseña" required>
                    <button type="submit">Registrar</button>
                </form>

                <p>¿Ya tienes cuenta? <a href="login.php">Inicia sesión aquí</a></p>
            </div>
        </section>
    </main>
    <?php incluir_footer(); ?>

</body>
</html>

