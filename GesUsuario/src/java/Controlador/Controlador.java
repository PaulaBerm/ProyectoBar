package Controlador;

import Modelo.categorias;
import ModeloDAO.PersonaDAO;
import Controlador.Consultas;
import Modelo.mesaAdm;
import ModeloVO.CUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controlador extends HttpServlet {

    String listar = "vistas/listar.jsp";
    String add = "vistas/listar.jsp";
    String edit = "vistas/edit.jsp";
    String editemp = "vistas/editemp.jsp";
    String empleado = "vistas/registroEmple.jsp";
    String empleadotabla = "vistas/Tabla_empleado.jsp";
    String inicio = "Administrador.jsp";
    String mesas = "vistas/mesasAdm.jsp";
    categorias p = new categorias();
    PersonaDAO dao = new PersonaDAO();
    Consultas con = new Consultas();
    CUsuario use = new CUsuario();
    mesaAdm mesa = new mesaAdm();
    PedidoFilaEmpC fila = new PedidoFilaEmpC();
    int id;
    int id_empleado;
    int id_usuario;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("listarr")) {
            acceso = listar;

        } else if (action.equalsIgnoreCase("inico")) {
            acceso = inicio;
        } else if (action.equalsIgnoreCase("add")) {
            acceso = add;
        } else if (action.equalsIgnoreCase("empleado")) {
            acceso = empleado;
        } else if (action.equalsIgnoreCase("empleadotabla")) {
            acceso = empleadotabla;
        }else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idper", request.getParameter("id"));
            acceso = edit;

        } else if (action.equalsIgnoreCase("Agregar")) {

            String nom = request.getParameter("txtNom");
            p.setCategorias(nom);

            dao.add(p);
            acceso = listar;
        } else if (action.equalsIgnoreCase("editemp")) {
            request.setAttribute("idpero", request.getParameter("id_empleado"));
            acceso = editemp;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            id = Integer.parseInt(request.getParameter("txtid"));
            String nom = request.getParameter("txtNom");
            p.setId(id);
            p.setCategorias(nom);

            dao.edit(p);
            acceso = listar;
        } else if (action.equalsIgnoreCase("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            p.setId(id);
            dao.eliminar(id);
            acceso = listar;
        } else if (action.equalsIgnoreCase("cambios")) {
            String correo = request.getParameter("correo");
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            if (con.registrarEmp(correo, nombre, apellido)) {
                response.sendRedirect("registroEmple.jsp");
            } else {
                acceso = empleado;
            }
        } else if (action.equalsIgnoreCase("tabla")) {
            acceso = empleadotabla;
        } else if (action.equalsIgnoreCase("Guardar")) {
            id_empleado = Integer.parseInt(request.getParameter("txtempleado"));
            id_usuario = Integer.parseInt(request.getParameter("txtusuario"));

            String nombre = request.getParameter("txtnombre");
            String apellido = request.getParameter("txtapellido");
            use.setId_empleado(id_empleado);
            use.setNombre(nombre);
            use.setApellido(apellido);
            use.setId_usuario(id_usuario);
             con.edit(use);
             acceso = empleadotabla ;
        } else if (action.equalsIgnoreCase("mesas")) {
            acceso = mesas;
        } else if (action.equalsIgnoreCase("registrar")) {
            int numero = Integer.parseInt(request.getParameter("txtNumero"));
            String capacidad = request.getParameter("txtCapacidad");
            
            mesa.setNumero_mesa(numero);
            mesa.setCapacidad(capacidad);
            fila.agregarMesa(mesa);
            acceso = mesas;
        } else if (action.equalsIgnoreCase("editarMesa")) {
            String capacidad = request.getParameter("txtCapacidad");
            int estado = Integer.parseInt(request.getParameter("txtEstado"));
            int numero = Integer.parseInt(request.getParameter("txtNumero"));
            
            mesa.setNumero_mesa(numero);
            mesa.setCapacidad(capacidad);
            mesa.setEstadoN(estado);
            fila.modificarMesa(mesa);
            acceso = mesas;
        }else if (action.equalsIgnoreCase("eliminarMesa")) {
            id = Integer.parseInt(request.getParameter("id"));
            mesa.setNumero_mesa(id);
            fila.eliminarMesa(mesa);
            acceso = mesas;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}