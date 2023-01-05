<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $asunto = $_POST["cmbAsunto"];
    $lugar = $_POST["cmbLugar"];
    $fecha = $_POST["txtFecha"];
    $hora = $_POST["txtHora"]; 
    $resolucion = $_POST["txtResolucion"];    


    if (empty($lugar) && empty($asunto) && empty($resolucion) && empty($hora) && empty($fecha)) {
?>
        <script>
            //alert('El formulario se encuentra vacio');
            swal({
                title: "Error!",
                text: "El formulario se encuentra vacio",
                icon: "error",
            });
        </script>
        <?php
    } else {
        if (empty($lugar)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un lugar",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($asunto)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes seleccionar un asunto",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($resolucion)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar una resolución de audiencia",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($fecha)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar una fecha",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($hora)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes establecer una hora",
                    icon: "error",
                });
            </script>
        <?php
        } else {
            $sql = "INSERT INTO audiencia (id_lugar, fecha, hora, resolucion, id_asunto) VALUES ('$lugar','$fecha','$hora','$resolucion','$asunto')";
            $resultado = mysqli_query($conn, $sql);            
            if ($resultado) {
            ?>
                <script>
                    swal({
                        title: "Exito!",
                        text: "Registro guardado correctamente",
                        icon: "success",
                    }).then(function() {
                        location.reload();
                        window.location='../HTML/audiencia.php';
                    });
                </script>
            <?php

            } else {
            ?>
                <script>
                    swal({
                        title: "Error!",
                        text: "Error al guardar registro",
                        icon: "error",
                    });
                </script>
<?php
            }
        }
    }
}

mysqli_close($conn);
?>