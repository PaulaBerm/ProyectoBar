
package Intefaces;

import Modelo.categorias;
import java.util.List;


public interface CRUD {
    public List listar();
    public categorias list(int id);
    public boolean add(categorias per);
    public boolean edit(categorias per);
    public boolean eliminar(int id);
}
