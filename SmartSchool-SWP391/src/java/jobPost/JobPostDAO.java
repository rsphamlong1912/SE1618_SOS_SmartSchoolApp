package jobPost;

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
 * @author TrinhNgocBao
 */
public class JobPostDAO {

    private static final String UPLOAD_JOB_POST = "INSERT INTO tblJobPost(userId, jobCategoryId, title, description, salary, amount, timeJob, process, date, status) VALUES (?, ?, ?, ?, ?, ?, ?, 'approving', ?, 1)";
    private static final String UPLOAD_QUESTION = "INSERT INTO tblQuestion(jobId, question) VALUES (?, ?)";
    private static final String GET_MYJOBPOST_PROCESS = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName\n"
            + "            FROM tblJobPost as j, tblCategoryJob as c\n"
            + "            WHERE j.jobCategoryId=c.jobCategoryId AND status=1 AND (process='new' OR process='process') AND  userId=? ";
    private static final String GET_MYJOBPOST_DONE = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName\n"
            + "            FROM tblJobPost as j, tblCategoryJob as c\n"
            + "            WHERE j.jobCategoryId=c.jobCategoryId AND status=1 AND process='done' AND  userId=? ";
    private static final String GET_MYJOBPOST_APPROVE = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName\n"
            + "            FROM tblJobPost as j, tblCategoryJob as c\n"
            + "            WHERE j.jobCategoryId=c.jobCategoryId AND status=1 AND process='approving' AND  userId=? ";
    private static final String GET_MYJOB_WAITING = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName\n"
            + "            FROM tblJobPost as j, tblCategoryJob as c\n"
            + "            WHERE j.jobCategoryId=c.jobCategoryId AND status=1 AND  jobId=? ";
    private static final String LIST_ALL = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName, u.fullname,u.compName\n"
            + "FROM tblJobPost as j, tblCategoryJob as c, tblUser as u\n"
            + "WHERE j.jobCategoryId=c.jobCategoryId AND j.userId=u.userId AND status=1 AND (process='new' OR process='process') \n"
            + "ORDER BY jobId DESC";
    private static final String SEARCH_BY_TITLE = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName, u.fullname,u.compName \n"
            + "FROM  tblJobPost as j, tblCategoryJob as c, tblUser as u \n"
            + "WHERE j.jobCategoryId=c.jobCategoryId AND j.userId=u.userId AND status=1 AND  (dbo.removeMark(title) LIKE ? OR title LIKE ?) AND (process = 'new' OR process='process')\n"
            + "ORDER BY jobId DESC";
    private static final String SEARCH_BY_JOBCATEGORYID = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName, u.fullname,u.compName\n"
            + "FROM  tblJobPost as j, tblCategoryJob as c, tblUser as u\n"
            + "WHERE j.jobCategoryId=c.jobCategoryId AND j.userId=u.userId AND status=1 AND (process = 'new' OR process='process') AND j.jobCategoryId=?\n"
            + "ORDER BY jobId DESC";
    private static final String JOB_DETAIL = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName, u.fullname,u.compName\n"
            + "FROM  tblJobPost as j, tblCategoryJob as c, tblUser as u\n"
            + "WHERE j.jobCategoryId=c.jobCategoryId AND j.userId=u.userId AND status=1 AND (process = 'new' OR process='process') AND j.jobId=?\n";
        private static final String GET_TOTAL_APPROVE_POST = "SELECT COUNT(jobId) AS count FROM tblJobPost WHERE process='approving' AND status=1";

    private static final String GET_TOTAL_JOB_POST = "  SELECT COUNT(jobId) AS totalJobPost FROM tblJobPost WHERE status = 1";
    private static final String GET_TOP5_NEW_JOB_POST = "SELECT TOP(5) j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName, u.fullname,u.compName \n"
            + "FROM  tblJobPost as j, tblCategoryJob as c, tblUser as u\n"
            + "WHERE j.jobCategoryId=c.jobCategoryId AND j.userId=u.userId AND status=1 \n"
            + "ORDER BY jobId DESC";

    //FOR CHART
    private static final String GET_TOTAL_POST_LAST_WEEK = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_POST_1DAY_AGO = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_POST_2DAY_AGO = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440)";
    private static final String GET_TOTAL_POST_3DAY_AGO = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880)";
    private static final String GET_TOTAL_POST_4DAY_AGO = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320)";
    private static final String GET_TOTAL_POST_5DAY_AGO = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760)";
    private static final String GET_TOTAL_POST_6DAY_AGO = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200)";
    private static final String GET_TOTAL_POST_7DAY_AGO = "SELECT COUNT(jobId) as totalJob from tblJobPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640)";

