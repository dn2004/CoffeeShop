/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.DAO.ItemDAO;
import Model.DTO.ItemDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dat20
 */
public class M_ShowItem extends HttpServlet {

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
        ItemDAO dao = new ItemDAO();
        String kindID = request.getParameter("kindID");
        String status = request.getParameter("status");
        ArrayList<ItemDTO> list;
        
        if (kindID != null && status != null) {
            if (!"1".equals(kindID) && !"2".equals(kindID)) {
                kindID = "0";
            }
            if (!"true".equalsIgnoreCase(status) && !"false".equalsIgnoreCase(status)) {
                status = "all";
            }
            if (kindID.equals("0") && status.equals("all")) {
                list = dao.findAllItems();
            } else if (kindID.equals("0")) {
                list = dao.findItems(Boolean.parseBoolean(status));
            } else if (status.equals("all")) {
                list = dao.findItems(Integer.parseInt(kindID));
            } else {
                list = dao.findItems(Integer.parseInt(kindID), Boolean.parseBoolean(status));
            }
        } else {
            list = dao.findAllItems();
        }

        request.setAttribute("list", list);
        request.setAttribute("status", status);
        request.setAttribute("kindID", kindID);
        request.getRequestDispatcher("manager-show-item.jsp").forward(request, response);
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
