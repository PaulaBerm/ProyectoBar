<%-- 
    Document   : index.jsp
    Created on : 26/07/2020, 08:12:15 PM
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="assets/img/LogoInvertido.png">
        <meta charset="utf-8">
        <title>Login</title>
        <link href="assets/csslogin.css" rel="stylesheet" type="text/css"/>
        <link href="assets/fontslogin.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans|Montez|Pathway+Gothic+One" rel="stylesheet">
    </head>
    <body>
        <div class="contenedor">

            <header>
                <h1 class="title">INBAR</h1>
                <a href="index.html"> Inicio </a>
                <a href="registro.jsp"> Registrarme </a>
                            </header>
            <script src="assets/js/mainB.js" type="text/javascript"></script>
            
                
                <div class="login">
                    <article class="fondo">
                        <img src="assets/img/LogoInvertido.png" alt=""/>

                        <h3>Inicio de Sesión</h3>
                      <form action="Iniciar" method="post" id="forminicio">
                            <span class="icon-user"></span><input class="inp" type="email" name="usuario" id="txtCorreo" placeholder="Ingrese correo eléctronico"/><br>
                            <span class="icon-key"></span><input class="inp" type="password" name="pass" id="txtPass" placeholder="Ingrese Contraseña" /><br>
                            <input class="boton" type="button" name="accion" value="Ingresar" id="btnIniciar"/>
                        </form>
                    </article>
                </div>

        </div>
        

    </div>
    <script src="assets/js/mainB.js" type="text/javascript"></script>
</body>
</html>
