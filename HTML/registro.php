<?php
include "../PHP/conexion.php";
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
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="shortcut icon" href="../IMG/mta.ico">
    <title>MTA Registrarse</title>    
</head>

<body>
    <main class="contenedor-registro">
        <div class="logo-registro">
            <img src="../IMG/logotipo.png" alt="" class="contenedor__logo--logotipo">
        </div>
        <div class="registro-campos">
            <h1 class="encabezado">Por favor llene el formulario</h1>
            <form class="formulario-registro" action="" method="POST">
                <legend>**Todos los campos son obligatorios**</legend>
                <div class="campos">                    
                    <div class="campos__texto">
                        <label class="campos__texto--label" for="">Usuario</label>
                        <input class="campos__texto--input" type="text" name="txtUsuario" id="txtUsuario">
                    </div>
                    <div class="campos__texto">
                        <label class="campos__texto--label" for="">Password</label>
                        <input class="campos__texto--input" type="password" name="txtPassword1" id="txtPassword1">
                    </div>
                    <div class="campos__texto">
                        <label class="campos__texto--label" for="">Confirmar Password</label>
                        <input class="campos__texto--input" type="password" name="txtPassword2" id="txtPassword2">
                    </div> 
                    <div class="campos__texto">
                        <label for=""></label>
                        <input class="registro__boton--submit botonRegistro" type="submit" value="Registrar">
                    </div>                   
                </div>
            </form>           
            <a class="link" href="../index.php">Regresar a menú</a>
        </div>
    </main>
</body>

</html>
<?php include "../PHP/registros/registroUsuarios.php"; ?>