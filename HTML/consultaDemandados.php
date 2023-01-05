<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
include "../PHP/includes/menuLogos.php";
?>

    <div class="contenedor__tabla">
        <h2>Listado de personas morales</h2>
        <table class="tabla-registros">
            <tr class="tabla-registros--fila">
                <td class="tabla-registros--columna tabla-registros--columnatitle">Id demandado</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Razón social</td>
            </tr>
            <?php
            $sql = "SELECT * FROM empresa";
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_assoc($query)) {
            ?>
                <tbody>
                    <tr class="tabla-registros--fila tabla-registros--empresas">
                        <td class="tabla-registros--columna"><?php echo $row['id_demandado']; ?></td>
                        <td class="tabla-registros--columna"><?php echo $row['razon_social']; ?></td>
                    </tr>
                </tbody>
            <?php } ?>
        </table>
    </div>
    <div class="contenedor__tabla">
        <h2>Listado de personas físicas</h2>
        <table class="tabla-registros">
            <tr class="tabla-registros--fila">
                <td class="tabla-registros--columna tabla-registros--columnatitle">Id demandado</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Dirección</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Id tipo</td>
            </tr>
            <tbody>
                <?php
                $sql2 = "SELECT * FROM demandado";
                $query = mysqli_query($conn, $sql2);
                while ($row2 = mysqli_fetch_assoc($query)) {
                ?>
                    <tr class="tabla-registros--fila">
                        <td class="tabla-registros--columna"><?php echo $row2['id_demandado']; ?></td>
                        <td class="tabla-registros--columna"><?php echo $row2['direccion']; ?></td>
                        <td class="tabla-registros--columna"><?php echo $row2['id_tipo']; ?></td>
                    </tr>
            </tbody>
        <?php } ?>
        </table>
    </div>
    <div class="contenedor__tabla">
        <h2>Listado de Demandados fisicos y morales</h2>
        <table class="tabla-registros">
            <tr class="tabla-registros--fila">
                <td class="tabla-registros--columna tabla-registros--columnatitle">Id demandado</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Nombre</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Paterno</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Materno</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Dirección</td>
                <td class="tabla-registros--columna tabla-registros--columnatitle">Tipo</td>
            </tr>
            <tbody>
                <?php
                $sql3 = "SELECT  d.id_demandado AS id_demandado, d.direccion AS direccion, d.id_tipo AS tipo, p.nombre AS nombre, p.paterno AS paterno, p.materno AS materno FROM demandado d, persona p WHERE p.id_demandado = d.id_demandado ORDER BY id_demandado ASC";
                $query = mysqli_query($conn, $sql3);
                while ($row3 = mysqli_fetch_assoc($query)) {
                ?>
                    <tr class="tabla-registros--fila">
                        <td class="tabla-registros--columna"><?php echo $row3['id_demandado'];?></td>
                        <td class="tabla-registros--columna"><?php echo $row3['direccion'];?></td>
                        <td class="tabla-registros--columna"><?php echo $row3['tipo'];?></td>
                        <td class="tabla-registros--columna"><?php echo $row3['nombre'];?></td>
                        <td class="tabla-registros--columna"><?php echo $row3['paterno'];?></td>
                        <td class="tabla-registros--columna"><?php echo $row3['materno'];?></td>
                    </tr>
            </tbody>
        <?php } ?>
        </table>
    </div>
</body>
</html>