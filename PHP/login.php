<?php

include "conexion.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $btnEntrar = $_POST['btnEntrar'];
    if (isset($btnEntrar)) {
        $usuario = $_POST["txtUsuario"];
        $password = $_POST["txtPassword"];

        $sql = "SELECT nombre, paterno, materno FROM usuarios WHERE n_usuario='" . $usuario . "' and u_password ='" . $password . "'";

        $resultado = mysqli_query($conn, $sql);


        if ($log = mysqli_fetch_assoc($resultado)) {
            $_SESSION["txtUsuario"] = $log["nombre"].' '.$log["paterno"].' '.$log["materno"];
            $_SESSION["txtPassword"] = $log["u_password"];

            //echo "<script>alert('Autenticacion exitosa'); window.location='../HTML/menu.php';</script>";
?>
            <script>
                swal(
                    'Exito!',
                    'Autentificación exitosa!',
                    'success',
                ).then(function() {
                    window.location = '../Buffete/HTML/menu.php';
                });
            </script>
        <?php
        
        
            //header('location:../HTML/menu.php');  
        } else {
            //echo "<script> alert('Credenciales incorrectas'); window.location='../HTML/index.php';</script>";
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Autentificación fallida!",
                    icon: "error",
                });
            </script>
<?php

        }
    }
}
mysqli_close($conn);
?>