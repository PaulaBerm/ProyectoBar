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

/**
 *
 * @author Brandon
 * @author Paula
 */
public class Consultas extends Conexion {
    
    CUsuario cu = new CUsuario();

   public CUsuario autenticacion(String usuario, String contraseña) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        
     

        try {
            String consultaIniciar =  "SELECT correo, password, id_rol FROM usuario WHERE correo= ? AND password = ? ";
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
    }
}