
<?php
/**
 * Función para incluir los archivos CSS principales
 */
function incluir_css() {
    echo '<link rel="stylesheet" href="css/index.css">';
    echo '<link rel="stylesheet" href="css/navbar.css">';
    echo '<link rel="stylesheet" href="css/footer.css">';
    echo '<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">';
    echo '    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">';
}

/**
 * Función para incluir el navbar
 */
function incluir_navbar() {
    ?>
    <!-- Topbar -->
    <div class="top-bar ">
            <p class="textoTopBar">¡Unite a nosotros y aprovechá nuestro Pase del Día!</p>
        </div>
        <nav class="navbar">
            <div class="logo">Los Jaúles</div> 
            <ul class="nav-links">
                <li><a href="#">Servicios</a></li>
                <li><a href="#">Los Jaúles</a></li>
                <li><a href="#">GYM</a></li>
                <li><a href="#">Actividades</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Horarios y contacto</a></li>
            </ul>
            <button class="btn-membresia">Iniciar Sesión</button>
        </nav>
    <?php
}

/**
 * Función para incluir el footer
 */
function incluir_footer() {
    ?>
    <br>
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
?>