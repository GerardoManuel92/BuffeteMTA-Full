<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $nombre = $_POST["txtNombre"];
    $paterno = $_POST["txtPaterno"];
    $materno = $_POST["txtMaterno"];
    $RFC = $_POST["txtRFC"];
    $Cedula = $_POST["txtCedula"];
    $grado = $_POST["cmbGrado"];

    if (empty($nombre) && empty($paterno) && empty($materno) && empty($RFC) && empty($Cedula) && empty($grado)) {
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
                    text: "Debes confirmar el apellido materno",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($RFC)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar el RFC",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($Cedula)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar la cedula profesional",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($grado)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar el grado academico",
                    icon: "error",
                });
            </script>
            <?php
        } else {
            $insertar = "INSERT INTO abogado (paterno, materno, nombre, RFC, cedula, id_grado) VALUES ('$paterno','$materno','$nombre','$RFC','$Cedula','$grado')";
            $resultado = mysqli_query($conn, $insertar);
            if ($resultado) {
            ?>
                <script>
                    swal({
                        title: "Exito!",
                        text: "Registro guardado correctamente",
                        icon: "success",
                    }).then(function() {
                        location.reload();
                        window.location="../HTML/abogados.php"
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