<%-- 
    Document   : pedidosEmp
    Created on : 27/08/2020, 05:41:59 PM
    Author     : Paula
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.descripcionPedido"%>
<%@page import="ModeloVO.CUsuario"%>
<%@page import="Controlador.EmpleadoC"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.infoPedidoFila"%>
<%@page import="Controlador.PedidoFilaEmpC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->

        <!-- BEGIN PAGE LEVEL STYLES -->
        <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css">
        <link rel="stylesheet" type="text/css" href="plugins/table/datatable/dt-global_style.css">
        <link rel="stylesheet" type="text/css" href="plugins/table/datatable/custom_dt_multiple_tables.css">
        <!-- END PAGE LEVEL STYLES -->

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="plugins/animate/animate.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->

        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link href="assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" />
        <!--  END CUSTOM STYLE FILE  -->

        <!-- BEGIN THEME GLOBAL STYLES -->
        <script src="plugins/sweetalerts/promise-polyfill.js"></script>
        <link href="plugins/sweetalerts/sweetalert2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/components/custom-sweetalert.css" rel="stylesheet" type="text/css" />
        <!-- END THEME GLOBAL STYLES -->

        <!-- <link href="assets/css/cssEmpleado.css" rel="stylesheet" type="text/css"/>-->
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

                        <li class="menu active">
                            <a href="ControladorEmp?accion=pedido" aria-expanded="true" class="dropdown-toggle">
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


                    </ul>

                </nav>

            </div>
            <!--  END SIDEBAR  -->

            <!--  BEGIN CONTENT AREA  -->
            <div id="content" class="main-content">
                <div class="layout-px-spacing">

                    <div class="page-header">
                        <div class="page-title">
                            <h3>Pedidos en Fila...</h3>
                        </div>
                    </div>

                    <div class="row" id="cancel-row">

                        <div class="col-xl-12 col-lg-12 col-sm-12  layout-spacing">
                            <div class="widget-content widget-content-area br-6">
                                <div class="table-responsive mb-4 mt-4">
                                    <table id="multi-table" class="table table-hover" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th>Número de Pedido</th>
                                                <th>Cliente</th>
                                                <th>Cantidad de Productos</th>
                                                <th class="text-center">Descripción</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                PedidoFilaEmpC ped = new PedidoFilaEmpC();
                                                CUsuario user = emp.list(correo);
                                                List<infoPedidoFila> list = ped.listar();
                                                Iterator<infoPedidoFila> iter = list.iterator();
                                                infoPedidoFila infP = null;
                                                while (iter.hasNext()) {
                                                    infP = iter.next();
                                                    int id = infP.getNumeroPedido();
                                                    // infoPedidoFila p = ped.buscarPedido(infP.getNumeroPedido());
                                                    //ArrayList<descripcionPedido> descripcion = ped.descripcionPedido(infP.getNumeroPedido());                                                    
%>
                                            <tr>
                                                <td><%= infP.getNumeroPedido()%></td>
                                                <td><%= infP.getCliente()%></td>
                                                <td><%= infP.getCantidad()%></td>
                                                <td class="text-center">
                                                    <button type="button" class="btn btn-outline-primary mb-2 mr-2" data-toggle="modal" data-target="#view<%=infP.getNumeroPedido()%>">Ver</button>
                                                </td>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                        <jsp:include page= "viewModal.jsp" flush="true"/>
                                        <tfoot>
                                            <tr>
                                                <th>Número de Pedido</th>
                                                <th>Cliente</th>
                                                <th>Cantidad de Productos</th>
                                                <th class="text-center">Descripción</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>                                 
                            </div>
                        </div>
                    </div>
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
        <script>
                                    $(document).ready(function () {
                                        App.init();
                                    });
        </script>
        <script src="plugins/highlight/highlight.pack.js"></script>
        <script src="assets/js/custom.js"></script>
        <!-- END GLOBAL MANDATORY SCRIPTS -->

        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/js/scrollspyNav.js"></script>
        <script src="plugins/table/datatable/datatables.js"></script>
        <script>
                                    $(document).ready(function () {
                                        $('#multi-table').DataTable({
                                            "oLanguage": {
                                                "oPaginate": {"sPrevious": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>', "sNext": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>'},
                                                "sInfo": "Página _PAGE_ de _PAGES_",
                                                "sInfoEmpty": "Filtrado 0 a 0 de 0 entradas",
                                                "sInfoFiltered": "(Filtrado _MAX_ elementos en total)",
                                                "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
                                                "sSearchPlaceholder": "Buscar...",
                                                "sLengthMenu": "Resultados :  _MENU_",
                                                "sLoadingRecords": "Cargando...",
                                                "sZeroRecords": "No se encontró resultados",
                                            },
                                            "stripeClasses": [],
                                            "lengthMenu": [7, 10, 20, 50],
                                            "pageLength": 7,
                                            drawCallback: function () {
                                                $('.t-dot').tooltip({template: '<div class="tooltip status" role="tooltip"><div class="arrow"></div><div class="tooltip-inner"></div></div>'})
                                                $('.dataTables_wrapper table').removeClass('table-striped');
                                            }
                                        });
                                    });

                                    $('#success').on('click', function () {
                                        swal({
                                            title: 'Pedido aceptado!',
                                            text: "Puede ver el pedido en la ventana de -Pedido Realizado-",
                                            type: 'success',
                                            padding: '4em'
                                        })
                                    })
        </script>
        <!-- END PAGE LEVEL SCRIPTS
        
        <!-- BEGIN THEME GLOBAL STYLE -->
        <script src="plugins/sweetalerts/sweetalert2.min.js"></script>
        <script src="plugins/sweetalerts/custom-sweetalert.js"></script>
        <!-- END THEME GLOBAL STYLE     

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->-->
        <script src="assets/js/sweetalert.min.js" type="text/javascript"></script>

        <script src="assets/js/empleado.js" type="text/javascript"></script>
    </body>
</html>
