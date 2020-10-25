/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Controlador.Conexion;
import Modelo.descripcionPedido;
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
    
    */
    
    
//Modal Descripcion del Pedido    
    

    public ArrayList descripcionPedido(int NumeroPedido) {
        ArrayList list = new ArrayList();
         String sql = "select dt.id_pedido as NumeroPedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente) as cliente, pr.nombre_producto as producto, dt.cantidad as cantidad, pd.numero_mesa as numeroMesa\n" +
"from detalle_compras dt\n" +
"inner join producto pr on pr.id_producto=dt.id_producto\n" +
"inner join pedido pd on pd.id_pedido=dt.id_pedido\n" +
"inner join cliente cl on cl.id_cliente=pd.id_cliente where dt.id_pedido="+NumeroPedido;
        try {
           
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                for (int x=0; x<=rs.getMetaData().getColumnCount(); x++){
                     int dd = x+1;
                     descripcionPedido descrip = new descripcionPedido(
                             rs.getInt(dd), rs.getString("cliente"),rs.getString("producto"),rs.getInt("cantidad"),rs.getInt("numeroMesa")
                     );
                     list.add(descrip);                   
                } 
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    public infoPedidoFila buscarPedido(int NumeroPedido) {
        Conexion conex = new Conexion();
        infoPedidoFila ped = new infoPedidoFila();
        boolean existe = false;
        
        try {
            //Statement estatuto = conex.getConnection().createStatement();
            PreparedStatement consulta = conex.getConexion().prepareStatement("select dt.id_pedido as NumeroPedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente) as cliente, pr.nombre_producto as producto, dt.cantidad as cantidad, pd.numero_mesa as numeroMesa\n" +
"from detalle_compras dt\n" +
"inner join producto pr on pr.id_producto=dt.id_producto\n" +
"inner join pedido pd on pd.id_pedido=dt.id_pedido\n" +
"inner join cliente cl on cl.id_cliente=pd.id_cliente where dt.id_pedido = ? ");
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
        String sql = "SELECT * FROM vw_pedido_realizado where correo = '"+correo+"'";
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
}
