
package jobPost;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import utills.DBUtils;

/**
 *
 * @author TrinhNgocBao
 */
public class JobPostDAO {
    private static final String UPLOAD_JOB_POST = "INSERT INTO tblJobPost(userId, jobCategoryId, title, description, salary, amount, timeJob, process, date, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'new', ?, 1)";
    private static final String UPLOAD_QUESTION = "INSERT INTO tblQuestion(jobId, question) VALUES (?, ?)";
    
    public int uploadJobPost(String userId, int jobCategoryId, String title, String description, float salary, int amount, int timeJob)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;       
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPLOAD_JOB_POST);
                ptm.setString(1, userId);
                ptm.setInt(2, jobCategoryId);
                ptm.setString(3, title);
                ptm.setString(4, description);
                ptm.setFloat(5, salary);
                ptm.setInt(6, amount);
                ptm.setInt(7, timeJob);
                Date date = new Date();
                SimpleDateFormat df = new SimpleDateFormat("hh:mm dd/MM/yyyy");
                String newDate = df.format(date);
                ptm.setString(8, newDate);
                ptm.executeUpdate();
                String sql = "SELECT TOP 1 jobId FROM tblJobPost order by jobId DESC";
                PreparedStatement ptm2 = conn.prepareStatement(sql);;                
                rs = ptm2.executeQuery();
                if(rs.next()){
                   int jobId = rs.getInt("jobId");
                   return jobId;
                }          
            }
        } catch (Exception e) {

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
        return 0;      
    }
    
    public void uploadQuestion(int jobId, String q)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPLOAD_QUESTION);
                ptm.setInt(1, jobId);
                ptm.setString(2, q);
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
    public static void main(String[] args) {
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("hh:mm dd/MM/yyyy");
        String newDate = df.format(date);
        System.out.println(newDate);
                
    }
}
