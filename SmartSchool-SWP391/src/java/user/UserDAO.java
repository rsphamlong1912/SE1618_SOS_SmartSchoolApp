/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class UserDAO {
    private static final String REGISTER = "INSERT INTO tblUser(fullname, userId, password, email, phone) "
                                            + "Values(?, ?, ?, ?, ?)";

    public UserDTO login(String userId, String password) {
        UserDTO user = null;
        try {
            String sql = "select * from tblUser where userId = ? and password=?";
            Connection con = new DBUtils().getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, userId);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new UserDTO();
                user.setUserId(rs.getString("userId"));
                user.setRoleId(rs.getString("roleId"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setAvatar(rs.getBytes("avatar"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setCompAddress(rs.getString("compAddress"));
                user.setUserId(rs.getString("userId"));
                user.setUserStatus(rs.getBoolean("userStatus"));
                user.setHaveJob(rs.getBoolean("haveJob"));
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDTO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public boolean createNewAccount(UserDTO dto) throws SQLException {
        if (dto == null) {
            return false;
        }

        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REGISTER);
                ptm.setString(1, dto.getFullname());
                ptm.setString(2, dto.getUserId());
                ptm.setString(3, dto.getPassword());
                ptm.setString(4, dto.getEmail());
                ptm.setString(5, dto.getPhone());
                
                int row = ptm.executeUpdate();
                if (row > 0) {
                    return true;
                }
                
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
        return false;
    }
}
