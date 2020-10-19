/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Controlador.EmpleadoC;
import ModeloVO.CUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author Paula
 */
public class ControladorEmp extends HttpServlet {

    String index = "indexEmpleado.jsp";
    String pedido = "vistasEmp/pedidosEmp.jsp";
    String listar = "vistasEmp/pedidosRealizados.jsp";
    String ajustes = "vistasEmp/ajustesEmp.jsp";
    String view = "vistasEmp/viewModal.jsp";
    EmpleadoC emp = new EmpleadoC();
    CUsuario use = new CUsuario();
    int idE;
    int idU;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String acceso = "";
        String action = request.getParameter("accion");
        HttpSession objsesion = request.getSession(true);

        objsesion.setAttribute("getAlert", "Yes");
        if (action.equalsIgnoreCase("inicio")) {
            acceso = index;
        } else if (action.equalsIgnoreCase("pedido")) {
            acceso = pedido;
        } else if (action.equalsIgnoreCase("listar")) {
            acceso = listar;
        } else if (action.equalsIgnoreCase("ajustes")) {
            acceso = ajustes;
        } else if (action.equalsIgnoreCase("Guardar Cambios")) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String pass = request.getParameter("password");

            idE = Integer.parseInt(request.getParameter("txtIdEm"));
            idU = Integer.parseInt(request.getParameter("txtIdUs"));

            use.setNombre(nombre);
            use.setApellido(apellido);
            use.setCorreo(correo);
            use.setContraseña(pass);
            use.setId_empleado(idE);
            use.setId_usuario(idU);
            emp.modificar(use);
            if (action.equalsIgnoreCase("Guardar Cambios")) {
                acceso = ajustes;
            }
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
