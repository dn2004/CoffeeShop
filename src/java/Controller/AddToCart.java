/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.DAO.ItemDAO;
import Model.DTO.Detail;
import Model.DTO.ItemDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dat20
 */
public class AddToCart extends HttpServlet {

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

      
        // Lấy tham số sản phẩm từ request
        String testOrderID = request.getParameter("id");

        //check id phải khác null và ép được kiểu Integer 
        //nếu chúng không validate --> noti-error.jsp
        int orderID;
        try {
            orderID = Integer.parseInt(testOrderID);
        } catch (Exception e) {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
            return;
        }

        //Nếu số validate thành công, lấy HashMap<ItemDTO, Detail> cart thuộc Session
        //
        HttpSession session = request.getSession();
        HashMap<ItemDTO, Detail> cart = (HashMap<ItemDTO, Detail>) session.getAttribute("cart");
        
        //Nếu item có id đã được tạo tìm không thấy (hoặc == null) => cho vào trang error.
        ItemDAO dao = new ItemDAO();
        ItemDTO item = dao.findItem(orderID, true);
        if (item == null) {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
            return;
        }
        
        //Nếu item khác null vào cho item vào cart.
        //Nếu cart == null thì tạo cart mới
        //Mếu cart != null thì check xem id đã có trong cart chưa.
            //Nếu có (result != null) thì tăng quantity lên 1.
            //Nếu không có (result == null) thì put vào cart giá trị tạo mặc định
        Detail detail = new Detail("", 1);

        if (cart == null) {
            cart = new HashMap<>();
            cart.put(item, detail);
        } else {
            
            ItemDTO result = null;
            for (ItemDTO tmp : cart.keySet()) {
                if (tmp.getId() == item.getId()) {
                    result = tmp;
                    break;
                }
            }
            if (result == null) {//gio hang chua co 
                cart.put(item, detail);
            } else { //gio hang da co thi sua quantity
                detail = cart.get(result);
                int quantity = detail.getQuantity();
                quantity++;
                detail.setQuantity(quantity);
                cart.put(result, detail);
            }
        }
        
        //Cập nhật lại cart.
        session.setAttribute("cart", cart);
        // Chuyển hướng tới trang sản phẩm hoặc trang khác
        request.getRequestDispatcher("ShowItems").forward(request, response);
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
