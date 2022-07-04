
package jobPostQuestion;

import category.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jobPost.JobPostDTO;
import post.PostDAO;
import utills.DBUtils;

/**
 *
 * @author TrinhNgocBao
 */
public class JobPostQuestionDAO {
    private static final String LIST_QUESTION = "select * from tblQuestion where jobId = ? ";
    
   public List<JobPostQuestionDTO> getQuestionJobPost(String jobId) throws SQLException {
        List<JobPostQuestionDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_QUESTION);
                ptm.setString(1, jobId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    JobPostQuestionDTO question = new JobPostQuestionDTO();
                    question.setQuestionId(rs.getInt("questionId"));
                    question.setJobId(rs.getInt("jobId"));
                    question.setQuestion(rs.getString("question"));
                    list.add(question);
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
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }
}
