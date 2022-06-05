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
 * @author TQK
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/signup"})
public class SignUpController extends HttpServlet {
    private static final String SUCCESS = "login.jsp";
    private static final String SIGNUP = "register.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String fullname = request.getParameter("fullName");
        String userId = request.getParameter("userName");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re_password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String url = SIGNUP;
        try {
            if(!re_password.equals(password)){
                request.setAttribute("ERROR", "Confirm must match Password");
            } else {
                UserDAO dao = new UserDAO();
                UserDTO dto = dao.checkAccountExist(userId);
                if(dto == null) {
                    dao.signup(fullname, userId, password, email, phone);
                    response.sendRedirect(SUCCESS);
                }else {
                    response.sendRedirect(SIGNUP);
                }
//                boolean result = dao.createNewAccount(dto);
//                if(result) {
//                    url = SUCCESS;
//                }
            }
        } catch (Exception e) {
            log("Error at SignUpController: " + e.toString());
        } finally {
            request.getRequestDispatcher(SUCCESS).forward(request, response);
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
