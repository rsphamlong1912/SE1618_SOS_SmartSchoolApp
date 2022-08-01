/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package reportType;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utills.DBUtils;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class ReportTypeDAO {

    private static final String LIST_ALL = "SELECT * FROM tblReportType";

    public List<ReportTypeDTO> getAll() throws SQLException {
        List<ReportTypeDTO> list = new ArrayList<>();
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
                ReportTypeDTO reportType = new ReportTypeDTO();
                reportType.setReportTypeId(rs.getInt("reportTypeId"));
                reportType.setReportType(rs.getString("reportType"));
                list.add(reportType);
            }

        } catch (Exception ex) {
            Logger.getLogger(ReportTypeDAO.class.getName()).log(Level.SEVERE, null, ex);
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
