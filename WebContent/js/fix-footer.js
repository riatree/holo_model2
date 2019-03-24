var $footer = $("#footer");

function fixFooter() {
    var wHeight = $(window).height();
    var bHeight = $("body").height()+80;

    console.log(bHeight);

    if($footer.hasClass("fixed")) {
        bHeight += 150;
    }

    if(wHeight>=bHeight) {
        $footer.addClass("fixed");
    }else {
        $footer.removeClass("fixed");
    }
}

$(window).resize(fixFooter);

fixFooter();