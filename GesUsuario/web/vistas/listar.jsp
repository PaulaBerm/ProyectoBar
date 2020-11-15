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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>INBAR | Administrador </title>
        <link rel="icon" type="image/x-icon" href="assets/img/Logo_2.png" />
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700" rel="stylesheet">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="plugins/animate/animate.css" rel="stylesheet" type="text/css" />
        <!-- END PAGE LEVEL PLUGINS -->

        <!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
        <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css">
        <link rel="stylesheet" type="text/css" href="assets/css/forms/theme-checkbox-radio.css">
        <link rel="stylesheet" type="text/css" href="plugins/table/datatable/dt-global_style.css">
        <link rel="stylesheet" type="text/css" href="plugins/table/datatable/custom_dt_custom.css">
        <!-- END PAGE LEVEL CUSTOM STYLES -->

        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link href="assets/css/scrollspyNav.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/components/custom-modal.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="assets/css/forms/theme-checkbox-radio.css">
        <link rel="stylesheet" type="text/css" href="assets/css/forms/switches.css">
        <!--  END CUSTOM STYLE FILE  -->

        <link href="assets/css/cssEmpleado.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/sweetalert.css" rel="stylesheet" type="text/css" />
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

                        <li class="menu">
                            <a href="Controlador?accion=empleadotabla" aria-expanded="false" class="dropdown-toggle">
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

                        <li class="menu active">
                            <a href="Controlador?accion=listarr" aria-expanded="true" class="dropdown-toggle">
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
                            <h3>Categorías</h3>
                        </div>
                    </div>

                    <div class="row layout-spacing">
                        <div class="col-lg-12">
                            <div class="statbox widget box box-shadow">
                                <div class="widget-content widget-content-area">
                                    <div class="" style="float:right;">
                                        <button type="button" class="btn btn-outline-primary mb-2 mr-2" data-toggle="modal"
                                                data-target="#agregar">Agregar</button>
                                    </div>
                                    <div class="table-responsive mb-4">
                                        <table id="style-3" class="table style-3  table-hover">
                                            <thead>
                                                <tr>
                                                    <th class="checkbox-column text-center">Nombre</th>
                                                    <th class="text-center">Acciones</th>
                                                </tr>
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
                                                    <td class="checkbox-column text-center"> <%= per.getCategorias()%> </td>
                                                    <td class="text-center">
                                                        <ul class="table-controls">
                                                            <li>
                                                                <a href="Controlador?accion=editar&id=<%= per.getId()%>" class="bs-tooltip" data-toggle="modal" data-target="#editar<%= per.getId()%>" data-placement="top" title="" data-original-title="Editar">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                         height="24" viewBox="0 0 24 24" fill="none"
                                                                         stroke="currentColor" stroke-width="2"
                                                                         stroke-linecap="round" stroke-linejoin="round"
                                                                         class="feather feather-edit-2 p-1 br-6 mb-1">
                                                                    <path
                                                                        d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z">
                                                                    </path>
                                                                    </svg>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="Controlador?accion=eliminar&id=<%= per.getId()%>" class="bs-tooltip" data-toggle="tooltip" data-placement="top" title="" data-original-title="Eliminar">
                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24"
                                                                         height="24" viewBox="0 0 24 24" fill="none"
                                                                         stroke="currentColor" stroke-width="2"
                                                                         stroke-linecap="round" stroke-linejoin="round"
                                                                         class="feather feather-trash p-1 br-6 mb-1">
                                                                    <polyline points="3 6 5 6 21 6"></polyline>
                                                                    <path
                                                                        d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                                                    </path>
                                                                    </svg>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>

                                            <div id="editar<%= per.getId()%>" class="modal animated fadeInDown" role="dialog">
                                                <div class="modal-dialog">
                                                    <!-- Modal content-->
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Editar</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                                     width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                                     stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                                     stroke-linejoin="round" class="feather feather-x">
                                                                <line x1="18" y1="6" x2="6" y2="18"></line>
                                                                <line x1="6" y1="6" x2="18" y2="18"></line>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="Controlador" class="persona" method="post">
                                                                <div class="form-group">
                                                                    <label for="t-text" class="sr-only">Nombre:</label>
                                                                    <input id="t-text" type="text" name="txtNom" class="form-control" value="<%= per.getCategorias()%>" required>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <div>
                                                                        <button class="mt-2 btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> Cancelar</button>
                                                                    </div>                                                        
                                                                    <div>
                                                                        <input type="hidden" name="txtid" value="<%= per.getId()%>">
                                                                        <input class="mt-2 btn btn-outline-primary" style="float:right;" type="submit" name="accion" value="Actualizar">
                                                                    </div>                                                        
                                                                </div>
                                                            </form>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                            <%}%>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div id="agregar" class="modal animated fadeInDown" role="dialog">
                                        <div class="modal-dialog">
                                            <!-- Modal content-->
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Agregar Categoría</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                                                             width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                             stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                                             stroke-linejoin="round" class="feather feather-x">
                                                        <line x1="18" y1="6" x2="6" y2="18"></line>
                                                        <line x1="6" y1="6" x2="18" y2="18"></line>
                                                        </svg>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form action="Controlador" method="post">
                                                        <div class="form-group">
                                                            <label for="t-text" class="sr-only">Nombre:</label>
                                                            <input id="t-text" type="text" name="txtNom" placeholder="Nombre de la categoría" class="form-control" required>

                                                        </div>
                                                        <div class="modal-footer">
                                                            <button class="mt-2 btn" data-dismiss="modal"><i class="flaticon-cancel-12"></i> Cancelar</button>
                                                            <input type="submit" name="accion" class="mt-2 btn btn-outline-primary" style="float:right;" value="Agregar">
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
                                    c3 = $('#style-3').DataTable({
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
                                        "lengthMenu": [5, 10, 20, 50],
                                        "pageLength": 5
                                    });

                                    multiCheck(c3);

                                    $('input.few-options').maxlength({
                                        warningClass: "badge badge-success",
                                        limitReachedClass: "badge badge-warning"
                                    });
        </script>
        <!-- END PAGE LEVEL SCRIPTS -->

        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="plugins/bootstrap-maxlength/bootstrap-maxlength.js"></script>
        <script src="plugins/bootstrap-maxlength/custom-bs-maxlength.js"></script>
        <!-- END PAGE LEVEL PLUGINS -->

        <script src="assets/js/sweetalert.min.js" type="text/javascript"></script>
        <script src="assets/js/empleado.js" type="text/javascript"></script>
    </body>

</html>
