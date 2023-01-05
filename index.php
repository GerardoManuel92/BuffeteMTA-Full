<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../Buffete/CSS/style.css">    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="shortcut icon" href="../IMG/mta.ico">
    <title>MTA Login</title>
</head>

<body>
    <main class="contenedor">
        <div class="contenedor__logo">
            <img src="logotipo.png" alt="Logotipo" class="contenedor__logo--logotipo">
        </div>
        <div class="contenedor__campos">
            <form class="contenedor__campos--formulario" action="" method="POST">
                <h1 class="encabezado">Iniciar sesión</h1>
                <div class="campos">
                    <div class="campos__texto">
                        <label class="campos__texto--label" for="">Usuario:</label>
                        <input type="text" class="campos__texto--input" id="txtUsuario" name="txtUsuario">
                    </div>
                    <div class="campos__texto">
                        <label class="campos__texto--label" for="">Password:</label>
                        <input type="password" class="campos__texto--input" id="txtPassword" name="txtPassword">
                    </div>
                </div>
                <div class="campos__texto">
                    <input class="registro__boton--submit" type="submit" value="Entrar" name="btnEntrar">
                </div>
            </form>
            <p class="campos__texto--link"> Si no tienes cuenta <a class="link" href="../Buffete/HTML/registro.php">Registrarse</a></p>

        </div>

    </main>
</body>

</html>
<?php include "../Buffete/PHP/login.php";?>
