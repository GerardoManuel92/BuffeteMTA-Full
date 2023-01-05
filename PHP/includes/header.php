<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../node_modules/sweetalert2/dist/sweetalert2.min.css">
    <script src="../node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="shortcut icon" href="../IMG/mta.ico">
    <title>Portal Buffete</title>
</head>
<header class="cabezal">
    <div class="cabezal__logo">
        <a href="../HTML/menu.php"><img class="cabezal__logo--logo" src="../IMG/logotipo.png" alt="Logotipo"></a>
    </div>
    <div class="navegador__menu">
        <ul class="menu-horizontal">
            <li><a href="">Archivo</a>
                <ul class="menu-vertical">
                    <li><a class="navegador__menu--link" href="../HTML/abogados.php">Abogados</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/asesoria.php">Asesorias</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/audiencia.php">Audiencia</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/asuntos.php">Asuntos</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/clientes.php">Clientes</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/tipoDemandado.php">Demandados</a></li>
                </ul>
            </li>
            <li><a class="navegador__menu--link" href="#">Datos</a>
                <ul class="menu-vertical">
                    <li><a class="navegador__menu--link" href="../HTML/consultaRegistros.php">Consultas</a></li>
                </ul>
            </li>
            <li><a class="navegador__menu--link" href="#">Extra</a>
                <ul class="menu-vertical">
                    <li><a class="navegador__menu--link" href="../HTML/estados.php">Estados de Asuntos</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/estudios.php">Grados Académicos</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/lugares.php">Lugares de Audiencias</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/tipos.php">Tipos asuntos para demandas</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/tiposAsuntos.php">Tipos de Asuntos</a></li>
                    <li><a class="navegador__menu--link" href="../index.php">Salir</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="navegador__sesion finsesion">
        <a class="navegador__menu--link" href="../index.php">Cerrar sesion</a>
    </div>
</header>