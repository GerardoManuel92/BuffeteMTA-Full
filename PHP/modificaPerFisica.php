<?php
include "../PHP/conexion.php";

$id = $_GET['id'];
$sql = "SELECT d.id_demandado AS id, d.direccion AS direccion, d.id_tipo AS tipo, p.nombre AS nombre,
p.paterno AS paterno, p.materno AS materno FROM demandado d JOIN persona p WHERE d.id_demandado = p.id_demandado
AND p.id_demandado=$id";
$query = mysqli_query($conn, $sql);

while ($row2 = mysqli_fetch_assoc($query)) {
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
            <form class="formularioDialog" action="../PHP/updatePersona.php" id="formDialog" method="POST">
                <fieldset>
                    <legend class="legend"> Datos personales </legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id demandado</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtId" id="txtId" value="<?php echo $row2['id'] ?>" readonly>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Nombre</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtNombre" id="txtNombre" value="<?php echo $row2['nombre'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Apellido Paterno</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtPaterno" id="txtPaterno" value="<?php echo $row2['paterno'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Apellido Materno</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtMaterno" id="txtMaterno" value="<?php echo $row2['materno'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Direccion</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtDireccion" id="txtDireccion" value="<?php echo $row2['direccion'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id tipo</label>
                        <select class="dialogregistro__texto--select" name="cmbTipo" id="cmbTipo">
                            <option value="<?php echo $row2['tipo'] ?>" selected>
                                <?php
                                $id_tipo = $_GET['id'];
                                $sql = "SELECT t.descripcion AS tipo FROM tipo t, demandado d WHERE d.id_tipo=t.id_tipo AND d.id_tipo=$id_tipo GROUP BY(tipo)";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                    echo $row['tipo'];
                                }
                                ?></option>

                            <?php
                            $id_tipo = $_GET['id'];
                            $sql = "SELECT t.id_tipo AS id_tipo, t.descripcion AS tipo FROM tipo t WHERE t.id_tipo NOT IN (SELECT d.id_tipo FROM demandado d JOIN tipo t ON d.id_tipo = t.id_tipo WHERE d.id_tipo = $id_tipo)";
                            $query = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_assoc($query)) {
                            ?>
                                <option value="<?php echo $row['id_tipo'] ?>">
                                <?php
                                echo $row['tipo'];
                            } ?>
                                </option>
                        </select>
                    </div>                    
                </fieldset>               
                <div class="dialogregistro__botones">
                    <input class="dialogregistro__boton--submit" type="submit" value="Modificar Persona" name="btnModificar">
                    <a class="dialogregistro__boton--submit" href="../HTML/demandadoFisico.php">Salir</a>
                </div>
            </form>

        <?php
    }
        ?>
        </div>
    </body>

    </html>