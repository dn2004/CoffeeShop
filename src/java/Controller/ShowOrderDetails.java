/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DAO.ItemDAO;
import Model.DAO.OrderDAO;
import Model.DAO.OrderDetailDAO;
import Model.DTO.OrderDTO;
import Model.DTO.OrderDetailDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dat20
 */
public class ShowOrderDetails extends HttpServlet {

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

        String orderID = request.getParameter("orderID");
        
        //validate
        int id;
        try {
            id = Integer.parseInt(orderID);
        } catch (Exception e) {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
            return;
        }

        OrderDetailDAO dao = new OrderDetailDAO();
        OrderDAO orderDAO = new OrderDAO();
        //tìm order thuộc id, detaiList thuộc id đó
        OrderDTO orderInfo = orderDAO.findOrder(id);
        ArrayList<OrderDetailDTO> detailList = dao.getDetail(id);

        if (!detailList.isEmpty()) {
            request.setAttribute("orderInfo", orderInfo);
            request.setAttribute("detailList", detailList);
            request.getRequestDispatcher("customer-show-order-detail.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "oops");
            request.getRequestDispatcher("customer-show-order-detail.jsp").forward(request, response);
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
