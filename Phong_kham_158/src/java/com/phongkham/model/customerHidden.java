package com.phongkham.model;

import java.util.Date;

public class customerHidden {

    String name;
    int YOB;
    String AddressCus;
    Date DayVisit;
    String Result;

    public String getName() {
        return name;
    }

    public int getYOB() {
        return YOB;
    }

    public String getAddressCus() {
        return AddressCus;
    }

    public Date getDayVisit() {
        return DayVisit;
    }

    public String getResult() {
        return Result;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setYOB(int YOB) {
        this.YOB = YOB;
    }

    public void setAddressCus(String AddressCus) {
        this.AddressCus = AddressCus;
    }

    public void setDayVisit(Date DayVist) {
        this.DayVisit = DayVist;
    }

    public void setResult(String Result) {
        this.Result = Result;
    }
    
    
}
