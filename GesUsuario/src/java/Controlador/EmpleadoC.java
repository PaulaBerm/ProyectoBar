/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Controlador.Conexion;
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
public class EmpleadoC extends Conexion {

    public static PreparedStatement ps;
    public static ResultSet rs;
    public static String sql;
    CUsuario user = new CUsuario();

    /*   public List listar() {
        ArrayList<infoEmpleado> list = new ArrayList<>();
        String sql = "select * from empleado where id_empleado= 2";
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {

                emp.setId_empleado(rs.getInt("id_empleado"));
                emp.setNombre_empleado(rs.getString("nombre_empleado"));
                emp.setApellido_empleado(rs.getString("apellido_empleado"));
                list.add(emp);
            }
        } catch (Exception e) {
        }
        return list;
    }*/
    
    public CUsuario list(String correo) {
        String sql = ("SELECT em.*, u.* FROM empleado em INNER JOIN usuario u on u.id_usuario=em.id_usuario WHERE u.correo = '" + correo + "'");
        try {
            ps = getConexion().prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                user.setId_empleado(rs.getInt("id_empleado"));
                user.setId_usuario(rs.getInt("id_usuario"));
                user.setNombre(rs.getString("nombre_empleado"));
                user.setApellido(rs.getString("apellido_empleado"));
                user.setCorreo(rs.getString("correo"));
                user.setContraseña(rs.getString("password"));
            }
        } catch (Exception e) {
        }
        return user;
    }

    public static String buscarNombre(String correo) {
        Conexion conexion = new Conexion();
        String busqueda_nombre = null;

        try {
            Connection con = conexion.getConexion();
            String buscar = ("SELECT em.id_empleado,em.nombre_empleado, em.apellido_empleado, u.correo FROM empleado em INNER JOIN usuario u on u.id_usuario=em.id_usuario WHERE u.correo = '" + correo + "'");
            ps = con.prepareStatement(buscar);
            rs = ps.executeQuery();
            while (rs.next()) {
                String nombre = rs.getString("nombre_empleado");
                String apellido = rs.getString("apellido_empleado");
                busqueda_nombre = (nombre + " " + apellido);
            }
            con.close();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Error de buscarNombre..." + e.getMessage());
        }

        return busqueda_nombre;
    }
    
    public void modificar(CUsuario use) {
        try {
            String consulta = "update empleado em, usuario u set em.nombre_empleado = ?, em.apellido_empleado = ?, u.correo = ?, u.password = ? where em.id_empleado = ? and u.id_usuario= ?";
            PreparedStatement estatuto = getConexion().prepareStatement(consulta);

            estatuto.setString(1, use.getNombre());
            estatuto.setString(2, use.getApellido());
            estatuto.setString(3, use.getCorreo());
            estatuto.setString(4, use.getContraseña());
            estatuto.setInt(5, use.getId_empleado());
            estatuto.setInt(6, use.getId_usuario());
            estatuto.executeUpdate();
            
        } catch (SQLException e) {

            System.out.println(e);

        }
    }

}
