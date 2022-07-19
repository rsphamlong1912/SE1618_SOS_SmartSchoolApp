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
import javax.servlet.http.HttpSession;
import jobPost.JobPostDAO;
import user.UserDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "UploadJobPostController", urlPatterns = {"/uploadJobPost"})
public class UploadJobPostController extends HttpServlet {

    private static final String ERROR = "EmployerUpload.jsp";
    private static final String SUCCESS = "main?action=MyJobPostApprove";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userId = loginUser.getUserId();
            int jobCategoryId = Integer.parseInt(request.getParameter("jobCategoryId"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            float salary = Float.parseFloat(request.getParameter("salary"));
            int amount = Integer.parseInt(request.getParameter("amount"));
            int timeJob = Integer.parseInt(request.getParameter("timeJob"));
            String[] question = request.getParameterValues("question");
            JobPostDAO dao = new JobPostDAO();
            int jobId = dao.uploadJobPost(userId, jobCategoryId, title, description, salary, amount, timeJob);
            boolean success = false;
            for (String q : question) {
                success = dao.uploadQuestion(jobId,q);
            }
            if(success = true) {
                url = SUCCESS;
            }
        }catch (Exception e) {
            log("Error at UploadJobPostController: " + e.toString());
        } finally {
            response.sendRedirect(SUCCESS);
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
