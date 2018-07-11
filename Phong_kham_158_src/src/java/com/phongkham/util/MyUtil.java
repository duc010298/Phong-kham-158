package com.phongkham.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MyUtil {

    public static java.sql.Date convertUtilToSql(java.util.Date uDate) {
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        return sDate;
    }

    public static String listStrToJson(ArrayList<String> list) {
        String str = "";
        if (!list.isEmpty()) {
            str += "{";
            str += "\"content\":[";
            for (int i = 0; i < list.size() - 1; i++) {
                str += "\"" + list.get(i) + "\"" + ",";
            }
            str += "\"" + list.get(list.size() - 1) + "\"";
            str += "]}";
        } else {
            str += "{\"content\":[]}";
        }
        return str;
    }

    public static Date convertStrToDate(String str) {
        SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat format3 = new SimpleDateFormat("yyyy");
        format1.setLenient(false);
        format2.setLenient(false);
        Date ret;
        try {
            if (str.contains("/")) {
                ret = format1.parse(str);
            } else {
                ret = format2.parse(str);
            }
            int year = Integer.parseInt(format3.format(ret));
            if (year < 1500 || year > 2100) {
                return null;
            }
            return ret;
        } catch (ParseException ex) {
            Logger.getLogger(MyUtil.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
