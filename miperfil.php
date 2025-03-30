<?php 
require_once 'fragmentos.php';
session_start();

// Simulación de datos del usuario (debes obtener estos valores desde la base de datos)
$usuario = [
    'nombre' => 'Juan',
    'primer_apellido' => 'Pérez',
    'segundo_apellido' => 'Gómez',
    'cedula' => '123456789',
    'correo' => 'juanperez@example.com',
];

// Simulación de membresía (si no tiene, dejar vacío)
$membresia = [
    'nombre' => 'Premium',
    'costo' => '₡50,000',
    'duracion_dias' => 30,
    'descripcion' => 'Acceso ilimitado a todas las instalaciones.',
    'num_invitados' => 2,
    'estado' => 'Activa'
];

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/perfil.css">
    <?php incluir_css(); ?>
</head>

<body>
    <header>
        <?php incluir_navbar(); ?>
    </header>

    <div class="container-fluid profile-container">
        <div class="row">
            <!-- Columna izquierda: Información del usuario (con card) -->
            <div class="col-md-4 profile-info">
                <div class="card user-card">
                    <h2>Mi Perfil</h2>
                    <p><strong>Nombre Completo:</strong> <?php echo $usuario['nombre'] . ' ' . $usuario['primer_apellido'] . ' ' . $usuario['segundo_apellido']; ?></p>

                    <p><strong>Cédula:</strong> <?php echo $usuario['cedula']; ?></p>
                    <p><strong>Correo Electrónico:</strong> <?php echo $usuario['correo']; ?></p>
                    
                    <div class="buttons">
                        <button class="btn btn-edit"><i class="fas fa-edit"></i> Editar Perfil</button>
                        <button class="btn btn-logout"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</button>
                        <button class="btn btn-delete"><i class="fas fa-trash-alt"></i> Eliminar Cuenta</button>
                    </div>
                </div>
            </div>

            <!-- Columna derecha: Membresía -->
            <div class="col-md-8 profile-membership">
                <div class="card membership-card">
                    <h3>Membresía</h3> <!-- Título dentro del card -->
                    <?php if (!empty($membresia['nombre'])): ?>
                        <table class="table">
                            <tr>
                                <th>Nombre</th>
                                <td><?php echo $membresia['nombre']; ?></td>
                            </tr>
                            <tr>
                                <th>Costo</th>
                                <td><?php echo $membresia['costo']; ?></td>
                            </tr>
                            <tr>
                                <th>Duración (días)</th>
                                <td><?php echo $membresia['duracion_dias']; ?></td>
                            </tr>
                            <tr>
                                <th>Descripción</th>
                                <td><?php echo $membresia['descripcion']; ?></td>
                            </tr>
                            <tr>
                                <th>Número de invitados</th>
                                <td><?php echo $membresia['num_invitados']; ?></td>
                            </tr>
                            <tr>
                                <th>Estado</th>
                                <td><?php echo $membresia['estado']; ?></td>
                            </tr>
                        </table>
                        <!-- Botón de Cancelar Membresía -->
                        <div class="cancel-btn-container">
                            <button class="btn btn-cancel-membership"><i class="fas fa-times-circle"></i> Cancelar Membresía</button>
                        </div>
                    <?php else: ?>
                        <p>No cuentas con una membresía.</p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <?php incluir_footer(); ?>
</body>
</html>
