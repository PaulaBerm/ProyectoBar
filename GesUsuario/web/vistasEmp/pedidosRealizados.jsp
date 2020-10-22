<%-- 
    Document   : pedidosRealizados
    Created on : 28/08/2020, 07:21:31 PM
    Author     : Paula
--%>

<%@page import="ModeloVO.CUsuario"%>
<%@page import="Controlador.EmpleadoC"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.infoPedidoFila"%>
<%@page import="Controlador.PedidoFilaEmpC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PedidoFilaEmpC ped = new PedidoFilaEmpC();
    EmpleadoC emp = new EmpleadoC();
    HttpSession objsesion = request.getSession(true);
    String correo = (String) objsesion.getAttribute("usuario");
    
    
    String nombre = emp.buscarNombre(correo);
    CUsuario user = (CUsuario) emp.list(correo);
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

        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <link href="./assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/css/sb-admin_Emp.css" rel="stylesheet" type="text/css"/>

        <link href="./assets/css/cssEmpleado.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/css/demoEmp.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
        <link href="./assets/css/all.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        <link href="./assets/css/font-awesomEmp.min.css" rel="stylesheet" type="text/css"/>
        <link href="../assets/css/cssInterEmpleado.css" rel="stylesheet" type="text/css"/>
        <link href="./assets/css/sweetalert.css" rel="stylesheet" type="text/css"/>
        <link  rel = "stylesheet"  type = "text / css"  href = "https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css"/>
        <script src="./assets/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <script>
            $(document).ready(function ()
            {
                $("#myTable").DataTable();
            }
            );
        </script>

        <script type="text/javascript" src="jquery.tablesorter.js"></script> 
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
                    <li class="nav-item active">
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

                    <!-- CONTENIDO--> 
                    <div class="container">
                        <div class="row">
                            <div class="panel panel-primary filterable">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Pedidos Realizados</h3>
                                    <div class="pull-right">
                                        <button class="btn btn-default btn-xs btn-filter"><span class="fa fa-fw fa-filter"></span> Filtro</button>
                                    </div>
                                </div>
                                <table id="myTable" class="table tablesorter">
                                    <thead>
                                        <tr class="filters">
                                            <th><input type="text" class="form-control" placeholder="# Pedido" disabled></th>
                                            <th><input type="text" class="form-control" placeholder="Cliente" disabled></th>
                                            <th><input type="date" class="form-control" placeholder="Fecha y Hora" disabled></th>
                                            <th><input type="text" class="form-control" placeholder="Costo total" disabled></th>
                                            <th><input type="text" class="form-control" placeholder="# Mesa" disabled></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         <%

                                                List<infoPedidoFila> list = ped.listarPedidos(correo);
                                                Iterator<infoPedidoFila> iter = list.iterator();
                                                infoPedidoFila infP = (infoPedidoFila) ped.buscarRealizados(correo);
                                                while (iter.hasNext()) {
                                                    infP = iter.next();
                                            %>
                                        <tr>
                                            
                                            <td class="text-center"><%= infP.getNumeroPedido()%></td>
                                            <td><%= infP.getCliente()%></td>
                                            <td><%= infP.getFecha()%></td>
                                            <td class="text-center"><%= infP.getCosto()%></td>
                                            <td class="text-center"><%= infP.getNumeroMesa()%></td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                                    
                </div>
            </div>
        </div>
    </body>

    <!-- Bootstrap core JavaScript-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script type="text/javascript" src="jquery.tablesorter.js"></script> 

    
    <script src="./assets/js/empleado.js" type="text/javascript"></script>
    <script src="./assets/js/jquery.js" type="text/javascript"></script>
    <script src="./assets/js/bootstrap.bundle.js" type="text/javascript"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>

    <script src="./assets/js/jquery.easing.js" type="text/javascript"></script>
    <script src="./assets/js/sb-adminEmp.min.js" type="text/javascript"></script>

    <script src="./assets/js/sb-admin-datatables.js" type="text/javascript"></script>
    <script src="./assets/js/sb-admin-charts.min.js" type="text/javascript"></script>

    <script src="./assets/js/Chart.js" type="text/javascript"></script>
    <!--Paula-->
    <script src="./assets/js/demo.js" type="text/javascript"></script>
</html>

