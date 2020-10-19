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
public class infoPedidoFila {
    int NumeroPedido;
    String cliente;
    int cantidad;
    String producto;
    int numeroMesa;
    int costo;
    String fecha;
    int id_empleado;

    public infoPedidoFila() {
    }

    public infoPedidoFila(int NumeroPedido, String cliente, int cantidad, String producto, int numeroMesa, int costo, String fecha,int id_empleado) {
        this.NumeroPedido = NumeroPedido;
        this.cliente = cliente;
        this.cantidad = cantidad;
        this.producto = producto;
        this.numeroMesa = numeroMesa;
        this.costo = costo;
        this.fecha = fecha;
        this.id_empleado = id_empleado;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
    

    public int getNumeroPedido() {
        return NumeroPedido;
    }

    public String getCliente() {
        return cliente;
    }

    public int getCantidad() {
        return cantidad;
    }

    public String getProducto() {
        return producto;
    }

    public int getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroPedido(int NumeroPedido) {
        this.NumeroPedido = NumeroPedido;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public void setNumeroMesa(int numeroMesa) {
        this.numeroMesa = numeroMesa;
    }
}
