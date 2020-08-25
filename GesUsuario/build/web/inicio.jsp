<%-- 
    Document   : index.jsp
    Created on : 26/07/2020, 08:12:15 PM
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="assets/img/bar.png.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Login | Bar La Fonda Paisa </title>
    </head>
    <body>
        <script src="assets/js/mainB.js" type="text/javascript"></script>
        <div class="container col-lg-3">
            <form action="Iniciar" method="post" id="forminicio">
                <div class="form-group text-center"> 
                    <img src="assets/img/bar.png.png" height="125" width="125"/>
                    <p style="color:white"><strong>Bienvenidos al Sistema de Login</strong></p>
                </div>
                <div class="form-group">
                    <label style="color:white">Correo:</label>
                    <input class="form-control" type="email" name="correo" id="txtCorreo" placeholder="Ingrese Usuario"/><br>
                </div>
                <div class="form-group">
                    <label style="color:white">Contraseña:</label>
                    <input class="form-control" type="password" name="pass" id="txtPass" placeholder="Ingrese Contraseña" /><br> 
                    <input class="btn btn-info btn-block" type="button" name="accion" value="Iniciar Sesión" id="btnIniciar" />
                </div>
            </form>
            <br>
            <as style="color:white">No tienes cuenta?</a><a href="registro.jsp"> Registrarme </a>
        </div>
        <script src="assets/js/mainB.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/js/jquery-3.3.1.slim.min.js" type="text/javascript"></script>
        <script src="assets/js/popper.min.js" type="text/javascript"></script>
    </body>
</html>
