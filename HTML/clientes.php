<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
?>
<div class="cabezal__logo--titulo">
    <p>Registro de Clientes</p>
</div>

<body>
    <main class="contenedor contenedor2">
        <div class="contenedor__formulario">
            <form class="formulario" action="" method="POST">
                <fieldset class="fieldset-clientes">
                    <legend class="legend"> Complete el formulario </legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Id cliente</label>
                            <?php
                            $consultaId = "SELECT MAX((id_cliente)+1) as id from cliente";
                            $query = mysqli_query($conn, $consultaId);
                            while ($fila = mysqli_fetch_assoc($query)) {
                            ?>
                                <input class="registro__texto--input registro__texto--inputId" type="text" name="txtId" id="txtId" value="<?php echo $fila['id']; ?>" readonly>
                            <?php } ?>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Nombre</label>
                            <input class="registro__texto--input" type="text" name="txtNombre" id="txtNombre">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Apellido Paterno</label>
                            <input class="registro__texto--input" type="text" name="txtPaterno" id="txtPaterno">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Apellido Materno</label>
                            <input class="registro__texto--input" type="text" name="txtMaterno" id="txtMaterno">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">CURP</label>
                            <input class="registro__texto--input" type="text" name="txtCurp" id="txtCurp">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">RFC</label>
                            <input class="registro__texto--input" type="text" name="txtRFC" id="txtRFC">
                        </div>
                    </div>
                </fieldset>
                <?php
                $consultaId = "SELECT MAX((id_contacto)+1) as id from contacto";
                $query = mysqli_query($conn, $consultaId);
                while ($fila = mysqli_fetch_assoc($query)) {
                ?>
                    <input class="registro__texto--input registro__texto--inputId" type="text" name="txtIdContacto" id="txtId" value="<?php echo $fila['id']; ?>" readonly hidden="true">
                <?php } ?>
                <div class="registro__boton">
                    <input class="registro__boton--submit" type="submit" value="Registrar" name="btnRegistraCliente">
                </div>
            </form>
            <form class="formulario" action="" method="POST">
                <fieldset class="fieldset-clientes">
                    <legend class="legend">Información de contacto</legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Id contacto</label>
                            <?php
                            $consultaId = "SELECT MAX(id_contacto) as id from contacto";
                            $query = mysqli_query($conn, $consultaId);
                            while ($fila = mysqli_fetch_assoc($query)) {
                            ?>
                                <input class="registro__texto--input registro__texto--inputId" type="text" name="txtIdContacto" id="txtId" value="<?php echo $fila['id']; ?>" readonly>
                            <?php } ?>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Facebook</label>
                            <input class="registro__texto--input" type="text" name="txtFacebook" id="txtFacebook">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Telefono</label>
                            <input class="registro__texto--input" type="tel" name="txtTelefono" id="txtTelefono">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Email</label>
                            <input class="registro__texto--input" type="email" name="txtEmail" id="txtEmail">
                        </div>
                    </div>
                </fieldset>
                <div class="registro__boton">
                    <input class="registro__boton--submit" type="submit" value="Guardar" name="btnRegistraContacto">
                </div>
            </form>            
            <div class="contenedor__tabla">
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
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Modificar</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Eliminar</td>
                            </tr>
                            <tbody>
                                <?php
                                $sql = "SELECT * FROM cliente";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <tr class="tabla-registros--fila">
                                        <td class="tabla-registros--columna"><?php echo $row['id_cliente']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['paterno']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['materno']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['nombre']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['CURP']; ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['RFC']; ?></td>
                                        <td class="tabla-registros--columna"><a href="../PHP/modificarCliente.php?id=<?php echo $row['id_cliente']; ?>"><span class="material-symbols-outlined">
                                                    edit_square
                                                </span></a></td>
                                        <td class="tabla-registros--columna"><a href="../PHP/deleteCliente.php?id=<?php echo $row['id_cliente']; ?>"><span class="material-symbols-outlined">
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
<?php include "../PHP/registros/registrarClientes.php"; ?>