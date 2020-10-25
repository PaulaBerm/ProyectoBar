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
public class categorias {
    int id;
    String categorias;

    public categorias() {
    }

    public categorias(int id, String categorias) {
        this.id = id;
        this.categorias = categorias;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getCategorias() {
        return categorias;
    }

    public void setCategorias(String categorias) {
        this.categorias = categorias;
    }
    
}
