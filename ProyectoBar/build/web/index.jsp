<%-- 
    Document   : index.jsp
    Created on : 26/07/2020, 08:12:15 PM
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    <title>Login</title>
</head>
<body>
    <script src="js/main.js"></script>

    <div class="container col-lg-3">
        <form action="Iniciar" method="post" id="forminicio">
            <div class="form-group text-center"> 
                <img src="img/bar.png.png" height="125" width="125"/>
                <p style="color:white"><strong>Bienvenidos al Sistema de Login</strong></p>
            </div>
            <div class="form-group">
                <label style="color:white">Usuario:</label>
                <input class="form-control" type="text" name="usuario" id="txtusuario" placeholder="Ingrese Usuario"/><br>
            </div>
            <div class="form-group">
                <label style="color:white">Contraseña:</label>
                <input class="form-control" type="password" name="pass" id="txtpass" placeholder="Ingrese Contraseña" /><br> 
                <input class="btn btn-primary btn-block" type="button" name="accion" value="Iniciar Sesión" id="btniniciar" />
        </form>
        <br>
        <as style="color:white">No tienes cuenta?</a><a href="registro.jsp"> Registrarme </a>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
