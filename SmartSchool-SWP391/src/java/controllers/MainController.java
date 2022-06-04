/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "login";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "logout";
    private static final String PROFILE_DETAIL = "ProfileDetail";
    private static final String PROFILE_DETAIL_CONTROLLER = "profileDetail";
    private static final String MY_POST = "MyPost";
    private static final String MY_POST_CONTROLLER = "myPost";
    private static final String CHANGE_PASSWORD = "ChangePassword";
    private static final String CHANGE_PASSWORD_CONTROLLER = "changePassword";
    private static final String FEEDBACK_SYSTEM = "FeedbackSystem";
    private static final String FEEDBACK_SYSTEM_CONTROLLER = "feedbackSystem";
    private static final String SIGNUP = "Sigup";
    private static final String SIGNUP_CONTROLLER = "sigup";
    private static final String CREATE_ACCOUNT = "CreateAccount";
    private static final String CREATE_ACCOUNT_CONTROLLER = "createaccount";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            }
            if (PROFILE_DETAIL.equals(action)) {
                url = PROFILE_DETAIL_CONTROLLER;
            }
            if (MY_POST.equals(action)) {
                url = MY_POST_CONTROLLER;
            }
            if (CHANGE_PASSWORD.equals(action)) {
                url = CHANGE_PASSWORD_CONTROLLER;
            }
            if (FEEDBACK_SYSTEM.equals(action)) {
                url = FEEDBACK_SYSTEM_CONTROLLER;
            }
            if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            }
            if (SIGNUP.equals(action)) {
                url = SIGNUP_CONTROLLER;
            }
            if (CREATE_ACCOUNT.equals(action)) {
                url = CREATE_ACCOUNT_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
