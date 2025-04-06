document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("login-form");
    
    if (!form) {
        console.error("Error: No se encontró el formulario #login-form");
        return;
    }

    form.addEventListener("submit", function(event) {
        event.preventDefault(); // Evita que se recargue la página

        // Obtener los datos del formulario
        var cedula = document.getElementById("usernameLogin").value;
        var contrasena = document.getElementById("password").value;

        if (!cedula || !contrasena) {
            alert("Debes llenar ambos campos");
            return;
        }

        console.log("Cedula:", cedula);
        console.log("Contraseña:", contrasena);

        // Enviar datos al servidor con Fetch API en vez de jQuery (opcional)
        fetch("./data/get_login.php", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({ username: cedula, password: contrasena })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                window.location.href = data.redirect;
            } else {
                alert(data.message); 
            }
        })
        .catch(error => console.error("Error en la conexión:", error));
        
        
    });

});
 