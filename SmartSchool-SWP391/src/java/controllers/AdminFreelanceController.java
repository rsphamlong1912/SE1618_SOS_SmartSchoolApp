/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import controllers.AdminLostAndFoundController;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jobPost.JobPostDAO;
import jobPost.JobPostDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author SE150888 Pham Ngoc Long
 */
@WebServlet(name = "AdminFreelanceController", urlPatterns = {"/adminFreelance"})
public class AdminFreelanceController extends HttpServlet {

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
        try {
            UserDAO udao = new UserDAO();
            JobPostDAO jdao = new JobPostDAO();

            int totalEmployer = udao.getTotalEmployer();
            int totalUser = udao.getTotalUser();
            int totalJobPost = jdao.getTotalJobPost();
            int totalJobPostLastWeek = jdao.getTotalJobPostLastWeek();
            int totalJobPostOf1DayAgo = jdao.getTotalJobPost1DayAgo();
            int totalJobPostOf2DayAgo = jdao.getTotalJobPost2DayAgo();
            int totalJobPostOf3DayAgo = jdao.getTotalJobPost3DayAgo();
            int totalJobPostOf4DayAgo = jdao.getTotalJobPost4DayAgo();
            int totalJobPostOf5DayAgo = jdao.getTotalJobPost5DayAgo();
            int totalJobPostOf6DayAgo = jdao.getTotalJobPost6DayAgo();
            int totalJobPostOf7DayAgo = jdao.getTotalJobPost7DayAgo();
            
            
            
            List<JobPostDTO> listJobPost = jdao.getTop5NewJobPost();
            List<UserDTO> list5NewEmployer = udao.get5NewEmployer();

            for (JobPostDTO jobPost : listJobPost) {
                if (jobPost.getTitle().length() > 50) {
                    String title = jobPost.getTitle().substring(0, 50);
                    jobPost.setTitle(title + "...");
                }

            }

            int[] dataPost = {totalJobPostOf7DayAgo, 
                              totalJobPostOf6DayAgo, 
                              totalJobPostOf5DayAgo, 
                              totalJobPostOf4DayAgo, 
                              totalJobPostOf3DayAgo, 
                              totalJobPostOf2DayAgo, 
                              totalJobPostOf1DayAgo};
            
            request.setAttribute("TOTAL_EMPLOYER", totalEmployer);
            request.setAttribute("TOTAL_USER", totalUser);
            request.setAttribute("TOTAL_JOB_POST", totalJobPost);
            request.setAttribute("TOTAL_JOB_POST_LAST_WEEK", totalJobPostLastWeek);
            request.setAttribute("TOP5_JOB_POST", listJobPost);
            request.setAttribute("TOP5_NEW_EMPLOYER", list5NewEmployer);
            request.setAttribute("DATA", dataPost);

        } catch (Exception ex) {
            Logger.getLogger(AdminLostAndFoundController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher("/Admin/AdminDashboardFreelance.jsp").forward(request, response);
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
