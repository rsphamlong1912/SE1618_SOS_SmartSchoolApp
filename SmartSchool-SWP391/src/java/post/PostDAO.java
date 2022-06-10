/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package post;

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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class PostDAO {

    private static final String SEARCH_BY_TYPE = "SELECT * FROM tblPost WHERE type like ? AND postStatus = 'true'";
    private static final String SEARCH_BY_TITLE = "SELECT * FROM tblPost WHERE title like ? AND postStatus = 'true'";
    private static final String SEARCH_3NEWLOST = "SELECT TOP(3) * FROM tblPost WHERE type=0 AND postStatus = 'true' ORDER BY postId DESC";
    private static final String SEARCH_3NEWFOUND = "SELECT TOP(3) * FROM tblPost WHERE type=1 AND postStatus = 'true' ORDER BY postId DESC";
    private static final String LIST_ALL = "SELECT * FROM tblPost WHERE postStatus='true'";
    private static final String CREATE = "INSERT INTO tblPost(userId, categoryId, postImg, description, date, type, title, postStatus) VALUES(?,?,?,?,?,?,?,?)";
    private static final String UPDATE = "UPDATE tblPost SET postImg=?, description=?, type=?, title=?, postStatus=? WHERE postId=?";
    private static final String DELETE = "UPDATE tblPost SET postStatus='false' WHERE postId=?";
    private static final String LIST_MYPOST = "SELECT p.postId, p.userId,p.categoryId, p.postImg, p.description,p.date,p.type,p.title,p.postStatus,c.categoryName\n"
            + "FROM tblPost as p, tblCategory as c\n"
            + "WHERE p.categoryId=c.categoryId AND postStatus='true' AND userId=?";

    //Upload new post
    public void uploadPost(PostDTO post) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(CREATE);
            ptm.setString(1, post.getUserId());
            ptm.setInt(2, post.getCategoryId());
            ptm.setBytes(3, post.getPostImg());
            ptm.setString(4, post.getDescription());
            Date date = new Date();
            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm");
            String newDate = df.format(date);
            ptm.setString(5, newDate);
            ptm.setBoolean(6, post.getType());
            ptm.setString(7, post.getTitle());
            ptm.setString(8, post.getPostStatus());
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
                post.setDate(rs.getDate("date"));
                post.setType(rs.getBoolean("type"));
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
                    post.setDate(rs.getDate("date"));
                    post.setType(rs.getBoolean("type"));
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
                rs = ptm.executeQuery();
                while (rs.next()) {
                    PostDTO post = new PostDTO();
                    post.setPostId(rs.getInt("postId"));
                    post.setUserId(rs.getString("userId"));
                    post.setCategoryId(rs.getInt("categoryId"));
                    post.setPostImg(rs.getBytes("postImg"));
                    post.setDescription(rs.getString("description"));
                    post.setDate(rs.getDate("date"));
                    post.setType(rs.getBoolean("type"));
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
                    post.setDate(rs.getDate("date"));
                    post.setType(rs.getBoolean("type"));
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
    
    public byte[] getItemData(String postId) throws SQLException{
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
                    post.setDate(rs.getDate("date"));
                    post.setType(rs.getBoolean("type"));
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
            stm.setBoolean(3, post.getType());
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
                    post.setDate(rs.getDate("date"));
                    post.setType(rs.getBoolean("type"));
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

}
