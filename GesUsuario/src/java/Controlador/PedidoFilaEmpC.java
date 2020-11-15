/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Controlador.Conexion;
import Modelo.descripcionPedido;
import Modelo.infoPedidoFila;
import Modelo.mesaAdm;
import ModeloVO.CUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Paula
 */
public class PedidoFilaEmpC extends Conexion {

    public static Connection con;
    public static PreparedStatement ps;
    public static ResultSet rs;
    infoPedidoFila ped = new infoPedidoFila();
    CUsuario user = new CUsuario();
    descripcionPedido des = new descripcionPedido();

    public List listar() {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "SELECT * FROM vw_pedidos_activos order by NumeroPedido desc";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                infoPedidoFila ped = new infoPedidoFila();
                ped.setNumeroPedido(rs.getInt("NumeroPedido"));
                ped.setCliente(rs.getString("cliente"));
                ped.setCantidad(rs.getInt("cantidad"));
                list.add(ped);
            }
        } catch (Exception e) {
        }
        return list;
    }

    /*
    public List descripcionPedido(int NumeroPedido) {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "SELECT * FROM vw_detalle_pedido where NumeroPedido = " + NumeroPedido;
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ped.setNumeroPedido(rs.getInt("NumeroPedido"));
                ped.setCliente(rs.getString("cliente"));
                ped.setCantidad(rs.getInt("cantidad"));
                ped.setProducto(rs.getString("producto"));
                ped.setNumeroMesa(rs.getInt("numeroMesa"));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
     public List descripcionPedido() {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "SELECT * FROM vw_detalle_pedido";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                ped.setNumeroPedido(rs.getInt("NumeroPedido"));
                ped.setCliente(rs.getString("cliente"));
                ped.setCantidad(rs.getInt("cantidad"));
                ped.setProducto(rs.getString("producto"));
                ped.setNumeroMesa(rs.getInt("numeroMesa"));
                list.add(ped);
            }
        } catch (Exception e) {
        }
        return list;
    } 


    public ArrayList descripcionPedido(int NumeroPedido) {
        ArrayList list = new ArrayList();
        String sql = "SELECT * FROM vw_detalle_pedido where NumeroPedido = " + NumeroPedido;
        try {

            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                for (int x = 0; x <= rs.getMetaData().getColumnCount(); x++) {
                    int dd = x + 1;
                    descripcionPedido descrip = new descripcionPedido(
                            rs.getInt(dd), rs.getString("cliente"), rs.getString("producto"), rs.getInt("cantidad"), rs.getInt("numeroMesa")
                    );
                    list.add(descrip);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }    
    
     */
