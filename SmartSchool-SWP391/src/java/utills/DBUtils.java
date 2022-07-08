/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utills;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author SE150925 Nguyen Van Hai Nam
 */
public class DBUtils {
    public static Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://localhost:1433;databaseName=SmartSchool";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, "sa", "12345");
    }
    
        public static void main(String[] args) {
        try {
            
            if(DBUtils.getConnection() != null) {
                System.out.println("thanh cong");
            }else{
                System.out.println("that bai");
            }
        } catch (Exception ex) {
            Logger.getLogger(DBUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

