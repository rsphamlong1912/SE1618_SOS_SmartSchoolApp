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
import java.util.logging.Level;
import java.util.logging.Logger;
import post.PostDAO;
import post.PostDTO;
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class ReportDAO {

    private static final String CREATE = "INSERT INTO tblReport(userId,postId,reportTypeId,reportDetail) VALUES(?,?,?,?)";
    private static final String LIST_ALL = "SELECT * FROM tblReport";

    public void sendReport(ReportDTO report) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(CREATE);
            ptm.setString(1, report.getUserId());
            ptm.setInt(2, report.getPostId());
            ptm.setInt(3, report.getReportTypeId());
            ptm.setString(4, report.getReportDetail());
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
                report.setUserId(rs.getString("userId"));
                report.setPostId(rs.getInt("postId"));
                report.setReportId(rs.getInt("reportId"));
                report.setReportDetail(rs.getString("reportDetail"));
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
}
