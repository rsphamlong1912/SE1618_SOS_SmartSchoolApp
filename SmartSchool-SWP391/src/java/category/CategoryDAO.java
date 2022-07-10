/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import post.PostDAO;
import post.PostDTO;
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class CategoryDAO {
    
    private static final String LISTALL_CATEGORY = "select * from tblCategory where categoryId=? and categoryStatus=1";
    private static final String LISTALL_CATEGORY_BYID = "select * from tblCategory where categoryStatus=1";
    private static final String CREATE = "INSERT INTO tblCategory(categoryName, categoryStatus, categoryImg) VALUES(?,1,?)";
    private static final String DELETE = "UPDATE tblCategory SET categoryStatus=0 WHERE categoryId=?";
    private static final String UPDATE = "UPDATE tblCategory SET categoryName=?, categoryImg=? WHERE categoryId=?";
    
    public List<CategoryDTO> getAllCategory() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                stm = con.prepareStatement(LISTALL_CATEGORY_BYID);
                rs = stm.executeQuery();
                //Loading data into the list
                while (rs.next()) {
                    CategoryDTO category = new CategoryDTO();
                    category.setCategoryId(rs.getInt("categoryId"));
                    category.setCategoryName(rs.getString("categoryName"));
                    category.setCategoryStatus(rs.getBoolean("categoryStatus"));
                    category.setCategoryImg(rs.getString("categoryImg"));
                    list.add(category);
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
    
    public CategoryDTO getCategoryByCategoryId(int categoryId) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        CategoryDTO category = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LISTALL_CATEGORY_BYID);
                ptm.setInt(1, categoryId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    category = new CategoryDTO();
                    category.setCategoryId(rs.getInt("categoryId"));
                    category.setCategoryName(rs.getString("categoryName"));
                    category.setCategoryStatus(rs.getBoolean("categoryStatus"));
                    category.setCategoryImg(rs.getString("categoryImg"));
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
        return category;
    }
    
    public void updateCategory( int categoryId,String categoryName,String categoryImg) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(UPDATE);
            ptm.setString(1,categoryName);
            ptm.setString(2, categoryImg);
            ptm.setInt(3, categoryId);
            ptm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {

            if (ptm != null) {
                ptm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    public void deleteCategory(int categoryId) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DBUtils.getConnection();
            stm = con.prepareStatement(DELETE);
            stm.setInt(1, categoryId);
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
    
    //add Category
     public void uploadCategory(String categoryName, String categoryImg ) throws SQLException {
        Connection con = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(CREATE);
            ptm.setString(1, categoryName);
            ptm.setString(2, categoryImg);
            ptm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
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
