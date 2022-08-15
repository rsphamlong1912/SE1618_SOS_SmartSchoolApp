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
import javax.servlet.http.HttpSession;
import jobPost.JobPostDAO;
import jobPost.JobPostDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "SelectUserJobController", urlPatterns = {"/selectUserJob"})
public class SelectUserJobController extends HttpServlet {

    private static final String ERROR = "FreelancerJobDoing.jsp";
    private static final String MY_JOB_DOING_PAGE = "FreelancerJobDoing.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userId = loginUser.getUserId();
            String job = request.getParameter("Job");
            ApplyJobDAO jDao = new ApplyJobDAO();
            JobPostDAO pDao = new JobPostDAO();
            UserDAO udao = new UserDAO();
            List<JobPostDTO> listJob = new ArrayList<>();
            List<UserDTO> listUserInfo = new ArrayList<>();
            if ("doing".equals(job)) {
                List<ApplyJobDTO> listDoing = jDao.getListApplyJobDoing(userId);              
                for (ApplyJobDTO a : listDoing) {
                    listJob.add(pDao.getMyJobWaiting(a.getJobId()));
                }
                for (JobPostDTO jobInfo: listJob){
                    listUserInfo.add(udao.GetEmployerInfor(jobInfo.getUserId()));
                }
                request.setAttribute("MY_JOB_DOING", listJob);
                request.setAttribute("USER_INFO", listUserInfo);
                request.setAttribute("SELECTED", 1);
                if (listJob.isEmpty()) {
                    request.setAttribute("ERROR", "Bạn chưa có công việc nào");
                }
                url = MY_JOB_DOING_PAGE;
            } else if ("done".equals(job)) {
                List<ApplyJobDTO> listDone = jDao.getListApplyJobDone(userId);
                for (ApplyJobDTO a : listDone) {
                    listJob.add(pDao.getMyJobWaiting(a.getJobId()));
                }
                for (JobPostDTO jobInfo: listJob){
                    listUserInfo.add(udao.GetEmployerInfor(jobInfo.getUserId()));
                }
                request.setAttribute("MY_JOB_DOING", listJob);             
                request.setAttribute("USER_INFO", listUserInfo);
                request.setAttribute("SELECTED", 2);
                if (listJob.isEmpty()) {
                    request.setAttribute("ERROR", "Bạn chưa có công việc nào");
                }
                url = MY_JOB_DOING_PAGE;
            }
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
