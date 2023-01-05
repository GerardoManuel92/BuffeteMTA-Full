<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
include "../PHP/includes/menuLogos.php";
?>

<div class="contenedor__tabla">
    <h2>Listado de clientes registrados</h2>
    <div class="outer-wrapper">
        <div class="table-wrapper">
            <table class="tabla-registros">
                <tr class="tabla-registros--fila">
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Id cliente</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Paterno</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Materno</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">Nombre</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">CURP</td>
                    <td class="tabla-registros--columna tabla-registros--columnatitle">RFC</td>
                </tr>
                <?php
                $sql = "SELECT * FROM cliente";
                $query = mysqli_query($conn, $sql);
                while ($row = mysqli_fetch_assoc($query)) {
                ?>
                    <tbody>
                        <tr class="tabla-registros--fila">
                            <td class="tabla-registros--columna"><?php echo $row['id_cliente']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['paterno']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['materno']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['nombre']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['CURP']; ?></td>
                            <td class="tabla-registros--columna"><?php echo $row['RFC']; ?></td>
                        </tr>
                    </tbody>
                <?php } ?>
            </table>
        </div>
    </div>
    <div class="total-registros">
        <label class="registro__texto--label" for="">Total de registros:    </label>
        <?php
        $ctotal = "SELECT COUNT(*)AS total FROM cliente";
        $query = mysqli_query($conn, $ctotal);
        while ($row = mysqli_fetch_assoc($query)) {
        ?>            
            <label class="registro__texto--label" for=""><?php echo $row['total'] ?></label>
        <?php } ?>
    </div>
</div>
</body>

</html>