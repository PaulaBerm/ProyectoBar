<%-- 
    Document   : indexEmpleado
    Created on : 1/08/2020, 04:52:09 PM
    Author     : Paula
--%>
<%@page import="Controlador.EmpleadoC"%>
<%@page import="Controlador.Consultas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "ModeloVO.CUsuario"%>
<%@page import= "javax.servlet.http.*"%>
<%
    EmpleadoC emp = new EmpleadoC();
    HttpSession objsesion = request.getSession(true);
    String correo = (String) objsesion.getAttribute("usuario");

    String nombre = emp.buscarNombre(correo);
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
        <link rel="icon" type="image/x-icon" href="assets/img/Logo_2.png"/>
        <link href="assets/css/loader.css" rel="stylesheet" type="text/css" /> <!--Pasado-->
        <script src="assets/js/loader.js"></script> <!--Pasado-->

        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" /> <!--Pasado cambiar ruta-->
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" /> <!--Pasado-->
        <!-- END GLOBAL MANDATORY STYLES -->

        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="plugins/apex/apexcharts.css" rel="stylesheet" type="text/css"> <!--Pasado-->
        <link href="assets/css/dashboard/dash_1.css" rel="stylesheet" type="text/css" /> <!--Pasado-->
        <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->

        <link href="assets/css/cssEmpleado.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/sweetalert.css" rel="stylesheet" type="text/css"/>

    </head>

    <body class="alt-menu sidebar-noneoverflow">
        <!-- BEGIN LOADER -->
        <div id="load_screen">
            <div class="loader">
                <div class="loader-content">
                    <div class="spinner-grow align-self-center"></div>
                </div>
            </div>
        </div>
        <!--  END LOADER -->

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
                        <li class="menu active">
                            <a href="ControladorEmp?accion=inicio" data-toggle="collapse" aria-expanded="true" class="dropdown-toggle">
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

                        <li class="menu">
                            <a href="ControladorEmp?accion=ajustes" aria-expanded="false" class="dropdown-toggle">
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
                        
                        <li class="menu">
                            <a href="vistasEmp/autenticacionEmp.jsp" aria-expanded="false" class="dropdown-toggle">
                                <div class="">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                         stroke-linejoin="round" class="feather feather-user">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                    <circle cx="12" cy="7" r="4"></circle>
                                    </svg>
                                    <span>Autenticación</span>
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

                    <div class="row layout-top-spacing">

                        <div class="col-xl-5 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="widget widget-one">
                                <div class="widget-heading">
                                    <h6 class="">Statistics</h6>
                                </div>
                                <div class="w-chart">
                                    <div class="w-chart-section">
                                        <div class="w-detail">
                                            <p class="w-title">Total Visits</p>
                                            <p class="w-stats">423,964</p>
                                        </div>
                                        <div class="w-chart-render-one">
                                            <div id="total-users"></div>
                                        </div>
                                    </div>

                                    <div class="w-chart-section">
                                        <div class="w-detail">
                                            <p class="w-title">Paid Visits</p>
                                            <p class="w-stats">7,929</p>
                                        </div>
                                        <div class="w-chart-render-one">
                                            <div id="paid-visits"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
                            <div class="widget widget-account-invoice-two">
                                <div class="widget-content">
                                    <div class="account-box">
                                        <div class="info">
                                            <h5 class="">Pro Plan</h5>
                                            <p class="inv-balance">$10,344</p>
                                        </div>
                                        <div class="acc-action">
                                            <div class="">
                                                <a href="javascript:void(0);"><svg xmlns="http://www.w3.org/2000/svg"
                                                                                   width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                                                   stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                                                   stroke-linejoin="round" class="feather feather-plus">
                                                    <line x1="12" y1="5" x2="12" y2="19"></line>
                                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                                    </svg></a>
                                                <a href="javascript:void(0);"><svg xmlns="http://www.w3.org/2000/svg"
                                                                                   width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                                                   stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                                                   stroke-linejoin="round" class="feather feather-credit-card">
                                                    <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                                                    <line x1="1" y1="10" x2="23" y2="10"></line>
                                                    </svg></a>
                                            </div>
                                            <a href="javascript:void(0);">Upgrade</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
                            <div class="widget widget-card-four">
                                <div class="widget-content">
                                    <div class="w-content">
                                        <div class="w-info">
                                            <h6 class="value">$ 45,141</h6>
                                            <p class="">Expenses</p>
                                        </div>
                                        <div class="">
                                            <div class="w-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-home">
                                                <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                                <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="progress">
                                        <div class="progress-bar bg-gradient-secondary" role="progressbar"
                                             style="width: 57%" aria-valuenow="57" aria-valuemin="0" aria-valuemax="100">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-xl-9 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="widget widget-chart-three">
                                <div class="widget-heading">
                                    <div class="">
                                        <h5 class="">Unique Visitors</h5>
                                    </div>

                                    <div class="dropdown  custom-dropdown">
                                        <a class="dropdown-toggle" href="#" role="button" id="uniqueVisitors"
                                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                 viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                 stroke-linecap="round" stroke-linejoin="round"
                                                 class="feather feather-more-horizontal">
                                            <circle cx="12" cy="12" r="1"></circle>
                                            <circle cx="19" cy="12" r="1"></circle>
                                            <circle cx="5" cy="12" r="1"></circle>
                                            </svg>
                                        </a>

                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="uniqueVisitors">
                                            <a class="dropdown-item" href="javascript:void(0);">View</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Update</a>
                                            <a class="dropdown-item" href="javascript:void(0);">Download</a>
                                        </div>
                                    </div>
                                </div>

                                <div class="widget-content">
                                    <div id="uniqueVisits"></div>
                                </div>
                            </div>
                        </div>

                        <!--<div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">
                                <div class="widget widget-activity-three">
    
                                    <div class="widget-heading">
                                        <h5 class="">Notifications</h5>
                                    </div>
    
                                    <div class="widget-content">
    
                                        <div class="mt-container mx-auto">
                                            <div class="timeline-line">
    
                                                <div class="item-timeline timeline-new">
                                                    <div class="t-dot">
                                                        <div class="t-primary"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg></div>
                                                    </div>
                                                    <div class="t-content">
                                                        <div class="t-uppercontent">
                                                            <h5>Logs</h5>
                                                            <span class="">27 Feb, 2020</span>
                                                        </div>
                                                        <p><span>Updated</span> Server Logs</p>
                                                        <div class="tags">
                                                            <div class="badge badge-primary">Logs</div>
                                                            <div class="badge badge-success">CPanel</div>
                                                            <div class="badge badge-warning">Update</div>
                                                        </div>
                                                    </div>
                                                </div>
    
                                                <div class="item-timeline timeline-new">
                                                    <div class="t-dot">
                                                        <div class="t-success"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg></div>
                                                    </div>
                                                    <div class="t-content">
                                                        <div class="t-uppercontent">
                                                            <h5>Mail</h5>
                                                            <span class="">28 Feb, 2020</span>
                                                        </div>
                                                        <p>Send Mail to <a href="javascript:void(0);">HR</a> and <a href="javascript:void(0);">Admin</a></p>
                                                        <div class="tags">
                                                            <div class="badge badge-primary">Admin</div>
                                                            <div class="badge badge-success">HR</div>
                                                            <div class="badge badge-warning">Mail</div>
                                                        </div>
                                                    </div>
                                                </div>
    
                                                <div class="item-timeline timeline-new">
                                                    <div class="t-dot">
                                                        <div class="t-danger"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check"><polyline points="20 6 9 17 4 12"></polyline></svg></div>
                                                    </div>
                                                    <div class="t-content">
                                                        <div class="t-uppercontent">
                                                            <h5>Task Completed</h5>
                                                            <span class="">01 Mar, 2020</span>
                                                        </div>
                                                        <p>Backup <span>Files EOD</span></p>
                                                        <div class="tags">
                                                            <div class="badge badge-primary">Backup</div>
                                                            <div class="badge badge-success">EOD</div>
                                                        </div>
                                                    </div>
                                                </div>
    
                                                <div class="item-timeline timeline-new">
                                                    <div class="t-dot">
                                                        <div class="t-warning"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg></div>
                                                    </div>
                                                    <div class="t-content">
                                                        <div class="t-uppercontent">
                                                            <h5>Collect Docs</h5>
                                                            <span class="">10 Mar, 2020</span>
                                                        </div>
                                                        <p>Collected documents from <a href="javascript:void(0);">Sara</a></p>
                                                        <div class="tags">
                                                            <div class="badge badge-success">Collect</div>
                                                            <div class="badge badge-warning">Docs</div>
                                                        </div>
                                                    </div>
                                                </div>
    
                                                <div class="item-timeline timeline-new">
                                                    <div class="t-dot">
                                                        <div class="t-dark"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-server"><rect x="2" y="2" width="20" height="8" rx="2" ry="2"></rect><rect x="2" y="14" width="20" height="8" rx="2" ry="2"></rect><line x1="6" y1="6" x2="6" y2="6"></line><line x1="6" y1="18" x2="6" y2="18"></line></svg></div>
                                                    </div>
                                                    <div class="t-content">
                                                        <div class="t-uppercontent">
                                                            <h5>Reboot</h5>
                                                            <span class="">06 Apr, 2020</span>
                                                        </div>
                                                        <p>Server rebooted successfully</p>
                                                        <div class="tags">
                                                            <div class="badge badge-warning">Reboot</div>
                                                            <div class="badge badge-primary">Server</div>
                                                        </div>
                                                    </div>
                                                </div>                                      
                                            </div>                                    
                                        </div>
                                    </div>
                                </div>
                            </div>-->

                        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">
                            <div class="widget-four">
                                <div class="widget-heading">
                                    <h5 class="">Visitors by Browser</h5>
                                </div>
                                <div class="widget-content">
                                    <div class="vistorsBrowser">
                                        <div class="browser-list">
                                            <div class="w-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-chrome">
                                                <circle cx="12" cy="12" r="10"></circle>
                                                <circle cx="12" cy="12" r="4"></circle>
                                                <line x1="21.17" y1="8" x2="12" y2="8"></line>
                                                <line x1="3.95" y1="6.06" x2="8.54" y2="14"></line>
                                                <line x1="10.88" y1="21.94" x2="15.46" y2="14"></line>
                                                </svg>
                                            </div>
                                            <div class="w-browser-details">
                                                <div class="w-browser-info">
                                                    <h6>Chrome</h6>
                                                    <p class="browser-count">65%</p>
                                                </div>
                                                <div class="w-browser-stats">
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-primary" role="progressbar"
                                                             style="width: 65%" aria-valuenow="90" aria-valuemin="0"
                                                             aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="browser-list">
                                            <div class="w-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-compass">
                                                <circle cx="12" cy="12" r="10"></circle>
                                                <polygon
                                                    points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76">
                                                </polygon>
                                                </svg>
                                            </div>
                                            <div class="w-browser-details">

                                                <div class="w-browser-info">
                                                    <h6>Safari</h6>
                                                    <p class="browser-count">25%</p>
                                                </div>

                                                <div class="w-browser-stats">
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-danger" role="progressbar"
                                                             style="width: 35%" aria-valuenow="65" aria-valuemin="0"
                                                             aria-valuemax="100"></div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                        <div class="browser-list">
                                            <div class="w-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-globe">
                                                <circle cx="12" cy="12" r="10"></circle>
                                                <line x1="2" y1="12" x2="22" y2="12"></line>
                                                <path
                                                    d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                                </path>
                                                </svg>
                                            </div>
                                            <div class="w-browser-details">

                                                <div class="w-browser-info">
                                                    <h6>Others</h6>
                                                    <p class="browser-count">15%</p>
                                                </div>

                                                <div class="w-browser-stats">
                                                    <div class="progress">
                                                        <div class="progress-bar bg-gradient-warning" role="progressbar"
                                                             style="width: 15%" aria-valuenow="15" aria-valuemin="0"
                                                             aria-valuemax="100"></div>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="row widget-statistic">
                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                                    <div class="widget widget-one_hybrid widget-followers">
                                        <div class="widget-heading">
                                            <div class="w-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-users">
                                                <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                                                <circle cx="9" cy="7" r="4"></circle>
                                                <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                                                <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                                                </svg>
                                            </div>
                                            <p class="w-value">31.6K</p>
                                            <h5 class="">Followers</h5>
                                        </div>
                                        <div class="widget-content">
                                            <div class="w-chart">
                                                <div id="hybrid_followers"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                                    <div class="widget widget-one_hybrid widget-referral">
                                        <div class="widget-heading">
                                            <div class="w-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-link">
                                                <path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71">
                                                </path>
                                                <path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71">
                                                </path>
                                                </svg>
                                            </div>
                                            <p class="w-value">1,900</p>
                                            <h5 class="">Referral</h5>
                                        </div>
                                        <div class="widget-content">
                                            <div class="w-chart">
                                                <div id="hybrid_followers1"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                                    <div class="widget widget-one_hybrid widget-engagement">
                                        <div class="widget-heading">
                                            <div class="w-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                                     stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-message-circle">
                                                <path
                                                    d="M21 11.5a8.38 8.38 0 0 1-.9 3.8 8.5 8.5 0 0 1-7.6 4.7 8.38 8.38 0 0 1-3.8-.9L3 21l1.9-5.7a8.38 8.38 0 0 1-.9-3.8 8.5 8.5 0 0 1 4.7-7.6 8.38 8.38 0 0 1 3.8-.9h.5a8.48 8.48 0 0 1 8 8v.5z">
                                                </path>
                                                </svg>
                                            </div>
                                            <p class="w-value">18.2%</p>
                                            <h5 class="">Engagement</h5>
                                        </div>
                                        <div class="widget-content">
                                            <div class="w-chart">
                                                <div id="hybrid_followers3"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--<div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
                                <div class="widget widget-card-one">
                                    <div class="widget-content">
    
                                        <div class="media">
                                            <div class="w-img">
                                                <img src="assets/img/90x90.jpg" alt="avatar">
                                            </div>
                                            <div class="media-body">
                                                <h6>Jimmy Turner</h6>
                                                <p class="meta-date-time">Monday, Nov 18</p>
                                            </div>
                                        </div>
    
                                        <p>"Duis aute irure dolor" in reprehenderit in voluptate velit esse cillum "dolore eu fugiat" nulla pariatur. Excepteur sint occaecat cupidatat non proident.</p>
    
                                        <div class="w-action">
                                            <div class="card-like">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-thumbs-up"><path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
                                                <span>551 Likes</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
    
                            </div>
                            
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-6 col-12 layout-spacing">
                                <div class="widget widget-five">
                                    <div class="widget-content">
    
                                        <div class="header">
                                            <div class="header-body">
                                                <h6>Pending Tasks</h6>
                                                <p class="meta-date">Nov 2019</p>
                                            </div>
                                            <div class="task-action">
                                                <div class="dropdown  custom-dropdown">
                                                    <a class="dropdown-toggle" href="#" role="button" id="pendingTask" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-horizontal"><circle cx="12" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle></svg>
                                                    </a>
    
                                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="pendingTask">
                                                        <a class="dropdown-item" href="javascript:void(0);">Add</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">View</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">Update</a>
                                                        <a class="dropdown-item" href="javascript:void(0);">Clear All</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
    
                                        <div class="w-content">
                                            <div class="">                                            
                                                <p class="task-left">8</p>
                                                <p class="task-completed"><span>12 Done</span></p>
                                                <p class="task-hight-priority"><span>3 Task</span> with High priotity</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
    
                            </div>
                            
                            <div class="col-xl-4 col-lg-6 col-md-6 col-sm-12 col-12 layout-spacing">
                                <div class="widget widget-card-two">
                                    <div class="widget-content">
    
                                        <div class="media">
                                            <div class="w-img">
                                                <img src="assets/img/90x90.jpg" alt="avatar">
                                            </div>
                                            <div class="media-body">
                                                <h6>Dev Summit - New York</h6>
                                                <p class="meta-date-time">Bronx, NY</p>
                                            </div>
                                        </div>
    
                                        <div class="card-bottom-section">
                                            <h5>4 Members Going</h5>
                                            <div class="img-group">
                                                <img src="assets/img/90x90.jpg" alt="avatar">
                                                <img src="assets/img/90x90.jpg" alt="avatar">
                                                <img src="assets/img/90x90.jpg" alt="avatar">
                                                <img src="assets/img/90x90.jpg" alt="avatar">
                                            </div>
                                            <a href="javascript:void(0);" class="btn">View Details</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        -->
                    </div>
                    <!--Contenido-->
                </div>
            </div>
            <!--  END CONTENT AREA  -->

        </div>
        <!-- END MAIN CONTAINER -->

        <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
        <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
        <!--Pasado-->
        <script src="assets/js/popper.min.js"></script>
        <!--Pasado cambiar ruta-->
        <script src="assets/js/bootstrap.min.js"></script>
        <!--Pasado cambiar ruta-->
        <script src="plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <!--Pasado-->
        <script src="assets/js/app.js"></script>
        <!--Pasado-->
        <script>
                                    $(document).ready(function () {
                                        App.init();
                                    });
        </script>
        <script src="assets/js/custom.js"></script>
        <!--Pasado-->
        <!-- END GLOBAL MANDATORY SCRIPTS -->

        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
        <script src="plugins/apex/apexcharts.min.js"></script>
        <!--Pasado-->
        <script src="assets/js/dashboard/dash_1.js"></script>
        <!--Pasado-->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
         <script src="assets/js/sweetalert.min.js" type="text/javascript"></script>

        <script src="assets/js/empleado.js" type="text/javascript"></script>

    </body>

</html>