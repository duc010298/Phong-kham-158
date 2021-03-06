package com.phongkham.dao;

import com.phongkham.model.formView;
import com.phongkham.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class formDao {

    Connection conn;

    public formDao() {
        conn = DBConn.getConnection();
    }
    
    public void closeConnection() {
        try {
            if(conn != null || !conn.isClosed()) {
                conn.close();
            }
        } catch(SQLException e) {
            Logger.getLogger(formDao.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public ArrayList<formView> getFormContent(String Id) {
        ArrayList<formView> formList = new ArrayList<>();
        String qry = "SELECT Class1, Class2 FROM KetQuaSieuAm_Content WHERE KqsaId = ? ORDER BY OrderNumber";
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setString(1, Id);
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                String class1 = (rs.getString("Class1") == null) ? "" : rs.getString("Class1");
                String class2 = (rs.getString("Class2") == null) ? "" : rs.getString("Class2");
                formView form = new formView();
                form.setClass1(class1);
                form.setClass2(class2);
                formList.add(form);
            }
            return formList;
        } catch (SQLException ex) {
            Logger.getLogger(formDao.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public int getFormId(String Id) {
        int formId = 0;
        String qry = "SELECT FormID FROM KetQuaSieuAm WHERE ID = ?";
        try {
            PreparedStatement preSta = conn.prepareStatement(qry);
            preSta.setString(1, Id);
            ResultSet rs = preSta.executeQuery();
            while (rs.next()) {
                formId = rs.getInt("FormID");
                break;
            }
            return formId;
        } catch (SQLException ex) {
            Logger.getLogger(formDao.class.getName()).log(Level.SEVERE, null, ex);
            return 0;
        }
    }
}
