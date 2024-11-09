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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dat20
 */
public class Welcome extends HttpServlet {

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
        // Lấy tất cả các cookie từ request
        Cookie[] cookies = request.getCookies();
        
        String itemIDs = null;
        ItemDAO dao = new ItemDAO();
        ItemDTO item;
        ArrayList<ItemDTO> wishlist = null;

        // Tìm cookie có tên là "wishlist"
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("wishlist".equals(cookie.getName())) {
                    itemIDs = cookie.getValue();
                    break;
                }
            }
        }
        //nếu itemIDs != null hay là Cookie có tên wishlist != null
        //tách ra tất cả ID sản phẩm mà khách hàng đã đưa ra list + add vào wishlist sản phẩm có ID đó
        if (itemIDs != null) {
            String[] itemIDArray = itemIDs.split("\\|");
            wishlist = new ArrayList<>();
            for (String itemID : itemIDArray) {
                if (itemID != null && !"".equals(itemID)) {
                    item = dao.findItem(Integer.parseInt(itemID), true);
                    if (item != null) {
                        wishlist.add(item);
                    }   
                }
            }
        }

        //wishlist chứ thông tin những sản phẩm đã có trong nó
        request.setAttribute("wishlist", wishlist);
        request.getRequestDispatcher("customer-welcome.jsp").forward(request, response);

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
