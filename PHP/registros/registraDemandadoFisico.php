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

    $Registrar = $_POST['btnRegistrar'];
    $RegistrarFisica = $_POST['btnRegistraFisica'];

    if (isset($Registrar)) {
        $direccion = $_POST["txtDireccion"];
        $tipo = $_POST["cmbTipo"];

        if (empty($direccion) && empty($tipo)) {
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
            if (empty($direccion)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar la direccion",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($tipo)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes seleccionar un tipo de demanda",
                        icon: "error",
                    });
                </script>
                <?php
            } else {

                $sql = "INSERT INTO demandado (direccion, id_tipo) VALUES ('$direccion','$tipo')";
                $resultado = mysqli_query($conn, $sql);
                if ($resultado) {
                ?>
                    <script>
                        swal({
                            title: "Exito!",
                            text: "Registro guardado correctamente",
                            icon: "success",
                        }).then(function() {
                            location.reload();
                            window.location = '../HTML/demandadoFisico.php';
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
    if (isset($RegistrarFisica)) {
        $id_demandado = $_POST["txtIdDemandado"];
        $nombre = $_POST["txtNombre"];
        $paterno = $_POST["txtPaterno"];
        $materno = $_POST["txtMaterno"];

        if (empty($id_demandado) && empty($nombre) && empty($paterno) && empty($materno)) {
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
            if (empty($id_demandado)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar un id de demandado",
                        icon: "error",
                    });
                </script>
            <?php
            } else if (empty($nombre)) {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Debes ingresar nombre completo",
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
            } else {
                $buscarId = "SELECT * FROM demandado WHERE id_demandado='$id_demandado'";
                $read = mysqli_query($conn, $buscarId);
                if ($busqueda = mysqli_fetch_assoc($read)) {
                    $sql = "INSERT INTO persona (id_demandado, paterno, materno, nombre) VALUES ('$id_demandado','$paterno','$materno','$nombre')";
                    $resultado = mysqli_query($conn, $sql);
                    if ($resultado) {
                ?>
                        <script>
                            swal({
                                title: "Exito!",
                                text: "Registro guardado correctamente",
                                icon: "success",
                            }).then(function() {
                                location.reload();
                                window.location = '../HTML/demandadoFisico.php';
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
                } else {
                    ?>
                    <script>
                        swal({
                            title: "Error!",
                            text: "El id ingresado no se encuentra registrado",
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