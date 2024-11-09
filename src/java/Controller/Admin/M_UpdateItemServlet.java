/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.DAO.ItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dat20
 */
public class M_UpdateItemServlet extends HttpServlet {

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

        String testID = request.getParameter("itemID");
        String name = request.getParameter("itemName");
        String image = request.getParameter("image");
        String previousImage = request.getParameter("previousImage");
        String testKindID = request.getParameter("kindID");
        String testAvailable = request.getParameter("isAvailable");
        String testPrice = request.getParameter("price");

        int kindID;
        int id;
        boolean isAvailable;
        Double price;

        try {
            if (name == null|| previousImage == null || testAvailable == null) {
                response.sendRedirect("noti-error.jsp");
                return;
            }
            kindID = Integer.parseInt(testKindID);
            id = Integer.parseInt(testID);
            isAvailable = Boolean.parseBoolean(testAvailable);
            price = Double.parseDouble(testPrice);

        } catch (Exception e) {
            response.sendRedirect("noti-error.jsp");
            return;
        }

        if (image == null || image.isEmpty()) {
            image = previousImage;
        }
        ItemDAO dao = new ItemDAO();
        int result = dao.updateItemServlet(name, price, kindID, isAvailable, image, id);
        if (result > 0) {
            request.setAttribute("updateMSG", "update success");
        } else {
            request.setAttribute("updateMSG", "update failed");
        }
        request.getRequestDispatcher("M_ShowItem").forward(request, response);
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
