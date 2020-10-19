<%-- 
    Document   : cliente
    Created on : 7/09/2020, 11:36:41 PM
    Author     : Sara Rodriguez
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        
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
                              <a class="nav-link" href="ControladorC?accion=Carrito"><i class="fas fa-cart-plus"><label style="color: orange">${contador}</label></i>Carrito</a>
                        </li>
                        
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           Categorias
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="ControladorC?accion=home&categoria=1">Cerveza</a>
                                <a class="dropdown-item" href="ControladorC?accion=home&categoria=2">Cerveza Artesanal</a>
                                <a class="dropdown-item" href="ControladorC?accion=home&categoria=3">Aguardiente</a>
                                  <a class="dropdown-item" href="ControladorC?accion=home&categoria=4">Whisky</a>
                            </div>
                        </div>
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
            <div class="row">
                <c:forEach var="p" items = "${producto}">
                    <div class="col-sm-4">
                    <div class="card">
                        <div class="card-header">
                            <label>${p.getNombres()} </label>
                        </div>
                        <div class="card-body">
                             <i>$.${p.getPrecio()}</i>
                             <img src="ControladorIMG?id=${p.getId()}" width="200" height="180">
                        </div>
                        <div class="card-footer text-center">
                        <label>${p.getDescripcion()}</label>
                        <div>
                            <a  href="ControladorC?accion=AgregarCarrito&id=${p.getId()}" class= "btn btn-outline-info">Agregar a Carrito</a>
                            <a href="#" class ="btn btn-outline-danger">Comprar</a>
                        </div>
                        </div>
                    </div>
                </div>
            
            </c:forEach>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    </body>
</html>
