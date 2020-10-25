/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.productosAdm;
import ModeloDAO.productoDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author cidra
 */
@MultipartConfig
public class controladorpro extends HttpServlet {

    productoDAO p = new productoDAO();
    productosAdm pr = new productosAdm();

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controladorpro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controladorpro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":
                List<productosAdm> lista = p.listar();
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("productos.jsp").forward(request, response);
                break;
            case "Guardar":
                String nom = request.getParameter("txtnom");
                Part part = request.getPart("filefoto");
                InputStream inputStream = part.getInputStream();
                double precio = (Integer.parseInt(request.getParameter("txtprecio")));
                String desc = request.getParameter("txtdescripcion");
                int cantidad = (Integer.parseInt(request.getParameter("txtstock")));
                pr.setNombre_producto(nom);
                pr.setFoto(inputStream);
                pr.setPrecio_unidad(precio);
                pr.setDescripcion(desc);
                pr.setCantidad(cantidad);
                p.registrar(pr);
                request.getRequestDispatcher("productos.jsp").forward(request, response);
                break;
            default:
                request.getRequestDispatcher("controladorpro?accion=listar").forward(request, response);
                break;

        }
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
