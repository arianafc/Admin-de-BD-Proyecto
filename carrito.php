<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito de Compras</title>
</head>
<body>
    <?php
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['accion']) && $_GET['accion'] === 'obtener') {
    $conn = conectarDB();
    $stmt = oci_parse($conn, "BEGIN obtener_carrito(:idUsuario, :cursor); END;");
    
    $cursor = oci_new_cursor($conn);
    oci_bind_by_name($stmt, ":idUsuario", $_GET['id_usuario']);
    oci_bind_by_name($stmt, ":cursor", $cursor, -1, OCI_B_CURSOR);
    
    oci_execute($stmt);
    oci_execute($cursor);
    
    $carrito = [];
    while ($row = oci_fetch_assoc($cursor)) {
        $carrito[] = $row;
    }

    oci_free_statement($cursor);
    oci_close($conn);
    
    echo json_encode($carrito);
}
function agregarItem(idUsuario, idReserva, cantidad) {
    let formData = new FormData();
    formData.append("accion", "agregar");
    formData.append("id_usuario", idUsuario);
    formData.append("id_reserva", idReserva);
    formData.append("cantidad", cantidad);

    fetch("carrito.php", {
        method: "POST",
        body: formData
    })
    .then(response => response.json())
    .then(data => console.log(data.mensaje))
    .catch(error => console.error("Error:", error));
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['accion']) && $_POST['accion'] === 'eliminar') {
    $conn = conectarDB();
    $stmt = oci_parse($conn, "BEGIN eliminar_item_carrito(:idUsuario, :idReserva); END;");
    
    oci_bind_by_name($stmt, ":idUsuario", $_POST['id_usuario']);
    oci_bind_by_name($stmt, ":idReserva", $_POST['id_reserva']);
    
    oci_execute($stmt);
    oci_close($conn);

    echo json_encode(["mensaje" => "Ítem eliminado correctamente"]);
}
function finalizarCompra(idUsuario) {
    let formData = new FormData();
    formData.append("accion", "finalizar");
    formData.append("id_usuario", idUsuario);

    fetch("carrito.php", {
        method: "POST",
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        console.log(data.mensaje);
        obtenerCarrito(idUsuario); // Actualizar la lista
    })
    .catch(error => console.error("Error:", error));
}


    ?>
    <h1>Carrito de Compras</h1>
    
    <button onclick="agregarItem(1, 10, 2)">Agregar Ítem</button>
    <button onclick="obtenerCarrito(1)">Ver Carrito</button>
    <button onclick="finalizarCompra(1)">Finalizar Compra</button>

    <ul id="listaCarrito"></ul>

    <script>
        function actualizarListaCarrito(idUsuario) {
            fetch(`carrito.php?accion=obtener&id_usuario=${idUsuario}`)
            .then(response => response.json())
            .then(data => {
                let carritoHTML = "";
                data.forEach(item => {
                    carritoHTML += `
                        <li>
                            Reserva ID: ${item.ID_RESERVA} - Cantidad: ${item.CANTIDAD}
                            <button onclick="eliminarItem(${idUsuario}, ${item.ID_RESERVA})">Eliminar</button>
                        </li>`;
                });
                document.getElementById("listaCarrito").innerHTML = carritoHTML;
            })
            .catch(error => console.error("Error:", error));
        }

        function agregarItem(idUsuario, idReserva, cantidad) {
            let formData = new FormData();
            formData.append("accion", "agregar");
            formData.append("id_usuario", idUsuario);
            formData.append("id_reserva", idReserva);
            formData.append("cantidad", cantidad);

            fetch("carrito.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log(data.mensaje);
                actualizarListaCarrito(idUsuario);
            })
            .catch(error => console.error("Error:", error));
        }

        function eliminarItem(idUsuario, idReserva) {
            let formData = new FormData();
            formData.append("accion", "eliminar");
            formData.append("id_usuario", idUsuario);
            formData.append("id_reserva", idReserva);

            fetch("carrito.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log(data.mensaje);
                actualizarListaCarrito(idUsuario);
            })
            .catch(error => console.error("Error:", error));
        }

        function finalizarCompra(idUsuario) {
            let formData = new FormData();
            formData.append("accion", "finalizar");
            formData.append("id_usuario", idUsuario);

            fetch("carrito.php", {
                method: "POST",
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                console.log(data.mensaje);
                actualizarListaCarrito(idUsuario);
            })
            .catch(error => console.error("Error:", error));
        }

        function obtenerCarrito(idUsuario) {
            actualizarListaCarrito(idUsuario);
        }
    </script>
</body>
</html>

