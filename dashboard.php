<!DOCTYPE html>
<html lang="en">

<?php
session_start();
require_once 'fragmentos.php';
?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="js/java.js"></script>
    <?php incluir_css() ?>
</head>

<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <?php sidebar(); ?>
            <!-- Contenido -->
            <main id="content" class="col-md-10 ms-sm-auto px-md-4 content">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2 titulo-Content">DASHBOARD</h1>
                    <div class="profile position-relative" onclick="toggleDropdown()">
                        <span>ADMIN ▼</span>
                        <div class="dropdown position-absolute bg-white shadow border rounded mt-1 p-2 d-none" id="dropdownMenu" style="min-width: 150px;">
                            <a class="dropdown-item" href="logout.php"><i class="fas fa-sign-out-alt"></i> Logout</a>
                        </div>
                    </div>
                </div>

                <!-- Tarjetas informativas -->
                <div class="row">
                    <div class="col-md-3">
                        <div class="card text-white cardVerde mb-3">
                            <div class="card-body">
                                <h5 class="card-title">290+</h5>
                                <p class="card-text">Productos Registrados</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card cardCafe mb-3">
                            <div class="card-body">
                                <h5 class="card-title">23</h5>
                                <p class="card-text">Clientes</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card text-white cardVerde mb-3">
                            <div class="card-body">
                                <h5 class="card-title">5</h5>
                                <p class="card-text">Consultas</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card cardCafe mb-3">
                            <div class="card-body">
                                <h5 class="card-title">90</h5>
                                <p class="card-text">Socios</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Gráfico Power BI -->
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Sales Analytics</h5>
                        <iframe width="1000" height="600"
                            src="https://app.powerbi.com/reportEmbed?reportId=a3b53aa9-8365-4965-8ae9-d2990251432a&autoAuth=true&ctid=dde2fb8f-d8e0-445e-b851-e69c198c1e59"
                            frameborder="0" allowFullScreen="true"></iframe>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        document.getElementById("menu-toggle")?.addEventListener("click", function () {
            document.getElementById("sidebar").classList.toggle("show");
            document.getElementById("content").classList.toggle("shift");
        });

        const dropdownMenu = document.getElementById("dropdownMenu");

        function toggleDropdown() {
            dropdownMenu.classList.toggle("d-none");
        }

        document.addEventListener("click", function (event) {
            if (!event.target.closest(".profile")) {
                dropdownMenu.classList.add("d-none");
            }
        });
    </script>
</body>

</html>
