/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
@WebServlet(name = "EmployerSignupController", urlPatterns = {"/employerSignup"})
public class EmployerSignupController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SUCCESS = "EmployerSignup.jsp";
    private static final String ERROR = "EmployerSignup.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String fullname = request.getParameter("fullName");
            String userId = request.getParameter("userName");
            String password = request.getParameter("password");
            String rePassword = request.getParameter("repassword");
            String compName=request.getParameter("compName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String compAddress=request.getParameter("compAddress");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.checkAccountExist(userId);
            if (user != null) {
                request.setAttribute("ERROR", "Tên đăng nhập đã tồn tại!");
                request.setAttribute("FULLNAME", fullname);
                request.setAttribute("USERNAME", userId);
                request.setAttribute("EMAIL", email);
                request.setAttribute("PHONE", phone);
                request.setAttribute("COMPADDRESS", compAddress);
                request.setAttribute("COMPNAME", compName);
            } else {
                dao.employerSignup(fullname, userId, password, email, phone,compName,compAddress);
                request.setAttribute("SUCCESS", "Đăng ký tài khoản thành công!");
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at SignUpController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
