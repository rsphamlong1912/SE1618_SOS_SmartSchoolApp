/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

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
import jobPost.JobPostDAO;
import jobPost.JobPostDTO;
import post.PostDAO;
import post.PostDTO;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
@WebServlet(name = "SearchJobPostController", urlPatterns = {"/searchJobPost"})
public class SearchJobPostController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String txtSearch = request.getParameter("search");
        JobPostDAO dao = new JobPostDAO();
        List<JobPostDTO> listPost = dao.searchPostByTitle(txtSearch);
        PrintWriter out = response.getWriter();
        listPost.forEach((post) -> {
            out.println("<div class=\"col-lg-6 col-md-6 mb-5\">\n"
                    + "                                        <div class=\"card overflow-hidden shadow shadow-hover\" id=\"hoverCard\">\n"
                    + "                                            <div class=\"card-body \">\n"
                    + "                                                <div class=\"row mb-3\">\n"
                    + "                                                    <div class=\"col-md-2\">\n"
                    + "                                                                \n"
                    + "                                                                <img src=\"/avatar?userId=" + post.getUserId() + "\"\n"
                    + "                                                                     alt class=\"\" style=\"width: 50px; height: 50px;\"/>\n"
                    + "                                                        </div>\n"
                    + "                                                        <div class=\"col-md-9\" style=\"padding-left: 0px;\">\n"
                    + "                                                            <div\n"
                    + "                                                                class=\"d-flex flex-column flex-lg-row justify-content-between\">\n"
                    + "                                                                <h5 class=\"text-secondary fw-medium text-truncate\">" + post.getFullname() + "</h5>\n"
                    + "                                                                <span class=\"fs-1 fw-medium d-flex\"></span>\n"
                    + "                                                            </div>\n"
                    + "                                                            <div class=\"d-flex align-items-center\"><span class=\"fw-medium\"\n"
                    + "                                                                                                         style=\"font-size: 15px;\">" + post.getCompName() + "</span>\n"
                    + "                                                            </div>\n"
                    + "                                                        </div>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"d-flex flex-column flex-lg-row justify-content-between mb-2\">\n"
                    + "                                                        <h5 class=\"text-secondary fw-medium text-truncate\"><a\n"
                    + "                                                                class=\"link-901 text-decoration-none stretched-link\" href=\"#!\">" + post.getTitle() + "</a></h5><span class=\"fs-1 fw-medium\"></span>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"d-flex align-items-center mb-2\"> <span\n"
                    + "                                                            class=\"fw-medium\" style=\"font-size: 14px;\">Lĩnh vực: ${listJob.jobCategoryName}</span>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"d-flex align-items-center mb-2\"> <img src=\"assets/img/dest/dollar.svg\"\n"
                    + "                                                                                                      style=\"margin-right: 5px;\" width=\"20\" alt=\"navigation\" /><span\n"
                    + "                                                                                                      class=\"fw-medium\" style=\"font-size: 14px;\">" + post.getSalary() + " VNĐ/h</span>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"d-flex align-items-center mb-2\"> <img src=\"assets/img/dest/user.svg\"\n"
                    + "                                                                                                      style=\"margin-right: 5px;\" width=\"20\" alt=\"navigation\" /><span\n"
                    + "                                                                                                      class=\"fw-medium\" style=\"font-size: 14px;\">" + post.getAmount() + " người</span>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"d-flex align-items-center mb-5\"> <img src=\"assets/img/dest/calendar.svg\"\n"
                    + "                                                                                                      style=\"margin-right: 5px;\" width=\"20\" alt=\"navigation\" /><span\n"
                    + "                                                                                                      class=\"fw-semibold\" style=\"font-size: 14px;\">                                            \n"
                    + "                                                            <c:choose> \n"
                    + "                                                                <c:when test=\"" + post.getTimeJob() == 1 + "\">\n"
                    + "                                                                    Ít hơn 1 tháng\n"
                    + "                                                                </c:when>  \n"
//                    + "                                                                <c:when test=\"" + post.getTimeJob() == 2 + "\">\n"
//                    + "                                                                    1 - 3 tháng\n"
//                    + "                                                                </c:when>  \n"
//                    + "                                                                <c:when test=\"" + post.getTimeJob() == 3 + "\">\n"
//                    + "                                                                    Hơn 3 tháng\n"
//                    + "                                                                </c:when> \n"
                    + "                                                            </c:choose></span>\n"
                    + "\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"d-flex align-items-center\"> <img src=\"assets/img/dest/clock.svg\"\n"
                    + "                                                                                                 style=\"margin-right: 5px;\" width=\"15\" alt=\"navigation\" /><span\n"
                    + "                                                                                                 class=\"fw-medium\" style=\"font-size: 12px;\">" + post.getDate() + "</span>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>");
        });
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
            Logger.getLogger(SearchJobPostController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchJobPostController.class.getName()).log(Level.SEVERE, null, ex);
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
