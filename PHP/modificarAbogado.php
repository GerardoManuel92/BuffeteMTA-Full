<?php
include "../PHP/conexion.php";

$id = $_GET['id'];
$sql = "SELECT * FROM abogado WHERE id_abogado=$id";
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
            <form class="formularioDialog" action="../PHP/updateAbogado.php" id="formDialog" method="POST">
                <fieldset>
                    <legend class="legend"> Ingrese el nuevo valor en algún campo </legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id abogado</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtId" id="txtId" value="<?php echo $row['id_abogado'] ?>" readonly>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Nombre</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtNombre" id="txtNombre" value="<?php echo $row['nombre'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Apellido Paterno</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtPaterno" id="txtPaterno" value="<?php echo $row['paterno'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Apellido Materno</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtMaterno" id="txtMaterno" value="<?php echo $row['materno'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">RFC</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtRFC" id="txtRFC" value="<?php echo $row['RFC'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Cédula</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtCedula" id="txtCedula" value="<?php echo $row['cedula'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Grado</label>
                        <select class="dialogregistro__texto--select" name="cmbGrado" id="cmbGrado">


                            <option value="<?php echo $row['id_grado'] ?>" selected>
                                <?php
                                $id_grado = $_GET['id'];
                                $sql = "SELECT e.descripcion AS grado FROM estudio e, abogado a WHERE a.id_grado=e.id_grado AND a.id_abogado=$id_grado";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                    echo $row['grado'];
                                }
                                ?></option>

                            <?php
                            $id_abogado = $_GET['id'];
                            $sql = "SELECT e.id_grado AS id_grado, e.descripcion AS grados FROM estudio e WHERE e.id_grado NOT IN (SELECT a.id_grado FROM abogado a JOIN estudio e ON a.id_grado = e.id_grado WHERE a.id_abogado = $id_abogado)";
                            $query = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_assoc($query)) {
                            ?>
                                <option value="<?php echo $row['id_grado'] ?>">
                                <?php
                                echo $row['grados'];
                            } ?>
                                </option>
                        </select>
                    </div>
                </fieldset>
                <div class="dialogregistro__botones">
                    <input class="dialogregistro__boton--submit" type="submit" value="Modificar" name="btnModificar">
                    <a class="dialogregistro__boton--submit" href="../HTML/abogados.php">Salir</a>
                </div>
            </form>
        <?php
    }
        ?>
        </div>
    </body>

    </html>