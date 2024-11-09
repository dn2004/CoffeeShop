/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

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
public class EditCart extends HttpServlet {

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

        String testItemid = request.getParameter("itemId");
        String testQuantity = request.getParameter("quantity");
        String nut_chon = request.getParameter("btn");

        //Check thử những giá trị yêu cầu nó null không? Nút có thuộc chức năng cần thiết không?
        //Không thì cho chúng về trang error
        int itemid;
        int quantity;
        try {
            if (!"update".equalsIgnoreCase(nut_chon) && !"remove".equalsIgnoreCase(nut_chon)) {
                request.getRequestDispatcher("noti-error.jsp").forward(request, response);
                return;
            }
            itemid = Integer.parseInt(testItemid);
            quantity = Integer.parseInt(testQuantity);
        } catch (Exception e) {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
            return;
        }

        //Lấy giá trị note thuộc trang yêu cầu để cập nhật detail
        String note = (request.getParameter("note") != null) ? request.getParameter("note") : "";
        Detail detail;
        ItemDTO result = null; //lấy ItemDTO có id = id yêu cầu thuộc cart.

        HttpSession session = request.getSession();
        HashMap<ItemDTO, Detail> cart = (HashMap<ItemDTO, Detail>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        for (ItemDTO it : cart.keySet()) {

            if (it.getId() == itemid) {
                result = it;
                break;
            }
        }
        if (nut_chon.equalsIgnoreCase("remove")) {
            if (result != null) {
                cart.remove(result);
                session.setAttribute("cart", cart);
            }
        } else { // update
            // Ensure quantity is valid
            if (result != null) {
                detail = cart.get(result);
                detail.setQuantity(quantity);
                detail.setNote(note);
                cart.put(result, detail);
                session.setAttribute("cart", cart);
                cart.get(result).getQuantity();
            }
        }
        request.getRequestDispatcher("customer-cart.jsp").forward(request, response);
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
