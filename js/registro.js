document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("registro-form");

    if (!form) {
        console.error("Error: No se encontró el formulario #registro-form");
        return;
    }

    form.addEventListener("submit", function (event) {
        event.preventDefault(); // Prevenir recarga de página

        // Obtener los valores del formulario
        const cedula = document.getElementById("cedulaRegistro").value.trim();
        const nombre = document.getElementById("nombre").value.trim();
        const apellido1 = document.getElementById("apellido1").value.trim();
        const apellido2 = document.getElementById("apellido2").value.trim();
        const contrasena = document.getElementById("contrasenaRegistro").value;
        const confirmar = document.getElementById("confirmarContrasena").value;
        
        if (!cedula || !nombre || !apellido1 || !apellido2 || !contrasena || !confirmar) {
            alert("Todos los campos son obligatorios.");
            return;
        }
        
        if (contrasena !== confirmar) {
            alert("Las contraseñas no coinciden.");
            return;
        }
        


        if (!cedula || !nombre || !apellido1 || !apellido2 || !contrasena) {
            alert("Todos los campos son obligatorios.");
            return;
        }

        console.log("Datos del registro:", { cedula, nombre, apellido1, apellido2 });

        // Enviar los datos al backend
        fetch("./data/get_registro.php", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({
                cedula: cedula,
                nombre: nombre,
                apellido1: apellido1,
                apellido2: apellido2,
                contrasena: contrasena
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                
                alert("Registro exitoso. Ahora puedes iniciar sesión.");
                window.location.href = "./login.php"; // Ajustá según tu estructura
            } else {
                alert("Error al registrar: " + data.message);
                if (data.detail) console.error("Detalle:", data.detail);
            }
        })
        .catch(error => {
            console.error("Error en la conexión:", error);
            alert("Hubo un problema al intentar registrar el usuario.");
        });
    });
});
