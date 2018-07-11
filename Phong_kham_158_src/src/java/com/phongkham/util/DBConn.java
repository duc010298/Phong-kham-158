package com.phongkham.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConn {

    public static Connection getConnection() {

        String IP = "localhost";
        String port = "3306";
        String database = "phongkham";
        String userID = "duc010298";
        String password = "12345";

        String url = "jdbc:mysql://" + IP + ":" + port + "/" + database + "?autoReconnect=true&useSSL=false";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, userID, password);
            return conn;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBConn.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
