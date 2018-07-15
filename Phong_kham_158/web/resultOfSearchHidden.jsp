<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="display-result-content">
    <div class="totalPrint">
        <h3>Tổng số ca đã in: </h3>
        <table>
            <tr>
                <th class="STT"></th>
                <th class="Name">Họ và tên</th>
                <th class="Age">Tuổi</th>
                <th class="Address">Địa chỉ</th>
                <th class="result">Kết quả</th>
            </tr>
            <c:set var="count" value="1" scope="page" />
            <c:forEach items="${requestScope.listCusPrint}" var="cusPrint">
                <c:if test="${not empty cusPrint}">
                    <tr>
                        <td>${count}</td>
                        <td>${cusPrint.getName()}</td>
                        <td>${cusPrint.getAge()}</td>
                        <td>${cusPrint.getAddressCus()}</td>
                        <td>${cusPrint.getResult()}</td>
                    </tr>
                    <c:set var="count" value="${count + 1}" scope="page"/>
                </c:if>
            </c:forEach>
        </table>
    </div>

    <div class="totalSave">
        <h3>Tổng số ca đã lưu: </h3>
        <table>
            <tr>
                <th class="STT"></th>
                <th class="Name">Họ và tên</th>
                <th class="Age">Tuổi</th>
                <th class="Address">Địa chỉ</th>
                <th class="result">Kết quả</th>
            </tr>
            <c:set var="count2" value="1" scope="page" />
            <c:forEach items="${requestScope.listCusSave}" var="cusSave">
                <c:if test="${not empty cusSave}">
                    <tr>
                        <td>${count2}</td>
                        <td>${cusSave.getName()}</td>
                        <td>${cusSave.getAge()}</td>
                        <td>${cusSave.getAddressCus()}</td>
                        <td>${cusSave.getResult()}</td>
                    </tr>
                    <c:set var="count2" value="${count2 + 1}" scope="page"/>
                </c:if>
            </c:forEach>
        </table>
    </div>
</div>
