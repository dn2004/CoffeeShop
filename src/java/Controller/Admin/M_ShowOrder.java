/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.DAO.OrderDAO;
import Model.DAO.StatusDAO;
import Model.DTO.OrderDTO;
import Model.DTO.StatusDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dat20
 */
public class M_ShowOrder extends HttpServlet {

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
        String status = request.getParameter("orderStatus");
        
        OrderDAO dao = new OrderDAO();
        StatusDAO statusDAO = new StatusDAO();
        ArrayList<StatusDTO> statusList = statusDAO.findAllStatus();
        ArrayList<OrderDTO> list = new ArrayList<>();
        Date today = Date.valueOf(LocalDate.now());
        
        try {
            Integer.parseInt(status);
        } catch (Exception e) {
            status = "0";
        }
        
        if (status == null) {
            status = "0";
        } else if (status.equalsIgnoreCase("1")) {
            list.addAll(dao.manageOrders(today, 1));
        } else if (status.equalsIgnoreCase("2")) {
            list.addAll(dao.manageOrders(today, 2));
        } else if (status.equalsIgnoreCase("3")) {
            list.addAll(dao.manageOrders(today, 3));
        } else {
            for (int i = 0; i < 3; i++) {
                list.addAll(dao.manageOrders(today,i + 1));
            }
        }
        request.setAttribute("list", list);
        request.setAttribute("status", status);
        request.setAttribute("statusList", statusList);
        request.getRequestDispatcher("manager-order.jsp").forward(request, response);
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
