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
public class AddToWishlist extends HttpServlet {

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
        //Lấy itemID từ wishlist
        String itemID = request.getParameter("itemid");
        
        //check thử itemID có phải thuộc kiểu số không, nó có khác null không
        try {
            Integer.parseInt(itemID);
        } catch (Exception e) {
            request.getRequestDispatcher("noti-error.jsp").forward(request, response);
        }

        
        // Đọc cookie trong request
        Cookie[] arr = request.getCookies();
        boolean wishlistFound = false;

        // Không có cookie nào, tạo cookie wishlist mới
        if (arr == null || arr.length == 0) {
            Cookie c = new Cookie("wishlist", itemID);
            c.setMaxAge(60 * 60 * 24 * 7); // set 7 ngày
            c.setPath("/"); // đảm bảo cookie có hiệu lực trên toàn ứng dụng
            response.addCookie(c);
        } else {
//             Kiểm tra xem cookie "wishlist" có tồn tại không
//                Nếu tồn tại thì lấy tất cả id từ Cookie tmp, kiểm tra những id đó có giá trị nào trùng với itemID không.
//                    Nếu có thì isDuplicate = true tức là bỏ qua chúng. Ngược lại thì thêm chuổi và set lại Cookie tmp.
//                Nếu wishlist không tồn tại thì tạo Cookie mới với giá trị itemID yêu cầu
            
            for (Cookie tmp : arr) {
                if (tmp.getName().equals("wishlist")) {
                    wishlistFound = true;
                    String[] wishlistItems = tmp.getValue().split("\\|");

                    // Kiểm tra trùng lặp
                    boolean isDuplicate = false;
                    for (String id : wishlistItems) {
                        if (id.equals(itemID)) {
                            isDuplicate = true;
                            break;
                        }
                    }

                    if (!isDuplicate) {
                        tmp.setValue(tmp.getValue() + "|" + itemID);
                        tmp.setMaxAge(60 * 60 * 24 * 7); // đặt lại thời gian sống của cookie
                        tmp.setPath("/"); // đảm bảo cookie có hiệu lực trên toàn ứng dụng
                        response.addCookie(tmp);
                    }
                    break; // ngừng vòng lặp khi đã tìm thấy và cập nhật cookie
                }
            }

            // Nếu không tìm thấy cookie "wishlist", tạo cookie mới
            if (!wishlistFound) {
                Cookie c = new Cookie("wishlist", itemID);
                c.setMaxAge(60 * 60 * 24 * 7); // set 7 ngày
                c.setPath("/"); // đảm bảo cookie có hiệu lực trên toàn ứng dụng
                response.addCookie(c);
            }
        }

        // Chuyển hướng đến trang hiển thị các sản phẩm
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
