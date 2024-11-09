/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dat20
 */
public class RemoveFromWishList extends HttpServlet {

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
        String testItemID = request.getParameter("itemid");
        

        try {
            Integer.parseInt(testItemID);
        } catch (Exception e) {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
            return;
        }

        Cookie[] arr = request.getCookies();

        if (arr != null && arr.length > 0) {
            for (Cookie tmp : arr) {
                // Tìm cookie "wishlist"
                if (tmp.getName().equals("wishlist")) {
                    String[] wishlistItems = tmp.getValue().split("\\|");
                    StringBuilder updatedWishlist = new StringBuilder();
                    boolean itemFound = false;

                    // Tạo danh sách mới mà không chứa itemID cần xóa
                    for (String id : wishlistItems) {
                        if (!id.equals(testItemID)) {
                            if (updatedWishlist.length() > 0) {
                                updatedWishlist.append("|");
                            }
                            updatedWishlist.append(id);
                        } else {
                            itemFound = true; // Đánh dấu rằng mục đã được tìm thấy và sẽ bị xóa
                        }
                    }

                    // Nếu mục được tìm thấy và xóa
                    if (itemFound) {
                        if (updatedWishlist.length() > 0) {
                            // Nếu còn mục trong danh sách, cập nhật lại cookie
                            tmp.setValue(updatedWishlist.toString());
                            tmp.setMaxAge(60 * 60 * 24 * 7); // Đặt lại thời gian sống của cookie
                            tmp.setPath("/");
                            response.addCookie(tmp);
                        } else {
                            // Nếu danh sách rỗng, xóa cookie "wishlist"
                            tmp.setValue("");
                            tmp.setMaxAge(0); // Xóa cookie
                            tmp.setPath("/");
                            response.addCookie(tmp);
                        }
                    }
                    break; // Ngừng vòng lặp khi đã xử lý xong cookie "wishlist"
                }
            }
        }
        request.getRequestDispatcher("Welcome").forward(request, response);
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
