<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <c:set var="count" value="1" scope="page" />
        <c:forEach items="${requestScope.listCus}" var="cus">
            <c:if test="${not empty cus}">
                <tr>
                    <td>${count}</td>
                    <td>${cus.getDayVisit()}</td>
                    <td>${cus.getName()}</td>
                    <td>${cus.getAge()}</td>
                    <td>${cus.getAddressCus()}</td>
                    <td>${cus.getExpectedDOB()}</td>
                    <td>${cus.getResult()}</td>
                    <td>${cus.getNote()}</td>
                </tr>
                <c:set var="count" value="${count + 1}" scope="page"/>
            </c:if>
        </c:forEach>
    </table>
</div>
<script>
    if ($(".display-result-content tr").length > 10) {
        $("footer").attr("style", "position: static; bottom: auto");
    } else {
        $("footer").removeAttr("style");
    }
</script>