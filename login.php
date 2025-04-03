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
    <link rel="stylesheet" href="./css/login.css">
    <?php incluir_css(); ?>
    <script src="js/login.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
</head>
<body class="login-body">
    <?php incluir_navbar(); ?>

    <main>
    <section class="login-section">
        <div class="login-container">
            <img src="img/logo_jaules.png" alt="Logo Los Jaúles">
            <h2>Iniciar Sesión</h2>
            <p id="error-message" class="error" style="display: none;"></p>
            <form id="login-form">
                <input type="text" id="usernameLogin" name="email" placeholder="Username" required>
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
                <button type="submit" id="loginButton">Ingresar</button>
            </form>
            <p><a href="#">¿Olvidaste tu contraseña?</a></p>
            <p><a href="registro.php">Registrarme</a></p>
        </div>
    </section>
</main>

    <?php incluir_footer(); ?>
    
    <script src="js/login.js"></script>
</body>
</html>
