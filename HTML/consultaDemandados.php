<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
include "../PHP/includes/menuLogos.php";
?>

<div class="contenedor__tabla">
    <h2>Listado de empresas demandadas</h2>
    <div class="outer-wrapper">
        <div class="table-wrapper">
            <table class="tabla-registros">
                <tr class="tabla-registros--fila">
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Id demandado</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Empresa</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Direccion</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Id tipo</td>
                </tr>
                <?php
                $sql = "SELECT d.id_demandado AS id_demandado, e.razon_social AS empresa, d.direccion AS direccion, d.id_tipo AS tipo
                FROM demandado d JOIN empresa e WHERE d.id_demandado = e.id_demandado";
                $query = mysqli_query($conn, $sql);
                while ($row = mysqli_fetch_assoc($query)) {
                ?>
                    <tbody>
                        <tr class="tabla-registros--fila tabla-registros--empresas">
                            <td class="tabla-registros--columna"><?php echo $row['id_demandado']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['empresa']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['direccion']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['tipo']; ?></td>
                        </tr>
                    </tbody>
                <?php } ?>
            </table>
        </div>
    </div>
    <div class="total-registros">
        <label class="registro__texto--label" for="">Total de registros:    </label>
        <?php
        $ctotal = "SELECT count(*) AS total FROM empresa JOIN demandado WHERE empresa.id_demandado = demandado.id_demandado";
        $query = mysqli_query($conn, $ctotal);
        while ($row = mysqli_fetch_assoc($query)) {
        ?>            
            <label class="registro__texto--label" for=""><?php echo $row['total'] ?></label>
        <?php } ?>
    </div>
</div>
<div class="contenedor__tabla">
    <h2>Listado de personas demandadas</h2>
    <div class="outer-wrapper">
        <div class="table-wrapper">
            <table class="tabla-registros">
                <tr class="tabla-registros--fila">
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Id demandado</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Nombre</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Paterno</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Materno</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Direccion</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Id tipo</td>
                </tr>
                <?php
                $sql = "SELECT d.id_demandado AS id, p.nombre AS nombre, p.paterno AS paterno, p.materno AS materno,
                d.direccion AS direccion, d.id_tipo AS tipo FROM demandado d JOIN persona p WHERE d.id_demandado = p.id_demandado";
                $query = mysqli_query($conn, $sql);
                while ($row = mysqli_fetch_assoc($query)) {
                ?>
                    <tbody>
                        <tr class="tabla-registros--fila tabla-registros--empresas">
                            <td class="tabla-registros--columna"><?php echo $row['id']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['nombre']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['paterno']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['materno']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['direccion']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['tipo']; ?></td>
                        </tr>
                    </tbody>
                <?php } ?>
            </table>
        </div>
    </div>
    <div class="total-registros">
        <label class="registro__texto--label" for="">Total de registros:    </label>
        <?php
        $ctotal = "SELECT count(*) AS total FROM persona JOIN demandado WHERE persona.id_demandado = demandado.id_demandado";
        $query = mysqli_query($conn, $ctotal);
        while ($row = mysqli_fetch_assoc($query)) {
        ?>            
            <label class="registro__texto--label" for=""><?php echo $row['total'] ?></label>
        <?php } ?>
    </div>
</div>
</body>

</html>