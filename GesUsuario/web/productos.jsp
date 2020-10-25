<%-- 
    Document   : categorias
    Created on : 23-ago-2020, 13:50:44
    Author     : cidra
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> 
    <center>


        <!-- <a class="btn btn-success btn-lg" href="controladorcate?accion=listarr">Listar categoria</a>-->
        <section>
            <div>
                <form action="controladorpro" method="POST">
                    <input type="submit" name="accion" value="Listar">
                    <!--  <input type="submit" name="accion" value="Nuevo"> -->

                </form>
                <hr>
                    <table border="1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Foto</th>
                            <th>Precio</th>
                            <th>Descrpcion</th>
                            <th>Stock</th>
                            <th>Estado</th>
                            <th>Categorias</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dato" items="${lista}">
                            <tr>
                                <td>${dato.getId_producto()}</td>
                                <td>${dato.getNombre_producto()}</td>
                                <td> <img src="controladorimg?id=${dato.getId_producto()}" width="250" heigh="230"></td>
                                <td>${dato.getPrecio_unidad()}</td>
                                <td>${dato.getDescripcion()}</td>
                                <td>${dato.getCantidad() }</td>
                                <td>${dato.getId_estado()}</td>
                                <td>${dato.getId_categoria()}</td>
                                <td><form action="controladorpro" method="POST">
                                        <input type="submit" name="accion" value="Editar">
                                        <input type="submit" name="accion" value="Delete">

                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
        <section >
            <div class=" d-flex">
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary ml-auto" href="Controlador?accion=add" data-toggle="modal" data-target="#exampleModal">
                    <a >Agregar</a>
                </button>
            </div>
            <!-- Modal -->
            <div class="container">
                <div class="col-lg-6">
                    <section>
                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Administrador</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <form action="Controladorpro" method="POST" enctype="multipart/form-data">
                                            Nombres: <br>
                                            <input class="form-control" type="text" name="txtnom"><br>
                                            Foto: <br>
                                            <input class="form-control" type="file" name="filefoto"><br>
                                            Precio: <br>
                                            <input class="form-control" type="text" name="txtprecio"><br>
                                            Descrpcion: <br>
                                            <input class="form-control" type="text" name="txtdescripcion"><br>
                                            Stock: <br>
                                            <input class="form-control" type="text" name="txtstock"><br>
                                            <br>
                                            <br>
                                            <div>
                                                <input class="form-control" type="submit" name="accion" value="Guardar"><br>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
        </section>
    </center>
</body>
</html>
