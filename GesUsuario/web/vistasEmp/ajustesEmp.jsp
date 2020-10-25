<%-- 
    Document   : ajustesEmp
    Created on : 28/08/2020, 07:24:31 PM
    Author     : Paula
--%>


<%@page import="ModeloVO.CUsuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Controlador.EmpleadoC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    EmpleadoC emp = new EmpleadoC();
    HttpSession objsesion = request.getSession(true);
    String correo = (String) objsesion.getAttribute("usuario");

    String nombre = emp.buscarNombre(correo);
    CUsuario inf = (CUsuario) emp.list(correo);
    if (correo.equals("")) {
        out.print(correo);
        out.print(nombre);
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="icon" type="image/png" href="./assets/img/Logo_2.png">
        <title>Mesero | Bar La Fonda Paisa</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link rel="stylesheet" media="only screen and (max-width: 768px)" href="formularioEmp.css">
        <link rel="stylesheet" media="only screen and (max-width: 768px)" href="cssInterEmpleado.css">
        
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="./assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/css/sb-admin_Emp.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/css/cssEmpleado.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/css/demoEmp.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="./assets/css/all.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link href="./assets/css/font-awesomEmp.min.css" rel="stylesheet" type="text/css"/>

        <link href="./assets/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="./assets/js/sweetalert.min.js" type="text/javascript"></script>

        <!--<script src="./assets/js/empleado.js" type="text/javascript"></script>-->
        <script src="//code.jquery.com/jquery-1.10.1.min.js"></script>
        <link href="./assets/css/cssInterEmpleado.css" rel="stylesheet" type="text/css"/>


        <link rel="stylesheet" href="https://necolas.github.io/normalize.css/8.0.1/normalize.css">
        <link href="./assets/css/formularioEmp.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script> 

        <style type="text/css">
            .img {
                max-width: 200px;
                width: 50%;
                margin: auto;
                position: relative;
                align-content: center;
            }
        </style>
    </head>

    <body id="page-top">
        <!-- Page Wrapper -->
        <div id="wrapper">
            <form action="" method="post">
                <!-- Sidebar -->
                <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                    <!-- Sidebar - Brand -->
                    <div class="img" ><img src="assets/img/LogoNombreAbajoInv.png" alt=""/></div>
                    <hr class="sidebar-divider">

                    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="">
                        <div class="sidebar-brand-icon rotate-n-15">
                            <i class=""></i>
                        </div> 
                        <div class="">Mesero</div>
                        <div><sup>La</sup> Fonda Paisa</div>
                        <br>
                    </a>

                    <!-- Divider -->
                    <hr class="sidebar-divider my-0">
                    <!-- Nav Item - Dashboard -->
                    <li class="nav-item">
                        <a class="nav-link" href="ControladorEmp?accion=inicio">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Inicio</span></a>
                    </li>
                    <!-- Divider -->
                    <hr class="sidebar-divider">
                    <!-- Heading Opcional: es un subtitulo -->
                    <div class="sidebar-heading">
                        <p>Pedido</p>
                    </div>
                    <!-- Nav Item - Pages Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="ControladorEmp?accion=pedido">
                            <!--data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"-->
                            <i class="fas fa-fw fa-clipboard-list"></i>
                            <span>Pedido en Fila</span>
                        </a>
                    </li>

                    <!-- Nav Item - Utilities Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="ControladorEmp?accion=listar">
                            <!--data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"-->
                            <i class="fas fa-fw fa-book"></i>
                            <span>Pedidos Realizados</span>
                        </a>
                    </li>
                    <!-- Divider -->
                    <hr class="sidebar-divider">
                    <!-- Heading Titulo-->
                    <div class="sidebar-heading">
                    </div>
                    <!-- Nav Item - Charts -->
                    <li class="nav-item active">
                        <a class="nav-link collapsed" href="ControladorEmp?accion=ajustes">
                            <i class="fas fa-fw fa-cogs"></i>
                            <span>Ajustes</span>
                        </a>
                    </li>

                    <!-- Nav Item - Tables
                    <li class="nav-item">
                        <a class="nav-link" href="">
                            <i class="fas fa-fw fa-table"></i>
                            <span>Tables</span>
                        </a>
                    </li> -->

                    <!-- Divider -->
                    <hr class="sidebar-divider d-none d-md-block">
                    <!-- Sidebar Toggler (Sidebar) -->
                    <div class="text-center d-none d-md-inline">
                        <button class="rounded-circle border-0" id="sidebarToggle"></button>
                    </div>
                </ul>
            </form>

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">
                <!-- Main Content -->
                <div id="content">
                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto col-md-8">
                            <li class="nav-item">
                                <a class="nav-link">
                                    <i class="" style="color:black">¡Hola!, <%out.print(nombre);%>..</i>

                                </a>
                            </li>
                        </ul>
                        <ul class="navbar-nav ml-auto col-md-2">

                        </ul>
                        <ul class="navbar-nav ml-auto col-md-2">
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                                </a>

                            </li>
                            <li class="nav-item">
                                <a class="nav-link" onclick="mensaje()">
                                    <i class="fa fa-fw fa-sign-out-alt" style="color:black">Salir</i>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="">

                                </a>
                            </li>
                            <div class="topbar-divider d-none d-sm-block"></div>
                        </ul>
                    </nav>
                    <!-- End of Topbar -->

                    <!--CONTENIDO-->
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <form name="accion" action="${pageContext.request.contextPath}/ControladorEmp?accion=Guardar Cambios" onsubmit="return validar()" method="post" class="formulario" id="formulario">
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
                                                <input type="hidden" name="txtIdEm" value="<%= inf.getId_empleado()%>">
                                                <input type="hidden" name="txtIdUs" value="<%= inf.getId_usuario()%>">
                                                <button type="submit" class="formulario__btn" id="guardar" onclick="si()" name="accion" value="Guardar Cambios">Guardar Cambios</button>
                                                <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                                            </div>
                                        </form>
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <!-- Bootstrap core JavaScript-->
    <script src="./assets/js/formularioEmp.js" type="text/javascript"></script>
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>

    

    <script src="./assets/js/jquery.js" type="text/javascript"></script>
    <script src="./assets/js/bootstrap.bundle.js" type="text/javascript"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <script src="./assets/js/empleado.js" type="text/javascript"></script>

    <script src="./assets/js/jquery.easing.js" type="text/javascript"></script>
    <script src="./assets/js/sb-adminEmp.min.js" type="text/javascript"></script>

    <script src="./assets/js/sb-admin-datatables.js" type="text/javascript"></script>
    <script src="./assets/js/sb-admin-charts.min.js" type="text/javascript"></script>

    <script src="./assets/js/Chart.js" type="text/javascript"></script>
    <!--Paula-->
    <script src="./assets/js/demo.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
</html>
