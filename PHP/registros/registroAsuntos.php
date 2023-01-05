<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $cliente = $_POST["cmbCliente"];
    $demandado = $_POST["cmbDemandado"];
    $abogado = $_POST["cmbAbogado"];
    $estado = $_POST["cmbEstado"];
    $asunto = $_POST["cmbAsunto"];
    $f_inicio = $_POST["txtFechaInicio"];
    $f_termino = $_POST["txtFechaFinal"];

    if (empty($cliente) && empty($demandado) && empty($abogado) && empty($estado) && empty($asunto) && empty($f_inicio) && empty($f_termino)) {
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
        if (empty($cliente)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un cliente",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($demandado)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un demandado",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($abogado)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un abogado",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($estado)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un estado",
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
        } else if (empty($f_inicio)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar la fecha de inicio",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($f_termino)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar la fecha de termino",
                    icon: "error",
                });
            </script>
        <?php
        } else if ($f_termino < $f_inicio) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "La fecha de inicio no debe ser mayor a la fecha final!",
                    icon: "error",
                });
            </script>
            <?php
        } else {
            $insertar = "INSERT INTO asunto (id_cliente, id_demandado, id_estado, id_tipo_asu, id_abogado, F_inicio, F_final) VALUES ('$cliente','$demandado','$estado','$asunto','$abogado','$f_inicio','$f_termino')";
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
                        window.location = "../HTML/asuntos.php"
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