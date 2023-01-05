<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $usuario = $_POST['txtUsuario'];
    $password1 = $_POST['txtPassword1'];
    $password2= $_POST['txtPassword2'];

    if(empty($usuario) && empty($password1) && empty($password2)){                
        ?>
        <script>
            swal({
                title: "Error!",
                text: "Debes ingresar datos validos",
                icon: "error",
            });
        </script>
        <?php 
    }  else{ 
            if(empty($usuario)){                
            ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar un nombre de usuario",
                    icon: "error",
                });
            </script>
            <?php
        } else if (empty($password1)) {
            ?>
            <script>
                swal({
                title: "Error!",
                text: "Debes ingresar tu password",
                icon: "error",
            });
            </script>
            <?php
        } else if (empty($password2)) {
            ?>
            <script>
                swal({
                title: "Error!",
                text: "Debes confirmar tu password",
                icon: "error",
            });
            </script>
            <?php
        } else if ($password2 !== $password1) {
            ?>
            <script>
                swal({
                title: "Error!",
                text: "Los password no coinciden, favor de validar",
                icon: "error",
            });
            </script>
            <?php
        } else{
            $sql = "INSERT INTO usuarios (n_usuario, u_password) VALUES ('$usuario','$password2')";
            $resultado = mysqli_query($conn, $sql);
                if ($resultado) {
                ?>
                <script>
                    swal({
                        title: "Exito!",
                        text: "Registro guardado correctamente",
                        icon: "success",
                    });
                </script>
                <?php
            } else {
                ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Error al guardar registro",
                        icon: "error",
                    });
                </script>
                <?php
            }    
        }
    }
}

mysqli_close($conn);
?>