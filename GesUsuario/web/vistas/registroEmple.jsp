<%-- 
    Document   : registroEmple
    Created on : 01-nov-2020, 19:29:46
    Author     : cidra
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
        <link rel="icon" type="image/x-icon" href="./assets/img/Logo_2.png" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="./assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->

        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->

        <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->

        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link href="assets/css/elements/miscellaneous.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/elements/breadcrumb.css" rel="stylesheet" type="text/css" />
        <!--  END CUSTOM STYLE FILE  -->

        <link href="./assets/css/formularioEmp.css" rel="stylesheet" type="text/css" />
        <link href="./assets/css/cssEmpleado.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/css/sweetalert.css" rel="stylesheet" type="text/css"/>

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
                                    <div class="media-body">
                                        <h5><%out.print(nombre);%></h5>
                                        <p>Administrador</p>
                                    </div>
                                </div>
                            </div>
                            <div class="dropdown-item">
                                <a onclick="mensaje()">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-log-out">
                                    <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path>
                                    <polyline points="16 17 21 12 16 7"></polyline>
                                    <line x1="21" y1="12" x2="9" y2="12"></line>
                                    </svg> <span>Salir</span>
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
                            <a href="Controlador?accion=inico">
                                <img src="assets/img/LogoInvertido.png" class="navbar-logo" alt="logo">
                            </a>
                        </li>
                        <li class="nav-item theme-text">
                            <a href="Controlador?accion=inico" class="nav-link"> INBAR </a>
                        </li>
                    </ul>

                    <ul class="list-unstyled menu-categories" id="accordionExample">
                        <li class="menu">
                            <a href="Controlador?accion=inico" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-home">
                                    <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                    <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                    </svg>
                                    <span>Inicio</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu menu-heading">
                            <div class="heading"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                      viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle">
                                <circle cx="12" cy="12" r="10"></circle>
                                </svg><span>Tablas</span></div>
                        </li>

                        <li class="menu">
                            <a href="vistas/Tabla_pedidos.jsp" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-layout">
                                    <rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect>
                                    <line x1="3" y1="9" x2="21" y2="9"></line>
                                    <line x1="9" y1="21" x2="9" y2="9"></line>
                                    </svg>
                                    <span>Pedidos</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu active">
                            <a href="Controlador?accion=empleadotabla" aria-expanded="true" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-users">
                                    <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="9" cy="7" r="4"></circle>
                                    <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                    <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                    </svg>
                                    <span>Empleados</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu menu-heading">
                            <div class="heading"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                      viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                      stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle">
                                <circle cx="12" cy="12" r="10"></circle>
                                </svg><span>Registros</span></div>
                        </li>

                        <li class="menu">
                            <a href="Controlador?accion=listarr" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-list">
                                    <line x1="8" y1="6" x2="21" y2="6"></line>
                                    <line x1="8" y1="12" x2="21" y2="12"></line>
                                    <line x1="8" y1="18" x2="21" y2="18"></line>
                                    <line x1="3" y1="6" x2="3.01" y2="6"></line>
                                    <line x1="3" y1="12" x2="3.01" y2="12"></line>
                                    <line x1="3" y1="18" x2="3.01" y2="18"></line>
                                    </svg>
                                    <span>Categorias</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu">
                            <a href="Controlador?accion=mesas" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-grid">
                                    <rect x="3" y="3" width="7" height="7"></rect>
                                    <rect x="14" y="3" width="7" height="7"></rect>
                                    <rect x="14" y="14" width="7" height="7"></rect>
                                    <rect x="3" y="14" width="7" height="7"></rect>
                                    </svg>
                                    <span>Mesas</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu">
                            <a href="admProd.html" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 448 512"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-beer">
                                    <path fill="currentColor"
                                          d="M368 96h-48V56c0-13.255-10.745-24-24-24H24C10.745 32 0 42.745 0 56v400c0 13.255 10.745 24 24 24h272c13.255 0 24-10.745 24-24v-42.11l80.606-35.977C429.396 365.063 448 336.388 448 304.86V176c0-44.112-35.888-80-80-80zm16 208.86a16.018 16.018 0 0 1-9.479 14.611L320 343.805V160h48c8.822 0 16 7.178 16 16v128.86zM208 384c-8.836 0-16-7.164-16-16V144c0-8.836 7.164-16 16-16s16 7.164 16 16v224c0 8.836-7.164 16-16 16zm-96 0c-8.836 0-16-7.164-16-16V144c0-8.836 7.164-16 16-16s16 7.164 16 16v224c0 8.836-7.164 16-16 16z" />
                                    </svg>
                                    <span>Productos</span>
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
                            <h3>Registro de empleados</h3>
                        </div>
                    </div>

                    <div class="">

                        <div class="breadcrumb-five">
                            <ul class="breadcrumb">
                                <li class="active mb-2"><a href="Controlador?accion=empleadotabla">Listado</a>/</li>
                                <li class="mb-2"><a href="javscript:void(0);">Registro</a></li>
                            </ul>
                        </div>


                        <!-- CONTENT AREA -->
                        <div class="row" id="cancel-row">

                            <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                                <div class="widget-content widget-content-area br-6">
                                    <form action="${pageContext.request.contextPath}/Controlador?accion=cambios" onsubmit="return validar()" method="post" class="formulario" id="formulario">
                                        <!-- Grupo: Nombre -->

                                        <div class="formulario__grupo" id="grupo__nombre">
                                            <label for="nombre" class="formulario__label">Nombre</label>
                                            <div class="formulario__grupo-input">
                                                <input type="text" class="formulario__input" name="nombre" id="nombre"  value="">
                                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                            </div>
                                            <p class="formulario__input-error">El nombre solo puede contener letras.</p>
                                        </div>

                                        <!-- Grupo: Apellido -->
                                        <div class="formulario__grupo" id="grupo__apellido">
                                            <label for="apellido" class="formulario__label">Apellido</label>
                                            <div class="formulario__grupo-input">
                                                <input type="text" class="formulario__input" name="apellido" id="apellido" value="">
                                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                            </div>
                                            <p class="formulario__input-error">El apellido solo puede contener letras.</p>                                               
                                        </div>

                                        <!-- Grupo: Correo Electronico -->
                                        <div class="formulario__grupo" id="grupo__correo">
                                            <label for="correo" class="formulario__label">Correo Electrónico</label>
                                            <div class="formulario__grupo-input">
                                                <input type="email" class="formulario__input" name="correo" id="correo" value="">
                                                <i class="formulario__validacion-estado fas fa-times-circle"></i>
                                            </div>
                                            <p class="formulario__input-error">El correo solo puede contener letras, numeros, puntos, guiones y guion bajo.</p>
                                        </div>

                                        <div class="formulario__mensaje" id="formulario__mensaje">
                                            <p><i class="fas fa-exclamation-triangle"></i> <b>Error:</b> Por favor rellena el formulario correctamente. </p>
                                        </div>


                                        <div class="formulario__grupo formulario__grupo-btn-enviar">
                                            <button type="submit" class="formulario__btn" id="guardar" name="accion" value="cambios">Guardar Cambios</button>
                                            <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                                        </div>
                                        <!--
                                        <div>
                                             <input class="btn btn-secondary btn-block" type="submit" name="accion" value="Tabla empleados">
                                            <p class="formulario__mensaje-exito" id="formulario__mensaje-exito">Formulario enviado exitosamente!</p>
                                        </div>
                                        -->
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
        </div>
        <!-- END MAIN CONTAINER -->

        <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
        <script src="./assets/js/libs/jquery-3.1.1.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <script src="plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="./assets/js/app.js"></script>

        <script>
                                        $(document).ready(function () {
                                            App.init();
                                        });
        </script>
        <!-- END GLOBAL MANDATORY SCRIPTS -->
        <script src="plugins/highlight/highlight.pack.js"></script>
        <script src="./assets/js/custom.js"></script>
        <!-- END GLOBAL MANDATORY STYLES -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="./assets/js/scrollspyNav.js"></script>
        <!-- END PAGE LEVEL SCRIPTS -->

        <script src="./assets/js/formularioEmp.js" type="text/javascript"></script>
        <script src="./assets/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="./assets/js/empleado.js" type="text/javascript"></script>
    </body>
</html>