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
<link href="css/form2.css" rel="stylesheet" type="text/css"/>
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
            <%!int i;%>
            <%
                for (i = 1; i < formList.size(); i++) {
                    if (formList.get(i).getClass1().equals("Bờ hộp sọ:")) {
                        i++;
                        break;
                    }
            %>
            <tr>
                <td class="page-b6"><%=formList.get(i).getClass1()%></td>
                <td colspan="3"><input id="input<%=i + 2%>" type="text" value="<%=formList.get(i).getClass2()%>" size="46"></td>
            </tr>
            <%}%>
            <tr>
                <td colspan="4" class="page-b3">Bờ hộp sọ:</td>
            </tr>
            <%for (int j = i; j < formList.size() - 1; j += 2) {%>
            <tr>
                <td class="page-b6"><%=formList.get(j).getClass1()%></td>
                <td><input id="input<%=j + 2%>" type="text" value="<%=formList.get(j).getClass2()%>" size="10"></td>
                    <%if ((j + 1) != (formList.size() - 1)) {%>
                <td class="page-b6"><%=formList.get(j + 1).getClass1()%></td>
                <td><input id="input<%=j + 3%>" type="text" value="<%=formList.get(j + 1).getClass2()%>" size="10"></td>
                    <%}%>
            </tr>
            <%}%>
        </table>
        <br>
        <table class="page-table">
            <tr>
                <td class="page-b7"><%=formList.get(formList.size() - 1).getClass1()%></td>
                <td><input id="input<%=formList.size() + 1%>" type="text" class="page-b8" value="<%=formList.get(formList.size() - 1).getClass2()%>" size="44"></td>
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
        <%if (formList.size() > 21) {%>
        <script>
            $("#print-container").attr("style", "margin-top: auto");
        </script>
        <p class="page-b11"><span class="page-b13">Lưu ý:</span> khám lại</p>
        <p class="page-b11">- Nếu thấy bất thường( đau bụng, ra máu...) đến khám ngay</p>
        <p class="page-b11">- Nếu siêu âm đầy đủ các chu kì  sẽ sớm phát hiện được >90% dị tật thai nhi</p>
        <%} else {%>
        <p class="page-b12">Lời dặn</p>
        <p class="page-b11">- Một tuần sau khám lại</p>
        <p class="page-b11">- Nếu thấy bất thường( đau bụng, ra máu...) đến khám ngay</p>
        <p class="page-b11">- Nếu siêu âm đầy đủ các chu kì  sẽ sớm phát hiện được >90% dị tật thai nhi</p>
        <p class="page-b12">( Siêu âm không ảnh hưởng đến thai nhi và bà mẹ)</p>
        <%}%>
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

            .print-h1 {
                text-align: center;
                font-weight: bold;
                font-size: 22px;
            }

            .print-h2 {
                text-align: center;
                font-size: 17px;
            }

            .print-h3 {
                text-align: center;
                font-size: 17px;
                font-style: italic;
            }

            .print-h4 {
                text-align: center;
                font-weight: bold;
                font-size: 22px;
            }

            .print-table {
                width: 100%;
            }

            .print-b1 {
                font-size: 17px;
                width: 80px;
            }

            .print-b2 {
                font-size: 17px;
            }

            .print-b3 {
                font-size: 17px;
                width: 60px;
            }

            .print-b4 {
                font-size: 17px;
                padding-left: 5px;
                font-weight: bold;
            }

            .print-b5 {
                font-size: 17px;
                text-align: center;
                font-weight: bold
            }

            .print-b6 {
                font-size: 17px;
                width: 180px;
            }

            .print-b7 {
                font-size: 17px;
                font-weight: bold;
                width: 180px;
            }

            .print-b8 {
                font-size: 17px;
                font-weight: bold;
            }

            .print-b9 {
                width: 300px;
                text-align: center;
            }

            .print-b10 {
                font-size: 17px;
                font-weight: bold;
                font-style: italic;
                text-align: center;
            }

            .print-b11 {
                font-size: 17px;
                font-style: italic;
            }

            .pirnt-b12 {
                font-size: 17px;
                text-align: center;
                font-style: italic;
            }

            .print-b13 {
                font-weight: bold;
                font-style: normal;
                text-decoration: underline;
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
                <td class="print-b1">Họ và tên:</td>
                <td id="output0" class="print-b2"></td>
                <td class="print-b3">Tuổi:</td>
                <td id="output1" class="print-b2"></td>
            </tr>
            <tr>
                <td class="print-b2">Địa chỉ:</td>
                <td id="output2" class="print-b2" colspan="3"></td>
            </tr>
        </table>
        <p class="print-b4">Yêu cầu kiểm tra: <%=formList.get(0).getClass1()%></p>
        <p class="print-b5">KẾT QUẢ:</p>
        <table class="print-table">
            <%
                for (i = 1; i < formList.size(); i++) {
                    if (formList.get(i).getClass1().equals("Bờ hộp sọ:")) {
                        i++;
                        break;
                    }
            %>
            <tr>
                <td class="print-b6"><%=formList.get(i).getClass1()%></td>
                <td colspan="3" id="output<%=i + 2%>" class="print-b2"></td>
            </tr>
            <%}%>
            <tr>
                <td colspan="4" class="print-b2">Bờ hộp sọ:</td>
            </tr>
            <%for (int j = i; j < formList.size() - 1; j += 2) {%>
            <tr>
                <td class="print-b6"><%=formList.get(j).getClass1()%></td>
                <td id="output<%=j + 2%>" class="print-b2"></td>
                <%if ((j + 1) != (formList.size() - 1)) {%>
                <td class="print-b6"><%=formList.get(j + 1).getClass1()%></td>
                <td id="output<%=j + 3%>" class="print-b2"></td>
                <%}%>
            </tr>
            <%}%>
        </table>
        <table class="print-table">
            <tr>
                <td class="print-b7"><%=formList.get(formList.size() - 1).getClass1()%></td>
                <td id="output<%=formList.size() + 1%>" class="print-b8"></td>
            </tr>
        </table>
        <br>
        <table class="print-table">
            <tr>
                <td class="print-b9">Ảnh</td>
                <td>
                    <p class="print-b10"><%="Ngày " + day.format(now) + " tháng " + month.format(now) + " năm " + year.format(now)%></p>
                    <br>
                    <p class="print-b10">Người siêu âm</p>
                    <br><br><br><br><br><br><br><br><br><br>
                </td>
            </tr>
        </table>
        <br>
        <%if (formList.size() > 21) {%>
        <p class="print-b11"><span class="print-b13">Lưu ý:</span> khám lại</p>
        <p class="print-b11">- Nếu thấy bất thường( đau bụng, ra máu...) đến khám ngay</p>
        <p class="print-b11">- Nếu siêu âm đầy đủ các chu kì  sẽ sớm phát hiện được >90% dị tật thai nhi</p>
        <%} else {%>
        <p class="print-b12">Lời dặn</p>
        <p class="print-b11">- Một tuần sau khám lại</p>
        <p class="print-b11">- Nếu thấy bất thường( đau bụng, ra máu...) đến khám ngay</p>
        <p class="print-b11">- Nếu siêu âm đầy đủ các chu kì  sẽ sớm phát hiện được >90% dị tật thai nhi</p>
        <p class="print-b12">( Siêu âm không ảnh hưởng đến thai nhi và bà mẹ)</p>
        <%}%>
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