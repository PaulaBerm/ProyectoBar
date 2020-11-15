<%-- 
    Document   : registro.jsp
    Created on : 26/07/2020, 08:18:09 PM
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
                <a href="inicio.jsp"> Volver </a>
            </header>
            <div class="login">
                <article class="fondo">
                    <img src="assets/img/LogoInvertido.png" alt=""/>

                  <form action="nuevousuario" method="post">

                        <h3>Crear Cuenta</h3>


                        <div class="col-md-6 pl-1">

                            <label style="color:white">Nombre:</label>
                            <input type="text" name="nombre" id="nombre" class="inp" placeholder="Ingrese Nombre"/><br>


                            <label style="color:white">Apellido:</label>
                            <input type="text" name="apellido" id="apellido" class="inp" placeholder="Ingrese Apellido"/><br>



                            <label style="color:white">Correo:</label>
                            <input type="email" name="correo" id="email" class="inp" placeholder="example0@gmail.com"/><br>



                            <label style="color:white">Contraseña:</label>
                            <input type="password" name="pass" id="pass" class="inp" placeholder="Ingrese Contraseña"/><br
                                <input class="boton" type="submit" name="accion" value="Iniciar Sesión" id="btnIniciar" />
                            <input class="boton" type="submit" name="accion" value="Registrarme"/>
                            <p class="warnings" id="warnings"></p>
                          </div>
                    </form>
                    <script src="assets/js/formulario.js" type="text/javascript"></script>
                </article>

            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> 
    </body>
</html>
