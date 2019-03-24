var $body = $("body");

$(".setting").click(function () {
	//alert("test");
    $body.toggleClass("show");
});

$body.click(function (e) {
	//alert("test2");
    if($body.hasClass("show")){
        if(!$('.myInf,.setting').has(e.target).length){
            $body.removeClass("show");
        }
    }
});