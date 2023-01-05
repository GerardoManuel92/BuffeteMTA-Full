<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $asesor = $_POST["cmbAsesor"];
    $asesorado = $_POST["cmbAsesorado"];
    $asunto = $_POST["cmbAsunto"];
    $tema = $_POST["txtTema"];
    $fecha = $_POST["txtFecha"];
    $hora = $_POST["txtHora"];


    if (empty($asesor) && empty($asesorado) && empty($asunto) && empty($tema) && empty($hora) && empty($fecha)) {
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
        if (empty($asesor)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un asesor",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($asesorado)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un asesorado",
                    icon: "error",
                });
            </script>
        <?php
        } else if ($asesor === $asesorado) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "El asesor no puede asesorarse a si mismo",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($asunto)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un asunto",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($tema)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar una deescripción del tema",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($fecha)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar una fecha",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($hora)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes establecer una hora",
                    icon: "error",
                });
            </script>
            <?php
        } else {
            $sql = "INSERT INTO asesora (fecha, tema, hora, id_asunto, asesor, asesorado) VALUES ('$fecha','$tema','$hora','$asunto','$asesor','$asesorado')";
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
                        window.location = '../HTML/asesoria.php';
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