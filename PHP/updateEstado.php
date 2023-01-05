<?php

include "conexion.php";

?>
<!DOCTYPE html>
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
        $descripcion = $_POST["txtDescripcion"];        

        $sql = "UPDATE estado SET descripcion='$descripcion' WHERE id_estado='$id'";
        $resultado = mysqli_query($conn, $sql);

        if ($resultado) {
?>
            <script>
                swal({
                    title: "Exito!",
                    text: "Registro modificado correctamente",
                    icon: "success",
                }).then(function() {
                    location.reload();
                    window.location = "../HTML/estados.php"
                });
            </script>
        <?php

        } else {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Error al modificar registro",
                    icon: "error",
                }).then(function() {
                    location.reload();
                    window.location = "../PHP/modificarEstado.php"
                });
            </script>
<?php
        }
    }
}
mysqli_close($conn);
?>