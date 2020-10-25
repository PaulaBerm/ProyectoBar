/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author cidra
 */
public class usuario {
    int id_usuario;
    String correo;
    String password;

    public usuario() {
    }
    
    public usuario(int id_usuario, String correo, String password) {
        this.id_usuario = id_usuario;
        this.correo = correo;
        this.password = password;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public String getPassword() {
        return password;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
}
