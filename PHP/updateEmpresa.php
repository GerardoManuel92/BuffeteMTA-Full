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
        $direccion = $_POST["txtDireccion"];
        $tipo = $_POST["cmbTipo"];
        $empresa = $_POST["txtEmpresa"];
        

        $sql = "UPDATE demandado SET direccion='$direccion', id_tipo='$tipo' WHERE id_demandado='$id'";
        $resultado = mysqli_query($conn, $sql);
        $sql = "UPDATE empresa SET razon_social='$empresa' WHERE id_demandado='$id'";
        $resultado = mysqli_query($conn, $sql);        

        if ($resultado) {
?>
            <script>
                swal({
                    title: "Exito!",
                    text: "Actualización realizada con éxito",
                    icon: "success",
                }).then(function() {
                    location.reload();
                    window.location = "../HTML/demandadoMoral.php"
                });
            </script>
        <?php

        } else {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Error al modificar datos del cliente",
                    icon: "error",
                }).then(function() {                    
                    window.location = "../PHP/modificarPerMoral.php"
                });
            </script>
<?php
        }
    }
}
mysqli_close($conn);
?>