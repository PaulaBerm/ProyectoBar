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
        <link rel="icon" type="image/png" href="assets/img/Logo_2.png">
        <title>Mesero | Bar La Fonda Paisa</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/sb-admin_Emp.css" rel="stylesheet" type="text/css"/>

        <link href="assets/css/cssEmpleado.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/demoEmp.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="assets/css/all.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link href="assets/css/font-awesomEmp.min.css" rel="stylesheet" type="text/css"/>

        <link href="assets/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/sweetalert.min.js" type="text/javascript"></script>

        <script src="assets/js/empleado.js" type="text/javascript"></script>

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
                        <br>
                        <div><sup>La</sup> Fonda Paisa</div>
                    </a>

                    <!-- Divider -->
                    <hr class="sidebar-divider my-0">
                    <!-- Nav Item - Dashboard -->
                    <li class="nav-item active">
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
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="ControladorEmp?accion=ajustes">
                            <i class="fas fa-fw fa-cogs"></i>
                            <span>Ajustes</span>
                        </a>
                    </li>

                    <!-- Divider -->
                    <hr class="sidebar-divider">
                    <!-- Heading Titulo-->
                    <div class="sidebar-heading">
                    </div>

                    <!-- Nav Item - Charts 
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="vistasEmp/ajustesEmpl.jsp">
                            <i class="fas fa-fw fa-cogs"></i>
                            <span>Ajustes 2</span>
                        </a>
                    </li>-->
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
                            <!-- Icon Cards-->
                            <div class="row">
                                <div class="col-xl-3 col-sm-6 mb-3">
                                    <div class="card text-white bg-primary o-hidden h-100">
                                        <div class="card-body">
                                            <div class="card-body-icon">
                                                <i class="fa fa-fw fa-comments"></i>
                                            </div>
                                            <div class="mr-5">10 Nuevos recomendaciones</div>
                                        </div>
                                        <a class="card-footer text-white clearfix small z-1" href="#">
                                            <span class="float-left">View Details</span>
                                            <span class="float-right">
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-3">
                                    <div class="card text-white bg-warning o-hidden h-100">
                                        <div class="card-body">
                                            <div class="card-body-icon">
                                                <i class="fa fa-fw fa-list"></i>
                                            </div>
                                            <div class="mr-5">Registrar entrada</div>
                                        </div>
                                        <a class="card-footer text-white clearfix small z-1" href="#">
                                            <span class="float-left">View Details</span>
                                            <span class="float-right">
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-3">
                                    <div class="card text-white bg-success o-hidden h-100">
                                        <div class="card-body">
                                            <div class="card-body-icon">
                                                <i class="fa fa-fw fa-shopping-cart"></i>
                                            </div>
                                            <div class="mr-5">25 Pedidos Realizados</div>
                                        </div>
                                        <a class="card-footer text-white clearfix small z-1" href="#">
                                            <span class="float-left">View Details</span>
                                            <span class="float-right">
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                                <div class="col-xl-3 col-sm-6 mb-3">
                                    <div class="card text-white bg-danger o-hidden h-100">
                                        <div class="card-body">
                                            <div class="card-body-icon">
                                                <i class="fa fa-fw fa-support"></i>
                                            </div>
                                            <div class="mr-5">Mira tu reporte</div>
                                        </div>
                                        <a class="card-footer text-white clearfix small z-1" href="#">
                                            <span class="float-left">View Details</span>
                                            <span class="float-right">
                                                <i class="fa fa-angle-right"></i>
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <!-- Area Chart Example-->
                            <div class="card mb-3">
                                <div class="card-header">
                                    <i class="fa fa-area-chart"></i> Area Chart Example</div>
                                <div class="card-body">
                                    <canvas id="myAreaChart" width="100%" height="30"></canvas>
                                </div>
                                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <!-- Bootstrap core JavaScript-->
    <script src="assets/js/jquery.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.bundle.js" type="text/javascript"></script>

    <script src="assets/js/jquery.easing.js" type="text/javascript"></script>
    <script src="assets/js/sb-adminEmp.min.js" type="text/javascript"></script>

    <script src="assets/js/sb-admin-datatables.js" type="text/javascript"></script>
    <script src="assets/js/sb-admin-charts.min.js" type="text/javascript"></script>

    <script src="assets/js/Chart.js" type="text/javascript"></script>
    <!--Paula-->
    <script src="assets/js/demo.js" type="text/javascript"></script>
    <script src="assets/js/sweetalert.min.js" type="text/javascript"></script>
</html>