//    Approve Post
    private static final String LIST_APPROVE_POST = "SELECT j.jobId,j.userId,j.jobCategoryId,j.title,j.description,j.salary,j.amount,j.timeJob,j.process,j.date,j.status,c.jobCategoryName, u.avatar, u.fullname,u.compName\n"
            + "FROM tblJobPost as j, tblCategoryJob as c, tblUser as u\n"
            + "WHERE j.jobCategoryId=c.jobCategoryId AND j.userId=u.userId AND status=1 AND process='approving' \n"
            + "ORDER BY jobId DESC";
    private static final String APPROVE_POST = "UPDATE tblJobPost SET process='new' WHERE jobId=?";
    private static final String DONT_APPROVE_POST = "UPDATE tblJobPost SET status=0 WHERE jobId=? AND process='approving'";

    private static final String SET_JOB_APPROVE_DONE = "UPDATE tblJobPost SET process = 'done' WHERE jobId = ?";

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

    public List<JobPostDTO> getAll() throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
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
                post.setFullname(rs.getString("fullname"));
                post.setCompName(rs.getString("compName"));
                list.add(post);
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
                PreparedStatement ptm2 = conn.prepareStatement(sql);
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

    public boolean uploadQuestion(int jobId, String q)
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

    public void SetJobApproveDone(String jobId)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_JOB_APPROVE_DONE);
                ptm.setString(1, jobId);
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

    public List<JobPostDTO> getMyJobPostApprove(String userId) throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MYJOBPOST_APPROVE);
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

    public JobPostDTO getMyJobWaiting(int jobId) throws SQLException {;
        JobPostDTO post = new JobPostDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MYJOB_WAITING);
                ptm.setInt(1, jobId);
                rs = ptm.executeQuery();
                while (rs.next()) {
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
                }
                return post;
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
        return null;
    }

    public List<JobPostDTO> searchPostByTitle(String search) throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_TITLE);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
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
                    post.setFullname(rs.getString("fullname"));
                    post.setCompName(rs.getString("compName"));
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

    public List<JobPostDTO> searchPostByJobCategoryId(String search) throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_JOBCATEGORYID);
                ptm.setString(1, search);
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
                    post.setFullname(rs.getString("fullname"));
                    post.setCompName(rs.getString("compName"));
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

    public JobPostDTO getJobInformation(String jobId) throws SQLException {

        JobPostDTO post = new JobPostDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(JOB_DETAIL);
                ptm.setString(1, jobId);
                rs = ptm.executeQuery();
                while (rs.next()) {
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
                    post.setFullname(rs.getString("fullname"));
                    post.setCompName(rs.getString("compName"));
                }
                return post;
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
        return null;
    }

    public int getTotalJobPost() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_JOB_POST);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJobPost");
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

    public List<JobPostDTO> getTop5NewJobPost() throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOP5_NEW_JOB_POST);
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
                    post.setFullname(rs.getString("fullname"));
                    post.setCompName(rs.getString("compName"));
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

    public int getTotalJobPostLastWeek() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_LAST_WEEK);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public int getTotalJobPost1DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_1DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public int getTotalJobPost2DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_2DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public int getTotalJobPost3DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_3DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public int getTotalJobPost4DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_4DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public int getTotalJobPost5DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_5DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public int getTotalJobPost6DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_6DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public int getTotalJobPost7DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_7DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalJob");
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

    public List<JobPostDTO> getApprovePost() throws SQLException {
        List<JobPostDTO> list = new ArrayList<>();
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        try {
            //Creating and executing JDBC statements
            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(LIST_APPROVE_POST);
            //Loading data into the list
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
                post.setFullname(rs.getString("fullname"));
                post.setCompName(rs.getString("compName"));
                post.setAvatar(rs.getString("avatar"));
                list.add(post);
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

    public void approvePost(int jobId) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(APPROVE_POST);
            stm.setInt(1, jobId);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public void dontApprovePost(int jobId) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DONT_APPROVE_POST);
            stm.setInt(1, jobId);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public int getTotalApprovePost() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            //Creating and executing JDBC statements
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_APPROVE_POST);
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
