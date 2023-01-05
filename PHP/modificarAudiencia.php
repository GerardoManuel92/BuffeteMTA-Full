<?php
include "../PHP/conexion.php";

$id = $_GET['id'];
$sql = "SELECT * FROM audiencia WHERE id_audiencia=$id";
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
            <form class="formularioDialog" action="../PHP/updateAudiencia.php" id="formDialog" method="POST">
                <fieldset>
                    <legend class="legend"> Ingrese el nuevo valor en algún campo </legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id audiencia</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtId" id="txtId" value="<?php echo $row['id_audiencia']; ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Lugar</label>
                        <select class="dialogregistro__texto--select" name="cmbLugar" id="cmbLugar" required>
                            <option value="<?php echo $row['id_lugar'] ?>">
                                <?php
                                $id_lugar = $_GET['id'];
                                $csql = "SELECT l.descripcion as lugar FROM lugar l , audiencia aud WHERE l.id_lugar=aud.id_lugar AND aud.id_audiencia=$id_lugar";
                                $query2 = mysqli_query($conn, $csql);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                    echo $row2['lugar'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_lugar = $_GET['id'];
                            $sql = "SELECT l.id_lugar as id, l.descripcion AS nombre FROM lugar l WHERE l.id_lugar NOT IN (SELECT aud.id_lugar FROM audiencia aud
                                    JOIN lugar l ON aud.id_lugar=l.id_lugar WHERE aud.id_audiencia=$id_lugar) ORDER BY (l.id_lugar) ASC";
                            $query = mysqli_query($conn, $sql);
                            while ($row2 = mysqli_fetch_assoc($query)) {
                            ?>
                                <option value="<?php echo $row2['id'] ?>"><?php echo $row2['nombre'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Fecha</label>
                        <input class="dialogregistro__texto--input" type="date" name="txtFecha" id="txtFecha" value="<?php echo $row['fecha']; ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Hora</label>
                        <input class="dialogregistro__texto--input" type="time" name="txtHora" id="txtHora" value="<?php echo $row['hora']; ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Asunto</label>
                        <select class="dialogregistro__texto--select" name="cmbAsunto" id="cmbAsunto" required>
                            <option value="<?php echo $row['id_asunto'] ?>">
                                <?php
                                $id_asunto = $_GET['id'];
                                $csql = "SELECT asu.id_asunto as asunto FROM asunto asu , audiencia aud WHERE asu.id_asunto=aud.id_asunto AND aud.id_audiencia=$id_asunto";
                                $query2 = mysqli_query($conn, $csql);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                    echo $row2['asunto'];
                                }
                                ?>
                            </option>
                                <?php
                                $id_asunto = $_GET['id'];
                                $sql = "SELECT asu.id_asunto as id FROM asunto asu WHERE asu.id_asunto NOT IN (SELECT aud.id_asunto FROM audiencia aud
                                        JOIN asunto asu ON aud.id_asunto=asu.id_asunto WHERE aud.id_audiencia=$id_asunto) ORDER BY (asu.id_asunto) ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row2 = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row2['id'] ?>"><?php echo $row2['id'] ?></option>
                                <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Resolución</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtResolucion" id="txtResolucion" value="<?php echo $row['resolucion']; ?>" required>
                    </div>
                </fieldset>
                <div class="dialogregistro__botones">
                    <input class="dialogregistro__boton--submit" type="submit" value="Modificar" name="btnModificar">
                    <a class="dialogregistro__boton--submit" href="../HTML/audiencia.php">Salir</a>
                </div>
            </form>
        <?php } ?>
        </div>
    </body>

    </html>