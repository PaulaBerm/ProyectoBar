<%-- 
    Document   : carrito
    Created on : 11/09/2020, 05:04:28 PM
    Author     : Sara Rodriguez
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

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
                                Cliente
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Ajustes</a>
                                <a class="dropdown-item" href="#">Cerrar Sesion</a>
                              
                        </li>
                    </form>
                </div>
            </nav>
        <div class="container mt-4">
            <h3>CARRITO</h3>
            <br>
            <div class="row">
                <div class="col-sm-8">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>ITEM</th>
                                <th>NOMBRES</th>
                                <th>DESCRIPCION</th>
                                <th>PRECIO</th>
                                <th>CANTIDAD</th>
                                <th>SUBTOTAL</th>
                                <th>ACCION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${carrito}">
                                <tr class="text-center">
                                    <td>${car.getItem()}</td>
                                    <td>${car.getNombres()}</td>
                                    <td>${car.getDescripcion()}
                                          <img src="ControladorIMG?id=${car.getIdProducto()}"width="100" height="100">
                                    </td>
                                    <td>${car.getPrecioCompra()}</td>
                                    <td>${car.getCantidad()}</td>
                                    <td>${car.getSubTotal()}</td>
                                    <td>
                                        <input type="hidden" id="idp" value="${car.getIdProducto()}">
                                        <a href="#" id="btnDelete">Eliminar</a>  
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
              
                      
                </div>
                
                <div class=""col-sm-4>
                    <h3>GENERAR COMPRA</h3>
                <div class="card">
                    <div class="card-header">
                        
                    </div>
                    <div class="card-body"></div>
                    
                    <label>Subtotal: </label>
                    <input type="text" value="$.${totalPagar}" readonly="" class="form-control">
                                
                    <label>Descuento: </label>
                    <input type="text" readonly="" class="form-control">
                                
                    <label>Total a pagar: </label>
                    <input type="text" value="$.${totalPagar}" readonly="" class="form-control">
                    
                     </div>
                <div class="card-footer">
                    <a href="" class="btn btn-info btn-block">Realizar pago </a>
                    <a href=""class="btn btn-danger btn-block">Generar Compra</a>
                </div>
                    </div>
            </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="Func/funciones.js" type="text/javascript"></script>
    </body>
</html>
