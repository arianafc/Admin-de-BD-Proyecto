document.addEventListener("DOMContentLoaded", function () {



    $(document).on('click', '#adquirirMembresia', function () {
        let idMembresia = $(this).data('id');

        $.post('./data/carritoActions.php', {
            idMembresia: idMembresia,
            action: 'agregarMembresia'
        }, function (response) {
            if (response.success) {
                Swal.fire({
                    icon: "success",
                    title: "Éxito",
                    text: response.message
                });
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: response.message
                });
            }
        }, "json").fail(function (xhr) {
            let errorMsg = "Lo sentimos. Ocurrió un error al procesar tu solicitud.";
        
            if (xhr.responseText) {
                try {
                    const response = JSON.parse(xhr.responseText);
                    if (response.message) {
                        errorMsg = response.message;
                    }
                } catch (e) {
                    console.warn("Respuesta no es JSON válido:", xhr.responseText);
                }
            }
        
            Swal.fire({
                icon: "error",
                title: "Error",
                text: errorMsg
            });
        });
        
    });
    getCarrito();
    function getCarrito() {

        $.post('./data/carritoActions.php', { action: 'verCarrito' }, function (response) {
            if (response.success) {
                let tablaBody = document.getElementById("tablaCarritoBody");
                let totalCarrito = 0;
                tablaBody.innerHTML = '';

                response.data.forEach(item => {
                    let row = document.createElement('tr');
                    row.innerHTML = `
                <td>${item.MEMBRESIA || item.RESERVA}</td>
                <td>${item.CANTIDAD}</td>
                <td>${item.PRECIO} CRC</td>
                <td>${item.TOTAL} CRC</td>
                <td>
                    <button class="btn btn-danger btn-sm" id="eliminarCarrito" data-id=${item.ID_ITEM}>
                        <i class="fas fa-trash-alt"></i>
                    </button>
                ${item.RESERVA ? `
                <button class="btn btn-info btn-sm"  id="editarCarrito" data-id=${item.ID_ITEM}>
                        <i class="fas fa-pen-alt"></i>
                </button>` : ''}
    </td>
`;
                    tablaBody.appendChild(row);
                    totalCarrito += parseFloat(item.TOTAL);
                });

                document.getElementById("totalCarrito").textContent = totalCarrito + " CRC";

                Swal.fire({
                    icon: "success",
                    title: "Carrito actualizado",
                    text: "Los datos del carrito han sido cargados correctamente.",
                    timer: 2000,
                    showConfirmButton: false
                });

            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "No se pudieron obtener los datos del carrito."
                });
            }
        }, "json").fail(function () {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Error en la solicitud al cargar el carrito."
            });
        });
    }

    $(document).on('click', '#eliminarCarrito', function () {
        let idItem = parseInt($(this).data('id'));

        $.post('./data/carritoActions.php', { id_item: idItem, action: 'eliminar' }, function (response) {
            if (response.success) {
                Swal.fire({
                    icon: "success",
                    title: "Acción Exitosa",
                    text: response.message,
                    timer: 2000,
                    showConfirmButton: false
                }).then(() => {
                    location.reload(); // recarga si quieres refrescar la vista
                });
            } else {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: response.message || "No se pudo eliminar el item."
                });
            }
        }, "json").fail(function () {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Error al conectar con el servidor."
            });
        });
    });

