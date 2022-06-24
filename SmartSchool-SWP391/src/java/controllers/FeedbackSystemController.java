/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import feedbackSystem.FeedbackSystemDAO;
import feedbackSystem.FeedbackSystemDTO;
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
 * @author SE150888 Pham Ngoc Long
 */
@WebServlet(name = "FeedbackSystemController", urlPatterns = {"/feedbackSystem"})
public class FeedbackSystemController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "login.jsp";
    private static final String FEEDBACK_SYSTEM_PAGE = "feedbackSystem.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FEEDBACK_SYSTEM_PAGE;
        try {

        } catch (Exception e) {
            log("Error at LoginController:" + e.toString());
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
        String url = FEEDBACK_SYSTEM_PAGE;
        try {
            String userId = request.getParameter("userId");
            String feedbackText = request.getParameter("feedback");
            UserDAO userDao = new UserDAO();
            UserDTO loginUser = userDao.checkAccountExist(userId);
            if (loginUser != null) {
                FeedbackSystemDTO feedback = new FeedbackSystemDTO(-1, loginUser.getUserId(), feedbackText, null, null);
                FeedbackSystemDAO feedbackDao = new FeedbackSystemDAO();
                feedbackDao.sendFeedbackSystem(feedback);
                request.setAttribute("MESSAGE", "Gửi phản hồi hệ thống thành công!");               
            } else {
                request.setAttribute("MESSAGE", "Gửi phản hồi hệ thống thất bại!");
            }

        } catch (Exception e) {
            log("Error at LoginController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
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
