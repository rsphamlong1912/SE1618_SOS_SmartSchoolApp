/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package post;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import utills.DBUtils;
import java.util.Date;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class PostDAO {

    private static final String SEARCH_BY_TYPE = "SELECT * FROM tblPost WHERE type like ? AND postStatus = 'true' ORDER BY postId DESC";
    private static final String SEARCH_BY_TITLE = "SELECT * FROM tblPost WHERE  (dbo.removeMark(title) LIKE ? OR title LIKE ?)  AND postStatus = 'true' ORDER BY postId DESC";
    private static final String SEARCH_3NEWLOST = "SELECT TOP(3) * FROM tblPost WHERE type=0 AND postStatus = 'true' ORDER BY postId DESC";
    private static final String SEARCH_3NEWFOUND = "SELECT TOP(3) * FROM tblPost WHERE type=1 AND postStatus = 'true' ORDER BY postId DESC";
    private static final String SEARCH_5NEWLOST = "  SELECT TOP(5) p.postId, p.userId,p.categoryId, p.postImg, p.description,p.date,p.type,p.title,p.postStatus,c.categoryName \n"
            + "  FROM tblPost as p, tblCategory as c \n"
            + "  WHERE p.categoryId=c.categoryId AND type=0 AND postStatus='true'\n"
            + "  ORDER BY postId DESC";
    private static final String SEARCH_5NEWFOUND = "  SELECT TOP(5) p.postId, p.userId,p.categoryId, p.postImg, p.description,p.date,p.type,p.title,p.postStatus,c.categoryName \n"
            + "  FROM tblPost as p, tblCategory as c \n"
            + "  WHERE p.categoryId=c.categoryId AND type=1 AND postStatus='true' \n"
            + "  ORDER BY postId DESC";
    private static final String LIST_ALL = "SELECT * FROM tblPost WHERE postStatus='true' ORDER BY postId DESC";
    private static final String CREATE = "INSERT INTO tblPost(userId, categoryId, postImg, description, date, type, title, postStatus) VALUES(?,?,?,?,?,?,?,'approving')";
    private static final String UPDATE = "UPDATE tblPost SET postImg=?, description=?, type=?, title=?, postStatus=? WHERE postId=?";
    private static final String DELETE = "UPDATE tblPost SET postStatus='false' WHERE postId=?";
    private static final String LIST_MYPOST = "SELECT p.postId, p.userId,p.categoryId, p.postImg, p.description,p.date,p.type,p.title,p.postStatus,c.categoryName\n"
            + "FROM tblPost as p, tblCategory as c\n"
            + "WHERE p.categoryId=c.categoryId AND postStatus='true' AND userId=?";
    private static final String READ = "SELECT p.postId,p.userId,p.categoryId,p.postImg,p.description,p.date,p.type,p.title,p.postStatus, c.categoryName FROM tblPost as p inner join tblCategory as c \n"
            + "ON p.categoryId = c.categoryId WHERE p.postId  = ?";
    private static final String GET_TOTALPOST = "SELECT COUNT(postId) AS count FROM tblPost WHERE postStatus='true'";
    private static final String GET_TOTALLOSTPOST = "SELECT COUNT(postId) AS countLostPost FROM tblPost WHERE postStatus='true' AND type=0";
    private static final String GET_TOTALFOUNDPOST = "SELECT COUNT(postId) AS countFoundPost FROM tblPost WHERE postStatus='true' AND type=1";
    
    private static final String GET_TOTAL_POST_LAST_WEEK = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_POST_1DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_POST_2DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440)";
    private static final String GET_TOTAL_POST_3DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880)";
    private static final String GET_TOTAL_POST_4DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320)";
    private static final String GET_TOTAL_POST_5DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760)";
    private static final String GET_TOTAL_POST_6DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200)";
    private static final String GET_TOTAL_POST_7DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640)";
    
    private static final String GET_TOTAL_LOST_LAST_WEEK = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_LOST_1DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_LOST_2DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440)";
    private static final String GET_TOTAL_LOST_3DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880)";
    private static final String GET_TOTAL_LOST_4DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320)";
    private static final String GET_TOTAL_LOST_5DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760)";
    private static final String GET_TOTAL_LOST_6DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200)";
    private static final String GET_TOTAL_LOST_7DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 0 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640)";
    
    private static final String GET_TOTAL_FOUND_LAST_WEEK = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_FOUND_1DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440) AND DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())";
    private static final String GET_TOTAL_FOUND_2DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-1440)";
    private static final String GET_TOTAL_FOUND_3DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-2880)";
    private static final String GET_TOTAL_FOUND_4DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-4320)";
    private static final String GET_TOTAL_FOUND_5DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-5760)";
    private static final String GET_TOTAL_FOUND_6DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-7200)";
    private static final String GET_TOTAL_FOUND_7DAY_AGO = "SELECT COUNT(postId) as totalPost from tblPost WHERE type = 1 AND date BETWEEN (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-10080) AND (DATEDIFF(mi, '1970-01-01 00:00:00', GETUTCDATE())-8640)";
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

    //Upload new post
    public void uploadPost(String userId, int categoryId, InputStream inputStream, String description, String type, String title) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(CREATE);
            ptm.setString(1, userId);
            ptm.setInt(2, categoryId);
            ptm.setBlob(3, inputStream);
            ptm.setString(4, description);
            int date = takeMinutes();
            ptm.setInt(5, date);
            ptm.setString(6, type);
            ptm.setString(7, title);
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

    public PostDTO readPost(String userId) throws SQLException {
        PostDTO post = new PostDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(READ);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
                    post.setCategoryName(rs.getString("categoryName"));
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

    //List all post
    public List<PostDTO> getAll() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
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
                PostDTO post = new PostDTO();
                post.setPostId(rs.getInt("postId"));
                post.setUserId(rs.getString("userId"));
                post.setCategoryId(rs.getInt("categoryId"));
                post.setPostImg(rs.getBytes("postImg"));
                post.setDescription(rs.getString("description"));
                int date = rs.getInt("date");
                String newDate = checkTime(date);
                post.setDate(newDate);
                post.setType(rs.getString("type"));
                post.setTitle(rs.getString("title"));
                post.setPostStatus(rs.getString("postStatus"));
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

    //Search Post by type
    public List<PostDTO> searchPostByType(String search) throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_BY_TYPE);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
