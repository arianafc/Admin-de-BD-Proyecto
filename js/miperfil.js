document.addEventListener("DOMContentLoaded", function () {

    
function obtenerMembresiaUsuarios() {
    $.post('./data/accionesMembresias.php', { action: 'obtenerMembresiaUsuario' }, function(response) {

        if (response.success) {
            const data = response.data;
    
            let acciones = `
    <button class="btn btn-danger btn-sm btn-cancelar" id="cancelarMembresia" data-id="${data.ID_MEMBRESIA}">
        Cancelar
    </button>
`;

if (data.ID_TIPO_MEMBRESIA == 1) {
    acciones += `
        <button class="btn btn-primary btn-sm btn-actualizar" id="btnActualizarPaseDiario" data-id="${data.ID_MEMBRESIA}" data-bs-toggle="modal" data-bs-target="#modalActualizarFecha">
            Actualizar Fecha
        </button>
    `;
}
            $('#tablaMembresiaUsuario tbody').empty();
    
          
            $('#tablaMembresiaUsuario tbody').append(`
                <tr>
                    <td>${data.NOMBRE}</td>
                    <td>${data.FECHA_INICIO}</td>
                    <td>${data.FECHA_FIN}</td>
                    <td>${data.ESTADO}</td>
                      <td>${acciones}</td>
                </tr>
            `);
        } else {
            $('#tablaMembresiaUsuario tbody').html(`
                <tr>
                    <td colspan="5">${response.message}</td>
                </tr>
            `);
        }
    });
    
}
    obtenerMembresiaUsuarios();

    $(document).on('click', '#btnActualizarPaseDiario', function () {
        console.log('hola');
        const idMembresia = $(this).data('id'); 
    
        Swal.fire({
            title: 'Actualizar Fecha de Inicio',
            html: `
                <input type="date" id="nuevaFecha" class="swal2-input" placeholder="Nueva fecha">
            `,
            confirmButtonText: 'Actualizar',
            cancelButtonText: 'Cancelar',
            showCancelButton: true,
            preConfirm: () => {
                const nuevaFecha = document.getElementById('nuevaFecha').value;
                if (!nuevaFecha) {
                    Swal.showValidationMessage('Por favor ingresa una fecha válida');
                }
                return nuevaFecha;
            }
        }).then(result => {
            if (result.isConfirmed && result.value) {
                const nuevaFecha = result.value;
    
                $.post('./data/accionesMembresias.php', {
                    action: 'actualizarFechaInicio',
                    id_membresia: idMembresia,
                    nueva_fecha: nuevaFecha
                }, function (res) {
                    Swal.fire({
                        icon: res.success ? 'success' : 'error',
                        title: res.message,
                        text: res.message
                    });
    
                    if (res.success) {
                     
                    }
                }, 'json');
            }
        });
    });



    $(document).on('click', '#cancelarMembresia', function () {
        const idMembresia = $(this).data('id');
    
        Swal.fire({
            title: '¿Estás seguro?',
            text: "Esta acción cancelará la membresía.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, cancelar',
            cancelButtonText: 'No, mantener'
        }).then((result) => {
            if (result.isConfirmed) {
                $.post('./data/accionesMembresias.php', {
                    action: 'cancelarMembresia',
                    id_membresia: idMembresia
                }, function (res) {
                    Swal.fire({
                        icon: res.success ? 'success' : 'error',
                        title: res.message,
                        text: res.message
                    });
    
                    if (res.success) {
                        // Aquí puedes recargar la tabla si quieres
                    }
                }, 'json');
            }
        });
    });
    
function getReservasUsuario(){
    $.post('./data/accionesReservas.php', { action: 'obtenerReservasUsuario' }, function (res) {
        if (res.success) {
            const tbody = $('#tablaReservas tbody');
            tbody.empty();
    
            const hoy = new Date().toISOString().split('T')[0];
    
            res.data.forEach(reserva => {
                const fechaInicio = reserva.FECHA_INICIO;
                const mostrarCancelar = fechaInicio >= hoy;
    
                let botonCancelar = '';
                if (mostrarCancelar) {
                    botonCancelar = `<button class="btn btn-danger btn-sm cancelar-reserva" data-id="${reserva.ID_RESERVA}">
                                        Cancelar
                                     </button>`;
                }
    
                const row = `
                    <tr>
                        <td>${reserva.NOMBRE}</td>
                        <td>${fechaInicio}</td>
                        <td>${reserva.HORA_INICIO} - ${reserva.HORA_FIN}</td>
                        <td>${reserva.NUMERO_PERSONAS}</td>
                        <td>${reserva.ESTADO}</td>
                        <td>${botonCancelar}</td>
                    </tr>
                `;
                tbody.append(row);
            });
    
        } else {
            Swal.fire('Error', res.message || 'No se pudieron obtener las reservas.', 'error');
        }
    }, 'json');
    
}
    getReservasUsuario();

function getFacturasUsuario(){
    $.post('./data/accionesFacturas.php', { action: 'obtenerFacturasUsuario' }, function (res) {
        if (res.success) {
            const tbody = $('#tablaFacturasUsuario tbody');
            tbody.empty();
    
            res.data.forEach(factura => {
                const row = `
                    <tr>
                        <td>${factura.ID_ORDEN}</td>
                        <td>${factura.FECHA_EMISION}</td>
                        <td>₡${parseFloat(factura.SUBTOTAL).toFixed(2)}</td>
                        <td>₡${parseFloat(factura.IVA).toFixed(2)}</td>
                        <td>₡${parseFloat(factura.TOTAL).toFixed(2)}</td>
                        <td>${factura.DESCRIPCION}</td>
                    </tr>
                `;
                tbody.append(row);
            });
        } else {
            Swal.fire('Error', res.message || 'No se pudieron obtener las facturas.', 'error');
        }
    }, 'json');
    
}

getFacturasUsuario();









    
});