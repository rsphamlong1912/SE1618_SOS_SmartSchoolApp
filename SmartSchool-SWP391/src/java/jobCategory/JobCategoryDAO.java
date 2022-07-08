package jobCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utills.DBUtils;

/**
 *
 * @author TrinhNgocBao
 */
public class JobCategoryDAO {

    private static final String LISTALL_CATEGORY = "select * from tblCategoryJob where statusCategory=1";
    private static final String CREATE = "INSERT INTO tblCategoryJob(statusCategory, jobCategoryName, jobImage, jobDescription) VALUES(1,?,?,?)";
    private static final String DELETE = "UPDATE tblCategoryJob SET statusCategory=0 WHERE jobCategoryId=?";
    private static final String UPDATE = "UPDATE tblCategoryJob SET jobCategoryName=?, jobImage=?, jobDescription=? WHERE jobCategoryId=?";
    public List<JobCategoryDTO> getAllCategory() throws SQLException {
        List<JobCategoryDTO> list = new ArrayList<>();
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(LISTALL_CATEGORY);
            //Loading data into the list
            while (rs.next()) {
                JobCategoryDTO category = new JobCategoryDTO();
                category.setJobCategoryId(rs.getInt("jobCategoryId"));
                category.setJobCategoryName(rs.getString("jobCategoryName"));
                category.setStatusCategory(rs.getBoolean("statusCategory"));
                category.setJobImage(rs.getString("jobImage"));
                category.setJobDescription(rs.getString("jobDescription"));
                list.add(category);
            }

        } catch (Exception ex) {

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
    
    public void updateJobCategory( int jobCategoryId,String jobCategoryName,String jobImage,String jobDescription ) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(UPDATE);
            ptm.setString(1,jobCategoryName);
            ptm.setString(2, jobImage);
            ptm.setString(3, jobDescription);
            ptm.setInt(4, jobCategoryId);
            ptm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(JobCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public void deleteJobCategory(int jobCategoryId) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE);
            stm.setInt(1, jobCategoryId);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(JobCategoryDTO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
     public void uploadJobCategory(String jobCategoryName, String jobImage, String jobDescription ) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(CREATE);
            ptm.setString(1, jobCategoryName);
            ptm.setString(2, jobImage);
            ptm.setString(3, jobDescription);
            ptm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(JobCategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
