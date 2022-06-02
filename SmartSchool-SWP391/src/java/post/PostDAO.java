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
/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class PostDAO {
    private static final String SEARCH = "SELECT * FROM tblPost WHERE type like ? AND postStatus = 'true'";
    
    public void uploadPost(Connection con, PostDTO post) throws SQLException, Exception {
        String sql = "INSERT INTO tblPost(userId, categoryId, postImg, description, date, type, title, statusPost) VALUES(?,?,?,?,?,?,?,?)";
        PreparedStatement ptm = con.prepareStatement(sql);
        ptm.setString(1, post.getUserId());
        ptm.setInt(2, post.getCategoryId());
        ptm.setBytes(3, post.getPostImg());
        ptm.setString(4, post.getDescription());
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy hh:mm");
        String newDate=df.format(date);
        ptm.setString(5, newDate);
        ptm.setString(6, post.getType());
        ptm.setString(7, post.getTitle());
        ptm.setString(8, post.getStatusPost());
        ptm.executeUpdate();
    }
    
        protected List<PostDTO> getAll(Connection con) throws SQLException {
        List<PostDTO> list = new ArrayList<>();        
        //Creating and executing JDBC statements
        String sql = "select * from tblPost";
        Statement stm = con.createStatement();
        ResultSet rs = stm.executeQuery(sql);
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
            post.setStatusPost(rs.getString("statusPost"));
            list.add(post);
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
                    listP.add(new PostDTO(postId, userId, categoryId, postImg, description, (java.sql.Date)date, type, title, statusPost));
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
        return listP;
    }
    
    public static void main(String[] args) {
        
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("hh:mm dd/MM/yyyy");
        String strDate = df.format(date);
        System.out.println("Date Format with MM/dd/yyyy: " + strDate);
}
}
