<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
?>
<div class="cabezal__logo--titulo">
    <p>Registro de Asesorias</p>
</div>

<body>
    <main class="contenedor contenedor2">
        <div class="contenedor__formulario">
            <form class="formulario" method="POST">
                <fieldset>
                    <legend class="legend"> Complete el formulario </legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Asesor</label>
                            <select class="registro__texto--select" name="cmbAsesor" id="cmbAsesor">
                                <option value="">--Seleccionar asesor--</option>
                                <?php
                                $sql = "SELECT id_abogado,paterno,materno,nombre FROM abogado";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_abogado']; ?>"><?php echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Asesorado</label>
                            <select class="registro__texto--select" name="cmbAsesorado" id="cmbAsesorado">
                                <option value="">--Seleccionar asesorado--</option>
                                <?php
                                $sql = "SELECT id_abogado,paterno,materno,nombre FROM abogado";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_abogado']; ?>"><?php echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Id asunto</label>
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
                            <label class="registro__texto--label" for="">Tema</label>
                            <input class="registro__texto--input" type="text" name="txtTema" id="txtTema">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Fecha</label>
                            <input class="registro__texto--input" type="date" name="txtFecha" id="txtFecha">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Hora</label>
                            <input class="registro__texto--input" type="time" name="txtHora" id="txtHora">
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
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id asesoria</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Fecha</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Tema</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Hora</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id asunto</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">ID asesor</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">ID asesorado</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Editar</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Eliminar</td>
                            </tr>
                            <tbody>
                            <?php
                                $sql = "SELECT * FROM asesora";
                                $query = mysqli_query($conn, $sql);
                            while ($row = mysqli_fetch_assoc($query)) {
                            ?>
                                <tr class="tabla-registros--fila">
                                    <td class="tabla-registros--columna"><?php echo $row['id_asesoria']; ?></td>
                                    <td class="tabla-registros--columna"><?php echo $row['fecha']; ?></td>
                                    <td class="tabla-registros--columna"><?php echo $row['tema']; ?></td>
                                    <td class="tabla-registros--columna"><?php echo $row['hora']; ?></td>
                                    <td class="tabla-registros--columna"><?php echo $row['id_asunto']; ?></td>
                                    <td class="tabla-registros--columna"><?php echo $row['asesor']; ?></td>
                                    <td class="tabla-registros--columna"><?php echo $row['asesorado']; ?></td>
                                    <td class="tabla-registros--columna"><a href="../PHP/modificarAsesoria.php?id=<?php echo $row['id_asesoria']; ?>"><span class="material-symbols-outlined">edit_square
                                            </span></a>
                                    </td>
                                    <td class="tabla-registros--columna"><a href="../PHP/deleteAsesoria.php?id=<?php echo $row['id_asesoria']; ?>"><span class="material-symbols-outlined">
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
<?php
include "../PHP/registros/registraAsesoria.php"; ?>
