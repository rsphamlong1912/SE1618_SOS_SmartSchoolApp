/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jobPostAnswer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utills.DBUtils;

/**
 *
 * @author TrinhNgocBao
 */
public class JobPostAnswerDAO {

    private static final String SUBMIT_ANSWER = "INSERT INTO tblAnswer(questionId, userId, jobId, answer, status) VALUES (?, ?, ?, ?, 'true')";
    private static final String GETLIST_ANSWER_AND_QUESTION = "  SELECT a.aswerId, a.questionId, q.question, a.userId, a.jobId, a.answer \n"
            + "  FROM tblAnswer as a, tblQuestion as q \n"
            + "  WHERE a.questionId = q.questionId AND a.jobId = ? AND a.userId = ? AND a.status = 'true'";
    private static final String DELETE_ANSWER = "UPDATE tblAnswer SET status = 'false' WHERE userId = ? AND jobId = ? ";
    public boolean submitAnswer(int questionId, String userId, int jobId, String answer)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SUBMIT_ANSWER);
                ptm.setInt(1, questionId);
                ptm.setString(2, userId);
                ptm.setInt(3, jobId);
                ptm.setString(4, answer);
                ptm.executeUpdate();
                return true;
            }
        } catch (Exception e) {

        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    public void deleteAnswer(String userId, String jobId)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_ANSWER);
                ptm.setString(1, userId);
                ptm.setString(2, jobId);
                ptm.executeUpdate();   
            }
        } catch (Exception e) {

        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    
    }

    public ArrayList<JobPostAnswerDTO> getAnswerJobWaiting(int jobId, String userId) throws SQLException {;
        ArrayList<JobPostAnswerDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETLIST_ANSWER_AND_QUESTION);
                ptm.setInt(1, jobId);
                ptm.setString(2, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    JobPostAnswerDTO a = new JobPostAnswerDTO();
                    a.setAnswerId(rs.getInt("aswerId"));
                    a.setQuestionId(rs.getInt("questionId"));
                    a.setQuestion(rs.getString("question"));
                    a.setUserId(rs.getString("userId"));
                    a.setJobId(rs.getInt("jobId"));
                    a.setAnswer(rs.getString("answer"));
                    list.add(a);
                }
            }
        } catch (Exception ex) {

        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}
