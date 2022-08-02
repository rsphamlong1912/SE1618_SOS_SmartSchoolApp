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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jobPost.JobPostDAO;
import jobPost.JobPostDTO;
import jobPostAnswer.JobPostAnswerDAO;
import jobPostAnswer.JobPostAnswerDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "MyJobPostDoneDetailController", urlPatterns = {"/myJobPostDoneDetail"})
public class MyJobPostDoneDetailController extends HttpServlet {

    private static final String ERROR = "EmployerJobProcessDetail.jsp";
    private static final String MY_JOB_POST_DONE_DETAIL_PAGE = "EmployerJobDoneDetail.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
                String url = ERROR;
        try {
            String jobId = request.getParameter("jobId");
            JobPostDAO dao = new JobPostDAO();
            JobPostDTO postJob = dao.getJobInformationDone(jobId);
            ApplyJobDAO jDao = new ApplyJobDAO();
            List<ApplyJobDTO> listUserDoing = jDao.getListUserDoing(jobId);
            ArrayList<JobPostAnswerDTO> listAnswer = new ArrayList<>();
            JobPostAnswerDAO aDao = new JobPostAnswerDAO();
            for (ApplyJobDTO a : listUserDoing) {
                listAnswer.addAll(aDao.getAnswerJobWaiting(a.getJobId(), a.getUserId()));              
            }
            
            if (listUserDoing.isEmpty()) {
                request.setAttribute("JOBDETAIL", postJob);
                request.setAttribute("ERROR", "(Chưa có ứng viên)");
                url = MY_JOB_POST_DONE_DETAIL_PAGE;
            }else {
                request.setAttribute("JOBDETAIL", postJob);
                request.setAttribute("USER_DOING", listUserDoing);
                request.setAttribute("USER_ANSWER_WAITING", listAnswer);
                url = MY_JOB_POST_DONE_DETAIL_PAGE;
            }
            request.setAttribute("AMOUNT_FREELANCER", postJob.getAmountFreelancer());
        } catch (Exception e) {
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
