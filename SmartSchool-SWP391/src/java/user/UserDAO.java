/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import post.PostDAO;
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class UserDAO {

    private static final String REGISTER = "INSERT INTO tblUser(fullname, userId, password, email, phone, roleId) VALUES (?, ?, ?, ?, ?, 'US')";
    private static final String EM_REGISTER = "INSERT INTO tblUser(fullname, userId, password, email, phone, roleId,compName,compAddress) VALUES (?, ?, ?, ?, ?, 'EM',?,?)";

    private static final String LOGIN = "SELECT u.userId, u.roleId, u.password, u.fullname, u.avatar, u.phone, u.email, u.facebook, u.userStatus, u.haveJob, r.roleName\n"
            + "FROM tblUser as u, tblRole as r\n"
            + "WHERE u.roleId = r.roleId AND userId = ? AND password = ?";
    private static final String CHECK_ACCOUNT = "SELECT u.userId, u.roleId, u.password, u.fullname, u.avatar, u.phone, u.email, u.facebook, u.userStatus, u.haveJob, r.roleName\n"
            + "FROM tblUser as u, tblRole as r\n"
            + "WHERE u.roleId = r.roleId AND userId = ?";
    private static final String CHANGE_PASSWORD = "UPDATE tblUser SET password = ? WHERE userId= ?";
    private static final String UPDATE_ACCOUNT = "UPDATE tblUser SET fullname = ?, email = ?, facebook = ?, phone = ? WHERE userId= ?";
    private static final String EMPLOYER_INFOR = "SELECT u.userId, u.roleId, u.password, u.fullname, u.avatar, u.phone, u.email, u.facebook,u.compName,u.compDesc,u.compPhone,u.compEmail,u.compAddress, u.userStatus, u.haveJob, r.roleName\n"
            + "            FROM tblUser as u, tblRole as r\n"
            + "            WHERE u.roleId = r.roleId AND userId = ?";
    private static final String GET_TOTAL_USER = "    SELECT COUNT(userId) AS totalUser FROM tblUser WHERE roleId='US'";
    private static final String SEARCH_5NEWUSER = "SELECT TOP(5) * FROM tblUser WHERE roleId='US' ORDER BY serial DESC";
    private static final String GET_USER_WAIT = "SELECT * FROM tblUser WHERE userId=?";
//    private static final String SEARCH_5NEWUSER = "SELECT TOP(5) * FROM tblUser  ORDER BY serial DESC";
    private static final String GET_TOP5_NEW_EMPLOYER = "SELECT TOP(5) * FROM tblUser WHERE roleId = 'EM'  ORDER BY serial DESC";
    private static final String GET_TOTAL_EMPLOYER = "SELECT COUNT(userId) as totalEmployer FROM tblUser WHERE roleId = 'EM'";
    private static final String SET_HAVE_JOB_PLUS_ONE = "UPDATE tblUser SET haveJob = haveJob + 1 where userId = ?";
    private static final String SET_HAVE_JOB_MINUS_ONE = "UPDATE tblUser SET haveJob = haveJob - 1 where userId = ?";

    private static final String GET_HAVE_JOB = "SELECT haveJob FROM tblUser WHERE userId = ?";

    public List<UserDTO> get5NewUser() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_5NEWUSER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    UserDTO user = new UserDTO();
                    user.setUserId(rs.getString("userId"));
                    user.setRoleId(rs.getString("roleId"));
                    user.setPassword(rs.getString("password"));
                    user.setFullname(rs.getString("fullname"));
                    user.setAvatar(rs.getBytes("avatar"));
                    user.setPhone(rs.getString("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setFacebook(rs.getString("facebook"));
//                user.setCompAddress(rs.getString("compAddress"));
//                user.setUserId(rs.getString("userId"));
                    user.setUserStatus(rs.getBoolean("userStatus"));
                    user.setHaveJob(rs.getBoolean("haveJob"));
//                    user.setRoleName(rs.getString("roleName"));
                    list.add(user);
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

    public int getHaveJob(String userId)
            throws SQLException {

        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_HAVE_JOB);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int haveJob = rs.getInt("haveJob");
                    return haveJob;
                }
            }
        } catch (Exception ex) {

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

    public UserDTO getUserWaitingForJob(String userId) throws SQLException {
        UserDTO user = new UserDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_USER_WAIT);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    user.setUserId(rs.getString("userId"));
                    user.setRoleId(rs.getString("roleId"));
                    user.setPassword(rs.getString("password"));
                    user.setFullname(rs.getString("fullname"));
                    user.setAvatar(rs.getBytes("avatar"));
                    user.setPhone(rs.getString("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setFacebook(rs.getString("facebook"));
                    user.setUserStatus(rs.getBoolean("userStatus"));
                    user.setHaveJob(rs.getBoolean("haveJob"));
                }
                return user;
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

    public void setHaveJobPlusOne(String userId)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_HAVE_JOB_PLUS_ONE);
                ptm.setString(1, userId);
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

    public void setHaveJobMinusOne(String userId)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SET_HAVE_JOB_MINUS_ONE);
                ptm.setString(1, userId);
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

    public UserDTO login(String userId, String password) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            ptm = con.prepareStatement(LOGIN);
            ptm.setString(1, userId);
            ptm.setString(2, password);
            rs = ptm.executeQuery();
            while (rs.next()) {
                user = new UserDTO();
                user.setUserId(rs.getString("userId"));
                user.setRoleId(rs.getString("roleId"));
                user.setPassword(rs.getString("password"));
                user.setFullname(rs.getString("fullname"));
                user.setAvatar(rs.getBytes("avatar"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setFacebook(rs.getString("facebook"));
//                user.setCompAddress(rs.getString("compAddress"));
//                user.setUserId(rs.getString("userId"));
                user.setUserStatus(rs.getBoolean("userStatus"));
                user.setHaveJob(rs.getBoolean("haveJob"));
                user.setRoleName(rs.getString("roleName"));
            }
        } catch (Exception ex) {
            Logger.getLogger(UserDTO.class.getName()).log(Level.SEVERE, null, ex);
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
        return user;
    }

    public UserDTO checkAccountExist(String userId) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_ACCOUNT);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    user = new UserDTO();
                    user.setUserId(rs.getString("userId"));
                    user.setRoleId(rs.getString("roleId"));
                    user.setPassword(rs.getString("password"));
                    user.setFullname(rs.getString("fullname"));
                    user.setAvatar(rs.getBytes("avatar"));
                    user.setPhone(rs.getString("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setFacebook(rs.getString("facebook"));
//                    user.setCompAddress(rs.getString("compAddress"));
//                    user.setUserId(rs.getString("userId"));
                    user.setUserStatus(rs.getBoolean("userStatus"));
                    user.setHaveJob(rs.getBoolean("haveJob"));
                    user.setRoleName(rs.getString("roleName"));
                }
                return user;
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

    public UserDTO GetEmployerInfor(String userId) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        UserDTO user = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EMPLOYER_INFOR);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    user = new UserDTO();
                    user.setUserId(rs.getString("userId"));
                    user.setRoleId(rs.getString("roleId"));
                    user.setPassword(rs.getString("password"));
                    user.setFullname(rs.getString("fullname"));
                    user.setAvatar(rs.getBytes("avatar"));
                    user.setPhone(rs.getString("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setFacebook(rs.getString("facebook"));
                    user.setCompName(rs.getString("compName"));
                    user.setCompDesc(rs.getString("compDesc"));
                    user.setCompPhone(rs.getString("compPhone"));
                    user.setCompEmail(rs.getString("compEmail"));
                    user.setCompAddress(rs.getString("compAddress"));
                    user.setUserStatus(rs.getBoolean("userStatus"));
                    user.setHaveJob(rs.getBoolean("haveJob"));
                    user.setRoleName(rs.getString("roleName"));
                }
                return user;
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

    public void signup(String fullname, String userId, String password, String email, String phone)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(REGISTER);
                ptm.setString(1, fullname);
                ptm.setString(2, userId);
                ptm.setString(3, password);
                ptm.setString(4, email);
                ptm.setString(5, phone);
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

    public void employerSignup(String fullname, String userId, String password, String email, String phone,String compName,String compAddress)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(EM_REGISTER);
                ptm.setString(1, fullname);
                ptm.setString(2, userId);
                ptm.setString(3, password);
                ptm.setString(4, email);
                ptm.setString(5, phone);
                ptm.setString(6, compName);
                ptm.setString(7, compAddress);
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

//    public boolean createNewAccount(UserDTO dto) throws SQLException {
//        if (dto == null) {
//            return false;
//        }
//        Connection conn = null;
//        PreparedStatement ptm = null;
//
//        try {
//            conn = DBUtils.getConnection();
//            if (conn != null) {
//                ptm = conn.prepareStatement(REGISTER);
//                ptm.setString(1, dto.getFullname());
//                ptm.setString(2, dto.getUserId());
//                ptm.setString(3, dto.getPassword());
//                ptm.setString(4, dto.getEmail());
//                ptm.setString(5, dto.getPhone());
//                
//                int row = ptm.executeUpdate();
//                if (row > 0) {
//                    return true;
//                }
//                
//            }
//        } catch (Exception e) {
//        } finally {
//            if (ptm != null) {
//                ptm.close();
//            }
//            if (conn != null) {
//                conn.close();
//            }
//        }
//        return false;
//    }
    //Change Password
    public void changePassword(String userId, String newPassword)
            throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_PASSWORD);
                ptm.setString(1, newPassword);
                ptm.setString(2, userId);
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

    //Edit Profile
    public void updateAccount(String userId, String fullname, String email, String facebook, String phone) throws Exception {
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            //1. connect DB
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_ACCOUNT);
                ptm.setString(1, fullname);
                ptm.setString(2, email);
                ptm.setString(3, facebook);
                ptm.setString(4, phone);
                ptm.setString(5, userId);
                ptm.executeUpdate();
            } //process when connection is existed

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

    public boolean updateUserAvatar(InputStream inputStream, String userId) throws SQLException {
        String update = "UPDATE tblUser SET avatar = ? WHERE userId = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            //1. connect DB
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(update);
                ptm.setBlob(1, inputStream);
                ptm.setString(2, userId);
                ptm.executeUpdate();
                return true;
            } //process when connection is existed
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

    public byte[] getAvatarData(String userId) throws SQLException {
        String getAvatar = "SELECT avatar FROM tblUser WHERE userId = ?";
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(getAvatar);
                ptm.setString(1, userId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getBytes("avatar");
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

    public int getTotalUser() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            //Creating and executing JDBC statements
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_USER);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalUser");
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

    public int getTotalEmployer() throws SQLException {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement ptm = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ptm = con.prepareStatement(GET_TOTAL_EMPLOYER);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    return rs.getInt("totalEmployer");
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

    public List<UserDTO> get5NewEmployer() throws SQLException {
        List<UserDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOP5_NEW_EMPLOYER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    UserDTO user = new UserDTO();
                    user.setUserId(rs.getString("userId"));
                    user.setRoleId(rs.getString("roleId"));
                    user.setPassword(rs.getString("password"));
                    user.setFullname(rs.getString("fullname"));
                    user.setAvatar(rs.getBytes("avatar"));
                    user.setPhone(rs.getString("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setFacebook(rs.getString("facebook"));
//                user.setCompAddress(rs.getString("compAddress"));
//                user.setUserId(rs.getString("userId"));
                    user.setUserStatus(rs.getBoolean("userStatus"));
                    user.setHaveJob(rs.getBoolean("haveJob"));
//                    user.setRoleName(rs.getString("roleName"));
                    list.add(user);
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
