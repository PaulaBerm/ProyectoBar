/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Paula
 */
public class mesaAdm {
    int numero_mesa;
    String capacidad;
    String estado;
    int estadoN;

    public mesaAdm() {
    }
    
    public mesaAdm(int numero_mesa, String capacidad, String estado, int estadoN) {
        this.numero_mesa = numero_mesa;
        this.capacidad = capacidad;
        this.estado = estado;
        this.estadoN = estadoN;
    }

    public int getNumero_mesa() {
        return numero_mesa;
    }

    public void setNumero_mesa(int numero_mesa) {
        this.numero_mesa = numero_mesa;
    }

    public String getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(String capacidad) {
        this.capacidad = capacidad;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getEstadoN() {
        return estadoN;
    }

    public void setEstadoN(int estadoN) {
        this.estadoN = estadoN;
    }
}
