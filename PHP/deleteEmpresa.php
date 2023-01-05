<?php
include "conexion.php";
?>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../CSS/style.css">
    <link rel="stylesheet" href="../node_modules/sweetalert2/dist/sweetalert2.min.css">
    <script src="../node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="shortcut icon" href="../IMG/mta.ico">
    <title>Portal Buffete</title>
</head>
</html>

<?php

$id = $_GET['id'];
$sql = "DELETE empresa FROM empresa JOIN demandado ON empresa.id_demandado=demandado.id_demandado AND demandado.id_demandado='$id'";
$resultado = mysqli_query($conn, $sql);

if ($resultado) {
?>
    <script>
        swal({
            title: "Exito!",
            text: "Se ha eliminado al demandado del sistema",
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
            text: "Error al eliminar registro",
            icon: "error",
        }).then(function() {
            location.reload();
            window.location = "../HTML/demandadoMoral.php"
        });
    </script>
<?php
}
mysqli_close($conn);
?>