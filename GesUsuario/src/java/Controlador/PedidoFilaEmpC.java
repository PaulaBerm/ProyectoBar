/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Controlador.Conexion;
import Modelo.infoPedidoFila;
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

    public List listar() {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "select dt.id_pedido as NumeroPedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente) as cliente, sum(dt.cantidad) as cantidad from detalle_compras dt inner join pedido pd on pd.id_pedido=dt.id_pedido inner join cliente cl on cl.id_cliente=pd.id_cliente group by dt.id_pedido";
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

    public infoPedidoFila list(int NumeroPedido) {
        String sql = "select dt.id_pedido as NumeroPedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente) as cliente, pr.nombre_producto as producto, dt.cantidad as cantidad, pd.numero_mesa as numeroMesa from detalle_compras dt inner join producto pr on pr.id_producto=dt.id_producto inner join pedido pd on pd.id_pedido=dt.id_pedido inner join cliente cl on cl.id_cliente=pd.id_cliente WHERE NumeroPedido = " + NumeroPedido;
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
        return ped;
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
    
    public List listarPedidos(String correo) {
        ArrayList<infoPedidoFila> list = new ArrayList<>();
        String sql = "select id_pedido as NumeroPedido, fecha_ingreso as fecha, costo_total, concat(c.nombre_cliente, ' ', c.apellido_cliente) as cliente, numero_mesa from pedido pe inner join empleado em on em.id_empleado =pe.id_empleado inner join cliente c on c.id_cliente=pe.id_cliente inner join usuario u on u.id_usuario=em.id_usuario where u.correo = '"+correo+"'";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                infoPedidoFila ped = new infoPedidoFila();
                ped.setNumeroPedido(rs.getInt("NumeroPedido"));
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
}
