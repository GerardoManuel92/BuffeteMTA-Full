<?php
include "../PHP/conexion.php";

$id = $_GET['id'];
$sql = "SELECT * FROM asunto WHERE id_asunto=$id";
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
            <form class="formularioDialog" action="../PHP/updateAsunto.php" id="formDialog" method="POST">
                <fieldset>
                    <legend class="legend"> Ingrese el nuevo valor en algún campo </legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id asunto</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtId" id="txtId" value="<?php echo $row['id_asunto'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Cliente</label>
                        <select class="dialogregistro__texto--select" name="cmbCliente" id="cmbCliente" required>
                            <option value="<?php echo $row['id_cliente'] ?>">
                                <?php
                                $id_cliente = $_GET['id'];
                                $csql = "SELECT cl.nombre as nombre, cl.paterno AS paterno, cl.materno AS materno FROM cliente cl , asunto asu WHERE asu.id_cliente=cl.id_cliente AND asu.id_asunto=$id_cliente";
                                $query2 = mysqli_query($conn, $csql);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                    echo $row2['nombre'] . ' ' . $row2['paterno'] . ' ' . $row2['materno'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_cliente = $_GET['id'];
                            $sql = "SELECT cl.id_cliente as id, cl.nombre as nombre, cl.paterno AS paterno, cl.materno AS materno FROM cliente cl WHERE cl.id_cliente NOT IN (SELECT asu.id_cliente FROM asunto asu
                                        JOIN cliente cl ON asu.id_cliente=cl.id_cliente WHERE asu.id_asunto=$id_cliente) ORDER BY (cl.id_cliente) ASC";
                            $query = mysqli_query($conn, $sql);
                            while ($row2 = mysqli_fetch_assoc($query)) {
                            ?>
                                <option value="<?php echo $row2['id'] ?>"><?php echo $row2['nombre'] . ' ' . $row2['paterno'] . ' ' . $row2['materno'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Demandado</label>
                        <select class="dialogregistro__texto--select" name="cmbDemandado" id="cmbDemandado" required>
                            <option value="<?php echo $row['id_demandado'] ?>">
                                <?php
                                $id_demandado = $_GET['id'];
                                $csql = "SELECT per.nombre as nombre, per.paterno AS paterno, per.materno AS materno FROM persona per , asunto asu WHERE asu.id_demandado=per.id_demandado AND asu.id_asunto=$id_cliente";
                                $query2 = mysqli_query($conn, $csql);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                    echo $row2['nombre'] . ' ' . $row2['paterno'] . ' ' . $row2['materno'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_demandado = $_GET['id'];
                            $sql = "SELECT per.id_demandado as id, per.nombre as nombre, per.paterno AS paterno, per.materno AS materno FROM persona per WHERE per.id_demandado NOT IN (SELECT asu.id_demandado FROM asunto asu
                                        JOIN persona per ON asu.id_demandado=per.id_demandado WHERE asu.id_asunto=$id_demandado) ORDER BY (per.id_demandado) ASC";
                            $query = mysqli_query($conn, $sql);
                            while ($row2 = mysqli_fetch_assoc($query)) {
                            ?>
                                <option value="<?php echo $row2['id'] ?>"><?php echo $row2['nombre'] . ' ' . $row2['paterno'] . ' ' . $row2['materno'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Abogado</label>
                        <select class="dialogregistro__texto--select" name="cmbAbogado" id="cmbAbogado" required>
                            <option value="<?php echo $row['id_abogado'] ?>">
                                <?php
                                $id_abogado = $_GET['id'];
                                $csql = "SELECT ab.nombre as nombre, ab.paterno AS paterno, ab.materno AS materno FROM abogado ab , asunto asu WHERE asu.id_abogado=ab.id_abogado AND asu.id_asunto=$id_cliente";
                                $query2 = mysqli_query($conn, $csql);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                    echo $row2['nombre'] . ' ' . $row2['paterno'] . ' ' . $row2['materno'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_abogado = $_GET['id'];
                            $csql = "SELECT ab.id_abogado as id, ab.nombre as nombre, ab.paterno AS paterno, ab.materno AS materno FROM abogado ab WHERE ab.id_abogado NOT IN (SELECT asu.id_abogado FROM asunto asu
                                        JOIN abogado ab ON asu.id_abogado=ab.id_abogado WHERE asu.id_asunto=$id_abogado) ORDER BY (ab.id_abogado) ASC";
                            $query2 = mysqli_query($conn, $csql);
                            while ($row2 = mysqli_fetch_assoc($query2)) {
                            ?>
                                <option value="<?php echo $row2['id'] ?>"><?php echo $row2['nombre'] . ' ' . $row2['paterno'] . ' ' . $row2['materno'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Estado</label>
                        <select class="dialogregistro__texto--select" name="cmbEstado" id="cmbEstado" required>
                            <option value="<?php echo $row['id_estado'] ?>">
                                <?php
                                $id_estado = $_GET['id'];
                                $csql = "SELECT e.descripcion as estado FROM estado e, asunto asu WHERE asu.id_estado=e.id_estado AND asu.id_asunto=$id_estado";
                                $query2 = mysqli_query($conn, $csql);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                    echo $row2['estado'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_estado = $_GET['id'];
                            $csql = "SELECT e.id_estado as id, e.descripcion as estado FROM estado e WHERE e.id_estado NOT IN (SELECT asu.id_estado FROM asunto asu
                                        JOIN estado e ON asu.id_estado=e.id_estado WHERE asu.id_asunto=$id_estado) ORDER BY (e.id_estado) ASC";
                            $query2 = mysqli_query($conn, $csql);
                            while ($row2 = mysqli_fetch_assoc($query2)) {
                            ?>
                                <option value="<?php echo $row2['id'] ?>"><?php echo $row2['estado'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Tipo de asunto</label>
                        <select class="dialogregistro__texto--select" name="cmbAsunto" id="cmbAsunto" required>
                            <option value="<?php echo $row['id_asunto'] ?>">                            
                                <?php
                                $id_tipo = $_GET['id'];
                                $csql = "SELECT t.descripcion as tipo_asunto FROM tipo_asunto t, asunto asu WHERE asu.id_tipo_asu=t.id_tipo_asunto AND asu.id_asunto=$id_tipo";
                                $query2 = mysqli_query($conn, $csql);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                    echo $row2['tipo_asunto'];
                                }
                                ?>
                            </option>
                            <?php
                            $id_estado = $_GET['id'];
                            $csql = "SELECT t.id_tipo_asunto as id, t.descripcion as tipo_estado FROM tipo_asunto t WHERE t.id_tipo_asunto NOT IN (SELECT asu.id_tipo_asu FROM asunto asu
                                        JOIN tipo_asunto t ON asu.id_tipo_asu=t.id_tipo_asunto WHERE asu.id_asunto=$id_tipo) ORDER BY (t.id_tipo_asunto) ASC";
                            $query2 = mysqli_query($conn, $csql);
                            while ($row2 = mysqli_fetch_assoc($query2)) {
                            ?>
                                <option value="<?php echo $row2['id'] ?>"><?php echo $row2['tipo_estado'] ?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Fecha inicio</label>
                        <input class="dialogregistro__texto--input" type="date" name="txtFechaInicio" id="txtFechaInicio" value="<?php echo $row['F_inicio'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Fecha final</label>
                        <input class="dialogregistro__texto--input" type="date" name="txtFechaFinal" id="txtFechaFinal" value="<?php echo $row['F_final'] ?>" required>
                    </div>
                </fieldset>
                <div class="dialogregistro__botones">
                    <input class="dialogregistro__boton--submit" type="submit" value="Modificar" name="btnModificar">
                    <a class="dialogregistro__boton--submit" href="../HTML/asuntos.php">Salir</a>
                </div>
            </form>
        <?php } ?>
        </div>
    </body>

    </html>