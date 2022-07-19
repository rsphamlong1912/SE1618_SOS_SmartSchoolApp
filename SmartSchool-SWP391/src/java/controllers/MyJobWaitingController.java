/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import applyJob.ApplyJobDAO;
import applyJob.ApplyJobDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jobPost.JobPostDAO;
import jobPost.JobPostDTO;
import jobPostAnswer.JobPostAnswerDAO;
import jobPostAnswer.JobPostAnswerDTO;
import user.UserDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "MyJobWaitingController", urlPatterns = {"/myJobWaiting"})
public class MyJobWaitingController extends HttpServlet {

    private static final String ERROR = "FreelancerJobWaiting.jsp";
    private static final String MY_JOB_WAITING_PAGE = "FreelancerJobWaiting.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userId = loginUser.getUserId();
            ApplyJobDAO jDao = new ApplyJobDAO();
            List<ApplyJobDTO> listWait = jDao.getListApplyJobWaiting(userId);
            JobPostDAO pDao = new JobPostDAO();
            List<JobPostDTO> listJob = new ArrayList<>();
            ArrayList<JobPostAnswerDTO> listAnswer = new ArrayList<>();
            JobPostAnswerDAO aDao = new JobPostAnswerDAO();
            for (ApplyJobDTO a : listWait) {
                listJob.add(pDao.getMyJobWaiting(a.getJobId()));
                listAnswer.addAll(aDao.getAnswerJobWaiting(a.getJobId(),a.getUserId()));
            }
            if (!listJob.isEmpty()) {
                request.setAttribute("MY_JOB_WAITING", listJob);
                request.setAttribute("MY_JOB_ANSWER_WAITING", listAnswer);
                url = MY_JOB_WAITING_PAGE;
            } else {
                request.setAttribute("ERROR", "Bạn chưa đăng ký công việc nào");
                url = ERROR;
            }
        } catch (Exception e) {
            log("Error at MyJobWaitingController:" + e.toString());
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
