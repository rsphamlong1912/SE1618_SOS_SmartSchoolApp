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
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import post.PostDAO;
import post.PostDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "SearchPostController", urlPatterns = {"/searchPost"})
public class SearchPostController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String txtSearch = request.getParameter("search");
        PostDAO dao = new PostDAO();
        List<PostDTO> listPost = dao.searchPostByTitle(txtSearch);
        PrintWriter out = response.getWriter();
        for (PostDTO post : listPost) {
            out.println("                         <div class=\"col-lg-4 col-md-6 mb-5\">\n"
                    + "                                        <div class=\"card overflow-hidden shadow shadow-hover\" id=\"hoverCard\"> <img class=\"card-img-top\" src=\"/item?postId="+post.getPostId()+"\"alt=\"Found Item\" style=\"height: 12rem;\" />\n"
                    + "                                            <div class=\"card-body py-4 px-3\">\n"
                    + "                                                <div class=\"d-flex flex-column flex-lg-row justify-content-between mb-3\">\n"
                    + "                                                    <h5 class=\"text-secondary fw-medium text-truncate\"><a class=\"link-901 text-decoration-none stretched-link\"\n"
                    + "                                                                                                          href=\"#!\">"+post.getTitle()+"</a></h5><span class=\"fs-1 fw-medium\"></span>\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"d-flex align-items-center\"> <img src=\"assets/img/dest/clock.svg\"\n"
                    + "                                                                                             style=\"margin-right: 5px\" width=\"15\" alt=\"navigation\" /><span class=\"fw-medium\" style=\"font-size: 12px;\">"+post.getDate()+"</span></div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>");
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
            Logger.getLogger(SearchPostController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchPostController.class.getName()).log(Level.SEVERE, null, ex);
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
