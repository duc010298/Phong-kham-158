var firstClick = true;

$("#btn-kqsa").click(function () {
    if ($("#btn-kqsa").attr("class") === "nav-content") {
        $("#btn-kqsa").attr("class", "nav-content nav-active");
        $("#btn-bcsa").attr("class", "nav-content");
        $("#btn-kqsa>span").attr("class", "fas fa-angle-up");
        $("section").attr("style", "margin-left: 14.375rem");
        $(".spinner-content").attr("style", "padding-right: 14.375rem;");
        if (firstClick) {
            $(".content-default p").attr("style", "padding-right: 14.375rem;");
        }
        $(".footer-content").attr("style", "margin-left: 14.375rem");
    } else {
        $("#btn-kqsa").attr("class", "nav-content");
        $("#btn-kqsa>span").attr("class", "fas fa-angle-down");
        $("section, .spinner-content").attr("style", "");
        if (firstClick) {
            $(".content-default p").attr("style", "");
        }
        $(".footer-content").attr("style", "");
    }
    $("#nav-2").animate({
        height: 'toggle'
    }, 350);
});

$("#btn-bcsa").click(function () {
    if ($("#btn-bcsa").attr("class") === "nav-content") {
        $("#btn-bcsa").attr("class", "nav-content nav-active");
        $("#btn-kqsa").attr("class", "nav-content");
        $("#btn-kqsa>span").attr("class", "fas fa-angle-down");
        $("section").attr("style", "");
        if (firstClick) {
            $(".content-default p").attr("style", "");
        }
        $(".footer-content").attr("style", "");
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
});

$("#btn-acept-save").click(function () {
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

    console.log(Name);
    console.log(Age);
    console.log(YOB);
    console.log(AddressCus);
    console.log(ExpectedDOB);
    console.log(Result);
    console.log(Note);

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