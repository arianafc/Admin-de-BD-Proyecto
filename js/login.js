document.addEventListener("DOMContentLoaded", function () {
    $("#login-form").submit(function(event) {
        event.preventDefault(); // Evita que se recargue la página

        // Obtener los datos del formulario
        var cedula = $("#usernameLogin").val();
        var contrasena = $("#password").val();
        console.log(cedula);
        console.log(contrasena);

        $.post("./data/get_login.php", {
            username: cedula, password: contrasena
        }, function(response) {
            if (response.success) {
                // Si el login es exitoso, muestra el mensaje de éxito y redirige
                $("#error-message").hide();
                $("#error-message").removeClass("error");
                $("#error-message").html(response.message);
                $("#error-message").show();
                
                // Redirigir después de 1 segundo
                setTimeout(function() {
                    window.location.href = "index.html";  // Cambia por la URL a donde quieras redirigir
                }, 1000); // 1 segundo de retraso para mostrar el mensaje
            } else {
                // Si el login falla, muestra el mensaje de error
                console.log(response);
                $("#error-message").show();
                $("#error-message").addClass("error");
                $("#error-message").html(response.message);
            }
        }).fail(function() {
            // Si ocurre un error de conexión, muestra el mensaje
            $("#error-message").show();
            $("#error-message").addClass("error");
            $("#error-message").html("Error en la conexión.");
        });
    });
});
