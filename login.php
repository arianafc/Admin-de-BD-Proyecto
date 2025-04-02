<?php
session_start();
require_once 'fragmentos.php';

// Si el usuario ya ha iniciado sesión, redirigir al dashboard
if (isset($_SESSION['user'])) {
    header("Location: dashboard.php");
    exit();
}
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
                <input type="text" id="usernameLogin" name="email" placeholder="Cédula" required>
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
                <button type="submit" id="loginButton">Ingresar</button>
            </form>
            <p><a href="#">¿Olvidaste tu contraseña?</a></p>
            <p><a href="registro.php">Registrarme</a></p>
        </div>
    </section>
</main>

    <?php incluir_footer(); ?>
    
    <script>
        document.addEventListener("DOMContentLoaded", function () {
    $("#login-form").submit(function(event) {
        event.preventDefault(); // Evita que se recargue la página

        // Obtener los datos del formulario
        var cedula = $("#usernameLogin").val();
        var contrasena = $("#password").val();
     

        $.post("data/get_login.php", {
            username: cedula, password: contrasena
        }, function(response) {
            if (response.success) {
                // Si el login es exitoso, muestra el mensaje de éxito y redirige
                $("#error-message").hide();
                $("#error-message").removeClass("error");
                $("#error-message").html(response.message);
                $("#error-message").show();
                
                // Redirigir después de 1 segundo
                setTimeout(function() {
                    window.location.href = "index.html";  // Cambia por la URL a donde quieras redirigir
                }, 1000); // 1 segundo de retraso para mostrar el mensaje
            } else {
                // Si el login falla, muestra el mensaje de error
                console.log(response);
                $("#error-message").show();
                $("#error-message").addClass("error");
                $("#error-message").html(response.message);
            }
        }).fail(function() {
            // Si ocurre un error de conexión, muestra el mensaje
            $("#error-message").show();
            $("#error-message").addClass("error");
            $("#error-message").html("Error en la conexión.");
        });
    });
});


    </script>
</body>
</html>
