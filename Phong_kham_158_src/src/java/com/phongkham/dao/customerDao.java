package com.phongkham.dao;

import com.phongkham.model.Customer;
import com.phongkham.model.customerHidden;
import com.phongkham.model.customerHiddenView;
import com.phongkham.model.customerView;
import com.phongkham.model.searchCustomer;
import com.phongkham.util.DBConn;
import com.phongkham.util.MyUtil;
import com.phongkham.util.VNCharacterUtils;
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

    public void closeConnection() {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, e);
            }
        }
    }

    public boolean addCustomer(Customer cus) {
        String Name = cus.getName();
        String NameS = VNCharacterUtils.removeAccent(Name).toLowerCase();
        int YOB = cus.getYOB();
        String AddressCus = cus.getAddressCus();
        String AddressCusS = VNCharacterUtils.removeAccent(AddressCus).toLowerCase();
        Date DayVisit = cus.getDayVisit();
        Date ExpectedDOB = cus.getExpectedDOB();
        String Result = cus.getResult();
        String Note = cus.getNote();

        String qry = "INSERT INTO Customer VALUES(null, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setString(1, Name);
            preSta.setString(2, NameS);
            preSta.setInt(3, YOB);
            preSta.setString(4, AddressCus);
            preSta.setString(5, AddressCusS);

            java.sql.Date sDayVisit = MyUtil.convertUtilToSql(DayVisit);
            preSta.setDate(6, sDayVisit);

            if (ExpectedDOB == null) {
                preSta.setNull(7, java.sql.Types.DATE);
            } else {
                java.sql.Date sExpectedDOB = MyUtil.convertUtilToSql(ExpectedDOB);
                preSta.setDate(7, sExpectedDOB);
            }

            preSta.setString(8, Result);
            if (Note == null) {
                preSta.setNull(9, java.sql.Types.NVARCHAR);
            } else {
                preSta.setString(9, Note);
            }
            preSta.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public void addCustomerHidden(customerHidden cusHidden) {
        String Name = cusHidden.getName();
        int YOB = cusHidden.getYOB();
        String AddressCus = cusHidden.getAddressCus();
        Date DayVisit = cusHidden.getDayVisit();
        String Result = cusHidden.getResult();

        String qry = "INSERT INTO Customer_Hidden VALUES(null, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            if (Name == null) {
                preSta.setNull(1, java.sql.Types.NVARCHAR);
            } else {
                preSta.setString(1, Name);
            }
            preSta.setInt(2, YOB);
            if (AddressCus == null) {
                preSta.setNull(3, java.sql.Types.NVARCHAR);
            } else {
                preSta.setString(3, AddressCus);
            }
            java.sql.Date sDayVisit = MyUtil.convertUtilToSql(DayVisit);
            if (AddressCus == null) {
                preSta.setNull(4, java.sql.Types.DATE);
            } else {
                preSta.setDate(4, sDayVisit);
            }
            if (AddressCus == null) {
                preSta.setNull(5, java.sql.Types.NVARCHAR);
            } else {
                preSta.setString(5, Result);
            }
            preSta.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<String> searchName(String value) {
        value = VNCharacterUtils.removeAccent(value).toLowerCase();
        String qry = "SELECT Name FROM Customer WHERE NameS LIKE ? GROUP BY NameS LIMIT 0, 15";
        ArrayList<String> list = new ArrayList<>();
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setString(1, "%" + value + "%");
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("Name"));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<String> searchAge(String value) {
        String qry = "SELECT YOB FROM Customer WHERE YOB LIKE ? GROUP BY YOB  LIMIT 0, 15";
        ArrayList<String> list = new ArrayList<>();
        int YOB = Integer.parseInt(value);
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setString(1, "%" + YOB + "%");
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
        value = VNCharacterUtils.removeAccent(value).toLowerCase();
        String qry = "SELECT AddressCus FROM Customer WHERE AddressCusS LIKE ? GROUP BY AddressCusS  LIMIT 0, 15";
        ArrayList<String> list = new ArrayList<>();
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setString(1, "%" + value + "%");
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("AddressCus"));
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public ArrayList<customerView> search(searchCustomer content) {
        String temp;
        temp = content.getName();
        String name = (temp == null) ? null : VNCharacterUtils.removeAccent(temp).toLowerCase();
        int age = content.getAge();
        temp = content.getAddress();
        String address = (temp == null) ? null : VNCharacterUtils.removeAccent(temp).toLowerCase();
        Date dayVisit = content.getDayVisit();
        if (name == null && age == 0 && address == null && dayVisit == null) {
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
            qry += "NameS LIKE ? ";
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
            qry += "AddressCusS LIKE ?";
        }
        if (dayVisit != null) {
            if (notFirstValue) {
                qry += "AND ";
            } else {
                qry += "WHERE ";
                notFirstValue = true;
            }
            qry += "DayVisit BETWEEN ? AND DATE('NOW') ";
            sDayVisit = MyUtil.convertUtilToSql(dayVisit);
            qry += "ORDER BY DayVisit ASC LIMIT 0, 1000";
        } else {
            qry += "ORDER BY DayVisit DESC LIMIT 0, 1000";
        }
        ArrayList<customerView> listCus = new ArrayList<>();
        int count = 1;
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            if (name != null) {
                preSta.setString(count, "%" + name + "%");
                count++;
            }
            if (age != 0) {
                preSta.setInt(count, age);
                count++;
            }
            if (address != null) {
                preSta.setString(count, "%" + address + "%");
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
                String resultNote = rs.getString("Note");
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

    public ArrayList<customerHiddenView> searchCusHiddenSave(String value) {
        ArrayList<customerHiddenView> listCusPrint = new ArrayList<>();
        Date dayVisit = MyUtil.convertStrToDate(value);
        java.sql.Date sDayVisit = MyUtil.convertUtilToSql(dayVisit);
        String qry = "SELECT Name, YOB, AddressCus, Result FROM Customer WHERE DayVisit = ? ORDER BY DayVisit";
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setDate(1, sDayVisit);
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                String resultName = rs.getString("Name");
                int resultYOB = rs.getInt("YOB");
                String resultAddress = rs.getString("AddressCus");
                String resultResult = rs.getString("Result");
                customerHiddenView cus = new customerHiddenView();
                cus.setName(resultName);
                cus.setAge(resultYOB);
                cus.setAddressCus(resultAddress);
                cus.setResult(resultResult);
                listCusPrint.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return listCusPrint;
    }

    public ArrayList<customerHiddenView> searchCusHiddenPrint(String value) {
        ArrayList<customerHiddenView> listCusPrint = new ArrayList<>();
        Date dayVisit = MyUtil.convertStrToDate(value);
        java.sql.Date sDayVisit = MyUtil.convertUtilToSql(dayVisit);
        String qry = "SELECT Name, YOB, AddressCus, Result FROM Customer_Hidden WHERE DayVisit = ? ORDER BY DayVisit";
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setDate(1, sDayVisit);
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                String resultName = rs.getString("Name");
                int resultYOB = rs.getInt("YOB");
                String resultAddress = rs.getString("AddressCus");
                String resultResult = rs.getString("Result");
                customerHiddenView cus = new customerHiddenView();
                cus.setName(resultName);
                cus.setAge(resultYOB);
                cus.setAddressCus(resultAddress);
                cus.setResult(resultResult);
                listCusPrint.add(cus);
            }
        } catch (SQLException ex) {
            Logger.getLogger(customerDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return listCusPrint;
    }
}
