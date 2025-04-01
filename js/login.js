function loginUsuario() {
    // Obtener los datos del formulario
    const cedula = document.getElementById("cedula").value;
    const password = document.getElementById("password").value;

    // Enviar los datos al servidor
    fetch("admin-de-bd-proyecto/data/get_login.php", {

        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            cedula: cedula,
            password: password
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.length === 0) {
            alert("Credenciales incorrectas. Intenta de nuevo.");
        } else {
            // Procesar el resultado
            const usuario = data[0];
            console.log("Usuario validado:", usuario);
            // Aquí puedes redirigir al usuario a la página principal o su perfil
            window.location.href = "home.php";  // Ejemplo de redirección
        }
    })
    .catch(error => {
        console.error("Error al validar el login:", error);
        alert("Hubo un error en el proceso de login. Intenta más tarde.");
    });
}

// Asignar la función al evento de clic del botón de login
document.getElementById("loginButton").addEventListener("click", loginUsuario);
