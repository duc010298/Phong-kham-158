var firstClick = true;

$("#btn-result").click(function () {
    if ($("#btn-result").attr("class") === "nav-content") {
        $("#btn-result").attr("class", "nav-content nav-active");
        $("#btn-report").attr("class", "nav-content");
        $("#btn-result>span").attr("class", "fas fa-angle-up");
        $("main").attr("style", "margin-left: 14.375rem");
        $(".spinner-content").attr("style", "padding-right: 14.375rem;");
        if (firstClick) {
            $(".content-default p").attr("style", "padding-right: 14.375rem;");
        }
        $(".footer-content").attr("style", "margin-left: 14.375rem");
    } else {
        $("#btn-result").attr("class", "nav-content");
        $("#btn-result>span").attr("class", "fas fa-angle-down");
        $("main, .spinner-content, .footer-content").removeAttr("style");
        if (firstClick) {
            $(".content-default p").removeAttr("style");
        }
    }
    $("#nav-2").animate({
        height: 'toggle'
    }, 350);
});

$("#btn-report").click(function () {
    if ($("#btn-report").attr("class") === "nav-content") {
        $("#btn-report").attr("class", "nav-content nav-active");
        $("#btn-result").attr("class", "nav-content");
        $("#btn-result>span").attr("class", "fas fa-angle-down");
        $("main, .spinner-content, .footer-content, footer").removeAttr("style");
        if (firstClick) {
            $(".content-default p").removeAttr("style");
        }
    }
    for (var i = 1; i <= $("#nav-2>ul>li").length; i++) {
        if ($("#nav-2>ul>li:nth-child(" + i + ")").attr("class") === "nav-2-content-active") {
            $("#nav-2>ul>li:nth-child(" + i + ")").attr("class", "nav-2-content");
            break;
        }
    }
    $("#tool").fadeOut(500);
    $("#nav-2").animate({
        height: 'hide'
    }, 350);
    $(".spinner").attr("style", "display: flex");
    setTimeout(function () {
        //ajax here
        $("#container").load(window.location.href + "report.jsp");
        $(".spinner").attr("style", "display: none");
    }, 300);
});

$("#nav-2>ul>li").click(function () {
    for (var i = 1; i <= $("#nav-2>ul>li").length; i++) {
        if ($("#nav-2>ul>li:nth-child(" + i + ")").attr("class") === "nav-2-content-active") {
            $("#nav-2>ul>li:nth-child(" + i + ")").attr("class", "nav-2-content");
            break;
        }
    }
    $(this).attr("class", "nav-2-content-active");
    $("#tool").fadeIn(500);
    var postContent = $(this).attr("name");
    $(".content-default").attr("style", "display: none");
    $(".spinner").attr("style", "display: flex");
    setTimeout(function () {
        $.ajax({
            url: window.location.href + "form",
            type: 'GET',
            dataType: 'html',
            data: {
                Id: postContent
            }
        }).done(function (result) {
            $(".spinner").attr("style", "display: none");
            $("#container").html(result);
            $("html, body").animate({
                scrollTop: 0
            }, "slow");
            if (firstClick) {
                $("footer").attr("style", "position: static; bottom: auto");
                firstClick = false;
            }
        });
    }, 300);
});

$("#btn-print").click(function () {
    //Chia đôi phần .page và .print, trừ đi td của "Ảnh và ngày siêu âm"
    var totalInput = (($("td").length / 2) - 2) / 2;
    for (var i = 0; i < totalInput; i++) {
        $("#output" + i).html($("#input" + i).val());
    }
    $("#print-container").printThis();
});

$("#btn-save").click(function () {
    $("#modal").fadeIn();
});

$("#btn-reload").click(function () {
    for (var i = 1; i <= $("#nav-2>ul>li").length; i++) {
        if ($("#nav-2>ul>li:nth-child(" + i + ")").attr("class") === "nav-2-content-active") {
            $("#nav-2>ul>li:nth-child(" + i + ")").click();
            break;
        }
    }
});

