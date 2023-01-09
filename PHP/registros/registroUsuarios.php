<?php


if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre = $_POST['txtNombre'];
    $paterno = $_POST['txtPaterno'];
    $materno = $_POST['txtMaterno'];
    $usuario = $_POST['txtUsuario'];
    $password1 = $_POST['txtPassword1'];
    $password2 = $_POST['txtPassword2'];

    if (empty($nombre) && empty($paterno) && empty($materno) && empty($usuario) && empty($password1) && empty($password2)) {
?>
        <script>
            swal({
                title: "Error!",
                text: "Debes ingresar datos validos",
                icon: "error",
            });
        </script>
        <?php
    } else {
        if (empty($nombre)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar tu nombre completo",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($paterno)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar tu apellido paterno",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($materno)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar tu apellido materno",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($usuario)) {
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
        } else {
            $sql = "INSERT INTO usuarios (nombre, paterno, materno, n_usuario, u_password) VALUES ('$nombre', '$paterno', '$materno', '$usuario','$password2')";
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