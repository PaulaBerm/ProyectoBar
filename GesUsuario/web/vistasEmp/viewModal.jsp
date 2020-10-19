<%-- 
    Document   : viewModal
    Created on : 31/08/2020, 04:29:12 PM
    Author     : Paula
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.infoPedidoFila"%>
<%@page import="Controlador.PedidoFilaEmpC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PedidoFilaEmpC ped = new PedidoFilaEmpC();

            List<infoPedidoFila> list = ped.listar();
            Iterator<infoPedidoFila> iter = list.iterator();

            infoPedidoFila infP = null;

            while (iter.hasNext()) {
                infP = iter.next();
                infoPedidoFila p = ped.buscarPedido(infP.getNumeroPedido());
        %>
        <div class="modal fade" id="view<%= infP.getNumeroPedido()%>" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                        <h4 class="modal-title custom_align" id="Heading">Descripcion del pedido...</h4>
                    </div>
                    <div class="modal-body" id="contenido">

                        <div class="card-body w-100">
                            <input type="hidden" name="id" value="<%= infP.getNumeroPedido()%> ">
                            <div class="row">
                                <div class="col-md-6 pr-1">
                                    <div class="form-group">
                                        <label>Cliente:</label>
                                        <label name="cliente"><%= p.getCliente()%> </label>
                                    </div>
                                </div>
                                <div class="col-md-6 pr-1">
                                    <div class="form-group">
                                        <label># de Mesa:</label>
                                        <label name="mesa"><%= p.getNumeroMesa()%>  </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 pr-1">
                                    <div class="form-group">
                                        <label>Producto:</label>
                                        <label name="producto"><%= p.getProducto()%>  </label>
                                    </div>
                                </div>
                                <div class="pr-2">
                                    <div class="form-group">
                                        <label>Cantidad:</label>
                                        <label name="cantidad"><%= p.getCantidad()%>  </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;" data-dismiss="modal" aria-label="Close"><span class="glyphicon glyphicon-ok-sign"></span> Cerrar</button>
                    </div>
                </div>
                <!-- /.modal-content --> 
            </div>
            <!-- /.modal-dialog --> 
        </div>
        <%}%>
    </body>
</html>