//----------------------------------------------------CHECKOUT
$(document).on('click', '#pagarCarrito', function () {
    Swal.fire({
        title: "TU COMPRA",
        html: `
            <p>Revisa tu pedido antes de finalizar.</p>
            <label for="paymentMethod">Método de Pago:</label>
            <div id="paymentOptions"></div>
            <div id="paymentDetails" style="margin-top: 10px;"></div>
            <div class="cart-summary" style="margin-top: 10px;">
                <p class="total">Total: <strong id="totalAmount"></strong></p>
            </div>
        `,
        showCancelButton: true,
        confirmButtonText: "Pagar Ahora",
        cancelButtonText: "Cancelar",
        customClass: {
            confirmButton: "bntPagar",
            cancelButton: "btnCancelar"
        },
        didOpen: () => {
            $.post('./data/carritoActions.php', { action: 'totalCarrito' }, function (data) {
                $('#totalAmount').text(`${parseFloat(data).toFixed(2)} CRC`);
            });

            const paymentSelect = document.getElementById("paymentOptions");
            const container = document.getElementById("paymentDetails");
            const paymentButton = document.querySelector('.bntPagar');
          
            paymentButton.disabled = true;

            $.post('./data/carritoActions.php', { action: 'obtenerMetodos' }, function (res) {
                if (res.success) {
                    res.data.forEach(metodo => {
                        const metodoHTML = `
                            <label style="cursor: pointer; display: flex; align-items: center; gap: 10px;">
                                <input class="text-center" type="radio" name="paymentMethod" id="metodoPago" value="${metodo.ID_METODO_PAGO}" data-descripcion="${metodo.DESCRIPCION.toLowerCase()}">
                                ${metodo.DESCRIPCION}
                            </label>
                        `;
                        paymentSelect.innerHTML += metodoHTML;
                    });

                    $('input[name="paymentMethod"]').on('change', function () {
                        const metodo = $(this).data('descripcion');
                        container.innerHTML = "";

            
                        paymentButton.disabled = true;

                        if (metodo === "transferencia") {
                            container.innerHTML = `
                                <p><strong>Por favor realice el pago a la siguiente cuenta BAC: <span class="text">CR36278279297892</span></strong></p>
                                <p><strong>A nombre de: Los Jaúles Club Campestre</strong></p>
                                <label for="transferCode">Código de Transferencia:</label>
                                <input type="text" id="transferCode" placeholder="Ej: TRX12345" class="swal2-input"><br>
                                <label for="paymentAttachment" class="adjuntarComprobante">Adjuntar Comprobante</label>
                                <input type="file" id="paymentAttachment" class="swal2-file">
                                <p id="file-name"></p>
                            `;

                            $('#transferCode, #paymentAttachment').on('change', function () {
                                if ($('#transferCode').val() !== "" && $('#paymentAttachment')[0].files.length > 0) {
                                    paymentButton.disabled = false; 
                                } else {
                                    paymentButton.disabled = true;
                                }
                            });

                        } else if (metodo === "tarjeta credito") {
                            container.innerHTML = `
                                <label for="cardNumber">Número de Tarjeta:</label>
                                <input type="text" id="cardNumber" class="swal2-input" placeholder="XXXX-XXXX-XXXX-XXXX"><br>
                                <label for="cardName">Nombre en la Tarjeta:</label>
                                <input type="text" id="cardName" class="swal2-input" placeholder="Nombre Completo"><br>
                                <label for="cardExpiry">Fecha de Expiración:</label>
                                <input type="month" id="cardExpiry" class="swal2-input"><br>
                                <label for="cardCVV">CVV:</label>
                                <input type="text" id="cardCVV" class="swal2-input" placeholder="123">
                            `;

                            $('#cardNumber, #cardName, #cardExpiry, #cardCVV').on('change', function () {
                                if ($('#cardNumber').val() !== "" && $('#cardName').val() !== "" && $('#cardExpiry').val() !== "" && $('#cardCVV').val() !== "") {
                                    paymentButton.disabled = false;
                                } else {
                                    paymentButton.disabled = true; 
                                }
                            });

                        } else if (metodo === "paypal") {
                            container.innerHTML = `
                                <p><strong>Serás redirigido a PayPal para completar tu pago.</strong></p>
                                <p>Asegúrate de tener una cuenta activa o tarjeta vinculada.</p>
                                <label for="paypalEmail">Correo de PayPal:</label>
                                <input type="email" id="paypalEmail" class="swal2-input" placeholder="correo@ejemplo.com">
                            `;

                
                            $('#paypalEmail').on('change', function () {
                                if ($('#paypalEmail').val() !== "") {
                                    paymentButton.disabled = false; 
                                } else {
                                    paymentButton.disabled = true; 
                                }
                            });
                        }
                    });
                } else {
                    paymentSelect.innerHTML = '<p>Error al cargar métodos de pago</p>';
                }
            }, 'json');
        }
    }).then((result) => {
        if (result.isConfirmed) {

            //EJECUTAMOS EL CHECKOUT
            const metodoSeleccionado = document.querySelector('input[name="paymentMethod"]:checked');

            if (metodoSeleccionado) {
                let idMetodoPago = metodoSeleccionado.value;
                     console.log("ID del método de pago seleccionado:", idMetodoPago);
                     $.post('./data/carritoActions.php', {action: 'checkout', idMetodoPago: idMetodoPago}, function(data){
                        if(data.success) {
                            Swal.fire({
                                title: "Procesando Pago...",
                                text: "Contactando con la entidad bancaria...",
                                showConfirmButton: false,
                                timer: 5000 
                            }).then(() => {
                                Swal.fire({
                                    title: "¡Pago Exitoso!",
                                    text: "Tu pago ha sido completado correctamente. Encontrarás información de tus reservas y membresías en la sección de Mi Perfil",
                                    icon: "success",
                                    confirmButtonText: "Aceptar",
                                    timer: 3000 
                                }).then(() => {
                        
                                    location.reload();
                                });
                            });
                        } else {
                         
                                Swal.fire({
                                    title: "No pudimos completar tu transacción.",
                                    text: "Tu pago no ha sido completado correctamente.",
                                    icon: "Error",
                                    confirmButtonText: "Aceptar"
                                });
                        
                        }
                    });
                }

           
        }
    });
});




    $(document).on('click', '#editarCarrito', function () {
        idItem = $(this).data('id');
        console.log(idItem);
        mostrarFormularioEditarReserva();

    });


    function mostrarFormularioEditarReserva() {
        Swal.fire({
            title: 'ACTUALIZACIÓN DE RESERVA',
            html: `
            <div class="container mt-4">
    <form id="formReserva">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="fechaInicioEditar" class="form-label">Día de Ingreso</label>
                <input type="date" id="fechaInicioEditar" class="form-control" placeholder="Fecha Inicio" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="fechaFinEditar" class="form-label">Día de Salida</label>
                <input type="date" id="fechaFinEditar" class="form-control" placeholder="Fecha Fin" required>
            </div>
            <div class="col-md-6 mb-3">
                <label for="personasEditar" class="form-label">Número de Personas</label>
                <input type="number" id="personasEditar" class="form-control" placeholder="Número de Personas" required min="1">
            </div>
        </div>
    </form>
</div>

            `,
            showCancelButton: true,
            confirmButtonText: 'Reservar',
            preConfirm: () => {
                const fechaInicio = document.getElementById('fechaInicioEditar').value;
                const fechaFin = document.getElementById('fechaFinEditar').value;
                const personas = document.getElementById('personasEditar').value;

                if (!fechaInicio || !fechaFin || !personas) {
                    Swal.showValidationMessage('Por favor, complete todos los campos.');
                    return false;
                }

                if (new Date(fechaInicio) > new Date(fechaFin)) {
                    Swal.showValidationMessage('La fecha de inicio no puede ser posterior a la fecha de fin.');
                    return false;
                }

                return { fechaInicio, fechaFin, personas };
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const { fechaInicio, fechaFin, personas } = result.value;
                $.post('./data/carritoActions.php', {
                    fecha_inicio: fechaInicio,
                    fecha_fin: fechaFin,
                    num_personas: personas,
                    idItem: idItem,
                    action: 'editar'

                }, function (response) {
                    console.log(response);
                    if (response.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Éxito",
                            text: response.message
                        });
                    } else {
                        Swal.fire({
                            icon: "error",
                            title: "Error",
                            text: response.message
                        });
                    }
                });
            }
        });
    }

});
