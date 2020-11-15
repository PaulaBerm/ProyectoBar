const nombre = document.getElementById("nombre");
const apellido = document.getElementById("apellido");
const email = document.getElementById("email");
const pass = document.getElementById("pass");
const form = document.getElementById("form");
const parrafo =document.getElementById("warnings");

form.addEventListener("submit", e=>{
    e.preventDefault();
    let warnings = "";
    let regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
    if(nombre.value.length <4){
        warnings += `El nombre no es valido <br>`;
        entrar = true;
    }
    if(apellido.value.length <4){
        warnings += `El apellido no es valido <br>`;
        entrar = true;
    }
    console.log(regexEmail.test(email.value));
    if (!regexEmail.test(email.value)){
        warnings += `El email no es valido <br>`;
        entrar = true;
    }
    if(pass.value.length <5){
    warnings += `La contraseña no es valida <br>`;   
    entrar = true;
    }
    if(entrar){
        parrafo.innerHTML = warnings;
    }else{
        parrafo.innerHTML = "Enviado";
    }
});