/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.Conexion;
import Modelo.productosAdm;
import com.sun.xml.internal.ws.policy.subject.WsdlBindingSubject;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cidra
 */
public class productoDAO {

    // conexion a la base de datos
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // metodo para mostrar la tabla 
    public List listar() {
        List<productosAdm> lista = new ArrayList<>();
        String sql = "select * from producto";
        // preparando la conexion
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                productosAdm p = new productosAdm();
                p.setId_producto(rs.getInt(1));
                p.setNombre_producto(rs.getString(2));
                p.setFoto(rs.getBinaryStream(3));
                p.setPrecio_unidad(rs.getDouble(4));
                p.setDescripcion(rs.getString(5));
                p.setCantidad(rs.getInt(6));
                p.setId_estado(rs.getInt(7));
                p.setId_categoria(rs.getInt(8));
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    // metodo para mostrar la imagen que esta en la base de datos 
    public void listarimg(int id_producto, HttpServletResponse response) {
        String sql = "select * from producto where id_producto=" + id_producto;
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();

            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if (rs.next()) {
                inputStream = rs.getBinaryStream("foto");
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);

            }
        } catch (Exception e) {
        }

    }

    public void registrar(productosAdm p) {
        String sql = " insert into producto (nombre_producto, foto, precio_unidad, descripcion, stock, id_estado, id_categoria) values (?,?,?,?,?,1,1)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre_producto());
            ps.setBlob(2, p.getFoto());
            ps.setDouble(3, p.getPrecio_unidad());
            ps.setString(4, p.getDescripcion());
            ps.setInt(5, p.getCantidad());
            ps.setInt(6, p.getId_estado());
            ps.setInt(7, p.getId_categoria());
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }
}
