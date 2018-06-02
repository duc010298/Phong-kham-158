package com.phongkham.dao;

import com.phongkham.model.Customer;
import com.phongkham.model.customerView;
import com.phongkham.model.searchCustomer;
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

    public ArrayList<customerView> search(searchCustomer content) {
        String name = content.getName();
        int age = content.getAge();
        String address = content.getAddress();
        Date dayVisit = content.getDayVisit();
        if(name == null && age == 0 && address == null && dayVisit == null) {
            return null;
        }
        java.sql.Date sDayVisit = null;
        boolean notFirstValue = false;
        String qry = "SELECT DayVisit, Name, YOB, AddressCus, ExpectedDOB, Result, Note FROM Customer ";
        if (name != null) {
            if (notFirstValue) {
                qry += "AND ";
            } else {
                qry += "WHERE ";
                notFirstValue = true;
            }
            qry += "Name LIKE ? ";
        }
        if (age != 0) {
            if (notFirstValue) {
                qry += "AND ";
            } else {
                qry += "WHERE ";
                notFirstValue = true;
            }
            qry += "YOB = ? ";
        }
        if (address != null) {
            if (notFirstValue) {
                qry += "AND ";
            } else {
                qry += "WHERE ";
                notFirstValue = true;
            }
            qry += "AddressCus LIKE ?";
        }
        if (dayVisit != null) {
            if (notFirstValue) {
                qry += "AND ";
            } else {
                qry += "WHERE ";
                notFirstValue = true;
            }
            qry += "DayVisit BETWEEN ? AND NOW() ";
            sDayVisit = MyUtil.convertUtilToSql(dayVisit);
            qry += "ORDER BY DayVisit ASC";
        } else {
            qry += "ORDER BY DayVisit DESC";
        }
        ArrayList<customerView> listCus = new ArrayList<>();
        int count = 1;
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            if (name != null) {
                preSta.setNString(count, "%" + name + "%");
                count++;
            }
            if (age != 0) {
                preSta.setInt(count, age);
                count++;
            }
            if (address != null) {
                preSta.setNString(count, "%" + address + "%");
                count++;
            }
            if (dayVisit != null) {
                preSta.setDate(count, sDayVisit);
            }
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                Date resultDayVisit = rs.getDate("DayVisit");
                String resultName = rs.getString("Name");
                int resultYOB = rs.getInt("YOB");
                String resultAddress = rs.getString("AddressCus");
                Date resultExpectedDOB = rs.getDate("ExpectedDOB");
                String resultResult = rs.getString("Result");
                String resultNote = rs.getNString("Note");
                customerView cus = new customerView();
                cus.setDayVisit(resultDayVisit);
                cus.setName(resultName);
                cus.setAge(resultYOB);
                cus.setAddressCus(resultAddress);
                cus.setExpectedDOB(resultExpectedDOB);
                cus.setResult(resultResult);
                cus.setNote(resultNote);
                listCus.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return listCus;
    }

}
