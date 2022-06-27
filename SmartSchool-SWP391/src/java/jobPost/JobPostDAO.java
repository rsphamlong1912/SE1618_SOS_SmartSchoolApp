package jobPost;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
 * @author TrinhNgocBao
 */
public class JobPostDAO {

    private static final String UPLOAD_JOB_POST = "INSERT INTO tblJobPost(userId, jobCategoryId, title, description, salary, amount, timeJob, process, date, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'new', ?, 1)";
    private static final String UPLOAD_QUESTION = "INSERT INTO tblQuestion(jobId, question) VALUES (?, ?)";
    private static final String GET_MYJOBPOST_PROCESS = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName\n"
            + "            FROM tblJobPost as j, tblCategoryJob as c\n"
            + "            WHERE j.jobCategoryId=c.jobCategoryId AND status=1 AND (process='new' OR process='process') AND  userId=? ";
    private static final String GET_MYJOBPOST_DONE = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName\n"
            + "            FROM tblJobPost as j, tblCategoryJob as c\n"
            + "            WHERE j.jobCategoryId=c.jobCategoryId AND status=1 AND process='done' AND  userId=? ";

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
                int date = takeMinutes();
                ptm.setInt(8, date);
                ptm.executeUpdate();
                String sql = "SELECT TOP 1 jobId FROM tblJobPost order by jobId DESC";
                PreparedStatement ptm2 = conn.prepareStatement(sql);;
                rs = ptm2.executeQuery();
                if (rs.next()) {
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

    public List<JobPostDTO> getMyJobPostProcess(String userId) throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MYJOBPOST_PROCESS);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    JobPostDTO post = new JobPostDTO();
                    post.setJobId(rs.getInt("jobId"));
                    post.setUserId(rs.getString("userId"));
                    post.setJobCategoryId(rs.getInt("jobCategoryId"));
                    post.setTitle(rs.getString("title"));
                    post.setDescription(rs.getString("description"));
                    post.setSalary(rs.getFloat("salary"));
                    post.setAmount(rs.getInt("amount"));
                    post.setTimeJob(rs.getInt("timeJob"));
                    post.setProcess(rs.getString("process"));
//                    post.setDate(rs.getString("date"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setStatus(rs.getBoolean("status"));
                    post.setJobCategoryName(rs.getString("jobCategoryName"));
                    list.add(post);
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

    public List<JobPostDTO> getMyJobPostDone(String userId) throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MYJOBPOST_DONE);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    JobPostDTO post = new JobPostDTO();
                    post.setJobId(rs.getInt("jobId"));
                    post.setUserId(rs.getString("userId"));
                    post.setJobCategoryId(rs.getInt("jobCategoryId"));
                    post.setTitle(rs.getString("title"));
                    post.setDescription(rs.getString("description"));
                    post.setSalary(rs.getFloat("salary"));
                    post.setAmount(rs.getInt("amount"));
                    post.setTimeJob(rs.getInt("timeJob"));
                    post.setProcess(rs.getString("process"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setStatus(rs.getBoolean("status"));
                    post.setJobCategoryName(rs.getString("jobCategoryName"));
                    list.add(post);
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
