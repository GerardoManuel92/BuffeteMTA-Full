<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
?>
<div class="cabezal__logo--titulo">
    <p>Registro de Audiencias</p>
</div>

<body>
    <main class="contenedor contenedor2">
        <div class="contenedor__formulario">
            <form class="formulario" action="" method="POST">
                <fieldset>
                    <legend class="legend"> Complete el formulario </legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Lugar</label>
                            <select class="registro__texto--select" name="cmbLugar" id="cmbLugar">
                                <option value="">--Seleccionar lugar--</option>
                                <?php
                                $sql = "SELECT * FROM lugar ORDER BY id_lugar ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_lugar']; ?>"><?php echo $row['descripcion']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Fecha</label>
                            <input class="registro__texto--input" type="date" name="txtFecha" id="txtFecha">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Hora</label>
                            <input class="registro__texto--input" type="time" name="txtHora" id="txtHora">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Asunto</label>
                            <select class="registro__texto--select" name="cmbAsunto" id="cmbAsunto">
                                <option value="">--Seleccionar id asunto--</option>
                                <?php
                                $sql = "SELECT id_asunto FROM asunto";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_asunto']; ?>"><?php echo $row['id_asunto']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Resolución</label>
                            <input class="registro__texto--input" type="text" name="txtResolucion" id="txtResolucion">
                        </div>
                    </div>
                </fieldset>
                <div class="registro__boton">
                    <input class="registro__boton--submit" type="submit" value="Registrar">
                </div>
            </form>
            <div class="contenedor__tabla">
                <div class="outer-wrapper">
                    <div class="table-wrapper">
                        <table class="tabla-registros">
                            <tr class="tabla-registros--fila">
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id audiencia</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Lugar</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Fecha</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Hora</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Resolución</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Asunto</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Modificar</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Eliminar</td>
                            </tr>
                            <tbody>
                                <?php
                                $sql = "SELECT * FROM audiencia";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <tr class="tabla-registros--fila">
                                        <td class="tabla-registros--columna"><?php echo $row['id_audiencia']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['id_lugar']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['fecha']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['hora']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['resolucion']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['id_asunto']; ?></td>
                                        <td class="tabla-registros--columna tabla-registros--accion"><a <a href="../PHP/modificarAudiencia.php?id=<?php echo $row['id_audiencia']; ?>"><span class="material-symbols-outlined">
                                                    edit_square
                                                </span></a>
                                        </td>
                                        <td class="tabla-registros--columna tabla-registros--accion"><a href="../PHP/deleteAudiencia.php?id=<?php echo $row['id_audiencia']; ?>"><span class="material-symbols-outlined">
                                                    delete
                                                </span></a></td>
                                    </tr>
                            </tbody>
                        <?php } ?>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
<?php include "../PHP/includes/footer.php" ?>
</html>
<?php include "../PHP/registros/registraAudiencia.php"; ?>