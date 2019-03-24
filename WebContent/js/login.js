$(".login").click(function () {
        $(".loginPopup").show();
        $("#loginform").show();
    });
    $("#loginClose").click(function () {
        $("#loginform").hide();
        $(".loginPopup").hide();
    });