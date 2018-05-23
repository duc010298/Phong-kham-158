package com.phongkham.dao;

import com.phongkham.model.Customer;
import com.phongkham.util.DBConn;
import com.phongkham.util.MyUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class customerDao {

    Connection conn;

    public customerDao() {
        conn = DBConn.getConnection();
    }

    public boolean addCustomer(Customer cus) {
        String Name = cus.getName();
        int YOB = cus.getYOB();
        String AddressCus = cus.getAddressCus();
        Date DayVisit = cus.getDayVisit();
        Date ExpectedDOB = cus.getExpectedDOB();
        String Result = cus.getResult();
        String Note = cus.getNote();

        String qry = "INSERT INTO Customer VALUES(?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setNString(1, Name);
            preSta.setInt(2, YOB);
            preSta.setNString(3, AddressCus);

            java.sql.Date sDayVisit = MyUtil.convertUtilToSql(DayVisit);
            preSta.setDate(4, sDayVisit);

            if (ExpectedDOB == null) {
                preSta.setNull(5, java.sql.Types.DATE);
            } else {
                java.sql.Date sExpectedDOB = MyUtil.convertUtilToSql(ExpectedDOB);
                preSta.setDate(5, sExpectedDOB);
            }

            preSta.setNString(6, Result);
            if (Note == null) {
                preSta.setNull(7, java.sql.Types.NVARCHAR);
            } else {
                preSta.setNString(7, Note);
            }
            preSta.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public ArrayList<String> searchName(String value) {
        String qry = "SELECT Name FROM Customer WHERE Name LIKE ?";
        ArrayList<String> list = new ArrayList<>();
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setNString(1, "%" + value + "%");
            ResultSet rs = preSta.executeQuery();
            while(rs.next()) {
                list.add(rs.getNString("Name"));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
