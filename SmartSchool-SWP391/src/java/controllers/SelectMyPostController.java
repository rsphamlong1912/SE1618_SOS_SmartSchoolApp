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
import javax.servlet.http.HttpSession;
import post.PostDAO;
import post.PostDTO;
import user.UserDTO;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
@WebServlet(name = "SelectMyPostController", urlPatterns = {"/selectMyPost"})
public class SelectMyPostController extends HttpServlet {

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
        try {
            response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession();
            String postStatus = request.getParameter("postStatus");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            PostDAO dao = new PostDAO();
            if ("approving".equals(postStatus)) {
                List<PostDTO> listApproving = dao.getMyPostApproving(loginUser.getUserId());
                if (listApproving.isEmpty()) {
                    request.setAttribute("ERROR", "Bạn chưa có bài đăng nào");
                } else {
                    request.setAttribute("MY_POST", listApproving);
                    request.setAttribute("SELECTED", 1);
                }
            } else if ("true".equals(postStatus)) {
                List<PostDTO> list = dao.getMyPost(loginUser.getUserId());
                if (list.isEmpty()) {
                    request.setAttribute("ERROR", "Bạn chưa có bài đăng nào");
                } else {
                    request.setAttribute("MY_POST", list);
                    request.setAttribute("SELECTED", 2);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(SelectMyPostController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher("myPost.jsp").forward(request, response);
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
