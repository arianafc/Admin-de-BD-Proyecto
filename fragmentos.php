<?php

/**
 * Función para incluir los archivos CSS principales
 */
function incluir_css()
{
    
    echo '<link rel="stylesheet" href="css/navbar.css">';
    echo '<link rel="stylesheet" href="css/footer.css">';
    echo '<link rel="stylesheet" href="css/index.css">';
    echo '<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">';
    echo '    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">';
}

/**
 * Función para incluir el navbar
 */
function incluir_navbar()
{
    ?>
    <!-- Topbar -->
     
    <div class="top-bar ">
        <p class="textoTopBar">¡Unite a nosotros y aprovechá nuestro Pase del Día!</p>
    </div>
    <nav class="navbar">
        <div class="logo">Los Jaúles</div>
        <ul class="nav-links">
            <li><a href="servicios.php">Servicios</a></li>
            <li><a href="#">Los Jaúles</a></li>
            <li><a href="#">GYM</a></li>
            <li><a href="eventos.php">Actividades</a></li>
            <li><a href="membresias.php">Membresías</a></li>
            <li><a href="contacto.php">Horarios y contacto</a></li>
        </ul>
        <?php if (!isset($_SESSION['usuario'])): ?>
    <button class="btn-membresia" onclick="location.href='login.php'">Iniciar Sesión</button>
<?php else: ?>
    <div class="dropdown">
    <button class="dropdown-button"> Hola, <?php echo $_SESSION['nombre']; ?> ▼</button>
    <div class="dropdown-content">
        <a href="carrito.php">Carrito</a>
        <a href="perfil.php">Mi Perfil</a>
        <a href="logout.php">Cerrar Sesión</a>
    </div>
</div>
<?php endif; ?>

    </nav>
    <?php
}

/**
 * Función para incluir el footer
 */
function incluir_footer()
{
    ?>
    <br><br><br><br>
    <div class="info-container">
    <div class="info-item">
        
    <a href="#">Horarios y contactos</a>
    </div>
    <div class="separator"></div>
    <div class="info-item">
       
        <a href="#">¿Cómo ser socio?</a>
    </div>
    <div class="separator"></div>
    <div class="info-item">
       
        <a href="#">Pase del día</a>
    </div>
</div>

    <footer class="footer">
        
        <div class="footer-divider"></div>

        <div class="footer-content">
            <div class="footer-section">
                <h3>Servicios</h3>
                <ul>
                    <li><a href="productos.php?categoria=hamburguesas">Alojamiento</a></li>
                    <li><a href="productos.php?categoria=postres">Entretenimiento</a></li>
                    <li><a href="productos.php?categoria=sandwich">Relajación</a></li>
                </ul>
            </div>

            <div class="footer-section">
                <h3>Nosotros</h3>
                <ul>
                    <li><a href="nosotros.php?seccion=mision">Misión</a></li>
                    <li><a href="nosotros.php?seccion=vision">Visión</a></li>
                    <li><a href="nosotros.php?seccion=quienes-somos">¿Quiénes somos?</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h3>Ayuda</h3>
                <ul>
                    <li><a href="nosotros.php?seccion=mision">Contáctanos</a></li>

                </ul>
            </div>

            <div class="footer-section">
                <h3>Horario</h3>
                <ul>
                    <li>Martes a sábado</li>
                    <li>8 am - 8 pm</li>
                    <li>Domingo</li>
                    <li>8 am - 5 pm</li>
                </ul>
            </div>

            <div class="company-name">
                <h2>LOS JAÚLES</h2>
                <h1>CLUB CAMPESTRE</h1>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="copyright">
                Derechos Reservados Los Jaúles Club Campestre @ 2025
            </div>

            <div class="footer-language-selector">
                Español
            </div>
        </div>
    </footer>
    <?php
}


function sidebar()
{
    ?>
    
    <!-- Sidebar -->
    <nav id="sidebar" class="sidebar py-3 d-md-block">
        <div class="sidebar-header text-center">
            <h4 class="tituloAdmin">CLUB LOS JAÚLES CAMPESTRE</h4>
        </div>


        <hr>
        <div class="opciones">   
        <a href="dashboard.php" id="dashboard">Dashboard</a>
        <a href="gestionUsuarios.php" id="gestionUsuarios">Gestión de Usuarios</a>
        <a href="gestionProveedores.php" id="gestionProveedores" class="active">Gestión de Proveedores</a>
        <a href="gestionProductos.php" id="gestionProductos">Gestión de Productos</a>
        <a href="gestionInventario.php" id="gestionInventario">Gestión de Inventario</a>
        <a href="gestionCotizaciones.php" id="gestionCotizaciones">Gestión de Membresías</a></div>
        <a href="gestionEmpleados.php" id="gestionEmpleados">Gestión de Empleados</a></div>
        <a href="gestionReservaciones.php" id="gestionReservaciones">Gestión de Reservaciones</a></div>
    </nav>

    <!-- Botón de menú -->
    <button class="btn btn-toggle d-md-none m-3" id="menu-toggle">☰</button>

   
    <?php
}
?>