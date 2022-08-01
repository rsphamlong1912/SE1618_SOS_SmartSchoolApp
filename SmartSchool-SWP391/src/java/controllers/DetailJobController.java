/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import applyJob.ApplyJobDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jobCategory.JobCategoryDAO;
import jobCategory.JobCategoryDTO;
import jobPost.JobPostDAO;
import jobPost.JobPostDTO;
import jobPostQuestion.JobPostQuestionDAO;
import jobPostQuestion.JobPostQuestionDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author SE150888 Pham Ngoc Long
 */
@WebServlet(name = "DetailJobController", urlPatterns = {"/detailJob"})
public class DetailJobController extends HttpServlet {

    private static final String DETAIL_PAGE = "FreelanceDetail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = DETAIL_PAGE;
        try {
            HttpSession session = request.getSession();        
            if ((UserDTO) session.getAttribute("LOGIN_USER") != null) {
                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                String userId1 = loginUser.getUserId();
                String jobId = request.getParameter("jobId");
                ApplyJobDAO aDao = new ApplyJobDAO();
                String status = aDao.getStatusCheckApplyJob(jobId, userId1);
                if ("waiting".equals(status) || "doing".equals(status)) {
                    request.setAttribute("EXISTJOB", status);
                }
            }
            String jobId = request.getParameter("jobId");
            JobPostDAO dao = new JobPostDAO();
            JobPostDTO postJob = dao.getJobInformation(jobId);
            if("doing".equals(postJob.getProcess()) || "done".equals(postJob.getProcess())){
                request.setAttribute("ISDONE", 1);
            }else {
            JobPostQuestionDAO questionDao = new JobPostQuestionDAO();
            List<JobPostQuestionDTO> listQuestion = questionDao.getQuestionJobPost(jobId);
            String userId = request.getParameter("userId");
            UserDAO udao = new UserDAO();
            UserDTO user = udao.GetEmployerInfor(userId);
            List<JobPostDTO> list3Job = dao.getTop3JobPostByCategory(postJob.getJobCategoryId(), postJob.getJobId());
            request.setAttribute("USERINFOR", user);
            request.setAttribute("LISTQUESTION", listQuestion);
            request.setAttribute("JOBDETAIL", postJob);
            request.setAttribute("ISDONE", 2);
            request.setAttribute("LIST3JOB", list3Job);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SearchJobPostController.class.getName()).log(Level.SEVERE, null, ex);
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
