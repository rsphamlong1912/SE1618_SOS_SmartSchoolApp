/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "LogoutController", urlPatterns = {"/logout"})
public class LogoutController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String LOSTFOUND_SUCCESS = "login.jsp";
    private static final String FREELANCE_SUCCESS = "FreelancerLogin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
              HttpSession session = request.getSession();
              String urlBranch =(String) session.getAttribute("urlBranch");
              if ("LostFound".equals(urlBranch)) {
                  session.invalidate();
                  url = LOSTFOUND_SUCCESS;
              } else {
                  session.invalidate();
                  url = FREELANCE_SUCCESS;
              }
//            String isFreelance = request.getParameter("isFreelance");
//            HttpSession session = request.getSession(false);
//            
//            if (session != null) {
//                if ("isFreelance".equals(isFreelance)) {
//                    session.invalidate();
//                    url = FREELANCE_SUCCESS;
//                } else {
//                    session.invalidate();
//                    url = SUCCESS;
//                }
//            }
        } catch (Exception e) {
            log("Error at LogoutController:" + e.toString());
        } finally {
            response.sendRedirect(url);
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
