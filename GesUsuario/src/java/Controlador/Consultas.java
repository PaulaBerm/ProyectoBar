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
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Brandon
 * @author Paula
 */
public class Consultas extends Conexion {
    EmpleadoC emp = new EmpleadoC();
    CUsuario cu = new CUsuario();

    public CUsuario autenticacion(String usuario, String contraseña) {
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String consultaIniciar = "SELECT correo, password, id_rol FROM usuario WHERE correo= ? AND password = ? ";
            pst = getConexion().prepareStatement(consultaIniciar);
            pst.setString(1, usuario);
            pst.setString(2, contraseña);
            rs = pst.executeQuery();

            if (rs.next()) {
                cu.setCorreo(rs.getString(1));
                cu.setContraseña(rs.getString(2));
                cu.setRol(rs.getInt(3));
            }
        } catch (Exception e) {
            System.err.println("Error " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.err.println("Error " + e);
            }
        }

        return cu;
    }

    public boolean registrar(String correo, String contraseña, String nombre, String apellido) {

        PreparedStatement pst = null;
        Statement st = null;

        try {
            st = getConexion().createStatement();

            st.addBatch("insert into USUARIO(CORREO, PASSWORD,ID_ROL) values('" + correo + "','" + contraseña + "',2)");
            st.addBatch("insert into cliente(NOMBRE_CLIENTE, APELLIDO_CLIENTE,ID_USUARIO) values('" + nombre + "','" + apellido + "',NULL)");
            st.addBatch("CALL pr_id_usuario()");
            st.executeBatch();
            if (pst.executeUpdate() == 1) {

                return true;
            }

        } catch (Exception e) {

        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
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

    public boolean registrarEmp(String correo, String nombre, String apellido) {

        PreparedStatement pst = null;
        Statement st = null;
        ResultSet rs = null;
        PasswordGenerator password = new PasswordGenerator();
        String pass = password.getPinNumber();
        try {
            st = getConexion().createStatement();
            
            st.addBatch("insert into USUARIO(CORREO, PASSWORD,ID_ROL) values('" + correo + "','" + pass+ "',3)");
            st.addBatch("insert into empleado(NOMBRE_empleado, APELLIDO_empleado,ID_USUARIO) values('"+ nombre + "','" + apellido + "',NULL)");
            st.addBatch("CALL pr_id_usuario()");
            emp.enviarCorreo(correo,pass);
            st.executeBatch();
            
            if (pst.executeUpdate() == 1) {

                return true;
            }
            
        } catch (Exception e) {

        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
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
    
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    CUsuario usu = new CUsuario();

    public List Listarempleado() {

        ArrayList<CUsuario> list = new ArrayList<>();
        String sql = "select nombre_empleado, apellido_empleado from empleado";
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                CUsuario per = new CUsuario();
                per.setNombre(rs.getString("nombre_empleado"));
                per.setApellido(rs.getString("apellido_empleado"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public CUsuario lista(int id) {
        String sql = "select * from empleado where id_empleado=" + id;
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                cu.setId_empleado(rs.getInt("id_empleado"));
                cu.setNombre(rs.getString("nombre_empleado"));
                cu.setApellido(rs.getString("apellido_empleado"));
                cu.setId_usuario(rs.getInt("id_usuario"));

            }
        } catch (Exception e) {
        }
        return cu;

    }

    public boolean edit(CUsuario per) {

        String sql = "update empleado set nombre_empleado='" + per.getNombre() + "', apellido_empleado='" + per.getApellido() + "' where id_empleado=" + per.getId_empleado();
        try {
            con = cn.getConexion();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
        }
        return false;

    }
    /* public boolean registrarEmp(String correo, String contraseña, String nombre, String apellido) {

        PreparedStatement pst = null;
        Statement st = null;

        try {
            st = getConexion().createStatement();

            st.addBatch("insert into USUARIO(CORREO, PASSWORD,ID_ROL) values('" + correo + "','" + contraseña + "',2)");
            st.addBatch("insert into cliente(NOMBRE_CLIENTE, APELLIDO_CLIENTE,ID_USUARIO) values('"+nombre + "','" + apellido + "',NULL)");
            st.addBatch("CALL pr_id_usuario()");
            st.executeBatch();
            if (pst.executeUpdate() == 1) {

                return true;
            }
            
        } catch (Exception e) {

        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.err.println("Error " + e);
            }

        }

        return false;
    }*/
}
