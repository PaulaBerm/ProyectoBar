<%-- 
    Document   : ajustes
    Created on : 30/10/2020, 04:15:39 PM
    Author     : Sara Rodriguez
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="ModeloVO.CUsuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.EmpleadoC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    EmpleadoC emp = new EmpleadoC();
    HttpSession objsesion = request.getSession(true);
    String correo = (String) objsesion.getAttribute("usuario");

    CUsuario inf = (CUsuario) emp.listC(correo);
    if (correo.equals("")) {
        out.print(correo);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="icon" type="image/png" href="assets/img/Logo_2.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./assets/css/formularioEmp.css" rel="stylesheet" type="text/css"/>
        <title>Carrito</title>
    </head>
    <body>
        <div class="container mt-2">

            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <a class="navbar-brand" href="ControladorC?accion=home">Carta</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">

                        <li class="nav-item">
                            <a class="nav-link">Promociones <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ControladorC?accion=home">Seguir Comprando</a>
                        </li>

                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%out.print(correo);%>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="ajustes.jsp">Ajustes</a>
                                <a class="dropdown-item" href="pedidos.jsp">Compras</a>
                                <a class="dropdown-item" href="#">Cerrar Sesion</a>

                        </li>
                    </form>
                </div>
            </nav>
            <div class="container mt-4">
                <h3>CARRITO</h3>
                <br>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/ControladorEmp?accion=Guardar" onsubmit="return validar()" method="post" class="formulario" id="formulario">
                                    <!-- Grupo: Nombre -->

                                    <div class="formulario__grupo" id="grupo__nombre">
                                        <label for="nombre" class="formulario__label">Nombre</label>
                                        <div class="formulario__grupo-input">
                                            <input type="text" class="formulario__input" name="nombre" id="nombre"  value="<%= inf.getNombre()%>">
                                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                        </div>
                                        <p class="formulario__input-error">El nombre solo puede contener letras.</p>
                                    </div>

                                    <!-- Grupo: Apellido -->
                                    <div class="formulario__grupo" id="grupo__apellido">
                                        <label for="apellido" class="formulario__label">Apellido</label>
                                        <div class="formulario__grupo-input">
                                            <input type="text" class="formulario__input" name="apellido" id="apellido" value="<%= inf.getApellido()%>">
                                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                        </div>
                                        <p class="formulario__input-error">El apellido solo puede contener letras.</p>                                               
                                    </div>


                                    <!-- Grupo: Contraseña -->
                                    <div class="formulario__grupo" id="grupo__password">
                                        <label for="password" class="formulario__label">Contraseña</label>
                                        <div class="formulario__grupo-input">
                                            <input type="password" class="formulario__input" name="password" id="password" value="<%= inf.getContraseña()%>">
                                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                        </div>
                                        <p class="formulario__input-error">La contraseña tiene que ser de 4 a 12 dígitos.</p>
                                        <div>
                                            <label for="password"></label>
                                            <!-- checkbox que nos permite activar o desactivar la opcion -->
                                            <div style="margin-top:5px;">
                                                <input style="margin-left:20px;" type="checkbox" id="mostrar_contrasena" title="clic para mostrar contraseña"/>
                                                &nbsp;&nbsp;Mostrar Contraseña</div>
                                        </div>
                                    </div>

                                    <!-- Grupo: Contraseña 2 -->
                                    <div class="formulario__grupo" id="grupo__password2">
                                        <label for="password2" class="formulario__label">Repetir Contraseña</label>
                                        <div class="formulario__grupo-input">
                                            <input type="password" class="formulario__input" name="password2" id="password2" >
                                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                        </div>
                                        <p class="formulario__input-error">Ambas contraseñas deben ser iguales.</p>
                                        <div>
                                            <label for="password"></label>
                                            <!-- checkbox que nos permite activar o desactivar la opcion -->
                                            <div style="margin-top:5px;">
                                                <input style="margin-left:20px;" type="checkbox" id="mostrar_contrasena2" title="clic para mostrar contraseña"/>
                                                &nbsp;&nbsp;Mostrar Contraseña</div>
                                        </div>

                                    </div>

                                    <!-- Grupo: Correo Electronico -->
                                    <div class="formulario__grupo" id="grupo__correo">
                                        <label for="correo" class="formulario__label">Correo Electrónico</label>
                                        <div class="formulario__grupo-input">
                                            <input type="email" class="formulario__input" name="correo" id="correo" value="<%= inf.getCorreo()%>">
                                            <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                        </div>
                                        <p class="formulario__input-error">El correo solo puede contener letras, numeros, puntos, guiones y guion bajo.</p>
                                    </div>

                                    <div class="formulario__mensaje" id="formulario__mensaje">
                                        <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                                    </div>


                                    <div class="formulario__grupo formulario__grupo-btn-enviar">
                                        <input type="hidden" name="txtIdCl" value="<%= inf.getId_empleado()%>">
                                        <input type="hidden" name="txtIdUs" value="<%= inf.getId_usuario()%>">
                                        <button type="submit" class="formulario__btn" id="guardar" onclick="si()" name="accion" value="Guardar">Guardar Cambios</button>
                                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                                    </div>
                                </form>
                            </div>                                    
                        </div>
                    </div>
                </div>
            </div>
            <script src="./assets/js/formularioEmp.js" type="text/javascript"></script>
            <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
            <script src="Func/funciones.js" type="text/javascript"></script>
            <script src="assets/js/empleado.js" type="text/javascript"></script>
    </body>
</html>
