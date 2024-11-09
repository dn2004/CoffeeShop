/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.DAO.OrderDAO;
import Model.DAO.OrderDetailDAO;
import Model.DAO.StatusDAO;
import Model.DTO.OrderDTO;
import Model.DTO.OrderDetailDTO;
import Model.DTO.StatusDTO;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dat20
 */
public class M_ShowOrderDetail extends HttpServlet {

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
        String page = "manager-order-detail.jsp";

        String testOrderID = request.getParameter("orderID");
        String update = request.getParameter("update");
        String testDate = request.getParameter("date");

        int orderID;
        Date date = null;
        try {
            if (date != null) {
                date = Date.valueOf(testDate); //nếu date khác null mới check thôi
            }
            orderID = Integer.parseInt(testOrderID);
        } catch (Exception e) {
            response.sendRedirect("M_ShowReport");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        OrderDTO order = orderDAO.findOrder(orderID);
        OrderDetailDAO detailDAO = new OrderDetailDAO();
        StatusDAO statusDAO = new StatusDAO();

        ArrayList<StatusDTO> statusList = statusDAO.findAllStatus();
        String status = statusDAO.findStatus(order.getStatusId()).getStatusName();
        if (order.getStatusId() < 4) {
            String nextStatus = statusDAO.findStatus(order.getStatusId() + 1).getStatusName();
            request.setAttribute("nextStatus", nextStatus);
        }
        int statusID = order.getStatusId();
        ArrayList<OrderDetailDTO> detailList = detailDAO.getDetail(orderID);

        request.setAttribute("statusList", statusList);
        request.setAttribute("orderInfo", order);
        request.setAttribute("detailList", detailList);
        request.setAttribute("update", update);
        request.setAttribute("date", date);
        request.setAttribute("statusID", statusID);
        request.setAttribute("status", status);
        request.getRequestDispatcher(page).forward(request, response);
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
