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
public class empleado {
    int id_empleado;
    String nombre_empleado;
    String apellido_empleado;
    int id_usuario;

    public empleado() {
    }

    public empleado(int id_empleado, String nombre_empleado, String apellido_empleado) {
        this.id_empleado = id_empleado;
        this.nombre_empleado = nombre_empleado;
        this.apellido_empleado = apellido_empleado;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public String getNombre_empleado() {
        return nombre_empleado;
    }

    public String getApellido_empleado() {
        return apellido_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public void setNombre_empleado(String nombre_empleado) {
        this.nombre_empleado = nombre_empleado;
    }

    public void setApellido_empleado(String apellido_empleado) {
        this.apellido_empleado = apellido_empleado;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
    
}
