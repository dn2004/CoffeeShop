/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.DAO.ManagerAccountDAO;
import Model.DTO.ManagerAccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author dat20
 */
public class LoginServlet extends HttpServlet {

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession testSession = request.getSession(false);
        //Nếu session hiện tại không null và Object account của session cũng không null -> vào trang manager-welcome
        if (testSession != null) {
            ManagerAccountDTO account = (ManagerAccountDTO) testSession.getAttribute("account");
            if (account != null) {
                request.setAttribute("welcomeUser", "Welcome Manager: " + account.getUsername());
                request.getRequestDispatcher("Admin/manager-welcome.jsp").forward(request, response);
                return;
            }
        }

        //Nếu account thông qua mật khẩu vài tài khoản từ request không null -> Tạo session mới cùng với Object account cho session
        //-> đến trang manager welcome
        //Nếu không tìm thấy tài khoản từ database thì đến trang login lại.
        ManagerAccountDAO dao = new ManagerAccountDAO();
        ManagerAccountDTO account2 = dao.login(username, password);
        if (account2 != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", account2);
            request.setAttribute("welcomeUser", "Welcome Manager: " + account2.getUsername());
            request.getRequestDispatcher("Admin/manager-welcome.jsp").forward(request, response);
        } else {
            if (username != null && password != null) {
                request.setAttribute("errorLoginMsg", "Tài khoàn hoặc mật khẩu không đúng");
            }
            request.getRequestDispatcher("customer-login.jsp").forward(request, response);
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
