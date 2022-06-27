package jobCategory;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utills.DBUtils;

/**
 *
 * @author TrinhNgocBao
 */
public class JobCategoryDAO {

    private static final String LISTALL_CATEGORY = "select * from tblCategoryJob where statusCategory=1";

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
}
