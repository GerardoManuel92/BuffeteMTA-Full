<?php
include "../PHP/conexion.php";

$id = $_GET['id'];
$sql = "SELECT * FROM tipo WHERE id_tipo=$id";
$query = mysqli_query($conn, $sql);

while ($row = mysqli_fetch_assoc($query)) {
?>

    <!DOCTYPE html>
    <html lang="es">

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
        <title>Portal Buffete</title>
    </head>

    <body>
        <div class="dialog-encabezado">
            <img src="../logotipo.png" alt="logo">
            <h1>Actualización de registro</h1>
        </div>
        <div class="dialog-contenido">
            <form class="formularioDialog" action="../PHP/updateTipo.php" id="formDialog" method="POST">
                <fieldset>
                    <legend class="legend"> Ingrese el nuevo valor en algún campo </legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id tipo</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtId" id="txtId" value="<?php echo $row['id_tipo'] ?>" readonly>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Descripcion</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtDescripcion" id="txtDescripcion" value="<?php echo $row['descripcion'] ?>" required>
                    </div>                    
                </fieldset>
                <div class="dialogregistro__botones">
                    <input class="dialogregistro__boton--submit" type="submit" value="Modificar Tipo" name="btnModificar">
                    <a class="dialogregistro__boton--submit" href="../HTML/tipos.php">Salir</a>
                </div>
            </form>
        <?php
    }
        ?>
        </div>
    </body>

    </html>