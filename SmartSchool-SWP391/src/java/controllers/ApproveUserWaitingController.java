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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import sendMail.MailSender;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "ApproveUserWaitingController", urlPatterns = {"/approveUserWaiting"})
public class ApproveUserWaitingController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String buttonValue = request.getParameter("buttonValue");
        String applyJobId = request.getParameter("applyJobId");
        String userId = request.getParameter("userId");
        String jobId = request.getParameter("jobId");
        ApplyJobDAO aDao = new ApplyJobDAO();
        UserDAO uDao = new UserDAO();
        JobPostAnswerDAO ansDao = new JobPostAnswerDAO();
        JobPostDAO pDao = new JobPostDAO();
        int haveJob = uDao.getHaveJob(userId);
        JobPostDTO checkAmount = pDao.getAmountFreelancer(jobId);
        
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        String fullname = request.getParameter("fullname");
        String title = request.getParameter("title");
        String jobCategoryName = request.getParameter("jobCategoryName");
        String userEmail = request.getParameter("userEmail");
        String subject = "You have been applied for the Freelance Job !";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: #f26f21;\">Hello, "+fullname+" !</h3>\n"
                + "    <div>First, we would like to thank you for your interest and application for this position.</div>\n"
                + "    <div>You will work as a "+title+" in the Field of "+jobCategoryName+"</div>\n"
                + "    <div>If you have any questions, you can contact us for answers.</div>\n"
                + "    <div>Hope we will have a good, long-term cooperation in the future.</div>\n"
                + "    <div>Contact us with,</div>\n"
                + "    <div>Phone: "+loginUser.getPhone()+"</div>\n"
                + "    <div>Email: "+loginUser.getEmail()+"</div>\n"
                + "    <div>Best regards.</div>"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        MailSender sendMail = new MailSender();
        if (haveJob < 3) {
            if (checkAmount.getAmountFreelancer() < checkAmount.getAmount()) {
                if ("approved".equals(buttonValue)) {
                    aDao.setApplyJobDoing(applyJobId);
                    pDao.setAmountFreelancerPlusOne(jobId);
                    uDao.setHaveJobPlusOne(userId);
                    JobPostDTO AmountFreelancer = pDao.getAmountFreelancer(jobId);                  
                    sendMail.send(userEmail, subject, message, "smartschool20222@gmail.com", "frscbuzdjuvziftg");
                    out.print(AmountFreelancer.getAmountFreelancer());
                } else if ("denied".equals(buttonValue)) {
                    aDao.setApplyJobDenied(applyJobId);
                    ansDao.deleteAnswer(userId, jobId);
                }

            } else {
                out.print("JobFullAmount");
            }
        } else {
            if ("approved".equals(buttonValue)) {
                out.print("UserFullJob");
            } else if ("denied".equals(buttonValue)) {
                aDao.setApplyJobDenied(applyJobId);
                ansDao.deleteAnswer(userId, jobId);
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ApproveUserWaitingController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ApproveUserWaitingController.class.getName()).log(Level.SEVERE, null, ex);
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
