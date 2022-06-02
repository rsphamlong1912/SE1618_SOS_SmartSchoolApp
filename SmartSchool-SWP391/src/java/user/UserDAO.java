/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class UserDAO {

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
}
