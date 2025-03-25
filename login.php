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
    <title>Los Jaules - Club Campestre</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/login.css">
    <?php incluir_css()?>
   
</head>
<body class="login-body">
    <?php incluir_navbar(); ?>
    <main>
        <section class="login-section">
            <div class="login-container">
                <img src="img/logo_jaules.png" alt="Logo Los Jaúles">
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
