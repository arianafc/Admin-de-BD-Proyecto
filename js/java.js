



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
        $("#cabanas").css("display", "block");
        $("#salones").css("display", "none");
        $("#ranchos").css("display", "none");

    });

    $(document).on('click', '#btnSalones', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnRanchos").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#salones").css("display", "block");
        $("#cabanas").css("display", "none");
        $("#ranchos").css("display", "none");
    });

    $(document).on('click', '#btnRanchos', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnCabana").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnSalones").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#ranchos").css("display", "block");
        $("#salones").css("display", "none");
        $("#cabanas").css("display", "none");
    });

    $(document).on('click', '#btnReservar', function(){
        $("#myModal").css("display", "flex");
    })

      // When the user clicks anywhere outside of the modal, close it
  
      $(document).on('click', '#close', function(){
        $("#myModal").css("display", "none");
        $("#modalDeportes").css("display", "none");
    })


    $(document).on('click', '#btnBasket', function
        () {

        this.classList.remove('btnReservas');
        this.classList.add('btnReservas-Activo');
        $("#btnBasket").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnVolley").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#basket").css("display", "block");
        $("#sintetica").css("display", "none");
        $("#volley").css("display", "none");

    });

    $(document).on('click', '#btnVolley', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnBasket").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnSintetica").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#volley").css("display", "block");
        $("#basket").css("display", "none");
        $("#sintetica").css("display", "none");
    });

    $(document).on('click', '#btnSintetica', function () {
        $(this).removeClass('btnReservas').addClass('btnReservas-Activo');
        $("#btnVolley").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#btnBasket").removeClass('btnReservas-Activo').addClass('btnReservas');
        $("#sintetica").css("display", "block");
        $("#volley").css("display", "none");
        $("#basket").css("display", "none");
    });

    $(document).on('click', '#btnReservarDeportes', function(){
        $("#modalDeportes").css("display", "flex");
    })
});






























