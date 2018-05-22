package com.phongkham.util;

import com.phongkham.dao.customerDao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConn {

    public static Connection getConnection() {

        String IP = "localhost";
        String instanceName = "MSSQLSERVER";
        String port = "1433";
        String database = "phongkham";
        String userID = "sa";
        String password = "12345";

        String url = "jdbc:sqlserver://" + IP + "\\" + instanceName + ":" + port
                + ";databaseName=" + database + ";user=" + userID + ";password=" + password;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn = DriverManager.getConnection(url);
            return conn;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
