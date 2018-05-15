<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="ultrasonic-report">
    <div class="search">
        <div class="search-header">
            <h2>Tìm kiếm</h2>
        </div>
        <hr>
        <div class="search-body">
            <p>Họ và tên</p>
            <p>Tuổi</p>
            <p>Địa chỉ</p>
            <p>Ngày đến khám</p>
            <p>Ghi chú</p>
            <input type="text" id="inputName" placeholder="Nhập họ và tên" name="inputName">
            <input type="text" id="inputAge" placeholder="Nhập tuổi" name="inputAge">
            <input type="text" id="inputAddress" placeholder="Nhập địa chỉ" name="inputAddress">
            <input type="text" id="inputDayVisit" placeholder="dd/MM/yyy" name="inputDayVisit">
            <input type="text" id="inputNote" placeholder="Nhập ghi chú" name="inputNote">
        </div>
        <hr>
        <div class="search-footer">
            <div class="btn-reload-search"><span class="fas fa-sync-alt"></span> Nhập lại</div>
            <div class="btn-search"><span class="fas fa-search"></span> Tìm kiếm</div>
        </div>
    </div>
    <div class="display-result" id="display-result">

    </div>
</div>