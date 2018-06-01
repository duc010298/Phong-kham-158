<%@page import="java.time.Year"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.phongkham.model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  ArrayList<Customer> listCus = (ArrayList<Customer>) request.getAttribute("listCus");
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
    int currYear = Year.now().getValue();
    int count = 1;%>
<div class="display-result-content">
    <table>
        <tr>
            <th class="STT"></th>
            <th class="dayVisit">Ngày đến khám</th>
            <th class="Name">Họ và tên</th>
            <th class="Age">Tuổi</th>
            <th class="Address">Địa chỉ</th>
            <th class="ExpectedDOB">Ngày sinh dự kiến</th>
            <th class="result">Kết quả</th>
            <th class="Note">Ghi chú</th>
        </tr>
        <%for (Customer cus : listCus) {%>
        <tr>
            <td><%=count++%></td>
            <%String dayVisit = formatter.format(cus.getDayVisit());%>
            <td><%=dayVisit%></td>
            <td><%=cus.getName()%></td>
            <%int age = currYear - cus.getYOB();%>
            <td><%=age%></td>
            <td><%=cus.getAddressCus()%></td>
            <%if (cus.getExpectedDOB() == null) {%>
            <td></td>
            <%} else {%>
            <%String expectedDOB = formatter.format(cus.getExpectedDOB());%>
            <td><%=expectedDOB%></td>
            <%}%>
            <td><%=cus.getResult()%></td>
            <%if (cus.getNote() == null) {%>
            <td></td>
            <%} else {%>
            <td><%=cus.getNote()%></td>
            <%}%>
        </tr>
        <%}%>
    </table>
</div>
<script>
    if ($(".display-result-content tr").length > 10) {
        $("footer").attr("style", "position: static; bottom: auto");
    } else {
        $("footer").removeAttr("style");
    }
</script>