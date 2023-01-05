<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
include "../PHP/includes/menuLogos.php";
?>

<div class="contenedor__tabla">
    <h2>Listado de abogados registrados</h2>
    <div class="outer-wrapper">
        <div class="table-wrapper">
            <table class="tabla-registros">
                <tr class="tabla-registros--fila">
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Id Abogado</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Paterno</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Materno</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Nombre</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">RFC</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Cédula</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Id Grado</td>
                </tr>
                <tbody>
                    <?php
                    $sql = "SELECT * FROM abogado";
                    $query = mysqli_query($conn, $sql);
                    while ($row = mysqli_fetch_assoc($query)) {
                    ?>
                        <tr class="tabla-registros--fila">
                            <td class="tabla-registros--columna"><?php echo $row['id_abogado']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['paterno']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['materno']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['nombre']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['RFC']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['cedula']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['id_grado']; ?></td>
                        </tr>
                </tbody>
            <?php } ?>
            </table>
        </div>
    </div>
    <div class="total-registros">
        <label class="registro__texto--label" for="">Total de registros:    </label>
        <?php
        $ctotal = "SELECT COUNT(*)AS total FROM abogado";
        $query = mysqli_query($conn, $ctotal);
        while ($row = mysqli_fetch_assoc($query)) {
        ?>            
            <label class="registro__texto--label" for=""><?php echo $row['total'] ?></label>
        <?php } ?>
    </div>
</div>
</body>

</html>