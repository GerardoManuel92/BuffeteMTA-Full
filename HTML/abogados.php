<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
?>

<div class="cabezal__logo--titulo">
    <p>Registro de Abogados</p>
</div>

<body>
    <main class="contenedor contenedor2">
        <div class="contenedor__formulario">
            <form class="formulario" action="" method="POST">
                <fieldset>
                    <legend class="legend">Todos los campos con asterisco (*) son obligatorios</legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Nombre *</label>
                            <input class="registro__texto--input" type="text" name="txtNombre" id="txtNombre">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Apellido Paterno *</label>
                            <input class="registro__texto--input" type="text" name="txtPaterno" id="txtPaterno">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Apellido Materno *</label>
                            <input class="registro__texto--input" type="text" name="txtMaterno" id="txtMaterno">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">RFC *</label>
                            <input class="registro__texto--input" type="text" name="txtRFC" id="txtRFC">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Cédula *</label>
                            <input class="registro__texto--input" type="text" name="txtCedula" id="txtCedula">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Grado *</label>
                            <select class="registro__texto--select" name="cmbGrado" id="cmbGrado">
                                <option value="0">--Seleccionar grado--</option>
                                <?php
                                $sql2 = "SELECT * FROM estudio";
                                $query2 = mysqli_query($conn, $sql2);
                                while ($row2 = mysqli_fetch_assoc($query2)) {
                                ?>
                                    <option value="<?php echo $row2['id_grado']; ?>"><?php echo $row2['descripcion']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                </fieldset>
                <div class="registro__boton">
                    <input class="registro__boton--submit registra" type="submit" value="Registrar">
                </div>
            </form>

            <div class="contenedor__tabla">
                <div class="outer-wrapper">
                    <div class="table-wrapper">
                        <table class="tabla-registros">
                            <tr class="tabla-registros--fila">
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id Abogado</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Nombre</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Paterno</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Materno</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Cédula</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">RFC</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id Grado</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Modificar</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Eliminar</td>
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
                                        <td class="tabla-registros--columna"><a href="../PHP/modificarAbogado.php?id=<?php echo $row['id_abogado']; ?>"><span class="material-symbols-outlined">
                                                    edit_square
                                                </span></a>

                                        </td>
                                        <td class="tabla-registros--columna"><a href="../PHP/deleteAbogado.php?id=<?php echo $row['id_abogado']; ?>"><span class="material-symbols-outlined">
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
include "../PHP/registros/registrarAbogados.php";
?>