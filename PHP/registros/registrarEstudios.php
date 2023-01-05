<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $id_estado = $_POST["txtId"];
    $descripcion = $_POST["txtDescripcion"];    

    if (empty($id_estado) && empty($descripcion)) {
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
        if (empty($id_estado)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "No hay un id al cual asociar",
                    icon: "error",
                });
            </script>
        <?php
        } else if (empty($descripcion)) {
        ?>
            <script>
                swal({
                    title: "Error!",
                    text: "Debes ingresar una descripcion",
                    icon: "error",
                });
            </script>
        <?php
        } else {
            $insertar = "INSERT INTO estudio (descripcion) VALUES ('$descripcion')";
            $resultado = mysqli_query($conn, $insertar);
            if ($resultado) {
            ?>
                <script>
                    swal({
                        title: "Exito!",
                        text: "Registro guardado correctamente",
                        icon: "success",
                    }).then(function() {
                        location.reload();
                        window.location="../HTML/estudios.php"
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