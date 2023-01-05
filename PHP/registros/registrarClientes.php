<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../node_modules/sweetalert2/dist/sweetalert2.min.css">
    <script src="../node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="shortcut icon" href="../IMG/mta.ico">

</head>

</html>
<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $RegistraCliente = $_POST['btnRegistraCliente'];
    $RegistrarContacto = $_POST['btnRegistraContacto'];

    if (isset($RegistraCliente)) {

        $idCliente = $_POST['txtId'];
        $nombre = $_POST["txtNombre"];
        $paterno = $_POST["txtPaterno"];
        $materno = $_POST["txtMaterno"];
        $curp = $_POST["txtCurp"];
        $RFC = $_POST["txtRFC"];



        if (empty($nombre) && empty($paterno) && empty($materno) && empty($curp) && empty($RFC)) {
?>
            <script>
                //alert('El formulario se encuentra vacio');
                swal({
                    title: "Error!",
                    text: "El formulario se encuentra vacio",
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
                        text: "Debes ingresar el o los nombres",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($paterno)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar el apellido paterno",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($materno)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar el apellido materno",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($curp)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar el CURP",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($RFC)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar un RFC",
                        icon: "error",
                    });
                </script>
                <?php
            } else {
                $sql = "INSERT INTO cliente (paterno, materno, nombre, CURP, RFC) VALUES ('$paterno','$materno','$nombre','$curp','$RFC')";
                $resultado = mysqli_query($conn, $sql);
                $sql = "INSERT INTO contacto (id_cliente) VALUES ('$idCliente')";
                $resultado = mysqli_query($conn, $sql);
                if ($resultado) {
                ?> <script>
                        swal({
                            title: "Exito!",
                            text: "Registro guardado correctamente",
                            icon: "success",
                        }).then(function() {
                            location.reload();
                            window.location = "../HTML/clientes.php";
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
    }else if (isset($RegistrarContacto)) {

        $idContacto = $_POST['txtIdContacto'];
        $facebook = $_POST["txtFacebook"];
        $telefono = $_POST["txtTelefono"];
        $correo = $_POST["txtEmail"];
        



        if (empty($idContacto) && empty($facebook) && empty($telefono) && empty($correo)) {
?>
            <script>
                //alert('El formulario se encuentra vacio');
                swal({
                    title: "Error!",
                    text: "No hay información de contacto para registrar",
                    icon: "error",
                });
            </script>
            <?php
        } else {
            if (empty($idContacto)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "No hay un id de contacto a asociar",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($facebook)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar una cuenta de facebook",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($telefono)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar un número telefónico",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($correo)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar un correo electrónico",
                        icon: "error",
                    });
                </script>
            <?php
            } else {
                $sql = "INSERT INTO facebook VALUES ('$idContacto','$facebook')";
                $resultado = mysqli_query($conn, $sql);
                $sql = "INSERT INTO telefono VALUES ('$idContacto','$telefono')";
                $resultado = mysqli_query($conn, $sql);
                $sql = "INSERT INTO correo VALUES ('$idContacto','$correo')";
                $resultado = mysqli_query($conn, $sql);
                if ($resultado) {
                ?> <script>
                        swal({
                            title: "Exito!",
                            text: "Contacto guardado correctamente",
                            icon: "success",
                        }).then(function() {
                            location.reload();
                            window.location = "../HTML/clientes.php";
                        });
                    </script>
                <?php

                } else {
                ?>
                    <script>
                        swal({
                            title: "Error!",
                            text: "Error al guardar contacto",
                            icon: "error",
                        });
                    </script>
<?php
                }
            }
        }
    }
}

mysqli_close($conn);
?>