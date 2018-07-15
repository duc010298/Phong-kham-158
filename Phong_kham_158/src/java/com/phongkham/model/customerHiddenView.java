package com.phongkham.model;

import java.time.Year;

public class customerHiddenView {

    private String Name;
    private String Age;
    private String AddressCus;
    private String Result;

    public String getName() {
        return Name;
    }

    public String getAge() {
        return Age;
    }

    public String getAddressCus() {
        return AddressCus;
    }

    public String getResult() {
        return Result;
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

    public void setResult(String Result) {
        if (Result != null) {
            this.Result = Result;
        } else {
            this.Result = "";
        }
    }

}
