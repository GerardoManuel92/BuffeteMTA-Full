<?php
include "../PHP/conexion.php";

$id = $_GET['id'];
$sql = "SELECT cl.id_cliente AS id_cliente, cl.nombre AS nombre, cl.paterno AS paterno, cl.materno AS materno,
cl.CURP AS curp, cl.RFC AS rfc, cn.id_contacto AS id_contacto, fb.usuario AS facebook, co.cuenta AS correo,
tel.numero AS telefono FROM cliente cl, contacto cn, facebook fb, correo co, telefono tel WHERE cl.id_cliente=cn.id_cliente
AND cn.id_contacto=fb.id_contacto AND co.id_contacto = cn.id_contacto AND tel.id_contacto=cn.id_contacto
AND cl.id_cliente=$id";
$query = mysqli_query($conn, $sql);

while ($row = mysqli_fetch_assoc($query)) {
?>

    <!DOCTYPE html>
    <html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../CSS/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../node_modules/sweetalert2/dist/sweetalert2.min.css">
        <script src="../node_modules/sweetalert2/dist/sweetalert2.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="shortcut icon" href="../IMG/mta.ico">
        <title>Portal Buffete</title>
    </head>

    <body>
        <div class="dialog-encabezado">
            <img src="../logotipo.png" alt="logo">
            <h1>Actualización de registro</h1>
        </div>
        <div class="dialog-contenido">
            <form class="formularioDialog" action="../PHP/updateCliente.php" id="formDialog" method="POST">
                <fieldset>
                    <legend class="legend"> Ingrese el nuevo valor en algún campo </legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id cliente</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtId" id="txtId" value="<?php echo $row['id_cliente'] ?>" readonly>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Nombre</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtNombre" id="txtNombre" value="<?php echo $row['nombre'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Apellido Paterno</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtPaterno" id="txtPaterno" value="<?php echo $row['paterno'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Apellido Materno</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtMaterno" id="txtMaterno" value="<?php echo $row['materno'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">CURP</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtCURP" id="txtCURP" value="<?php echo $row['curp'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">RFC</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtRFC" id="txtRFC" value="<?php echo $row['rfc'] ?>" required>
                    </div>
                </fieldset>
                <fieldset>
                    <legend class="legend">Información de contacto</legend>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Id contacto</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtIdContacto" id="txtIdContacto" value="<?php echo $row['id_contacto'] ?>" readonly>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Facebook</label>
                        <input class="dialogregistro__texto--input" type="text" name="txtFacebook" id="txtFacebook" value="<?php echo $row['facebook'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Teléfono</label>
                        <input class="dialogregistro__texto--input" type="number" name="txtTelefono" id="txtTelefono" value="<?php echo $row['telefono'] ?>" required>
                    </div>
                    <div class="dialogregistro__texto">
                        <label class="dialogregistro__texto--label" for="">Email</label>
                        <input class="dialogregistro__texto--input" type="email" name="txtCorreo" id="txtCorreo" value="<?php echo $row['correo'] ?>" required>
                    </div>
                </fieldset>
                <div class="dialogregistro__botones">
                    <input class="dialogregistro__boton--submit" type="submit" value="Modificar Cliente" name="btnModificar">
                    <a class="dialogregistro__boton--submit" href="../HTML/clientes.php">Salir</a>
                </div>
            </form>

        <?php
    }
        ?>
        </div>
    </body>

    </html>