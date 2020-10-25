
package ModeloDAO;

import Config.Conexion;
import Intefaces.CRUD;
import Modelo.categorias;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PersonaDAO implements CRUD{
    Conexion cn=new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    categorias p=new categorias();
    
    @Override
    public List listar() {
        ArrayList<categorias>list=new ArrayList<>();
        String sql="select * from categoria";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                categorias per=new categorias();
                per.setId(rs.getInt("id_categoria"));
               per.setCategorias(rs.getString("nombre_categoria"));
                list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public categorias list(int id) {
        String sql="select * from categoria where id_categoria="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setId(rs.getInt("id_categoria"));
                p.setCategorias(rs.getString("nombre_categoria"));

                
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(categorias per) {
       String sql="insert into categoria(nombre_categoria)values('"+per.getCategorias()+"')";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(categorias per) {
        String sql="update categoria set nombre_categoria='"+per.getCategorias()+"' where id_categoria="+per.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql="delete from categoria where id_categoria="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
