package com.phongkham.controller;

import com.phongkham.dao.customerDao;
import com.phongkham.model.Customer;
import com.phongkham.model.customerHidden;
import com.phongkham.model.searchCustomer;
import com.phongkham.util.MyUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Year;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "customerServlet", urlPatterns = {"/customer"})
public class customerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        customerDao cusDao = new customerDao();
        String tasks = request.getParameter("tasks");
        if (tasks.equals("add")) {
            String Name = request.getParameter("Name");
            int age;
            int YOB = 0;
            int currYear = Year.now().getValue();
            try {
                age = Integer.parseInt(request.getParameter("Age"));
            } catch (NumberFormatException ex) {
                age = 0;
            }
            if (age < 100 && age != 0) {
                YOB = currYear - age;
            } else if (age != 0) {
                YOB = age;
            }
            String AddressCus = request.getParameter("AddressCus");
            String strDayVisit = request.getParameter("DayVisit");
            Date DayVisit = MyUtil.convertStrToDate(strDayVisit);
            String strExpectedDOB = request.getParameter("ExpectedDOB");
            Date ExpectedDOB = MyUtil.convertStrToDate(strExpectedDOB);
            String Result = request.getParameter("Result");
            String Note = request.getParameter("Note");
            if (Note.equals("")) {
                Note = null;
            }
            Customer cus = new Customer();
            cus.setName(Name);
            cus.setYOB(YOB);
            cus.setAddressCus(AddressCus);
            cus.setDayVisit(DayVisit);
            cus.setExpectedDOB(ExpectedDOB);
            cus.setResult(Result);
            cus.setNote(Note);
            boolean status = cusDao.addCustomer(cus);
            cusDao.closeConnection();
            if (status) {
                try (PrintWriter out = response.getWriter()) {
                    out.println("Lưu thành công");
                }
            } else {
                try (PrintWriter out = response.getWriter()) {
                    out.println("Lỗi: Lưu không thành công");
                }
            }
        }
        if (tasks.equals("addHidden")) {
            String Name = request.getParameter("Name");
            int age;
            int YOB = 0;
            int currYear = Year.now().getValue();
            try {
                age = Integer.parseInt(request.getParameter("Age"));
            } catch (NumberFormatException ex) {
                age = 0;
            }
            if (age < 100 && age != 0) {
                YOB = currYear - age;
            } else if (age != 0) {
                YOB = age;
            }
            String AddressCus = request.getParameter("AddressCus");
            String strDayVisit = request.getParameter("DayVisit");
            Date DayVisit = MyUtil.convertStrToDate(strDayVisit);
            String Result = request.getParameter("Result");
            customerHidden cusHidden = new customerHidden();
            cusHidden.setName(Name);
            cusHidden.setYOB(YOB);
            cusHidden.setAddressCus(AddressCus);
            cusHidden.setDayVisit(DayVisit);
            cusHidden.setResult(Result);
            cusDao.addCustomerHidden(cusHidden);
            cusDao.closeConnection();
        }
        if (tasks.equals("searchContent")) {
            String search = request.getParameter("search");
            String value = request.getParameter("value");
            ArrayList<String> list = new ArrayList<>();
            if (search.equals("inputName")) {
                list = cusDao.searchName(value);
            }
            if (search.equals("inputAge")) {
                list = cusDao.searchAge(value);
            }
            if (search.equals("inputAddress")) {
                list = cusDao.searchAddress(value);
            }
            cusDao.closeConnection();
            String str = MyUtil.listStrToJson(list);
            try (PrintWriter out = response.getWriter()) {
                out.println(str);
            }
        }
        if (tasks.equals("search")) {
            String name = request.getParameter("name");
            if (name.equals("")) {
                name = null;
            }
            String strAge = request.getParameter("age");
            int YOB;
            if (strAge.equals("")) {
                YOB = 0;
            } else {
                try {
                    YOB = Integer.parseInt(strAge);
                } catch (NumberFormatException ex) {
                    YOB = 0;
                }
                if (YOB < 100) {
                    int currYear = Year.now().getValue();
                    YOB = currYear - YOB;
                }
            }
            String address = request.getParameter("address");
            if (address.equals("")) {
                address = null;
            }
            String strDayVisit = request.getParameter("dayVisit");
            Date dayVisit = MyUtil.convertStrToDate(strDayVisit);
            searchCustomer content = new searchCustomer();
            content.setName(name);
            content.setAge(YOB);
            content.setAddress(address);
            content.setDayVisit(dayVisit);
            request.setAttribute("listCus", cusDao.search(content));
            cusDao.closeConnection();
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/resultOfSearch.jsp");
            dispatch.forward(request, response);
        }
        if (tasks.equals("searchHidden")) {
            String date = request.getParameter("dayVisit");
            request.setAttribute("listCusPrint", cusDao.searchCusHiddenPrint(date));
            request.setAttribute("listCusSave", cusDao.searchCusHiddenSave(date));
            cusDao.closeConnection();
            RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/resultOfSearchHidden.jsp");
            dispatch.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