$(".btn-close").click(function () {
    $("#modal, #notify-modal").fadeOut();
    $(".modal-body>input").val("");
    setTimeout(function () {
        $(".modal-body h1").removeAttr("style");
    }, 500);
});

$("#btn-acept-save").click(function () {
    notify("Thông báo", "Đang xử lí");
    var totalInput = (($("td").length / 2) - 2) / 2;
    var indexOfResult = Math.floor(totalInput);
    var Name = $("#input0").val();
    if (Name === "") {
        $("#modal").fadeOut();
        notify("Lỗi", "Chưa nhập tên");
        return;
    }
    var YearNow = new Date().getFullYear();
    var AgeString = $("#input1").val();
    var Age = "";
    for (var i = 0; i < AgeString.length; i++) {
        for (var j = 0; j < 10; j++) {
            if (AgeString.substring(i, i + 1) == j && AgeString.substring(i, i + 1) !== " ") {
                Age += AgeString.substring(i, i + 1);
                break;
            }
        }
    }
    if (Age === "") {
        $("#modal").fadeOut();
        notify("Lỗi", "Chưa nhập tuổi");
        return;
    }
    var YOB = YearNow - Age;
    var AddressCus = $("#input2").val();
    if (AddressCus === "") {
        $("#modal").fadeOut();
        notify("Lỗi", "Chưa nhập địa chỉ");
        return;
    }
    var ExpectedDOB;
    if ($("#ExpectedDOB").val() == "") {
        ExpectedDOB = "NULL";
    } else {
        ExpectedDOB = $("#ExpectedDOB").val();
        if (!validateDate(ExpectedDOB)) {
            notify("Lỗi", "Ngày sinh dự kiến không được nhập chính xác");
            return;
        }
    }
    var Result = $("#input" + indexOfResult).val();
    if (typeof (Result) === "undefined") {
        indexOfResult--;
        Result = $("#input" + indexOfResult).val();
    }
    var Note;
    if ($("#Note").val() === "") {
        Note = "NULL";
    } else {
        Note = $("#Note").val();
    }

    $.ajax({
        url: window.location.href + "customer?tasks=add",
        type: 'POST',
        dataType: 'html',
        data: {
            Name: Name,
            Age: Age,
            YOB: YOB,
            AddressCus: AddressCus,
            ExpectedDOB: ExpectedDOB,
            Result: Result,
            Note: Note
        }
    }).done(function (result) {
        notify("Thông báo", result);
    });
});

function notify(Header, Content) {
    $("#notify-header").html(Header);
    //Độ dài vượt quá 22 gây tràn modal
    if (Content.length > 22) {
        $(".modal-body h1").attr("style", "font-size: 1.6rem");
    }
    $("#notify-content").html(Content);
    $("#notify-modal").fadeIn("fast");
}

$('.modal-body input').keydown(function (e) {
    if (e.which === 13 || e.which === 40) {
        var i = $('.modal-body input').index(this) + 1;
        $('.modal-body input').eq(i).focus();
    }
    if (e.which === 38) {
        var i = $('.modal-body input').index(this) - 1;
        $('.modal-body input').eq(i).focus();
    }
});

function validateDate(date) {
    //input must be dd/MM/yyyy
    var arr = date.split("/");
    if (arr.length !== 3) {
        return false;
    }

    var day = arr[0];
    var month = arr[1];
    var year = arr[2];

    var isLeapYear = false;
    if ((year % 4 == 0) && (year % 100 != 0)) {
        isLeapYear = true;
    }
    if (month < 1 || month > 12) {
        return false;
    }
    if ((month == 4 || month == 6 || month == 9 || month == 11) && (day < 0 || day > 30)) {
        return false;
    }
    if ((month != 2) && (day < 0 || day > 31)) {
        return false;
    }
    if (isLeapYear && month == 2 && (day < 0 || day > 29)) {
        return false;
    }
    if (!isLeapYear && month == 2 && (day < 0 || day > 28)) {
        return false;
    }
    if (year < 1500 || year > 2100) {
        return false;
    }

    return true;
}