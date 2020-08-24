<%-- 
    Document   : registro.jsp
    Created on : 26/07/2020, 08:18:09 PM
    Author     : Brandon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <title>Registrarme</title>
    </head>
    <body>

        <div class="container col-lg-3">
            <form action="nuevousuario" method="post" >
                <div class="form-group text-center"> 
                    <img src="img/bar.png.png" height="110" width="110"/>
                    <p style="color:white"><strong>Bienvenidos al Sistema de Registro</strong></p>
                </div>
                <div class="form-group">
                    <label style="color:white">Usuario:</label>
                    <input class="form-control" type="text" name="usuario"  placeholder="Ingrese Usuario"/><br>
                </div>
                <div class="form-group">
                    <label style="color:white">Nombre:</label>
                    <input class="form-control" type="text" name="nombre"  placeholder="Ingrese Nombre"/><br>
                </div>
                <div class="form-group">
                    <label style="color:white">Apellido:</label>
                    <input class="form-control" type="text" name="apellido"  placeholder="Ingrese Apellido"/><br>
                </div>
                <div class="form-group">
                    <label style="color:white">Correo:</label>
                    <input class="form-control" type="email" name="correo"  placeholder="example0@gmail.com"/><br>
                </div>
                <div class="form-group">
                    <label style="color:white">Contraseña:</label>
                    <input class="form-control" type="password" name="pass"  placeholder="Ingrese Contraseña"/><br>
                    <input class="btn btn-primary btn-block" type="submit" name="accion" value="Registrarme"/>
            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script> 
</body>
</html>
