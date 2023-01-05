<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
?>

<div class="cabezal__logo--titulo">
    <p>Tipos de Asuntos</p>
</div>

<body>
    <main class="contenedor contenedor3">
        <div class="contenedor__formulario">
            <form class="formulario" action="" method="POST">
                <fieldset class="fieldset2">
                    <legend class="legend"> Complete el formulario </legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Id Tipo</label>
                            <?php
                            $sql2 = "SELECT MAX(id_tipo_asunto)+1 as id_tipo FROM tipo_asunto";
                            $query2 = mysqli_query($conn, $sql2);
                            while ($row2 = mysqli_fetch_assoc($query2)) {
                                ?>
                            <input class="registro__texto--input" type="text" name="txtId" id="txtId" value="<?php echo $row2['id_tipo'] ?>" readonly>
                            <?php } ?>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Descripcion</label>
                            <input class="registro__texto--input" type="text" name="txtDescripcion" id="txtDescripcion">
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
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id tipo asunto</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Descripcion</td>                                
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Modificar</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Eliminar</td>
                            </tr>
                            <tbody>
                                <?php
                                $sql = "SELECT * FROM tipo_asunto ORDER BY (id_tipo_asunto) ASC";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <tr class="tabla-registros--fila">
                                        <td class="tabla-registros--columna"><?php echo $row['id_tipo_asunto']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['descripcion']; ?></td>                                        
                                        <td class="tabla-registros--columna"><a href="../PHP/modificarTipoAsuntos.php?id=<?php echo $row['id_tipo_asunto']; ?>"><span class="material-symbols-outlined">
                                                    edit_square
                                                </span></a>

                                        </td>
                                        <td class="tabla-registros--columna"><a href="../PHP/deleteTipoAsunto.php?id=<?php echo $row['id_tipo_asunto']; ?>"><span class="material-symbols-outlined">
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
include "../PHP/registros/registrarTipoAsuntos.php";
?>