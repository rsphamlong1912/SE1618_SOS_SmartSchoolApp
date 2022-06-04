/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package category;

import java.sql.Connection;
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
    private static final String LIST_ALL = "select * from tblCategory";
    public List<CategoryDTO> getAll() throws SQLException {
        List<CategoryDTO> list = new ArrayList<>();
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
                CategoryDTO category = new CategoryDTO();
                category.setCategoryId(rs.getInt("categoryId"));
                category.setCategoryName(rs.getString("categoryName"));
                category.setCategoryStatus(rs.getBoolean("categoryStatus"));
                category.setCategoryImg(rs.getBytes("categoryImg"));
                list.add(category);
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
}