/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DAO.OrderDAO;
import Model.DTO.Detail;
import Model.DTO.ItemDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dat20
 */
public class SaveCart extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        
        String testTotal = request.getParameter("total");
        String testTableNumber = request.getParameter("tableNumber");
        String customerName = request.getParameter("customerName");
        String customerPhone = request.getParameter("customerPhone");
        
        OrderDAO dao = new OrderDAO();
        HttpSession session = request.getSession();
        HashMap<ItemDTO, Detail> cart = (HashMap<ItemDTO, Detail>) session.getAttribute("cart");

        double total;
        int tableNumber;

        try {
            if (customerName == null || customerPhone == null || !customerPhone.trim().matches("^0\\d{9}$") || cart == null) {
                request.getRequestDispatcher("noti-error.jsp").forward(request, response);
                return;
            }
            total = Double.parseDouble(testTotal);
            tableNumber = Integer.parseInt(testTableNumber);
        } catch (Exception e) {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
            return;
        }

        
        int result = dao.insertOrder(customerName, tableNumber, customerPhone.trim(), total, cart);
        if (result > 0) {
            //xóa cart trong session 
            session.removeAttribute("cart");
            
            request.setAttribute("orderID", result);
            request.setAttribute("total", total);
            request.getRequestDispatcher("customer-checkout.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
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
