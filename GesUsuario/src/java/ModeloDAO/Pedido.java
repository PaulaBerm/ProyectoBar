







/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import java.sql.Timestamp;

/**
 *
 * @author Sara Rodriguez
 */
public class Pedido {
    private int idPedido;
    private Timestamp fecha;
    private double costo;
    private int idEstado;
    private int idCliente;
    private int idEmpleado;
    private int NumeroM;

    public Pedido(int idPedido, Timestamp fecha, double costo, int idEstado, int idCliente, int idEmpleado, int NumeroM) {
        this.idPedido = idPedido;
        this.fecha = fecha;
        this.costo = costo;
        this.idEstado = idEstado;
        this.idCliente = idCliente;
        this.idEmpleado = idEmpleado;
        this.NumeroM = NumeroM;
        
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getNumeroM() {
        return NumeroM;
    }

    public void setNumeroM(int NumeroM) {
        this.NumeroM = NumeroM;
    }
    
    
    
}