//                    int postId = rs.getInt("postId");
//                    String userId = rs.getString("userId");
//                    int categoryId = rs.getInt("categoryId");
//                    byte[] postImg = rs.getBytes("postImg");
//                    String description = rs.getString("description");
//                    Date date = rs.getDate("date");
//                    Boolean type = rs.getBoolean("type");
//                    String title = rs.getString("title");
//                    String statusPost = rs.getString("postStatus");
//                    listP.add(new PostDTO(postId, userId, categoryId, postImg, description, (java.sql.Date) date, type, title, statusPost));
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
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

    public List<PostDTO> searchPostByTitle(String search) throws SQLException {
        List<PostDTO> list = new ArrayList<>();
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
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
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

    public List<PostDTO> get3NewLost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_3NEWLOST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
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

    public List<PostDTO> get5NewLost() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_5NEWLOST);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
                    post.setCategoryName(rs.getString("categoryName"));
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

    public List<PostDTO> get5NewFound() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_5NEWFOUND);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
                    post.setCategoryName(rs.getString("categoryName"));
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

    public int getTotalPost() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            //Creating and executing JDBC statements
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTALPOST);
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

    public int getTotalLostPost() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            //Creating and executing JDBC statements
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTALLOSTPOST);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("countLostPost");
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

    public int getTotalFoundPost() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            //Creating and executing JDBC statements
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTALFOUNDPOST);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("countFoundPost");
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

    public byte[] getItemData(String postId) throws SQLException {
        String getAvatar = "SELECT postImg FROM tblPost WHERE postId = ? and postStatus = 'true'";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getAvatar);
                ptm.setString(1, postId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getBytes("postImg");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
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

    public List<PostDTO> get3NewFound() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_3NEWFOUND);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
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

    public void updatePost(PostDTO post) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(UPDATE);
            stm.setBytes(1, post.getPostImg());
            stm.setString(2, post.getDescription());
            stm.setString(3, post.getType());
            stm.setString(4, post.getTitle());
            stm.setString(5, post.getPostStatus());
            stm.setInt(6, post.getPostId());
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {

            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    //Delete Post
    public boolean deletePost(int postId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setInt(1, postId);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public List<PostDTO> getMyPost(String userId) throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LIST_MYPOST);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    int date = rs.getInt("date");
                    String newDate = checkTime(date);
                    post.setDate(newDate);
                    post.setType(rs.getString("type"));
                    post.setTitle(rs.getString("title"));
                    post.setPostStatus(rs.getString("postStatus"));
                    post.setCategoryName(rs.getString("categoryName"));
                    list.add(post);
//                    int postId = rs.getInt("postId");
//                    String newUserId=rs.getString("userId");
//                    int categoryId=rs.getInt("categoryId");
//                    byte[] postImg=rs.getBytes("postImg");
//                    String description=rs.getString("description");
//                    Date date=rs.getDate("date");
//                    boolean type=rs.getBoolean("type");
//                    String title=rs.getString("title");
//                    String postStatus=rs.getString("postStatus");
//                    String categoryName=rs.getString("categoryName");
//                    
//                    
//                    list.add(new PostDTO(postId, newUserId, categoryId, postImg, description, (java.sql.Date) date, type, title, postStatus, categoryName));
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
    
    public int getTotalPostLastWeek() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_LAST_WEEK);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalPost1DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_1DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalPost2DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_2DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalPost3DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_3DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalPost4DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_4DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalPost5DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_5DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalPost6DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_6DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalPost7DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_POST_7DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLostLastWeek() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_LAST_WEEK);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLost1DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_1DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLost2DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_2DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLost3DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_3DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLost4DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_4DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLost5DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_5DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLost6DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_6DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalLost7DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_LOST_7DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFoundLastWeek() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_LAST_WEEK);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFound1DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_1DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFound2DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_2DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFound3DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_3DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFound4DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_4DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFound5DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_5DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFound6DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_6DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
    
    public int getTotalFound7DayAgo() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_FOUND_7DAY_AGO);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalPost");
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
