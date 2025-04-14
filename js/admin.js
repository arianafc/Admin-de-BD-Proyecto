document.addEventListener("DOMContentLoaded", function () {
    $(document).on('click', '#btnAgregarAdmin', function(){
        console.log('hola');
        Swal.fire({
            title: 'Registrar Administrador',
            html: `
                <input type="text" id="cedulaAdmin" class="swal2-input" placeholder="ID Empleado">
                <input type="text" id="nombreAdmin" class="swal2-input" placeholder="Nombre">
                <input type="text" id="apellido1Admin" class="swal2-input" placeholder="Primer Apellido">
                <input type="text" id="apellido2Admin" class="swal2-input" placeholder="Segundo Apellido">
                <input type="email" id="emailAdmin" class="swal2-input" placeholder="Email">
                <input type="password" id="contrasenaAdmin" class="swal2-input" placeholder="Contraseña">
                <input type="password" id="confirmarAdmin" class="swal2-input" placeholder="Confirmar Contraseña">
            `,
            confirmButtonText: 'Registrar',
            showCancelButton: true,
            preConfirm: () => {
                const cedula = document.getElementById("cedulaAdmin").value.trim();
                const nombre = document.getElementById("nombreAdmin").value.trim();
                const apellido1 = document.getElementById("apellido1Admin").value.trim();
                const apellido2 = document.getElementById("apellido2Admin").value.trim();
                const contrasena = document.getElementById("contrasenaAdmin").value;
                const confirmar = document.getElementById("confirmarAdmin").value;
                const email = document.getElementById("emailAdmin").value.toLowerCase();

                if (!cedula || !nombre || !apellido1 || !apellido2 || !contrasena || !confirmar || !email) {
                    Swal.showValidationMessage("Todos los campos son obligatorios.");
                    return false;
                }


                if (contrasena.length < 8) {
                    Swal.showValidationMessage("La contraseña debe tener al menos 8 caracteres.");
                    return false;
                }

                if (contrasena !== confirmar) {
                    Swal.showValidationMessage("Las contraseñas no coinciden.");
                    return false;
                }



                return {
                    cedula,
                    nombre,
                    apellido1,
                    apellido2,
                    contrasena,
                    email
                };
            }
        }).then(result => {
            if (result.isConfirmed && result.value) {
                const { cedula, nombre, apellido1, apellido2, contrasena, email } = result.value;

                fetch("./data/get_registro.php", {
                    method: "POST",
                    headers: { "Content-Type": "application/x-www-form-urlencoded" },
                    body: new URLSearchParams({
                        cedula: cedula,
                        nombre: nombre,
                        apellido1: apellido1,
                        apellido2: apellido2,
                        contrasena: contrasena,
                        rol: 2,
                        email: email
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        Swal.fire({
                            icon: "success",
                            title: "Registro exitoso",
                            text: data.usuario
                                ? `Este es el usuario: ${data.usuario}`
                                : "Administrador registrado correctamente."
                        }).then(() => location.reload());
                    } else {
                        Swal.fire("Error", data.message || "Hubo un problema al registrar.", "error");
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    Swal.fire("Error", "Error de conexión al registrar.", "error");
                });
            }
        });
    });




















});