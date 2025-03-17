



document.addEventListener("DOMContentLoaded", function () {
    let links = document.querySelectorAll(".opciones a");
    let currentUrl = window.location.pathname.split("/").pop(); // Obtiene el nombre del archivo actual

    links.forEach(link => {
        if (link.getAttribute("href") === currentUrl) {
            link.classList.add("active"); // Agrega la clase 'active' al enlace actual
        }
    });



    $(document).on('click', '#btnCabana', function
        () {

        this.classList.remove('btnReservas');
        this.classList.add('btnReservas-Activo');
        $("#btnSalones").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnRanchos").removeClass('btnReservas-Activo').addClass('btnReservas');
    });

    $(document).on('click', '#btnSalones', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnRanchos").removeClass('btnReservas-Activo').addClass('btnReservas');
    });

    $(document).on('click', '#btnRanchos', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnSalones").removeClass('btnReservas-Activo').addClass('btnReservas');
    });
});






























