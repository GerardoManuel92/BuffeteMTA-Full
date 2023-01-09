<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
?>
<div class="cabezal__logo--titulo">
    <p>Registro de Asuntos</p>
</div>

<body>
    <main class="contenedor">
        <div class="contenedor__formulario">
            <form class="formulario" action="" method="POST">
                <fieldset class="fieldset-asuntos">
                    <legend class="legend">Todos los campos con asterisco (*) son obligatorios</legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="clientes">Cliente *</label>
                            <select class="registro__texto--select" name="cmbCliente" id="cmbCliente">
                                <option value="0">--Seleccionar cliente--</option>
                                <?php
                                $sql = "SELECT id_cliente, nombre, paterno, materno FROM cliente ORDER BY id_cliente ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_cliente']; ?>"><?php echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Demandado *</label>
                            <select class="registro__texto--select" name="cmbDemandado" id="cmbDemandado">
                                <option value="">--Seleccionar demandado--</option>
                                <?php
                                $sql = "SELECT * FROM persona ORDER BY id_demandado ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_demandado']; ?>"><?php echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Abogado *</label>
                            <select class="registro__texto--select" name="cmbAbogado" id="cmbAbogado">
                                <option value="">--Seleccionar abogado-</option>
                                <?php
                                $sql = "SELECT id_abogado, nombre, paterno, materno FROM abogado ORDER BY id_abogado ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_abogado']; ?>"><?php echo $row['nombre'] . ' ' . $row['paterno'] . ' ' . $row['materno']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Estado *</label>
                            <select class="registro__texto--select" name="cmbEstado" id="cmbEstado">
                                <option value="">--Seleccionar estado-</option>
                                <?php
                                $sql = "SELECT * FROM estado ORDER BY id_estado ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_estado']; ?>"><?php echo $row['descripcion']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Tipo de asunto *</label>
                            <select class="registro__texto--select" name="cmbAsunto" id="cmbAsunto">
                                <option value="">--Seleccionar tipo asunto-</option>
                                <?php
                                $sql = "SELECT * FROM tipo ORDER BY id_tipo ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <option value="<?php echo $row['id_tipo']; ?>"><?php echo $row['descripcion']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                        <div class="registro__texto"></div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Fecha inicio *</label>
                            <input class="registro__texto--input" type="date" name="txtFechaInicio" id="txtFechaInicio">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Fecha final *</label>
                            <input class="registro__texto--input" type="date" name="txtFechaFinal" id="txtFechaFinal">
                        </div>
                    </div>
                </fieldset>
                <div class="registro__boton">
                    <input class="registro__boton--submit" type="submit" value="Registrar"></input>
                </div>
            </form>
            <div class="contenedor__tabla">
                <div class="outer-wrapper">
                    <div class="table-wrapper">
                        <table class="tabla-registros">
                            <tr class="tabla-registros--fila">
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id asunto</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Cliente</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Demandado</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Estado</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Tipo asunto</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Abogado</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Fecha inicio</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Fecha termino</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle" colspan="2">Acciones</td>
                            </tr>
                            <tbody>
                                <tr class="tabla-registros--fila">
                                    <?php
                                    $sql = "SELECT * FROM asunto";
                                    $query = mysqli_query($conn, $sql);
                                    while ($row = mysqli_fetch_assoc($query)) {
                                    ?>
                                        <td class="tabla-registros--columna"><?php echo $row['id_asunto']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['id_cliente']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['id_demandado']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['id_estado']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['id_tipo_asu']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['id_abogado']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['F_inicio']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['F_final']; ?></td>
                                        <td class="tabla-registros--columna"><a href="../PHP/modificarAsunto.php?id=<?php echo $row['id_asunto']; ?>"><span class="material-symbols-outlined">
                                                    edit_square
                                                </span></a>
                                        </td>
                                        <td class="tabla-registros--columna"><a href="../PHP/deleteAsunto.php?id=<?php echo $row['id_asunto']; ?>"><span class="material-symbols-outlined">
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
</html>
<?php include "../PHP/registros/registroAsuntos.php"; ?>
