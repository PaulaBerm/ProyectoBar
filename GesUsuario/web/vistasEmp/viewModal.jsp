<%-- 
    Document   : viewModal
    Created on : 31/08/2020, 04:29:12 PM
    Author     : Paula
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="Controlador.EmpleadoC"%>
<%@page import="ModeloVO.CUsuario"%>
<%@page import="Modelo.descripcionPedido"%>
<%@page import="java.util.ArrayList"%>
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


<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Descripcin</title>
    </head>
    <body>

        <%
            PedidoFilaEmpC ped = new PedidoFilaEmpC();
            CUsuario user = emp.list(correo);
            List<infoPedidoFila> list = ped.listar();
            Iterator<infoPedidoFila> iter = list.iterator();
            infoPedidoFila infP = null;
            while (iter.hasNext()) {
                infP = iter.next();
                // ArrayList<descripcionPedido> descripcion = ped.descripcionPedido();
                infoPedidoFila p = ped.buscarPedido(infP.getNumeroPedido());
        %>


        <div class="modal animated slideInUp custo-slideInUp" id="view<%= infP.getNumeroPedido()%>" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">

            <div class="modal-dialog">
                <%
                    //infoPedidoFila fila = new infoPedidoFila();
                    /*
                    int id = infP.getNumeroPedido();
                    //fila =(infoPedidoFila) ped.buscarPedido(id);
                    ArrayList<descripcionPedido> descripcion = ped.descripcionPedido(id);*/
                %>
                <form  action="${pageContext.request.contextPath}/ControladorEmp" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="Heading">Descripción del pedido...</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <svg aria-hidden="true" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                            </button>
                        </div>
                        <div class="modal-body" id="contenido">
                            <div class="card-body w-100">

                                <input type="hidden" name="id" value="<%= infP.getNumeroPedido()%> ">
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Pedido:</label>
                                            <label name="cliente"><%= infP.getNumeroPedido()%> </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Cliente:</label>
                                            <label name="cliente"><%= infP.getCliente()%> </label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-2">
                                        <div class="form-group">
                                            <label># de Mesa:</label>
                                            <label name="mesa"><%= p.getNumeroMesa()%>  </label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Productos:</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pr-2">
                                        <div class="form-group">
                                            <label>Cantidad:</label>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    try {

                                        ResultSet rs = ped.descripcionPedidoA(infP.getNumeroPedido());
                                        if (!rs.next()) {
                                            out.println("<label>No hay datos</label>");
                                        } else {
                                            do {

                                                out.println("<div class=\"row\">");
                                                out.println("<div class=\"col-md-6 pr-1\">");
                                                out.println("<div class=\"form-group\">");
                                                out.println("<label> * " + rs.getString("producto") + "</label>");
                                                out.println("</div>");
                                                out.println("</div>");
                                                out.println("<div class=\"col-md-6 pr-1\">");
                                                out.println("<div class=\"form-group\">");
                                                out.println("<label>" + rs.getInt("cantidad") + "</label>");
                                                out.println("</div>");
                                                out.println("</div>");
                                                out.println("</div>");
                                            } while (rs.next());
                                        }
                                    } catch (Exception e3) {
                                        System.out.println("No hizo conexion");
                                        e3.printStackTrace(System.err);
                                    }%>
                            </div>
                        </div>
                        <div class="modal-footer md-button">
                            <div class="">
                                <input type="hidden" name="txtPedido" value="<%= infP.getNumeroPedido()%>">
                                <input type="hidden" name="txtEmp" value="<%= user.getId_empleado()%>">                                    
                                <input id="success" class="mr-2 btn btn-primary" type="submit" name="accion" value="confirmar">
                            </div>
                            <div>
                                <button type="button" class="btn"  data-dismiss="modal"><i class="flaticon-cancel-12"></i> Cancelar</button>
                            </div>


                        </div>
                    </div>
                    <!-- /.modal-content --> 
                </form> 
            </div>
            <!-- /.modal-dialog -->
        </div>
        <%}%> 
    </body>

</html>
