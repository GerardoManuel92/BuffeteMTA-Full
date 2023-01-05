<?php
include "../PHP/includes/header.php";
?>
<div class="cabezal__logo--titulo">
    <p>Registro de Demandados</p>
</div>

<body>
    <main class="contenedor">
        <div class="contenedor__formulario">
            <form class="formulario" action="" id="formTipoDemandado">
                <fieldset>
                    <legend class="legend"> Seleccione la opción que desea registrar </legend>
                    <div class="registro__radios">
                        <input class="registro__texto--radio" type="radio" name="" id="radio-moral" onclick="validarTipoDemandado();">Empresa
                        <input class="registro__texto--radio" type="radio" name="" id="radio-fisica" onclick="validarTipoDemandado();">Persona

                    </div>
                </fieldset>
            </form>
        </div>
    </main>
</body>
<script src="../JS/ValidaTipoDemandado.js"></script>
</html>