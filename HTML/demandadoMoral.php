<?php
include "../PHP/conexion.php";
include "../PHP/includes/header.php";
?>
<div class="cabezal__logo--titulo">
    <p>Registro de Empresas Demandadas</p>
</div>

<body>
    <main class="contenedor">
        <div class="contenedor__formulario">
            <form class="formulario formularioMoral" action="" method="POST">
                <fieldset>
                    <legend class="legend"> Complete el formulario </legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Direccion</label>
                            <input class="registro__texto--input" type="text" name="txtDireccion" id="txtDireccion">
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Tipo</label>
                            <select class="registro__texto--select" name="cmbTipo" id="cmbTipo">
                                <option value="">--Seleccionar tipo asunto-</option>
                                <?php
                                $csql = "SELECT * FROM tipo ORDER BY (id_tipo) ASC";
                                $cquery = mysqli_query($conn, $csql);
                                while ($fila = mysqli_fetch_assoc($cquery)) {
                                ?>
                                    <option value="<?php echo $fila['id_tipo'] ?>"><?php echo $fila['descripcion'] ?></option>
                                <?php
                                }
                                ?>
                            </select>
                        </div>
                    </div>
                </fieldset>
                <div class="registro__boton">
                    <input class="registro__boton--submit" type="submit" value="Registrar" name="btnRegistrar"></input>
                </div>                
            </form>
            <form class="formulario formularioMoral" action="" method="POST">
                <fieldset>
                    <legend class="legend"> Ingrese una razon social </legend>
                    <div class="registro">
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Id demandado</label>
                            <?php
                            $busqueda = "SELECT MAX(id_demandado) as id_demandado FROM demandado";
                            $cbusqueda = mysqli_query($conn, $busqueda);
                            while ($a = mysqli_fetch_assoc($cbusqueda)) {
                                ?>
                            <input class="registro__texto--input" type="number" name="txtIdDemandado" id="txtIdDemandado" value="<?php echo $a['id_demandado']?>" readonly>
                            <?php } ?>
                        </div>
                        <div class="registro__texto">
                            <label class="registro__texto--label" for="">Razon Social</label>
                            <input class="registro__texto--input" type="text" name="txtRazonSocial" id="txtRazonSocial">
                        </div>
                    </div>
                </fieldset>
                <div class="registro__boton">
                    <input class="registro__boton--submit" type="submit" value="Registrar" name="btnRegistraMoral"></input>
                </div>
            </form>                                        
            <div class="contenedor__tabla">
                <div class="outer-wrapper">
                    <div class="table-wrapper">
                        <table class="tabla-registros">
                            <tr class="tabla-registros--fila">
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id demandado</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Dirección</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Id tipo</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Empresa</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Modificar</td>
                                <td class="tabla-registros--columna tabla-registros--columnatitle">Eliminar</td>
                            </tr>
                            <tbody>
                                <?php
                                $sql = " SELECT d.id_demandado AS id_demandado, d.direccion AS direccion, d.id_tipo AS tipo, e.razon_social AS empresa
                                FROM demandado d JOIN empresa e WHERE d.id_demandado = e.id_demandado";
                                $query = mysqli_query($conn, $sql);
                                while ($row = mysqli_fetch_assoc($query)) {
                                ?>
                                    <tr class="tabla-registros--fila">
                                        <td class="tabla-registros--columna"><?php echo $row['id_demandado'] ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['direccion'] ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['tipo'] ?></td>
                                        <td class="tabla-registros--columna"><?php echo $row['empresa'] ?></td>
                                        <td class="tabla-registros--columna"><a href="../PHP/modificaPerMoral.php?id=<?php echo $row['id_demandado'] ?>"><span class="material-symbols-outlined">
                                                    edit_square
                                                </span></a>
                                        </td>
                                        <td class="tabla-registros--columna"><a href="../PHP/deleteEmpresa.php?id=<?php echo $row['id_demandado'] ?>"><span class="material-symbols-outlined">
                                                    delete
                                                </span></a></td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>           
        </div>
    </main>
</body>
</html>
<?php
include "../PHP/registros/registraDemandadoMoral.php";
//include "../PHP/registros/registraMoral.php";
?>
