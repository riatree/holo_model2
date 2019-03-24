/* 메뉴 등록하기 */
    var addMenu = _.template($('#addMenu').html());
    $('.addMenu').click(function () {
        var menuName = $('#addMenuName').val();
        var menuPrice = $('#addMenuPrice').val();
        $('#addMenuName').val("");
        $('#addMenuPrice').val("");
        var menu = {"name": menuName, "price": menuPrice};
        $('.menuList').append(addMenu({menu}));
    });
    $('.menuList').on('click', "button", function () {
        $(this).parent().remove();
    });