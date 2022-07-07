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
import post.PostDAO;
import post.PostDTO;
import user.UserDAO;
import user.UserDTO;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
@WebServlet(name = "AdminLostAndFoundController", urlPatterns = {"/adminLostAndFound"})
public class AdminLostAndFoundController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            PostDAO dao = new PostDAO();
            UserDAO udao = new UserDAO();
            int count = dao.getTotalPost();
            int countLostPost = dao.getTotalLostPost();
            int countFoundPost = dao.getTotalFoundPost();
            int countUser = udao.getTotalUser();
            List<UserDTO> list5User=udao.get5NewLost();
            request.setAttribute("TOTALUSER", countUser);
            request.setAttribute("TOTALPOST", count);
            request.setAttribute("TOTALLOSTPOST", countLostPost);
            request.setAttribute("TOTALFOUNDPOST", countFoundPost);
            List<PostDTO> list5Lost = dao.get5NewLost();
            List<PostDTO> list5Found = dao.get5NewFound();
            for (PostDTO postDTO : list5Found) {
                if (postDTO.getTitle().length() > 50) {
                    String title = postDTO.getTitle().substring(0, 50);
                    postDTO.setTitle(title + "...");
                    System.out.println(postDTO.getTitle());
                }
            }
            for (PostDTO postDTO : list5Lost) {
                if (postDTO.getTitle().length() > 50) {
                    String title = postDTO.getTitle().substring(0, 50);
                    postDTO.setTitle(title + "...");
                    System.out.println(postDTO.getTitle());
                }
            }
            request.setAttribute("LIST5LOST", list5Lost);
            request.setAttribute("LIST5FOUND", list5Found);
            request.setAttribute("LIST5USER", list5User);
        } catch (SQLException ex) {
            Logger.getLogger(AdminLostAndFoundController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher("/Admin/AdminDashboard.jsp").forward(request, response);
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
