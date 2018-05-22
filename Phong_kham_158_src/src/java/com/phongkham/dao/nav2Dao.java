package com.phongkham.dao;

import com.phongkham.model.nav2Content;
import com.phongkham.util.DBConn;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class nav2Dao {

    Connection conn;

    public nav2Dao() throws SQLException, ClassNotFoundException {
        conn = DBConn.getConnection();
    }

    public List<nav2Content> getNav2Content() {
        List<nav2Content> nav2List = new ArrayList<>();
        String qry = "SELECT ID, Name FROM KetQuaSieuAm ORDER BY OrderNumber";
        try {
            Statement sta = conn.createStatement();
            ResultSet rs = sta.executeQuery(qry);
            while (rs.next()) {
                nav2Content content = new nav2Content();
                content.setId(rs.getInt("ID"));
                content.setName(rs.getNString("Name"));
                nav2List.add(content);
            }
            return nav2List;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
