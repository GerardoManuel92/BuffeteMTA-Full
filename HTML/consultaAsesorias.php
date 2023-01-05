<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
include "../PHP/includes/menuLogos.php";
?>

<div class="contenedor__tabla">
    <h2>Listado de asesorias registradas</h2>
    <table class="tabla-registros">
        <tr class="tabla-registros--fila">
            <td class="tabla-registros--columna tabla-registros--columnatitle">Id asesoria</td>
            <td class="tabla-registros--columna tabla-registros--columnatitle">Fecha</td>
            <td class="tabla-registros--columna tabla-registros--columnatitle">Tema</td>
            <td class="tabla-registros--columna tabla-registros--columnatitle">Hora</td>
            <td class="tabla-registros--columna tabla-registros--columnatitle">Id asunto</td>
            <td class="tabla-registros--columna tabla-registros--columnatitle">Asesor</td>
            <td class="tabla-registros--columna tabla-registros--columnatitle">Asesorado</td>
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
                </tr>
        </tbody>
    <?php } ?>
    </table>
</div>
</body>
</html>