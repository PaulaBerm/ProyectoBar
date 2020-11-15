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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>INBAR | Mesero </title>
        <link rel="icon" type="image/x-icon" href="assets/img/Logo_2.png" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <link href="assets/css/formularioEmp.css" rel="stylesheet" type="text/css"/>
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->

        <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="assets/css/cssEmpleado.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/sweetalert.css" rel="stylesheet" type="text/css"/>

    </head>

    <body class="alt-menu sidebar-noneoverflow">

        <!--  BEGIN NAVBAR  -->
        <div class="header-container fixed-top">
            <header class="header navbar navbar-expand-sm expand-header">
                <a href="javascript:void(0);" class="sidebarCollapse" data-placement="bottom"><svg
                        xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                        stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                        class="feather feather-menu">
                    <line x1="3" y1="12" x2="21" y2="12"></line>
                    <line x1="3" y1="6" x2="21" y2="6"></line>
                    <line x1="3" y1="18" x2="21" y2="18"></line>
                    </svg></a>

                <ul class="navbar-item flex-row ml-auto">

                    <li class="nav-item dropdown user-profile-dropdown  order-lg-0 order-1">
                        <a href="javascript:void(0);" class="nav-link dropdown-toggle user" id="userProfileDropdown"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                                 stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                 class="feather feather-user-check">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="8.5" cy="7" r="4"></circle>
                            <polyline points="17 11 19 13 23 9"></polyline>
                            </svg>
                        </a>
                        <div class="dropdown-menu position-absolute e-animated e-fadeInUp"
                             aria-labelledby="userProfileDropdown">
                            <div class="user-profile-section">
                                <div class="media mx-auto">
                                    <!--<img src="assets/img/90x90.jpg" class="img-fluid mr-2" alt="avatar">-->
                                    <div class="media-body">
                                        <h5><%out.print(nombre);%></h5>
                                        <p>Mesero</p>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown-item">
                                <a href="ControladorEmp?accion=ajustes">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-user">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                    <span>Perfil</span>
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a onclick="mensaje()">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-log-out">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                    </svg>
                                    <span>Salir</span>
                                </a>
                            </div>
                        </div>
                    </li>
                </ul>
            </header>
        </div>
        <!--  END NAVBAR  -->

        <!--  BEGIN MAIN CONTAINER  -->
        <div class="main-container sidebar-closed sbar-open" id="container">

            <div class="overlay"></div>
            <div class="cs-overlay"></div>
            <div class="search-overlay"></div>

            <!--  BEGIN SIDEBAR  -->
            <div class="sidebar-wrapper sidebar-theme">

                <div id="dismiss" class="d-lg-none"><i class="flaticon-cancel-12"></i></div>

                <nav id="sidebar">

                    <ul class="navbar-nav theme-brand flex-row  text-center">
                        <li class="nav-item theme-logo">
                            <a href="ControladorEmp?accion=inicio">
                                <img src="assets/img/LogoInvertido.png" class="navbar-logo" alt="logo">
                            </a>
                        </li>
                        <li class="nav-item theme-text">
                            <a href="ControladorEmp?accion=inicio" class="nav-link"> INBAR </a>
                        </li>
                    </ul>

                    <ul class="list-unstyled menu-categories" id="accordionExample">
                        <li class="menu">
                            <a href="ControladorEmp?accion=inicio" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-home">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                    </svg>
                                    <span>inicio</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu menu-heading">
                            <div class="heading"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                      viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle">
                                <circle cx="12" cy="12" r="10"></circle>
                                </svg><span>Pedidos</span></div>
                        </li>

                        <li class="menu">
                            <a href="ControladorEmp?accion=pedido" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-edit">
                                    <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                    <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                    </svg>
                                    <span>Entrando</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu">
                            <a href="ControladorEmp?accion=listar" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-layout">
                                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="3" y1="9" x2="21" y2="9"></line>
                                    <line x1="9" y1="21" x2="9" y2="9"></line>
                                    </svg>
                                    <span>Realizados</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu menu-heading">
                            <div class="heading"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                      viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle">
                                <circle cx="12" cy="12" r="10"></circle>
                                </svg><span>Ajustes</span></div>
                        </li>

                        <li class="menu active">
                            <a href="ControladorEmp?accion=ajustes" aria-expanded="true" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-user">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                    <span>Perfil</span>
                                </div>
                            </a>
                        </li>


                    </ul>

                </nav>

            </div>
            <!--  END SIDEBAR  -->

            <!--  BEGIN CONTENT AREA  -->
            <div id="content" class="main-content">
                <div class="layout-px-spacing">

                    <div class="page-header">
                        <div class="page-title">
                            <h3>Ajustes</h3>
                        </div>
                    </div>


                    <!-- CONTENT AREA -->
                    <div class="row" id="cancel-row">

                        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                            <div class="widget-content widget-content-area br-6">
                                <form action="${pageContext.request.contextPath}/ControladorEmp" onsubmit="return validar()" method="post" class="formulario" id="formulario">
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
                                        <button type="submit" class="formulario__btn" id="guardar" name="accion" value="Guardar Cambios">Guardar Cambios</button>
                                        <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- CONTENT AREA -->
                </div>
            </div>
            <!--  END CONTENT AREA  -->
        </div>
        <!-- END MAIN CONTAINER -->

        <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
        <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="assets/js/formularioEmp.js" type="text/javascript"></script>
        <script>
                                    $(document).ready(function () {
                                        App.init();
                                    });
        </script>
        <script src="assets/js/custom.js"></script>
        <!-- END GLOBAL MANDATORY SCRIPTS -->

        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->

        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
        <script src="assets/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="assets/js/empleado.js" type="text/javascript"></script>
    </body>

</html>