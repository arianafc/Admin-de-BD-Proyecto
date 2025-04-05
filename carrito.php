<!DOCTYPE html>
<html lang="es">

<?php
require_once 'fragmentos.php';
session_start();
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Los Jaules</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/carrito.css">
    <?php incluir_css(); ?>
    <script src="js/membresia.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
</head>

<body>
    <?php incluir_navbar(); ?>
    <main>
        <section class="cart-section">
     

            <div class="cart-items container p-5">
            <div class="table-responsive carrito-container">
    <table class="table carrito-tabla">
        <thead class="theadCarrito">
            <tr>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio Unitario (CRC)</th>
                <th>Subtotal (CRC)</th>
                <th>Acción</th>
            </tr>
        </thead>
        <tbody id="tablaCarritoBody">
        
        </tbody>
    </table>
    <h4 class="fw-bold text-end">TOTAL <span id="totalCarrito">0,00 CRC</span></h4>

    <div class="d-flex justify-content-between align-items-center carrito-footer">
        <button class="btnCancelar btn ">Seguir Comprando</button>
        <button class="btnPagar btn " id="pagarCarrito">Proceder al Pago</button>
    </div>
</div>
            </div>

            <div id="checkoutModal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2>Resumen de Compra</h2>
                    <p>Revisa tu pedido antes de finalizar.</p>

                    <!-- Selección de método de pago -->
                    <label for="paymentMethod">Método de Pago:</label>
                    <select id="paymentMethod" class="selectPago">
                        <option value="">Seleccione un método</option>
                        <option value="sinpe">Sinpe</option>
                        <option value="efectivo">Efectivo</option>
                    </select>

                    <!-- Información adicional para Sinpe -->
                    <div id="sinpeInfo" class="hidden">
                        <p><strong>Por favor realice el pago al siguiente número: <span
                                    class="phone-number">8888-8888</span></strong></p>
                        <label for="paymentAttachment" class="adjuntarComprobante">Adjuntar Comprobante</label>
                        <input type="file" id="paymentAttachment">
                        <p id="file-name"></p>
                    </div>

                    <div class="cart-summary">
                        <p class="total">Total: <strong>$XX.XX</strong></p>
                    </div>

                    <div class="modal-actions">
                        <button class="btn btn-secondary cancelar" id="closeModal">Cancelar</button>
                        <button class="btn btn-primary pagar" id="pagarYa">Pagar Ahora</button>
                    </div>
                </div>
            </div>

         

        </section>
    </main>
    <hr>
    <?php incluir_footer(); ?>
</body>

</html>