//Modal Descripcion del Pedido 
    public ResultSet descripcionPedidoA(int NumeroPedido) throws SQLException {
        String sqli = "SELECT * FROM vw_detalle_pedido where NumeroPedido = "+ NumeroPedido;
        ps = getConexion().prepareStatement(sqli);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public infoPedidoFila buscarPedido(int NumeroPedido) {
        Conexion conex = new Conexion();
        infoPedidoFila ped = new infoPedidoFila();
        boolean existe = false;

        try {
            //Statement estatuto = conex.getConnection().createStatement();
            PreparedStatement consulta = conex.getConexion().prepareStatement("SELECT * FROM vw_detalle_pedido where NumeroPedido = ? ");
            consulta.setInt(1, NumeroPedido);
            ResultSet res = consulta.executeQuery();
            while (res.next()) {
                existe = true;
                ped.setNumeroPedido(Integer.parseInt(res.getString("NumeroPedido")));
                ped.setCliente(res.getString("cliente"));
                ped.setProducto(res.getString("producto"));
                ped.setCantidad(Integer.parseInt(res.getString("cantidad")));
                ped.setNumeroMesa(Integer.parseInt(res.getString("numeroMesa")));

            }
            res.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error, no se conecto");
            System.out.println(e);
        }

        if (existe) {
            return ped;
        } else {
            return null;
        }
    }

    ///Pedidos Realizados
    ///
    public List listarPedidos(String correo) {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "SELECT * FROM vw_pedido_realizado where correo = '" + correo + "'";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                infoPedidoFila ped = new infoPedidoFila();
                ped.setNumeroPedido(rs.getInt("id_pedido"));
                ped.setFecha(rs.getString("fecha"));
                ped.setCliente(rs.getString("cliente"));
                ped.setCosto(rs.getInt("costo_total"));
                ped.setNumeroMesa(rs.getInt("numero_mesa"));
                list.add(ped);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public infoPedidoFila buscarRealizados(String correo) {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        Conexion conex = new Conexion();
        infoPedidoFila ped = new infoPedidoFila();
        boolean existe = false;
        try {
            //Statement estatuto = conex.getConnection().createStatement();
            PreparedStatement consulta = conex.getConexion().prepareStatement("SELECT * FROM vw_pedido_realizado WHERE correo = ? ");
            consulta.setString(1, correo);
            ResultSet res = consulta.executeQuery();
            while (res.next()) {
                existe = true;
                ped.setNumeroPedido(Integer.parseInt(res.getString("id_pedido")));
                ped.setFecha(res.getString("fecha"));
                ped.setCosto(Integer.parseInt(res.getString("costo_total")));
                ped.setCliente(res.getString("cliente"));
                ped.setNumeroMesa(Integer.parseInt(res.getString("numero_mesa")));
                user.setCorreo(res.getString("correo"));
            }
            res.close();

        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error, no se conecto");
            System.out.println(e);
        }

        if (existe) {
            return ped;
        } else {
            return null;
        }
    }

    ////Actualizar campos estado y empleado de la tabla pedido
    public void modificarPedido(infoPedidoFila mod) {
        try {
            String consulta = "update pedido set id_estado = 2, id_empleado = ? where id_pedido = ?";
            PreparedStatement estatuto = getConexion().prepareStatement(consulta);

            estatuto.setInt(1, mod.getId_empleado());
            estatuto.setInt(2, mod.getNumeroPedido());
            estatuto.executeUpdate();

        } catch (SQLException e) {

            System.out.println(e);

        }
    }

    ////Mostrar los pedidos del cliente
    public List pedidoCliente(String correo) {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "SELECT  dt.id_pedido, count(pr.id_producto) cantidadp, pe.costo_total, CONCAT(em.nombre_empleado, ' ', em.apellido_empleado) AS empleado FROM detalle_compras dt inner join producto pr on pr.id_producto=dt.id_producto inner join pedido pe on pe.id_pedido=dt.id_pedido inner join cliente cl on cl.id_cliente=pe.id_cliente inner join usuario us on us.id_usuario=cl.id_usuario inner join empleado em on em.id_empleado=pe.id_empleado where pe.id_estado=2 and us.correo = '" + correo + "' group by dt.id_pedido";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                infoPedidoFila ped = new infoPedidoFila();
                ped.setNumeroPedido(rs.getInt("id_pedido"));
                ped.setCantidad(rs.getInt("cantidadp"));
                ped.setCosto(rs.getInt("costo_total"));
                ped.setEmpelado(rs.getString("empleado"));
                list.add(ped);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List pedidoClienteDetalle(int id_pedido) {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "SELECT pe.fecha_ingreso, pr.nombre_producto, dt.cantidad,pr.precio_unidad FROM detalle_compras dt inner join producto pr on pr.id_producto=dt.id_producto inner join pedido pe on pe.id_pedido=dt.id_pedido inner join cliente cl on cl.id_cliente=pe.id_cliente inner join usuario us on us.id_usuario=cl.id_usuario inner join empleado em on em.id_empleado=pe.id_empleado where pe.id_estado=2 and dt.id_pedido = " + id_pedido + "";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                infoPedidoFila ped = new infoPedidoFila();
                ped.setFecha(rs.getString("fecha_ingreso"));
                ped.setProducto(rs.getString("nombre_producto"));
                ped.setCantidad(rs.getInt("cantidad"));
                ped.setCosto_unidad(rs.getInt("precio_unidad"));
                list.add(ped);
            }
        } catch (Exception e) {
        }
        return list;
    }

    /*Mostrar información de mesas*/
    public List infoMesas() {
        ArrayList<mesaAdm> list = new ArrayList<>();
        String sql = "SELECT m.numero_mesa, m.capacidad, m.id_estado, es.nombre_estado FROM mesa m INNER JOIN estado es ON es.id_estado=m.id_estado";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                mesaAdm mesa = new mesaAdm();
                mesa.setNumero_mesa(rs.getInt("numero_mesa"));
                mesa.setCapacidad(rs.getString("capacidad"));
                mesa.setEstado(rs.getString("nombre_estado"));
                mesa.setEstadoN(rs.getInt("id_estado"));
                list.add(mesa);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ResultSet mostrarEstados() throws SQLException {
        String sqli = "SELECT id_estado, nombre_estado FROM estado";
        ps = getConexion().prepareStatement(sqli);
        ResultSet rs = ps.executeQuery();
        return rs;
    }

    public boolean agregarMesa(mesaAdm mesa) {
        String sql = "insert into mesa values(" + mesa.getNumero_mesa() + ",'" + mesa.getCapacidad() + "', 1)";
        try {
            con = getConexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    public void modificarMesa(mesaAdm mesa) {
        try {
            String consulta = "UPDATE mesa set capacidad = ?, id_estado = ? where numero_mesa= ?";
            PreparedStatement estatuto = getConexion().prepareStatement(consulta);

            estatuto.setString(1, mesa.getCapacidad());
            estatuto.setInt(2, mesa.getEstadoN());
            estatuto.setInt(3, mesa.getNumero_mesa());
            estatuto.executeUpdate();

        } catch (SQLException e) {

            System.out.println(e);

        }
    }

    public boolean eliminarMesa(mesaAdm mesa) {
        String sql = "delete from mesa where numero_mesa=" + mesa.getNumero_mesa();
        try {
            con = getConexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}
