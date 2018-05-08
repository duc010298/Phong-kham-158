<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%if(request.getParameter("add").equals("success")){%>
    Lưu thành công
<%} else if(request.getParameter("add").equals("error")) {%>
    Lỗi: Lưu không thành công
<%} else {%>
    Lỗi: Không nhận được request
<%}%>
