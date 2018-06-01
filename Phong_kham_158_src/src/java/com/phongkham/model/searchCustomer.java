package com.phongkham.model;

import java.util.Date;

public class searchCustomer {

    String name;
    int age;
    String address;
    Date dayVisit;

    public void setName(String name) {
        this.name = name;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDayVisit(Date dayVisit) {
        this.dayVisit = dayVisit;
    }

    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getAddress() {
        return address;
    }

    public Date getDayVisit() {
        return dayVisit;
    }
}
