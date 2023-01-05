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
        $asesor = $_POST["cmbAsesor"];
        $asesorado = $_POST["cmbAsesorado"];
        $asunto = $_POST["cmbAsunto"];
        $tema = $_POST["txtTema"];
        $fecha = $_POST["txtFecha"];
        $hora = $_POST["txtHora"];

        $sql = "UPDATE asesora SET fecha='$fecha',tema='$tema', hora='$hora', id_asunto='$asunto', asesor='$asesor', asesorado='$asesorado' WHERE id_asesoria='$id'";
        $resultado = mysqli_query($conn, $sql);

        if ($resultado) {
?>
            <script>
                swal({
                    title: "Exito!",
                    text: "Asesoria modificada correctamente",
                    icon: "success",
                }).then(function() {
                    location.reload();
                    window.location = "../HTML/asesoria.php"
                });
            </script>
        <?php

        } else {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Error al modificar asesoria",
                    icon: "error",
                }).then(function() {
                    location.reload();
                    window.location = "../PHP/modificarAsesoria.php"
                });
            </script>
<?php
        }
    }
}
mysqli_close($conn);
?>