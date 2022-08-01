/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

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
import user.UserDTO;

/**
 *
 * @author TrinhNgocBao
 */
@WebServlet(name = "SelectJobController", urlPatterns = {"/selectJob"})
public class SelectJobController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userId = loginUser.getUserId();
            String job = request.getParameter("Job");
            JobPostDAO dao = new JobPostDAO();
            List<JobPostDTO> list = dao.getMyJobPostDoingDone(userId);
            List<JobPostDTO> listDoing = new ArrayList<>();
            List<JobPostDTO> listDone = new ArrayList<>();
            if ("doing".equals(job)){
                for(JobPostDTO doing: list){
                    if("doing".equals(doing.getProcess())){
                        listDoing.add(doing);
                    }
                }               
                request.setAttribute("MY_JOB_POST_DONE", listDoing);
                request.setAttribute("SELECTED", 1);
                if(listDoing.isEmpty()){
                    request.setAttribute("ERROR", "Chưa có công việc nào");
                }
                
            }else if ("done".equals(job)){
                for(JobPostDTO done: list){
                    if("done".equals(done.getProcess())){
                        listDone.add(done);
                    }
                }
                request.setAttribute("MY_JOB_POST_DONE", listDone);
                request.setAttribute("SELECTED", 2); 
                if(listDone.isEmpty()){
                    request.setAttribute("ERROR", "Chưa có công việc nào");
                }
            }
            
            
        } catch (Exception e) {
        } finally {
            request.getRequestDispatcher("EmployerJobDone.jsp").forward(request, response);
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
