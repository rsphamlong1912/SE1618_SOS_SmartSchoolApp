/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import category.CategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import post.PostDAO;
import category.CategoryDAO;
import post.PostDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "LostAndFoundHomeController", urlPatterns = {"/lostAndfoundhome"})
public class LostAndFoundHomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PostDAO pdao = new PostDAO();
            CategoryDAO cdao = new CategoryDAO();
            List<PostDTO> list3Lost = pdao.get3NewLost();
            List<PostDTO> list3Found = pdao.get3NewFound();
            for (PostDTO postDTO : list3Found) {
                if (postDTO.getTitle().length() > 25) {
                    String title = postDTO.getTitle().substring(0, 25);
                    postDTO.setTitle(title + "...");
                    System.out.println(postDTO.getTitle());
                }
            }
            for (PostDTO postDTO : list3Lost) {
                if (postDTO.getTitle().length() > 25) {
                    String title = postDTO.getTitle().substring(0, 25);
                    postDTO.setTitle(title + "...");
                    System.out.println(postDTO.getTitle());
                }
            }

            List<CategoryDTO> listAllCategory = cdao.getAllCategory();

            request.setAttribute("LIST3LOST", list3Lost);
            request.setAttribute("LIST3FOUND", list3Found);
            request.setAttribute("LISTALLCATEGORY", listAllCategory);
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher("LostAndFoundHome.jsp").forward(request, response);
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
