package com.phongkham.util;

import java.util.ArrayList;

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
}
