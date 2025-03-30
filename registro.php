<?php
session_start();
require_once 'fragmentos.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm_password'];

    // Validar que las contraseñas coinciden
    if ($password !== $confirmPassword) {
        $error = "Las contraseñas no coinciden.";
    } else {
        // Aquí podrías insertar el nuevo usuario en la base de datos
        // Solo se usa un ejemplo simple
        $usuarios = [
            "usuario@losjauales.cr" => "123456"
        ];

        if (!isset($usuarios[$email])) {
            // Simula el registro exitoso (deberías almacenar en base de datos)
            $usuarios[$email] = $password;
            $_SESSION['user'] = $email;
            header("Location: dashboard.php");
            exit();
        } else {
            $error = "El correo ya está registrado.";
        }
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
    <link rel="stylesheet" href="./css/registro.css">
    <?php incluir_css()?>
   
</head>
<body class="register-body">
    <?php incluir_navbar(); ?>
    <main>
        <section class="register-section">
            <div class="register-container">
                <img src="img/logo_jaules.png" alt="Logo Los Jaúles">
                <h2>Registrarse</h2>
                <?php if (isset($error)) echo "<p class='error'>$error</p>"; ?>
                <form method="POST" action="">
                    <input type="text" name="cedula" placeholder="Cédula" required>
                    <input type="text" name="nombre" placeholder="Nombre" required>
                    <input type="text" name="apellido1" placeholder="Primer Apellido" required>
                    <input type="text" name="apellido2" placeholder="Segundo Apellido" required>
                    <input type="email" name="email" placeholder="Correo Electrónico" required>
                    <input type="password" name="password" placeholder="Contraseña" required>
                    <input type="password" name="confirm_password" placeholder="Confirmar Contraseña" required>
                    <button type="submit">Registrar</button>
                </form>
                <p>¿Ya tienes cuenta? <a href="login.php">Inicia sesión aquí</a></p>
            </div>
        </section>
    </main>
    <?php incluir_footer(); ?>
</body>

</html>
