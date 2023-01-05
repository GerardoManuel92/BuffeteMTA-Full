<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
include "../PHP/includes/menuLogos.php";
?>

<div class="contenedor__tabla">
    <h2>Listado de audiencias registradas</h2>
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
                        </tr>
                </tbody>
            <?php } ?>
            </table>
        </div>
    </div>
    <div class="total-registros">
        <label class="registro__texto--label" for="">Total de registros:    </label>
        <?php
        $ctotal = "SELECT COUNT(*)AS total FROM audiencia";
        $query = mysqli_query($conn, $ctotal);
        while ($row = mysqli_fetch_assoc($query)) {
        ?>            
            <label class="registro__texto--label" for=""><?php echo $row['total'] ?></label>
        <?php } ?>
    </div>
</div>
</body>

</html>