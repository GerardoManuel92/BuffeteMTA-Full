<?php
session_start();
?>
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
    <link rel="shortcut icon" href="../IMG/mta.ico">
    <title>Menu Principal</title>
</head>
<nav class="navegador">
    <div class="navegador__menu">
        <ul class="menu-horizontal">
            <li><a href="">Archivo</a>
                <ul class="menu-vertical">
                    <li><a class="navegador__menu--link" href="abogados.php">Abogados</a></li>
                    <li><a class="navegador__menu--link" href="asesoria.php">Asesorias</a></li>
                    <li><a class="navegador__menu--link" href="audiencia.php">Audiencia</a></li>
                    <li><a class="navegador__menu--link" href="asuntos.php">Asuntos</a></li>
                    <li><a class="navegador__menu--link" href="clientes.php">Clientes</a></li>
                    <li><a class="navegador__menu--link" href="tipoDemandado.php">Demandados</a></li>
                </ul>
            </li>
            <li><a class="navegador__menu--link" href="#">Datos</a>
                <ul class="menu-vertical">
                    <li><a class="navegador__menu--link" href="consultaRegistros.php">Consultas</a></li>
                </ul>
            </li>
            <li><a class="navegador__menu--link" href="#">Extra</a>
                <ul class="menu-vertical">
                    <li><a class="navegador__menu--link" href="../HTML/estados.php">Estados de Asuntos</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/estudios.php">Grados Académicos</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/lugares.php">Lugares de Audiencias</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/tipos.php">Tipos de asuntos para demandas</a></li>
                    <li><a class="navegador__menu--link" href="../HTML/tiposAsuntos.php">Tipos de Asuntos</a></li>
                    <li><a class="navegador__menu--link" href="../index.php">Cerrar sesión</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="navegador__sesion">            
        <a class="navegador__menu--link usuario" href="#" style="text-decoration: none;"> Usuario: <?php echo $_SESSION['txtUsuario']?></a>
    </div>
</nav>

<body>
    <main class="contenedor-menu">
        <div class="contenedor-menu--img">            
            <img class="img" src="../IMG/logotipo.png" alt="">
        </div>
    </main>
</body>

</html>