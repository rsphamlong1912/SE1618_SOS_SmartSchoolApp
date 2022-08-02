/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filters;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class RouterFilter implements Filter {

    private static final boolean debug = true;

    // The filter configuration object we are associated with.  If
    // this value is null, this filter instance is not currently
    // configured. 
    private FilterConfig filterConfig = null;

    public RouterFilter() {
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RouterFilter:DoBeforeProcessing");
        }

        // Write code here to process the request and/or response before
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log items on the request object,
        // such as the parameters.
        /*
	for (Enumeration en = request.getParameterNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    String values[] = request.getParameterValues(name);
	    int n = values.length;
	    StringBuffer buf = new StringBuffer();
	    buf.append(name);
	    buf.append("=");
	    for(int i=0; i < n; i++) {
	        buf.append(values[i]);
	        if (i < n-1)
	            buf.append(",");
	    }
	    log(buf.toString());
	}
         */
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("RouterFilter:DoAfterProcessing");
        }

        // Write code here to process the request and/or response after
        // the rest of the filter chain is invoked.
        // For example, a logging filter might log the attributes on the
        // request object after the request has been processed. 
        /*
	for (Enumeration en = request.getAttributeNames(); en.hasMoreElements(); ) {
	    String name = (String)en.nextElement();
	    Object value = request.getAttribute(name);
	    log("attribute: " + name + "=" + value.toString());

	}
         */
        // For example, a filter might append something to the response.
        /*
	PrintWriter respOut = new PrintWriter(response.getWriter());
	respOut.println("<P><B>This has been appended by an intrusive filter.</B>");
         */
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {

        if (debug) {
            log("RouterFilter:doFilter()");
        }

        doBeforeProcessing(request, response);
        HttpServletRequest req = ((HttpServletRequest) request);
        HttpServletResponse res = ((HttpServletResponse) response);
        String url = req.getServletPath();
        //Admin Page
        if (url.endsWith("/Admin/AdminDashboardFreelance.jsp")) {
            res.sendRedirect(req.getContextPath() + "/adminFreelance");
        }
        if (url.endsWith("/Admin/AdminDashboard.jsp")) {
            res.sendRedirect(req.getContextPath() + "/adminLostAndFound");
        }
        if (url.endsWith("/Admin/ApprovePostFreelanceJob.jsp")) {
            res.sendRedirect(req.getContextPath() + "/approveJobPost");
        }
        if (url.endsWith("/Admin/ApprovePostLostAndFound.jsp")) {
            res.sendRedirect(req.getContextPath() + "/listPostToApprove");
        }
        if (url.endsWith("/Admin/CategoryFreelanceJob.jsp")) {
            res.sendRedirect(req.getContextPath() + "/jobCategory");
        }
        if (url.endsWith("/Admin/CategoryLostAndFound.jsp")) {
            res.sendRedirect(req.getContextPath() + "/category");
        }
        if (url.endsWith("/Admin/PostFreelanceJob.jsp")) {
        }
        if (url.endsWith("/Admin/PostLostAndFound.jsp")) {
            res.sendRedirect(req.getContextPath() + "/adminLostAndFoundPost");
        }
        if (url.endsWith("/Admin/ReportPostLostAndFound.jsp")) {

        }
        //Normal Page
        if (url.endsWith("/LostAndFoundHome.jsp")) {
            res.sendRedirect(req.getContextPath() + "/lostAndfoundhome");
        }
        if (url.endsWith("/EmployerHome.jsp")) {
            res.sendRedirect(req.getContextPath() + "/employerhome");
        }
        if (url.endsWith("/FreelancerHome.jsp")) {
            res.sendRedirect(req.getContextPath() + "/freelancerhome");
        }
        if (url.endsWith("/EmployerDashboard.jsp")) {
            res.sendRedirect(req.getContextPath() + "/employerDashboard");
        }
        if (url.endsWith("/FreelanceList.jsp")) {
            res.sendRedirect(req.getContextPath() + "/listJobPost");
        }
        if (url.endsWith("/list.jsp")) {
            res.sendRedirect(req.getContextPath() + "/listAll");
        }
        if (url.endsWith("/EmployerUpload.jsp")) {
            res.sendRedirect(req.getContextPath() + "/uploadJobPost");
        }
        if (url.endsWith("/UploadPost.jsp")) {
            res.sendRedirect(req.getContextPath() + "/uploadLostAndFoundPost");
        }
        if (url.endsWith("/profileDetail.jsp")) {
            res.sendRedirect(req.getContextPath() + "/updateAvatar");
        }
        if (url.endsWith("/EmployerJobDone.jsp")) {
            res.sendRedirect(req.getContextPath() + "/selectJob");
        }
        if (url.endsWith("/postDetail.jsp")) {
            res.sendRedirect(req.getContextPath() + "/postDetail");
        }
        if (url.endsWith("/myPost.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myPost");
        }
        if (url.endsWith("FreelancerJobWaiting.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myJobWaiting");
        }
        if (url.endsWith("EmployerJobProcessDetail.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myJobPostProcessDetail");
        }
        if (url.endsWith("EmployerJobProcess.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myJobPostProcess");
        }
        if (url.endsWith("EmployerJobDoneDetail.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myJobPostDoneDetail");
        }
        if (url.endsWith("EmployerJobDone.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myJobPostDone");
        }
        if (url.endsWith("EmployerJobApprove.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myJobPostApprove");
        }
        if (url.endsWith("FreelancerJobDoing.jsp")) {
            res.sendRedirect(req.getContextPath() + "/myJobDoing");
        }
        if (url.endsWith("LostAndFoundDetail.jsp")) {
            res.sendRedirect(req.getContextPath() + "/lostAndFoundDetail");
        }
        if (url.endsWith("FreelanceList.jsp")) {
            res.sendRedirect(req.getContextPath() + "/listJobPost");
        }
        if (url.endsWith("feedbackSystem.jsp")) {
            res.sendRedirect(req.getContextPath() + "/feedbackSystem");
        }
        Throwable problem = null;
        try {
            chain.doFilter(request, response);
        } catch (Throwable t) {
            // If an exception is thrown somewhere down the filter chain,
            // we still want to execute our after processing, and then
            // rethrow the problem after that.
            problem = t;
            t.printStackTrace();
        }

        doAfterProcessing(request, response);

        // If there was a problem, we want to rethrow it if it is
        // a known type, otherwise log it.
        if (problem != null) {
            if (problem instanceof ServletException) {
                throw (ServletException) problem;
            }
            if (problem instanceof IOException) {
                throw (IOException) problem;
            }
            sendProcessingError(problem, response);
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("RouterFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("RouterFilter()");
        }
        StringBuffer sb = new StringBuffer("RouterFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
