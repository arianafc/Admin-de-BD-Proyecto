// Función para agregar elementos al carrito
function agregarAlCarrito(nombre, precio) {
    // Crear un objeto de la reserva
    const reserva = { nombre, precio };
    
    // Obtener el carrito actual del sessionStorage
    let carrito = JSON.parse(sessionStorage.getItem('carrito')) || [];

    // Agregar la nueva reserva al carrito
    carrito.push(reserva);

    // Guardar el carrito actualizado en sessionStorage
    sessionStorage.setItem('carrito', JSON.stringify(carrito));

    // Actualizar la vista del carrito
    mostrarCarrito();
}

// Función para mostrar el contenido del carrito
function mostrarCarrito() {
    let carrito = JSON.parse(sessionStorage.getItem('carrito')) || [];
    const carritoDiv = document.getElementById('carrito');
    
    // Limpiar el carrito visualmente antes de agregar elementos
    carritoDiv.innerHTML = '';

    if (carrito.length === 0) {
        carritoDiv.innerHTML = '<p>Tu carrito está vacío.</p>';
        return;
    }

    // Mostrar cada elemento del carrito
    carrito.forEach((item, index) => {
        carritoDiv.innerHTML += `
            <p>${item.nombre} - $${item.precio}</p>
        `;
    });
}

// Función para vaciar el carrito
function vaciarCarrito() {
    // Borrar el carrito en sessionStorage
    sessionStorage.removeItem('carrito');

    // Actualizar la vista del carrito
    mostrarCarrito();
}

// Función para procesar la compra (ejemplo)
function procesarCompra() {
    let carrito = JSON.parse(sessionStorage.getItem('carrito')) || [];
    
    if (carrito.length === 0) {
        alert('Tu carrito está vacío. No puedes procesar la compra.');
        return;
    }
    
    // Aquí podrías agregar lógica para enviar los datos al servidor, por ejemplo.
    alert('Compra procesada. ¡Gracias por tu reserva!');
    
    // Limpiar el carrito después de procesar la compra
    vaciarCarrito();
}

// Mostrar el carrito al cargar la página
mostrarCarrito();

