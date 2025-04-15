document.addEventListener("DOMContentLoaded", function () {

    
    function obtenerMembresiaUsuarios() {
        $.post('./data/accionesMembresias.php', { action: 'obtenerMembresiaUsuario' }, function(response) {
            if (response.success) {
                const data = response.data; // ahora es un array
                console.log(data);
    
                $('#tablaMembresiaUsuario tbody').empty();
    
                data.forEach(membresia => {
                    let acciones = `
                        <button class="btn btn-danger btn-sm btn-cancelar" id="cancelarMembresia" data-id="${membresia.ID_MEMBRESIA}">
                            Cancelar
                        </button>
                    `;
    
                    if (membresia.ID_TIPO_MEMBRESIA == 1) {
                        acciones += `
                            <button class="btn btn-primary btn-sm btn-actualizar" id="btnActualizarPaseDiario" data-id="${membresia.ID_MEMBRESIA}" data-bs-toggle="modal" data-bs-target="#modalActualizarFecha">
                                Actualizar Fecha
                            </button>
                        `;
                    }
    
                    $('#tablaMembresiaUsuario tbody').append(`
                        <tr>
                            <td>${membresia.NOMBRE}</td>
                            <td>${membresia.FECHA_INICIO}</td>
                            <td>${membresia.FECHA_FIN}</td>
                            <td>${membresia.ESTADO}</td>
                            <td>${acciones}</td>
                        </tr>
                    `);
                });
    
            } else {
                $('#tablaMembresiaUsuario tbody').html(`
                    <tr>
                        <td colspan="5">${response.message}</td>
                    </tr>
                `);
            }
        }, 'json'); // asegúrate de que el tipo de datos sea JSON
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
            const tbody = $('#tablaReservasUsuario tbody');
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
                         <td>${reserva.FECHA_FIN}</td>
                        <td>${reserva.HORA_INICIO} - ${reserva.HORA_FIN}</td>
                       
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


function cargarInvitadosUsuario(cedulaMiembro) {
    $.post('./data/accionesInvitados.php', {
        action: 'obtener_invitados',
        cedulaMiembro: cedulaMiembro
    }, function (response) {
        if (response.success) {
            let contenido = '';
            response.data.forEach(inv => {
                contenido += `
                    <tr>
                        <td>${inv.CEDULA}</td>
                        <td>${inv.FECHA_REGISTRO}</td>
                        <td>
                            <button class="btn btn-danger btn-sm eliminar-invitado" data-id="${inv.ID_INVITADO}">
                                Eliminar
                            </button>
                        </td>
                    </tr>
                `;
            });
            $('#bodyInvitadosUsuario').html(contenido);
        } else {
            Swal.fire('Error', response.message, 'error');
        }
    }, 'json');
}

// Evento para eliminar invitado
$(document).on('click', '.eliminar-invitado', function () {
    const idInvitado = $(this).data('id');

    Swal.fire({
        title: '¿Eliminar invitado?',
        text: 'Esta acción no se puede deshacer.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Sí, eliminar',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            $.post('./data/accionesInvitados.php', {
                action: 'eliminar_invitado',
                idInvitado: idInvitado
            }, function (response) {
                if (response.success) {
                    Swal.fire('Eliminado', response.message, 'success');
                    cargarInvitadosUsuario(/* tu cédula de sesión o variable */);
                } else {
                    Swal.fire('Error', response.message, 'error');
                }
            }, 'json');
        }
    });
});


cargarInvitadosUsuario();

$('#btnAgregarInvitado').on('click', function () {
    Swal.fire({
        title: 'Agregar invitado',
        input: 'text',
        inputLabel: 'Cédula del invitado',
        inputPlaceholder: 'Ingrese la cédula',
        showCancelButton: true,
        confirmButtonText: 'Agregar',
        cancelButtonText: 'Cancelar',
        inputValidator: (value) => {
            if (!value) {
                return 'Debe ingresar una cédula';
            }
            if (!/^\d+$/.test(value)) {
                return 'La cédula debe ser numérica';
            }
        }
    }).then((result) => {
        if (result.isConfirmed) {
            const cedulaInvitado = result.value;

            $.post('./data/accionesInvitados.php', {
                action: 'agregar_invitado',
                cedulaInvitado: cedulaInvitado
            }, function (response) {
                if (response.success) {
                    Swal.fire('Éxito', response.message, 'success');
                    cargarInvitadosUsuario(); // recarga la tabla
                } else {
                    Swal.fire('Atención', response.message, 'warning');
                }
            }, 'json');
        }
    });
});





    
});