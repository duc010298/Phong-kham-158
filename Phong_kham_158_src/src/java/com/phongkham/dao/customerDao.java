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

        String qry = "INSERT INTO Customer VALUES(null, ?, ?, ?, ?, ?, ?, ?)";

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
        String qry = "SELECT Name FROM Customer WHERE Name LIKE ? GROUP BY Name";
        ArrayList<String> list = new ArrayList<>();
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setNString(1, "%" + value + "%");
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                list.add(rs.getNString("Name"));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<String> searchAge(String value) {
        String qry = "SELECT YOB FROM Customer WHERE YOB LIKE ? GROUP BY YOB";
        ArrayList<String> list = new ArrayList<>();
        int YOB = Integer.parseInt(value);
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setNString(1, "%" + YOB + "%");
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                int result = rs.getInt("YOB");
                String tempStr = String.valueOf(result);
                list.add(tempStr);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<String> searchAddress(String value) {
        String qry = "SELECT AddressCus FROM Customer WHERE AddressCus LIKE ? GROUP BY AddressCus";
        ArrayList<String> list = new ArrayList<>();
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setNString(1, "%" + value + "%");
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                list.add(rs.getNString("AddressCus"));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<String> searchNote(String value) {
        String qry = "SELECT Note FROM Customer WHERE Note LIKE ? GROUP BY Note";
        ArrayList<String> list = new ArrayList<>();
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setNString(1, "%" + value + "%");
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                list.add(rs.getNString("Note"));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
