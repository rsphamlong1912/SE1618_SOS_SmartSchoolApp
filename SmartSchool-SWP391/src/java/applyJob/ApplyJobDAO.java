/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package applyJob;

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
public class ApplyJobDAO {

    private static final String INSERT_APPLYJOB = "INSERT INTO tblApplyJob(jobId, userId, status) VALUES (?, ?, 'waiting')";
    private static final String LIST_JOB_WAITING = "SELECT * FROM tblApplyJob WHERE userId = ? AND status = 'waiting'";
    private static final String LIST_JOB_DOING = "SELECT * FROM tblApplyJob WHERE userId = ? AND status = 'doing' OR status = 'done' ";
    private static final String LIST_USER_WAITING = "SELECT a.applyJobId, a.jobId, a.userId, a.status, u.fullname, u.phone, u.email, u.facebook FROM tblApplyJob as a, tblUser as u WHERE a.userId = u.userId AND a.jobId = ? AND status = 'waiting'";
    private static final String CHECK_APPLYJOB = " SELECT TOP(1) status from tblApplyJob where userId = ? AND jobId = ? ORDER BY applyJobId DESC";
    private static final String SET_APPLYJOB_DOING = " UPDATE tblApplyJob SET status ='doing' WHERE  applyJobId = ? ";
    private static final String SET_APPLYJOB_DENIED = " UPDATE tblApplyJob SET status ='denied' WHERE  applyJobId = ? ";

    public void setApplyJobDoing(String applyJobId)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_APPLYJOB_DOING);
                ptm.setString(1, applyJobId);
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

    public void setApplyJobDenied(String applyJobId)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_APPLYJOB_DENIED);
                ptm.setString(1, applyJobId);
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

    public void insertApplyJob(String userId, int jobId)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_APPLYJOB);
                ptm.setInt(1, jobId);
                ptm.setString(2, userId);
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

    public List<ApplyJobDTO> getListApplyJobWaiting(String userId)
            throws SQLException {
        List<ApplyJobDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_JOB_WAITING);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ApplyJobDTO post = new ApplyJobDTO();
                    post.setApplyJobId(rs.getInt("applyJobId"));
                    post.setJobId(rs.getInt("jobId"));
                    post.setUserId(rs.getString("userId"));               
                    list.add(post);
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

    public List<ApplyJobDTO> getListApplyJobDoing(String userId)
            throws SQLException {
        List<ApplyJobDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_JOB_DOING);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ApplyJobDTO post = new ApplyJobDTO();
                    post.setApplyJobId(rs.getInt("applyJobId"));
                    post.setJobId(rs.getInt("jobId"));
                    post.setUserId(rs.getString("userId"));
                    list.add(post);
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

    public List<ApplyJobDTO> getListUserWaiting(String jobId)
            throws SQLException {
        List<ApplyJobDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_USER_WAITING);
                ptm.setString(1, jobId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    ApplyJobDTO post = new ApplyJobDTO();
                    post.setApplyJobId(rs.getInt("applyJobId"));
                    post.setJobId(rs.getInt("jobId"));
                    post.setUserId(rs.getString("userId"));
                    post.setFullname(rs.getString("fullname"));
                    post.setPhone(rs.getString("phone"));
                    post.setEmail(rs.getString("email"));
                    post.setFacebook(rs.getString("facebook")); 
                    list.add(post);
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

    public String getStatusCheckApplyJob(String jobId, String userId)
            throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_APPLYJOB);
                ptm.setString(1, userId);
                ptm.setString(2, jobId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String status = rs.getString("status");
                    return status;
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
        return null;
    }
}
