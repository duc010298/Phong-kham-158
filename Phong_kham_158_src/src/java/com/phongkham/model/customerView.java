package com.phongkham.model;

import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Date;

public class customerView {

    final SimpleDateFormat formater = new SimpleDateFormat("dd/MM/yyyy");
    private String Name;
    private String Age;
    private String AddressCus;
    private String DayVisit;
    private String ExpectedDOB;
    private String Result;
    private String Note;

    public String getName() {
        return Name;
    }

    public String getAge() {
        return Age;
    }

    public String getAddressCus() {
        return AddressCus;
    }

    public String getDayVisit() {
        return DayVisit;
    }

    public String getExpectedDOB() {
        return ExpectedDOB;
    }

    public String getResult() {
        return Result;
    }

    public String getNote() {
        return Note;
    }

    public void setName(String Name) {
        if (Name != null) {
            this.Name = Name;
        } else {
            this.Name = "";
        }
    }

    public void setAge(int YOB) {
        if (YOB != 0) {
            int age = Year.now().getValue() - YOB;
            this.Age = String.valueOf(age);
        } else {
            this.Age = "";
        }
    }

    public void setAddressCus(String AddressCus) {
        if (AddressCus != null) {
            this.AddressCus = AddressCus;
        } else {
            this.AddressCus = "";
        }
    }

    public void setDayVisit(Date DayVisit) {
        if (DayVisit != null) {
            this.DayVisit = formater.format(DayVisit);
        } else {
            this.DayVisit = "";
        }
    }

    public void setExpectedDOB(Date ExpectedDOB) {
        if (ExpectedDOB != null) {
            this.ExpectedDOB = formater.format(ExpectedDOB);
        } else {
            this.ExpectedDOB = "";
        }
    }

    public void setResult(String Result) {
        if (Result != null) {
            this.Result = Result;
        } else {
            this.Result = "";
        }
    }

    public void setNote(String Note) {
        if (Note != null) {
            this.Note = Note;
        } else {
            this.Note = "";
        }
    }

}
