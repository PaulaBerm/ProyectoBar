/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Intefaces.Crudemp;
import Modelo.empleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author cidra
 */
public class empleadoDAO extends Conexion implements Crudemp  {
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    empleado p=new empleado();

 

    @Override
    public List listar() {
       ArrayList <empleado> list = new ArrayList <>();
       String sql ="select * from empleado";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()){
                empleado emp = new empleado();
                emp.setId_empleado(rs.getInt("id_empleado"));
                emp.setNombre_empleado(rs.getString("nombre_empleado"));
                emp.setApellido_empleado(rs.getString("apellido_empleado"));
                emp.setId_usuario(rs.getInt("id_usuario"));
                list.add(emp);
            }
        } catch (Exception e) {
        }
       return list;
    }

    @Override
    public empleado list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(empleado emp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean edit(empleado emp) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
     public boolean registrar(String correo, String contraseña, String nombre, String apellido) {

        PreparedStatement pst = null;
        Statement st = null;
 //ps= getConnection().prepareStatement(sql);
        try {
            st = getConnection().createStatement();

            st.addBatch("insert into usuario(CORREO, PASSWORD,ID_ROL) values('" + correo + "','" + contraseña + "',3)");
            st.addBatch("insert into empleado(nombre_empleado, apellido_empleado, id_usuario) values('"+nombre + "','" + apellido + "',NULL)");
            st.addBatch("CALL pr_id_usuario()");
            st.executeBatch();
            if (pst.executeUpdate() == 1) {

                return true;
            }
            
        } catch (Exception e) {

        } finally {
            try {
                if (getConnection()!= null) {
                    getConnection().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error " + e);
            }

        }

        return false;
    }
    
}

    

 