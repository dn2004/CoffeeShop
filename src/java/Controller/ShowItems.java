/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DAO.ItemDAO;
import Model.DTO.ItemDTO;
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
public class ShowItems extends HttpServlet {

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
        //khách hàng nhập thanh search
        String search = request.getParameter("search");
        
        //thông tin khách hàng cần hiển thị
        ArrayList<ItemDTO> drinks;
        ArrayList<ItemDTO> foods;
        ItemDAO dao = new ItemDAO();
        
        //nếu search == null: hiển thị tất cả sản phẩm với 2 tham số là kindID và isAvailable
        //nếu search != null: hiển thị tất cả sản phẩm với 3 tham số là Search, kindID và isAvailable
        if (search != null) {
            drinks = dao.findItems(search, 1, true);
            foods = dao.findItems(search, 2, true);
        } else {
            drinks = dao.findItems(1, true);
            foods = dao.findItems(2, true);
        }
        
        //đem dữ liệu cho khách hàng: search: cho khách hàng thấy dữ liệu mình nhập trước đó 
        //trong khi drinks và foods là dữ liệu đưa ra từ những gì khách hàng search
        request.setAttribute("search", search);
        request.setAttribute("drinks", drinks);
        request.setAttribute("foods", foods);
        request.getRequestDispatcher("customer-menu.jsp").forward(request, response);
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
