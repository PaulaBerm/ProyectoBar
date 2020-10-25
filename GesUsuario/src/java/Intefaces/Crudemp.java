/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Intefaces;

import Modelo.empleado;
import java.util.List;

/**
 *
 * @author cidra
 */
public interface Crudemp {




    public List listar();
    public empleado list(int id);
    public boolean add(empleado emp );
    public boolean edit(empleado emp);
    public boolean eliminar(int id);
}

