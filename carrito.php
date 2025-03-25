<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
</head>
<body>
    <h1>Centro Recreativo los Jaules</h1>

    <h2>Reservas</h2>

    <div>
        <h3>Canchas de Baloncesto</h3>
        <button onclick="agregarAlCarrito('Cancha de Baloncesto', 500)">Reservar Cancha de Baloncesto</button>
    </div>

<?php


?>

    <div>
        <h3>Canchas de Tenis</h3>
        <button onclick="agregarAlCarrito('Cancha de Tenis', 400)">Reservar Cancha de Tenis</button>
    </div>

    <div>
        <h3>Ranchos</h3>
        <button onclick="agregarAlCarrito('Rancho', 300)">Reservar Rancho</button>
    </div>

    <h2>Carrito de Compras</h2>
    <div id="carrito">
        <!-- Aquí se mostrarán los productos del carrito -->
    </div>

    <button onclick="vaciarCarrito()">Vaciar Carrito</button>
    <button onclick="procesarCompra()">Procesar Compra</button>

    <script src="js/carrito.js"></script>
</body>
</html>

