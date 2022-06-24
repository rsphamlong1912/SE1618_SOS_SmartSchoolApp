/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package feedbackSystem;

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
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class FeedbackSystemDAO {

    private static final String SEND_FEEDBACK = "INSERT INTO tblFeedbackSystem(userId,feedbackDesc,dateFeedback) VALUES(?,?,?)";
    private static final String LIST_ALL = "SELECT * FROM tblFeedbackSystem";

    public void sendFeedbackSystem(FeedbackSystemDTO feedback) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(SEND_FEEDBACK);
            ptm.setString(1, feedback.getUserId());
            ptm.setString(2, feedback.getFeedbackDesc());
            Date date = new Date();
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm");
            String newDate = df.format(date);
            ptm.setString(3, newDate);
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

    public List<FeedbackSystemDTO> getAll() throws SQLException {
        List<FeedbackSystemDTO> list = new ArrayList<>();
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
                FeedbackSystemDTO feedbackSystem = new FeedbackSystemDTO();
                feedbackSystem.setFeedbackId(rs.getInt("feedbackId"));
                feedbackSystem.setUserId(rs.getString("userId"));
                feedbackSystem.setFeedbackDesc(rs.getString("feedbackDesc"));
                feedbackSystem.setFeedbackImg(rs.getBytes("feedbackImg"));
                feedbackSystem.setDateFeedback(rs.getDate("dateFeedback"));
                list.add(feedbackSystem);
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
