<?php
include "../PHP/conexion.php";

$id = $_GET['id'];
$sql = "SELECT * FROM asesora WHERE id_asesoria=$id";
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
            <form class="formularioDialog" action="../PHP/updateAsesoria.php" id="formDialog" method="POST">
                <fieldset>
                    <legend class="legend"> Ingrese el nuevo valor en algún campo </legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id asesoria</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtId" id="txtId" readonly value="<?php echo $row2['id_asesoria'] ?>">
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Asesor</label>
                        <select class="dialogregistro__texto--select" name="cmbAsesor" id="cmbAsesor">
                            <option value="<?php echo $row2['asesor'] ?>">
                                <?php
                                $id_asesor = $_GET['id'];
                                $sql = "SELECT nombre, paterno, materno FROM abogado WHERE id_abogado=$id_asesor";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                    echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno'];
                                }
                                ?>
                            </option>

                            <?php
                            $id_asesor = $_GET['id'];
                            $sql = "SELECT id_abogado, nombre, paterno, materno FROM abogado WHERE id_abogado NOT IN (SELECT ase.asesor FROM asesora ase
                                    JOIN abogado a ON ase.asesor=a.id_abogado WHERE ase.id_asesoria=$id_asesor)";
                            $query = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_assoc($query)) {
                            ?>
                                <option value="<?php echo $row['id_abogado'] ?>"><?php echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Asesorado</label>
                        <select class="dialogregistro__texto--select" name="cmbAsesorado" id="cmbAsesorado">
                            <option value="<?php echo $row2['asesorado'] ?>">
                                <?php
                                $id_asesorado = $_GET['id'];
                                $sql = "SELECT nombre, paterno, materno FROM abogado a, asesora ase WHERE ase.asesorado=a.id_abogado and id_asesoria=$id_asesorado";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                    echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_asesorado = $_GET['id'];
                            $sql = "SELECT id_abogado, nombre, paterno, materno FROM abogado WHERE id_abogado NOT IN (SELECT ase.asesorado FROM asesora ase
                                    JOIN abogado a ON ase.asesorado=a.id_abogado WHERE ase.id_asesoria=$id_asesorado)";
                            $query = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_assoc($query)) {
                            ?>
                            <option value="<?php echo $row['id_abogado'] ?>"><?php echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno'] ?></option>
                            <?php } ?>

                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id asunto</label>
                        <select class="dialogregistro__texto--select" name="cmbAsunto" id="cmbAsunto">
                            <option value="<?php echo $row2['id_asunto'] ?>">
                                <?php
                                $id_asunto = $_GET['id'];
                                $sql = "SELECT asu.id_asunto AS asunto FROM asunto asu, asesora ase WHERE ase.id_asunto=asu.id_asunto and id_asesoria=$id_asunto";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                    echo $row['asunto'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_asesoria = $_GET['id'];
                            $sql = "SELECT asu.id_asunto AS asunto FROM asunto asu WHERE asu.id_asunto NOT IN (SELECT ase.id_asunto FROM asesora ase
                                    JOIN asunto asu ON ase.id_asunto=asu.id_asunto WHERE ase.id_asesoria=$id_asesoria) ORDER BY (asu.id_asunto) ASC";
                            $query = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_assoc($query)) {
                            ?>
                            <option value="<?php echo $row['asunto'] ?>"><?php echo $row['asunto'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Tema</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtTema" id="txtTema" required value="<?php echo $row2['tema'] ?>">
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Fecha</label>
                        <input class="dialogregistro__texto--input" type="date" name="txtFecha" id="txtFecha" required value="<?php echo $row2['fecha'] ?>">
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Hora</label>
                        <input class="dialogregistro__texto--input" type="time" name="txtHora" id="txtHora" required value="<?php echo $row2['hora'] ?>">
                    </div>
                </fieldset>
                <div class="dialogregistro__botones">
                    <input class="dialogregistro__boton--submit" type="submit" value="Modificar" name="btnModificar">
                    <a class="dialogregistro__boton--submit" href="../HTML/asesoria.php">Salir</a>
                </div>
            </form>
        <?php
    }
        ?>
        </div>
    </body>

    </html>