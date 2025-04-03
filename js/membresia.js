document.addEventListener("DOMContentLoaded", function () {
    $(document).on('click', '#adquirirMembresia', function() {
        let idMembresia = $(this).data('id');

        $.post('./data/carritoMembresias.php', { idMembresia: idMembresia, action: 'agregarMembresia'}, function(response) {
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
        }, "json").fail(function () {
            Swal.fire({
                icon: "error",
                title: "Error",
                text: "Lo sentimos. Solo puedes agregar una membresía al carrito."
            });
        });
    });

getCarrito();
    function getCarrito() {
       
            $.post('./data/carritoMembresias.php', { action: 'verCarrito' }, function(response) {
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
                                <button class="btn btn-danger btn-sm" onclick="eliminarItem(${item.ID_ITEM})">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
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
        
    
    
        $(document).on('click', '#pagarCarrito', function(){
            Swal.fire({
                title: "Resumen de Compra",
                html: `
                    <p>Revisa tu pedido antes de finalizar.</p>
                    <label for="paymentMethod">Método de Pago:</label>
                    <select id="paymentMethod" class="swal2-select">
                        <option value="">Seleccione un método</option>
                        <option value="sinpe">Sinpe</option>
                        <option value="efectivo">Efectivo</option>
                    </select>
        
                    <div id="sinpeInfo" style="display: none; margin-top: 10px;">
                        <p><strong>Por favor realice el pago al siguiente número: <span class="phone-number">8888-8888</span></strong></p>
                        <label for="paymentAttachment" class="adjuntarComprobante">Adjuntar Comprobante</label>
                        <input type="file" id="paymentAttachment">
                        <p id="file-name"></p>
                    </div>
        
                    <div class="cart-summary" style="margin-top: 10px;">
                        <p class="total">Total: <strong>$XX.XX</strong></p>
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
                    let paymentMethod = document.getElementById("paymentMethod");
                    let sinpeInfo = document.getElementById("sinpeInfo");
        
                    paymentMethod.addEventListener("change", function() {
                        if (this.value === "sinpe") {
                            sinpeInfo.style.display = "block";
                        } else {
                            sinpeInfo.style.display = "none";
                        }
                    });
        
                    document.getElementById("paymentAttachment").addEventListener("change", function(event) {
                        document.getElementById("file-name").textContent = event.target.files[0]?.name || "";
                    });
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire("¡Pago Exitoso!", "Tu pago ha sido procesado correctamente.", "success");
                }
            });
        });






});
