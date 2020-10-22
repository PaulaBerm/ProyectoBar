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
public class descripcionPedido {
    int NumeroPedido;
    String cliente;
    String producto;
    int cantidad;    
    int numeroMesa;

    public descripcionPedido() {
    }

    public descripcionPedido(int NumeroPedido, String cliente, String producto, int cantidad, int numeroMesa) {
        this.NumeroPedido = NumeroPedido;
        this.cliente = cliente;
        this.producto = producto;
        this.cantidad = cantidad;
        this.numeroMesa = numeroMesa;
    }

    public int getNumeroPedido() {
        return NumeroPedido;
    }

    public void setNumeroPedido(int NumeroPedido) {
        this.NumeroPedido = NumeroPedido;
    }

    public String getCliente() {
        return cliente;
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getNumeroMesa() {
        return numeroMesa;
    }

    public void setNumeroMesa(int numeroMesa) {
        this.numeroMesa = numeroMesa;
    }
    
    
}
