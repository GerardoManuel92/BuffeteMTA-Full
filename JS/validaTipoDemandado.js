const formulario = document.getElementById('formTipoDemandado');
formulario.addEventListener('submit', function (e){
    e.preventDefault();
});

function validarTipoDemandado(){
    const personaFisica = document.getElementById('radio-fisica');
    const personaMoral = document.getElementById('radio-moral');

    if(personaFisica.checked){
        location.href = "../HTML/demandadoFisico.php";
    }else if(personaMoral.checked){
        location.href = "../HTML/demandadoMoral.php";
    }else{
        
    }
}