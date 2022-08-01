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
import jobPostAnswer.JobPostAnswerDAO;
import jobPostAnswer.JobPostAnswerDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "SearchUserDoingDoneController", urlPatterns = {"/searchUserDoingDone"})
public class SearchUserDoingDoneController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String txtSearch = request.getParameter("search");
        String jobId = request.getParameter("jobId");
        ApplyJobDAO jDao = new ApplyJobDAO();
        List<ApplyJobDTO> listUserDoing = jDao.searchListUserDoingDone(jobId, txtSearch);
        ArrayList<JobPostAnswerDTO> listAnswer = new ArrayList<>();
        JobPostAnswerDAO aDao = new JobPostAnswerDAO();
        for (ApplyJobDTO a : listUserDoing) {
            listAnswer.addAll(aDao.getAnswerJobWaiting(a.getJobId(), a.getUserId()));
        }
        if (listUserDoing.isEmpty()) {
            out.println("<div class=\"card-body\">\n"
                    + "                                                <div class=\"row text-center\">\n"
                    + "                                                    <h3>Không tìm thấy</h3>                                                       \n"
                    + "                                                </div>                                                   \n"
                    + "                                            </div>");
        } else {
            int i = 1;
            for (ApplyJobDTO a : listUserDoing) {
                i++;
                out.println("<div class=\"card-body\">\n"
                        + "                                                <div class=\"row\">\n"
                        + "                                                    <div class=\"col-lg-12 col-md-12\">\n"
                        + "                                                        <div class=\"card overflow-hidden shadow\">\n"
                        + "                                                            <div class=\"card-body container\">\n"
                        + "                                                                <div class=\"row mb-3\">\n"
                        + "                                                                    <div class=\"col-md-1\"><img\n"
                        + "                                                                            src=\"/avatar?userId=" + a.getUserId() + "\"\n"
                        + "                                                                            alt class=\"\" style=\"width: 50px; height: 50px; border-radius: 50%;\"/>\n"
                        + "                                                                    </div>\n"
                        + "                                                                    <div class=\"col-md-8\" style=\"padding-left: 0px;\">\n"
                        + "                                                                        <div class=\"d-flex flex-column flex-lg-row justify-content-between\">\n"
                        + "                                                                            <h5 class=\"fw-medium text-truncate\">" + a.getFullname() + "</h5>\n"
                        + "                                                                            <span class=\"fs-1 fw-medium d-flex\"></span>\n"
                        + "                                                                        </div>\n"
                        + "                                                                        <div class=\"d-flex align-items-center\"><span class=\"fw-medium\" style=\"font-size: 14px;\"> Freelancer</span>\n"
                        + "                                                                        </div>\n"
                        + "                                                                    </div>\n"
                        + "                                                                    <div class=\"col-md-3 text-end\">\n"
                        + "                                                                        <a type=\"button\" class=\"text-secondary text-decoration-none hoverLink\" data-bs-toggle=\"modal\" data-bs-target=\"#ModalAnswer" + i + "\"> \n"
                        + "                                                                            <img src=\"assets/img/dest/form.svg\" width=\"18\" alt=\"navigation\" /> Form đăng ký\n"
                        + "                                                                        </a>\n"
                        + "                                                                    </div>\n"
                        + "                                                                </div>\n"
                        + "                                                                <!-- Modal -->\n"
                        + "                                                                <div class=\"modal fade\" id=\"ModalAnswer" + i + "\" tabindex=\"-1\" data-bs-backdrop=\"false\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\n"
                        + "\n"
                        + "                                                                    <div class=\"modal-dialog modal-dialog-centered\">\n"
                        + "\n"
                        + "                                                                        <div class=\"modal-content modal-shadow\">\n"
                        + "\n"
                        + "                                                                            <div class=\"modal-header gradient-custom-2\" >\n"
                        + "                                                                                <h5 class=\"modal-title\" id=\"exampleModalLabel\" style=\"color: #ffffff;\">Câu trả lời của Ứng viên</h5>\n"
                        + "\n"
                        + "                                                                            </div>\n"
                        + "                                                                            <div class=\"modal-body\" style=\"padding: 1.5rem;\">");
                for (JobPostAnswerDTO ans : listAnswer) {
                    if (a.getUserId().equals(ans.getUserId())) {
                        out.println("<div class=\"mb-4\">\n"
                                + "                                                                                            <label for=\"formGroupExampleInput\" class=\"form-label fw-bold\">" + ans.getQuestion() + "</label>                                                                                    \n"
                                + "                                                                                            <input type=\"text\" class=\"form-control\" id=\"formGroupExampleInput\" name=\"answer\" value=\"" + ans.getAnswer() + "\" readonly=\"\">\n"
                                + "                                                                                        </div>");
                    }
                }
                out.println("                                                                            </div>\n"
                        + "                                                                            <div class=\"modal-footer\">\n"
                        + "                                                                                <button type=\"button\" class=\"btn btn-outline-primary\" data-bs-dismiss=\"modal\">Đóng</button>\n"
                        + "                                                                            </div>\n"
                        + "\n"
                        + "                                                                        </div>\n"
                        + "                                                                    </div>\n"
                        + "                                                                </div>\n"
                        + "                                                                <div class=\"d-flex align-items-center mb-3\"> <span class=\"fw-medium\" style=\"font-size: 14px;\"><i class=\"fa fa-user\" aria-hidden=\"true\"></i> Thông tin liên hệ</span>\n"
                        + "                                                                </div>\n"
                        + "                                                                <div class=\"row\">\n"
                        + "                                                                    <div class=\"col-md-6 d-flex align-items-center mb-2\"> <h6>Số điện thoại: <span class=\"fw-medium\" style=\"font-size: 14px;\"> " + a.getPhone() + "</span></h6>\n"
                        + "                                                                    </div>\n"
                        + "                                                                    <div class=\"col-md-6 d-flex align-items-center mb-2\"> <h6>Email: <span class=\"fw-medium\" style=\"font-size: 14px;\"> " + a.getEmail() + " </span></h6>\n"
                        + "                                                                    </div>\n"
                        + "                                                                </div>\n"
                        + "                                                                <div class=\"d-flex align-items-center mb-2\"> <h6>Facebook: <span class=\"fw-medium\" style=\"font-size: 14px;\"> <a class=\"text-decoration-none\" href=\"" + a.getFacebook() + "\">" + a.getFacebook() + "</a></span></h6></div>\n"
                        + "                                                                <div class=\"d-flex align-items-center mb-2\"> \n"
                        + "                                                                    <h6>Trạng thái:");
                if ("doing".equals(a.getStatus())) {
                    out.println("<span id=\"" + a.getUserId() + "\" class=\"fw-medium fw-bold text-success\" style=\"font-size: 14px; \">Đang làm</span>");
                } else if ("done".equals(a.getStatus())) {
                    out.println("<span id=\"" + a.getUserId() + "\" class=\"fw-medium fw-bold text-danger\" style=\"font-size: 14px; \">Đã hoàn thành</span>");
                }
                out.println("    </h6>\n"
                        + "                                                                </div>");
                out.println("<div class=\"row mb-3 justify-content-end\">\n"
                        + "                                                                        <div class=\"col-md-3\">                                                                       \n"
                        + "                                                                            <select class=\"form-select fw-bold\" onchange=\"changeStatus(this.getAttribute('data-applyJobId'), this.getAttribute('data-userId'), this)\" \n"
                        + "                                                                                    data-applyJobId=\"" + a.getApplyJobId() + "\"\n"
                        + "                                                                                    data-userId=\"" + a.getUserId() + "\">\n"
                        + "                                                                                <option value=\"doing\" >Đang làm</option>\n"
                        + "                                                                                <option value=\"done\" >Đã hoàn thành</option>\n"
                        + "                                                                            </select>\n"
                        + "                                                                        </div>\n"
                        + "                                                                    </div>");
                out.println("          </div>\n"
                        + "                                                        </div>\n"
                        + "                                                    </div>\n"
                        + "                                                </div>\n"
                        + "                                            </div>");
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
            Logger.getLogger(SearchUserDoingDoneController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchUserDoingDoneController.class.getName()).log(Level.SEVERE, null, ex);
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
