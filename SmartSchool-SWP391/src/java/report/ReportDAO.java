/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package report;

import feedbackSystem.FeedbackSystemDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import post.PostDAO;
import static post.PostDAO.checkTime;
import post.PostDTO;
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class ReportDAO {

    private static final String CREATE = "INSERT INTO tblReport(userId,postId,reportTypeId,reportDetail) VALUES(?,?,?,?)";
    private static final String LIST_ALL = "SELECT r.reportId, p.postId, p.title,c.categoryName,p.userId as postUser,r.reportDetail,r.userId as reportUser, t.reportType,p.type,p.description as postDescription,p.date as datePost\n"
            + "FROM tblReport as r,tblPost as p, tblUser as u, tblCategory as c,tblReportType as t\n"
            + "WHERE r.postId=p.postId AND r.userId =u.userId AND p.categoryId=c.categoryId AND r.reportTypeId= t.reportTypeId AND p.postStatus='true' ORDER BY reportId DESC";
    private static final String REMOVE_REPORTED_POST = "UPDATE tblPost\n"
            + "SET tblPost.postStatus = 'false'\n"
            + "FROM   tblReport r, \n"
            + "  tblPost p\n"
            + "WHERE r.postId = p.postId AND r.reportId=?";
    private static final String GET_TOTAL_REPORT = "SELECT COUNT(reportId) AS count\n"
            + "            FROM tblReport as r,tblPost as p, tblUser as u, tblCategory as c,tblReportType as t\n"
            + "            WHERE r.postId=p.postId AND r.userId =u.userId AND p.categoryId=c.categoryId AND r.reportTypeId= t.reportTypeId AND p.postStatus='true'";

    public static int takeMinutes() {
        long millis = System.currentTimeMillis();
        long minutes = TimeUnit.MILLISECONDS.toMinutes(millis);
        int minutesInt = (int) minutes;
        return minutesInt;
    }

    public static String checkTime(int minutes) {
        String time = null;
        long millis = System.currentTimeMillis();
        int minutesNow = (int) TimeUnit.MILLISECONDS.toMinutes(millis);
        int minutesDistance = minutesNow - minutes;
        if (minutesDistance < 60) {
            return time = Integer.toString(minutesDistance) + " phút trước";
        } else if (minutesDistance < 1440 && minutesDistance >= 60) {
            return time = Integer.toString(minutesDistance / 60) + " giờ trước";
        } else if (minutesDistance < 43200 && minutesDistance >= 1440) {
            return time = Integer.toString(minutesDistance / 1440) + " ngày trước";
        } else if (minutesDistance >= 43200) {
            return time = Integer.toString(minutesDistance / 43200) + " tháng trước";
        }
        return null;
    }

    public void sendReport(String userId, int postId, int reportTypeId, String reportDetail) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(CREATE);
            ptm.setString(1, userId);
            ptm.setInt(2, postId);
            ptm.setInt(3, reportTypeId);
            ptm.setString(4, reportDetail);
//            ptm.setString(4, reportDetail);
            ptm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public List<ReportDTO> getAll() throws SQLException {
        List<ReportDTO> list = new ArrayList<>();
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        try {
            //Creating and executing JDBC statements

            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(LIST_ALL);
            //Loading data into the list
            while (rs.next()) {
                ReportDTO report = new ReportDTO();
                report.setReportId(rs.getInt("reportId"));
                report.setPostId(rs.getInt("postId"));
                report.setTitle(rs.getString("title"));
                report.setCategoryName(rs.getString("categoryName"));
                report.setPostUser(rs.getString("postUser"));
                report.setReportDetail(rs.getString("reportDetail"));
                report.setReportUser(rs.getString("reportUser"));
                report.setReportType(rs.getString("reportType"));
                report.setType(rs.getInt("type"));
                int datePost = rs.getInt("datePost");
                String newDate = checkTime(datePost);
                report.setDatePost(newDate);
                report.setPostDescription(rs.getString("postDescription"));
                list.add(report);
            }
        } catch (Exception ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public boolean deletePost(int reportId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REMOVE_REPORTED_POST);
                ptm.setInt(1, reportId);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public int getTotalReport() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_REPORT);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("count");
                }
            }
        } catch (Exception ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }

        }

        return 0;
    }
}
