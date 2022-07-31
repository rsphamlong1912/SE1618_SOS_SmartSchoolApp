/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import category.CategoryDAO;
import category.CategoryDTO;
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

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
@WebServlet(name = "SearchByCategoryAndTypeController", urlPatterns = {"/searchPostByCategoryAndType"})
public class SearchByCategoryAndTypeController extends HttpServlet {

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
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));

            int type = Integer.parseInt(request.getParameter("type"));
            PostDAO dao = new PostDAO();
            CategoryDAO cdao = new CategoryDAO();
            List<CategoryDTO> listAllCategory = cdao.getAllCategory();
            List<PostDTO> listPost = dao.searchPostByJobCategoryAndType(categoryId, type);
            request.setAttribute("LISTPOST", listPost);
            request.setAttribute("LISTALLCATEGORY", listAllCategory);
            if (type == 0) {
                request.setAttribute("TAGCATEFORLOST", categoryId);
            } else if (type == 1) {
                request.setAttribute("TAGCATEFORFOUND", categoryId);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SearchByCategoryAndTypeController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher("list.jsp").forward(request, response);

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