/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDTO;
import user.UserDAO;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "login.jsp";
    private static final String ERROR_FREELANCE = "FreelancerLogin.jsp";
    private static final String AD = "AD";
    private static final String ADMIN_PAGE = "adminLostAndFound";
    private static final String US = "US";
    private static final String LOSTANDFOUNDHOME_PAGE = "lostAndfoundhome";
    private static final String EMPLOYERHOME_PAGE = "employerhome";
    private static final String FREELANCERHOME_PAGE = "freelancerhome";
    private static final String EM = "EM";
    private static final String EMPLOYER_PAGE = "employer.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String isFreelance = request.getParameter("isFreelance");
            String userID = request.getParameter("userID");
            String password = request.getParameter("password");
            HttpSession session = request.getSession();
            request.setAttribute("USERID", userID);
            request.setAttribute("PASSWORD", password);
            UserDAO dao = new UserDAO();
            UserDTO user = dao.login(userID, password);
            //xac thuc
            if (user != null) {
                String roleID = user.getRoleId();
                session.setAttribute("LOGIN_USER", user);
                if (roleID==null) {
                    request.setAttribute("ERROR", "Your role is not support!");
                } else if ("isFreelance".equals(isFreelance)) {
                    switch (roleID) {
                        case AD:
                            url = ADMIN_PAGE;
                            break;
                        case EM:
                            url = EMPLOYERHOME_PAGE;
                            break;
                        case US:
                            url = FREELANCERHOME_PAGE;
                            break;
                        default:
                            request.setAttribute("ERROR", "Your role is not support!");
                            break;
                    }
                } else {
                    switch (roleID) {
                        case AD:
                            url = ADMIN_PAGE;
                            break;
                        case US:
                            url = LOSTANDFOUNDHOME_PAGE;
                            break;
                        default:
                            request.setAttribute("ERROR", "Your role is not support!");
                            break;
                    }
                }
            } else {
                request.setAttribute("ERROR", "Tên đăng nhập hoặc mật khẩu không đúng!");
                if(isFreelance==null){
                    url=ERROR;
                }else{
                    url=ERROR_FREELANCE;
                }
            }
        } catch (Exception e) {
            log("Error at LoginController:" + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
