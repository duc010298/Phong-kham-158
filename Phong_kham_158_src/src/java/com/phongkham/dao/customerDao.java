package com.phongkham.dao;

import com.phongkham.model.Customer;
import com.phongkham.util.DBConn;
import com.phongkham.util.MyUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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

        java.sql.Date sDayVisit = MyUtil.convertUtilToSql(DayVisit);
        java.sql.Date sExpectedDOB = MyUtil.convertUtilToSql(ExpectedDOB);

        String qry = "INSERT INTO Customer VALUES(?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setNString(1, Name);
            preSta.setInt(2, YOB);
            preSta.setNString(3, AddressCus);
            preSta.setDate(4, sDayVisit);
            preSta.setDate(5, sExpectedDOB);
            preSta.setNString(6, Result);
            preSta.setNString(7, Note);
            preSta.executeUpdate();
            
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }

    }
}
