<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.categorias"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="Controlador.EmpleadoC"%>
<%@page import="Controlador.Consultas"%>
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
        <title>Administrador | Bar La Fonda Paisa</title>
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
        <!--Daniel-->
        <link href="assets/css/css----proyecto.css" rel="stylesheet" type="text/css"/>
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
                        <div class="">Administrador</div>
                        <br>
                    </a>

                    <!-- Divider -->
                    <hr class="sidebar-divider my-0">
                    <!-- Nav Item - Dashboard -->
                    <li class="nav-item active">
                        <a class="nav-link" href="">
                            <i class="fas fa-fw fa-tachometer-alt"></i>
                            <span>Inicio</span></a>
                    </li>
                    <!-- Divider -->
                    <hr class="sidebar-divider">
                    <!-- Nav Item - Utilities Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="controladoremp?accion=listar" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fas fa-fw fa-cog"></i>
                            <span>Registrar empleados </span>  
                        </a>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Registro:</h6>
                            </div>
                        </div>
                    </li>
                    <!-- Divider -->
                    <hr class="sidebar-divider">
                    <!-- Nav Item - Utilities Collapse Menu -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="Controlador?accion=listarr" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                            <i class="fas fa-fw fa-cog"></i>
                            <span>Registros</span>
                        </a>
                        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <a class="collapse-item" href="">Categorias</a>
                                <a class="collapse-item" href="">Productos</a>
                            </div>
                        </div>
                    </li>
                    <!-- Nav Item - Pages Collapse Menu 
                    <li class="nav-item">
                        <a class="nav-link collapsed"  href="" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                            <i class="fas fa-fw fa-cog"></i>
                            <span>Registrar Producto </span>  
                        </a>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <h6 class="collapse-header">Registro:</h6>
                            </div>
                        </div
                    </li>>-->
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
                            <!-- Earnings (Monthly) Card Example -->
                            <section class="container">
                                <div class=" d-flex">
                                    <!-- Button trigger modal -->
                                    <button type="button" class="btn  ml-auto fond" href="Controlador?accion=add" data-toggle="modal" data-target="#exampleModal">
                                        <a class="text-white">Agregar</a>
                                    </button>
                                </div>
                            </section>
                            <table class="table table-bordered">

                                <thead>
                                <div>        
                                    <tr class="fond"> 
                                        <th class="text-center text-white">ID</th>
                                        <th class="text-center text-white">Categorias</th>
                                        <th class="text-center text-white">Acciones</th>
                                    </tr> 
                                </div>

                                </thead>

                                <tbody>
                                    <%
                                        PersonaDAO dao = new PersonaDAO();
                                        List<categorias> list = dao.listar();
                                        Iterator<categorias> iter = list.iterator();
                                        categorias per = null;
                                        while (iter.hasNext()) {
                                            per = iter.next();

                                    %>
                                    <tr>
                                        <td class="text-center"><%= per.getId()%></td>
                                        <td class="text-center"><%= per.getCategorias()%></td>

                                        <td class="text-center">
                                            <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= per.getId()%>">Editar</a>
                                            <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= per.getId()%>">Remove</a>
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                                
                            <section >
                                <!-- Modal -->
                                <div class="container">
                                    <div class="col-lg-6">
                                        <section>
                                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header fondo">
                                                            <h5 class="modal-title text-center text-white" id="exampleModalLabel">Administrador</h5>
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="Controlador">

                                                                <b> Nombres: <br> </b>
                                                                <input class="form-control" type="text" name="txtNom"><br>
                                                                <input class="btn fondo text-white " type="submit" name="accion" value="Agregar">

                                                            </form>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </section>
                                    </div>
                            </section>

                            
                        </div>
                        <!-- comenzar a editar -->
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
</html>
