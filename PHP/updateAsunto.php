<?php

include "conexion.php";

?>

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

    $btnModificar = $_POST['btnModificar'];

    if (isset($btnModificar)) {
        $id = $_POST["txtId"];
        $cliente = $_POST["cmbCliente"];
        $demandado = $_POST["cmbDemandado"];
        $abogado = $_POST["cmbAbogado"];
        $estado = $_POST["cmbEstado"];
        $asunto = $_POST["cmbAsunto"];
        $fechaI = $_POST["txtFechaInicio"];
        $fechaT = $_POST["txtFechaFinal"];

        $sql = "UPDATE asunto SET id_cliente='$cliente', id_demandado='$demandado', id_estado='$estado', id_tipo_asu='$asunto', id_abogado='$abogado', F_inicio='$fechaI', F_final='$fechaT' WHERE id_asunto='$id'";
        $resultado = mysqli_query($conn, $sql);

        if ($fechaT < $fechaI) {
?>
            <script>
                swal({
                    title: "Error!",
                    text: "La fecha de inicio no debe ser mayor a la fecha final!",
                    icon: "error",
                }).then(function() {
                    location.reload();
                    window.location = "../PHP/modificarAsunto.php"
                });
            </script>
            <?php

        } else {
            if ($resultado) {
            ?>
                <script>
                    swal({
                        title: "Exito!",
                        text: "Asunto modificado correctamente",
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
                        text: "Error al modificar asunto",
                        icon: "error",
                    }).then(function() {
                        location.reload();
                        window.location = "../PHP/modificarAsunto.php"
                    });
                </script>
<?php
            }
        }
    }
}
mysqli_close($conn);
?>