<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.phongkham.model.Form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  List<Form> formList = (ArrayList<Form>) request.getAttribute("formList");
    Date now = new Date();
    SimpleDateFormat day = new SimpleDateFormat("d");
    SimpleDateFormat month = new SimpleDateFormat("M");
    SimpleDateFormat year = new SimpleDateFormat("y");
%>
<link href="css/form3.css" rel="stylesheet" type="text/css"/>
<div class="page">
    <div class="page-container">
        <p class="page-h1">PHÒNG KHÁM SẢN - PHỤ KHOA</p>
        <p class="page-h2">Địa chỉ : 158 Ngô quyền - Hoàng Xá - Thị Trấn An Lão - Hải phòng</p>
        <p class="page-h2">Điện thoại : 0916483289</p>
        <p class="page-h3">Siêu âm màu 4 chiều, siêu âm đầu dò âm đạo, siêu âm thai</p>
        <p class="page-h3">ổ bụng, phụ khoa, siêu âm vú</p>
        <br>
        <p class="page-h4">KẾT QUẢ SIÊU ÂM MÀU 4 CHIỀU</p>
        <br>
        <table class="page-table">
            <tr>
                <td class="page-b1">Họ và tên:</td>
                <td><input id="input0" type="text" placeholder="Nhập tên"></td>
                <td class="page-b2">Tuổi:</td>
                <td><input id="input1" type="text" value=" tuổi"></td>
            </tr>
            <tr>
                <td class="page-b3">Địa chỉ:</td>
                <td colspan="3"><input id="input2" type="text" placeholder="Nhập địa chỉ" size="55"></td>
            </tr>
        </table>
        <p class="page-b4">Yêu cầu kiểm tra: <%=formList.get(0).getClass1()%></p>
        <p class="page-b5">KẾT QUẢ:</p>
        <table class="page-table">
            <%for (int i = 1; i < formList.size() - 1; i++) {%>
            <tr>
                <td class="page-b6"><%=formList.get(i).getClass1()%></td>
                <% if (formList.get(i).getClass2().length() < 45) {%>
                <td><textarea cols="50" rows="1" id="input<%=i + 2%>"><%=formList.get(i).getClass2()%></textarea></td>
                    <%} else {%>
                <td><textarea cols="50" rows="2" id="input<%=i + 2%>"><%=formList.get(i).getClass2()%></textarea></td>
                    <%}%>
            </tr>
            <%}%>
        </table>
        <br>
        <table class="page-table">
            <tr>
                <td class="page-b7"><%=formList.get(formList.size() - 1).getClass1()%></td>
                <td><textarea cols="50" rows="2" class="page-b8" id="input<%=formList.size() + 1%>"><%=formList.get(formList.size() - 1).getClass2()%></textarea></td>
            </tr>
        </table>
        <br>
        <table class="page-table">
            <tr>
                <td class="page-b9">Ảnh</td>
                <td>
                    <p class="page-b10"><%="Ngày " + day.format(now) + " tháng " + month.format(now) + " năm " + year.format(now)%></p>
                    <br>
                    <p class="page-b10">Người siêu âm</p>
                    <br><br><br><br><br><br><br>
                </td>
            </tr>
        </table>
        <br>
        <p class="page-b11"><span class="page-b12">Lời dặn:</span> Khi đi siêu âm mang theo phiếu này</p>
    </div>
</div>
<div class="print">
    <div id="print-container" class="print-container">
        <style>
            .print-container {
                margin-top: 25px;
                margin-left: 45px;
                margin-right: 45px;
            }

            .print-container * {
                margin: 0;
                padding: 0;
            }

            .print-table {
                width: 100%;
            }

            .print-h1 {
                text-align: center; font-weight: bold; font-size: 25px;
            }

            .print-h2 {
                text-align: center; font-size: 18px;
            }

            .print-h3 {
                text-align: center; font-size: 18px; font-style: italic;
            }

            .print-h4 {
                text-align: center; font-weight: bold; font-size: 23px;
            }

            .print-h5 {
                font-size: 18px; width: 80px;
            }

            .print-h6 {
                font-size: 18px; width: 60px;
            }

            .print-h7 {
                font-size: 18px;
            }

            .print-h8 {
                font-size: 18px; font-weight: bold;
            }

            .print-h9 {
                font-size: 18px; text-align: center; font-weight: bold;
            }

            .print-h10 {
                font-size: 18px; width: 160px; vertical-align: text-top;
            }

            .print-h11 {
                font-size: 18px; font-weight: bold; width: 160px; vertical-align: text-top;
            }

            .print-h12 {
                font-size: 18px; font-weight: bold;
            }

            .print-h13 {
                width: 300px; text-align: center;
            }

            .print-h14 {
                font-size: 18px; font-weight: bold; font-style: italic; text-align: center;
            }

            .print-h15 {
                font-size: 18px; font-style: italic;
            }

            .print-h16 {
                font-weight: bold; font-style: normal; text-decoration: underline;
            }
        </style>
        <p class="print-h1">PHÒNG KHÁM SẢN - PHỤ KHOA</p>
        <p class="print-h2">Địa chỉ : 158 Ngô quyền - Hoàng Xá - Thị Trấn An Lão - Hải phòng</p>
        <p class="print-h2">Điện thoại : 0916483289</p>
        <p class="print-h3">Siêu âm màu 4 chiều, siêu âm đầu dò âm đạo, siêu âm thai</p>
        <p class="print-h3">ổ bụng, phụ khoa, siêu âm vú</p>
        <br>
        <p class="print-h4">KẾT QUẢ SIÊU ÂM MÀU 4 CHIỀU</p>
        <table class="print-table">
            <tr>
                <td class="print-h5">Họ và tên:</td>
                <td id="output0" class="print-h7"></td>
                <td class="print-h6">Tuổi:</td>
                <td id="output1" class="print-h7"></td>
            </tr>
            <tr>
                <td class="print-h7">Địa chỉ:</td>
                <td id="output2" class="print-h7" colspan="3"></td>
            </tr>
        </table>
        <p class="print-h8">Yêu cầu kiểm tra: <%=formList.get(0).getClass1()%></p>
        <p class="print-h9">KẾT QUẢ:</p>
        <table class="print-table">
            <%for (int i = 1; i < formList.size() - 1; i++) {%>
            <tr>
                <td class="print-h10"><%=formList.get(i).getClass1()%></td>
                <td id="output<%=i + 2%>" class="print-h7"></td>
            </tr>
            <%}%>
        </table>
        <table class="print-table">
            <tr>
                <td class="print-h11"><%=formList.get(formList.size() - 1).getClass1()%></td>
                <td id="output<%=formList.size() + 1%>" class="print-h12"></td>
            </tr>
        </table>
        <br>
        <table class="print-table">
            <tr>
                <td class="print-h13">Ảnh</td>
                <td>
                    <p class="print-h14"><%="Ngày " + day.format(now) + " tháng " + month.format(now) + " năm " + year.format(now)%></p>
                    <br>
                    <p class="print-h14">Người siêu âm</p>
                    <br><br><br><br><br><br><br><br><br><br>
                </td>
            </tr>
        </table>
        <br>
        <p class="print-h15"><span class="print-h16">Lời dặn:</span> Khi đi siêu âm mang theo phiếu này</p>
    </div>
</div>
<script>
    $('.page input').keydown(function (e) {
        if (e.which === 13 || e.which === 40) {
            var i = $('.page input').index(this) + 1;
            $('.page input').eq(i).focus();
        }
        if (e.which === 38) {
            var i = $('.page input').index(this) - 1;
            $('.page input').eq(i).focus();
        }
    });
</script>