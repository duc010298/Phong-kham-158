package com.phongkham.dao;

import com.phongkham.model.nav2ContentView;
import com.phongkham.util.DBConn;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class nav2Dao {

    Connection conn;

    public nav2Dao() {
        conn = DBConn.getConnection();
    }

    public Connection getConnection() {
        return conn;
    }

    public ArrayList<nav2ContentView> getNav2Content() {
        ArrayList<nav2ContentView> nav2List = new ArrayList<>();
        String qry = "SELECT ID, Name FROM KetQuaSieuAm ORDER BY OrderNumber";
        try {
            Statement sta = conn.createStatement();
            ResultSet rs = sta.executeQuery(qry);
            while (rs.next()) {
                nav2ContentView content = new nav2ContentView();
                content.setId(rs.getInt("ID"));
                content.setName(rs.getNString("Name"));
                nav2List.add(content);
            }
            return nav2List;
        } catch (SQLException ex) {
            Logger.getLogger(nav2Dao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    Logger.getLogger(nav2Dao.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        }
    }
}
