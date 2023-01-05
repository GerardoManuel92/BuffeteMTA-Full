<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
include "../PHP/includes/menuLogos.php";
?>

<div class="contenedor__tabla">
    <h2>Listado de asuntos registrados</h2>
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
        </tr>
        <tbody>
            <?php
            $sql = "SELECT * FROM asunto";
            $query = mysqli_query($conn, $sql);
            while ($row = mysqli_fetch_assoc($query)) {
            ?>
                <tr class="tabla-registros--fila">
                    <td class="tabla-registros--columna"><?php echo $row['id_asunto']; ?></td>
                    <td class="tabla-registros--columna"><?php echo $row['id_cliente']; ?></td>
                    <td class="tabla-registros--columna"><?php echo $row['id_demandado']; ?></td>
                    <td class="tabla-registros--columna"><?php echo $row['id_estado']; ?></td>
                    <td class="tabla-registros--columna"><?php echo $row['id_tipo_asu']; ?></td>
                    <td class="tabla-registros--columna"><?php echo $row['id_abogado']; ?></td>
                    <td class="tabla-registros--columna"><?php echo $row['F_inicio']; ?></td>
                    <td class="tabla-registros--columna"><?php echo $row['F_final']; ?></td>
                </tr>
        </tbody>
    <?php } ?>
    </table>
</div>
</body>

</html>