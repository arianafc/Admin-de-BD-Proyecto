<?php
session_start();
require_once 'fragmentos.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    
    // Datos de prueba (Reemplazar con base de datos en producción)
    $usuarios = [
        "usuario@losjauales.cr" => "123456"
    ];

    if (isset($usuarios[$email]) && $usuarios[$email] === $password) {
        $_SESSION['user'] = $email;
        header("Location: dashboard.php");
        exit();
    } else {
        $error = "Correo o contraseña incorrectos";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión - Los Jaúles</title>
    <link rel="stylesheet" href="login.css">
    <?php incluir_css(); ?>
</head>
<body class = "login-body">
    <?php incluir_navbar(); ?>
    <main>
        <section class="login-section">
            <div class="login-container">
                <img src="img/logo_jauales.png" alt="Logo Los Jaúles">
                <h2>Iniciar Sesión</h2>
                <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>
                <form method="POST" action="">
                    <input type="email" name="email" placeholder="Correo Electrónico" required>
                    <input type="password" name="password" placeholder="Contraseña" required>
                    <button type="submit">Ingresar</button>
                </form>
                <p><a href="#">¿Olvidaste tu contraseña?</a></p>
                <p><a href="registro.php">Registrarme</a></p>
            </div>
        </section>
    </main>
    <?php incluir_footer(); ?>
</body>
</html>