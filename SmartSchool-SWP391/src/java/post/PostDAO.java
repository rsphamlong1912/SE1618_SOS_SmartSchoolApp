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

    private static final String SEARCH = "SELECT * FROM tblPost WHERE type like ? AND postStatus = 'true'";
    private static final String LISTALL = "select * from tblPost";
    private static final String CREATE = "INSERT INTO tblPost(userId, categoryId, postImg, description, date, type, title, postStatus) VALUES(?,?,?,?,?,?,?,?)";
    private static final String UPDATE = "update tblPost set postImg=?, description=?, type=?, title=?, postStatus=? where postId=?";

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
            ptm.setString(6, post.getType());
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

    public List<PostDTO> getAll() throws SQLException {
        List<PostDTO> list = new ArrayList<>();
        Connection con = null;
        Statement stm = null;
        ResultSet rs = null;
        try {
            //Creating and executing JDBC statements

            con = DBUtils.getConnection();
            stm = con.createStatement();
            rs = stm.executeQuery(LISTALL);
            //Loading data into the list
            while (rs.next()) {
                PostDTO post = new PostDTO();
                post.setPostId(rs.getInt("postId"));
                post.setUserId(rs.getString("userId"));
                post.setCategoryId(rs.getInt("categoryId"));
                post.setPostImg(rs.getBytes("postImg"));
                post.setDescription(rs.getString("description"));
                post.setDate(rs.getDate("date"));
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

    //Search Post
    public List<PostDTO> getListPost(String search) throws SQLException {
        List<PostDTO> listP = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int postId = rs.getInt("postId");
                    String userId = rs.getString("userId");
                    int categoryId = rs.getInt("categoryId");
                    byte[] postImg = rs.getBytes("postImg");
                    String description = rs.getString("description");
                    Date date = rs.getDate("date");
                    String type = rs.getString("type");
                    String title = rs.getString("title");
                    String statusPost = rs.getString("postStatus");
                    listP.add(new PostDTO(postId, userId, categoryId, postImg, description, (java.sql.Date) date, type, title, statusPost));
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
        return listP;
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
}
