<%-- 
    Document   : detallePedido
    Created on : 30/10/2020, 09:55:31 PM
    Author     : Paula
--%>


<%@page import="Controlador.PedidoFilaEmpC"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="Modelo.infoPedidoFila"%>
<%@page import="Modelo.infoPedidoFila"%>
<%@page import="Modelo.infoPedidoFila"%>
<%@page import="Modelo.infoPedidoFila"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PedidoFilaEmpC ped = new PedidoFilaEmpC();
    infoPedidoFila infP = null;
    infoPedidoFila infPs = null;
    HttpSession objsesion = request.getSession(true);
    String correo = (String) objsesion.getAttribute("usuario");

    if (correo.equals("")) {
        out.print(correo);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                                <a class="dropdown-item" href="#">Ajustes</a>
                                <a class="dropdown-item" href="#">Cerrar Sesion</a>

                        </li>
                    </form>
                </div>
            </nav>
            <div class="container mt-4">
                <ol class="breadcrumb">
                    <li><a href="pedidos.jsp">Pedidos</a> / </li>
                     
                    <li class="active"> Detalle del pedido</li>
                </ol>
                <br>
                <div class="row">
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-lg-12 contenedor">
                        <table class="table table-hover" id="target">
                            <thead>
                                <tr>
                                    <th class="text-center">Fecha</th>
                                    <th class="text-center">Productos</th>
                                    <th class="text-center">Cantidad</th>
                                    <th class="text-center">Costo x unidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    int id = Integer.parseInt((String) request.getAttribute("id"));
                                    List<infoPedidoFila> lists = ped.pedidoClienteDetalle(id);
                                    Iterator<infoPedidoFila> iters = lists.iterator();

                                    while (iters.hasNext()) {
                                        infP = iters.next();
                                %>
                                <tr>
                                    <td class="text-center"><%= infP.getFecha()%></td>
                                    <td class="text-center"><%= infP.getProducto()%></td>
                                    <td class="text-center"><%= infP.getCantidad()%></td>
                                    <td class="text-center"><%= infP.getCosto_unidad()%></td>
                                </tr>
                                <%}%>
                            <tbody>
                        </table>    
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="Func/funciones.js" type="text/javascript"></script>


        <!-- Libreria jQuery -->
        <script type='text/javascript' src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

        <script type="text/javascript">

            function mostrar() {
                $('.target').toggle();
            }

        </script>
    </body>
</html>
