/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import category.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import post.PostDAO;
import post.PostDTO;
import reportType.ReportTypeDAO;
import reportType.ReportTypeDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author TQK
 */
@WebServlet(name = "LostAndFoundDetailController", urlPatterns = {"/lostAndFoundDetail"})
public class LostAndFoundDetailController extends HttpServlet {

    private static final String ERROR = "LostAndFoundDetail.jsp";
    private static final String POST_DETAIL_PAGE = "LostAndFoundDetail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = POST_DETAIL_PAGE;
        try {
//            HttpSession session = request.getSession();
//            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String postId = request.getParameter("postId");
            PostDAO pdao = new PostDAO();
            PostDTO post = pdao.readPost(postId);
            List<PostDTO> list3Cate = pdao.get3Category(post.getCategoryId(), post.getPostId());
            ReportTypeDAO dao = new ReportTypeDAO();
            List<ReportTypeDTO> list = dao.getAll();
            String userId = post.getUserId();
            UserDAO udao = new UserDAO();
            UserDTO user = udao.checkAccountExist(userId);
            request.setAttribute("POST", post);
            request.setAttribute("USER_POST", user);
            request.setAttribute("LIST3CATE", list3Cate);
            request.setAttribute("LISTREPORT", list);
        } catch (Exception e) {
            log("Error at LostAndFoundDetailController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
//            response.sendRedirect(url);
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
