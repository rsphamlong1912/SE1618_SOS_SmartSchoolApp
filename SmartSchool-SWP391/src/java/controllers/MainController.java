/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
@MultipartConfig(maxFileSize = 16177215)
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "login";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "logout";
    private static final String PROFILE_DETAIL = "ProfileDetail";
    private static final String PROFILE_DETAIL_CONTROLLER = "profileDetail";
    private static final String MY_POST = "MyPost";
    private static final String MY_POST_CONTROLLER = "myPost";
    private static final String CHANGE_PASSWORD = "ChangePassword";
    private static final String CHANGE_PASSWORD_CONTROLLER = "changePassword";
    private static final String FEEDBACK_SYSTEM = "FeedbackSystem";
    private static final String FEEDBACK_SYSTEM_CONTROLLER = "feedbackSystem";
    private static final String SIGNUP = "SignUp";
    private static final String SIGNUP_CONTROLLER = "signup";
    private static final String UPDATE_PROFILE = "UpdateProfile";
    private static final String UPDATE_PROFILE_CONTROLLER = "updateProfile";
    private static final String POST_DETAIL = "PostDetail";
    private static final String POST_DETAIL_CONTROLLER = "postDetail";
    private static final String UPLOAD_JOBPOST = "UploadJobPost";
    private static final String UPLOAD_JOBPOST_CONTROLLER = "uploadJobPost";
    private static final String MY_JOB_POST_PROCESS = "MyJobPostProcess";
    private static final String MY_JOB_POST_PROCESS_CONTROLLER = "myJobPostProcess";
    private static final String MY_JOB_POST_DONE = "MyJobPostDone";
    private static final String MY_JOB_POST_DONE_CONTROLLER = "myJobPostDone";
    private static final String MY_JOB_POST_APPROVE = "MyJobPostApprove";
    private static final String MY_JOB_POST_APPROVE_CONTROLLER = "myJobPostApprove";
    private static final String LIST_ALL = "ListAll";
    private static final String LIST_ALL_CONTROLLER = "listAll";
    private static final String UPLOAD_POST = "UploadPost";
    private static final String UPLOAD_POST_CONTROLLER = "uploadPost";
    private static final String LIST_ALL_JOBPOST = "ListJobPost";
    private static final String LIST_ALL_JOBPOST_CONTROLLER = "listJobPost";
    private static final String SEARCH_JOB = "SearchJob";
    private static final String SEARCH_JOB_CONTROLLER = "searchJobPost";
    private static final String SEARCH_JOBBYCATEGORY = "SearchJobByCategory";
    private static final String SEARCH_JOBBYCATEGORY_CONTROLLER = "searchJobByCategoryId";
    private static final String DETAIL_JOB = "DetailJob";
    private static final String DETAIL_JOB_CONTROLLER = "detailJob";
    private static final String ADMIN_LOSTANDFOUND = "AdminLostAndFound";
    private static final String ADMIN_LOSTANDFOUND_CONTROLLER = "adminLostAndFound";
    private static final String CATEGORY = "Category";
    private static final String CATEGORY_LOSTANDFOUND_CONTROLLER = "category";
    private static final String ADD_CATEGORY = "AddCategogy";
    private static final String ADD_CATEGORY_LOSTANDFOUND_CONTROLLER = "addCategory";
    private static final String EDIT_CATEGORY = "EditCategogy";
    private static final String EDIT_CATEGORY_LOSTANDFOUND_CONTROLLER = "editCategory";
    private static final String DELETE_CATEGORY = "DeleteCategogy";
    private static final String DELETE_CATEGORY_LOSTANDFOUND_CONTROLLER = "deleteCategory";

    private static final String JOB_CATEGORY = "JobCategory";
    private static final String JOB_CATEGORY_CONTROLLER = "jobCategory";
    private static final String ADD_JOB_CATEGORY = "AddJobCategory";
    private static final String ADD_JOB_CATEGORY_CONTROLLER = "addJobCategory";
    private static final String DELETE_JOB_CATEGORY = "DeleteJobCategory";
    private static final String DELETE_JOB_CATEGORY_CONTROLLER = "deleteJobCategory";
    private static final String EDIT_JOB_CATEGORY = "EditJobCategory";
    private static final String EDIT_JOB_CATEGORY_CONTROLLER = "editJobCategory";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            }
            if (PROFILE_DETAIL.equals(action)) {
                url = PROFILE_DETAIL_CONTROLLER;
            }
            if (MY_POST.equals(action)) {
                url = MY_POST_CONTROLLER;
            }

            if (CHANGE_PASSWORD.equals(action)) {
                url = CHANGE_PASSWORD_CONTROLLER;
            }
            if (FEEDBACK_SYSTEM.equals(action)) {
                url = FEEDBACK_SYSTEM_CONTROLLER;
            }
            if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            }
            if (SIGNUP.equals(action)) {
                url = SIGNUP_CONTROLLER;
            }
            if (UPDATE_PROFILE.equals(action)) {
                url = UPDATE_PROFILE_CONTROLLER;
            }
            if (POST_DETAIL.equals(action)) {
                url = POST_DETAIL_CONTROLLER;
            }
            if ("uploadImg".equals(action)) {
                url = "updateAvatar";
            }
            if (UPLOAD_JOBPOST.equals(action)) {
                url = UPLOAD_JOBPOST_CONTROLLER;
            }
            if (MY_JOB_POST_PROCESS.equals(action)) {
                url = MY_JOB_POST_PROCESS_CONTROLLER;
            }
            if (MY_JOB_POST_DONE.equals(action)) {
                url = MY_JOB_POST_DONE_CONTROLLER;
            }
            if (LIST_ALL.equals(action)) {
                url = LIST_ALL_CONTROLLER;
            }
            if (UPLOAD_POST.equals(action)) {
                url = UPLOAD_POST_CONTROLLER;
            }
            if (LIST_ALL_JOBPOST.equals(action)) {
                url = LIST_ALL_JOBPOST_CONTROLLER;
            }
            if (SEARCH_JOB.equals(action)) {
                url = SEARCH_JOB_CONTROLLER;
            }
            if (SEARCH_JOBBYCATEGORY.equals(action)) {
                url = SEARCH_JOBBYCATEGORY_CONTROLLER;
            }
            if (DETAIL_JOB.equals(action)) {
                url = DETAIL_JOB_CONTROLLER;
            }
            if (MY_JOB_POST_APPROVE.equals(action)) {
                url = MY_JOB_POST_APPROVE_CONTROLLER;
            }
            if (ADMIN_LOSTANDFOUND.equals(action)) {
                url = ADMIN_LOSTANDFOUND_CONTROLLER;
            }
            if (CATEGORY.equals(action)) {
                url = CATEGORY_LOSTANDFOUND_CONTROLLER;
            }
            if (ADD_CATEGORY.equals(action)) {
                url = ADD_CATEGORY_LOSTANDFOUND_CONTROLLER;
            }
            if (EDIT_CATEGORY.equals(action)) {
                url = EDIT_CATEGORY_LOSTANDFOUND_CONTROLLER;
            }
            if (DELETE_CATEGORY.equals(action)) {
                url = DELETE_CATEGORY_LOSTANDFOUND_CONTROLLER;
            }
            if (CATEGORY.equals(action)) {
                url = CATEGORY_LOSTANDFOUND_CONTROLLER;
            }
            if (JOB_CATEGORY.equals(action)) {
                url = JOB_CATEGORY_CONTROLLER;
            }
            if (ADD_JOB_CATEGORY.equals(action)) {
                url = ADD_JOB_CATEGORY_CONTROLLER;
            }
            if (DELETE_JOB_CATEGORY.equals(action)) {
                url = DELETE_JOB_CATEGORY_CONTROLLER;
            }
            if (EDIT_JOB_CATEGORY.equals(action)) {
                url = EDIT_JOB_CATEGORY_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
