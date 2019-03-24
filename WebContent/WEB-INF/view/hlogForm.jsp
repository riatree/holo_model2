<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css">
    <link rel="stylesheet" href="/css/tui-editor.min.css">
    <link rel="stylesheet" href="/css/tui-date-picker.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

    <style>
        #heroWrap{
            width: 100%; height: 400px;
            margin-top: 70px;
            background-color: #fff;
            transition: .3s ease;
        }
        #colorWrap{
            width: 100%; height: 100px;
            transition: .4s ease;
            background-color: transparent;
        }
        #titleBox{
            width: 1600px; height: 400px;
            margin: auto;

        }
        .menuTools{
            width: 100px; height: 400px;
            display: inline-block;
            vertical-align: top;
            position: relative;
        }
        .menuTools>li{
            width: 100px; height: 90px;
            display: inline-block;
            margin-top: 20px;
            padding-top: 10px;
            text-align: center;
            font-size: 30px;
            cursor: pointer;
            color:#E0E0E0;
            text-shadow: 1px 1px 2px #EEEEEE;
        }
        label{
            cursor: pointer;
        }
        .menuTools span{
            width: 100px; height: 30px;
            font-size: 20px;
            padding: 8px 0;
            display: block;
        }

        .hLogTitleBox{
            width: 1400px; height: 400px;
            display: inline-block;
            text-align: center;
        }
        #hLogTitle{
            min-width: 500px; height: 80px;
            transform: translateY(110px);
            text-align: center;
            border:none; outline: none;
            background-color: transparent;
            border-bottom: 1px solid #424242;
            font-size: 30px;
        }
        .dataRange{
            width: 500px;
            height: 80px;
            margin: auto;
            margin-top: 150px;
        }
        .dataRange .tui-datepicker{
            margin-top: 0;
            z-index: 1;
        }
        .dataRange .datepick{
            width: 150px; height: 50px;
            text-align: center;
            font-size: 18px;
            background-color: transparent;
            border-radius: 10px;
            border: 1px solid #424242;
        }
        .tui-calendar td, .tui-calendar th{
            line-height: 39px;
            font-size: 16px;
        }
        #startpicker-input{
            margin-right: 100px;
        }
        #heroImg{
            width: 100%; height: 400px;
            position: absolute;
            opacity: .7;
        }
        .no_image{
            display: none;
        }

        #contentsWrap{
            width: 1080px;
            margin: auto;
            margin-bottom: 50px;

        }
        #editSection{
            width: 1080px;
            margin: auto;
        }
        .te-ww-container{
            border: 1px solid #424242;
        }
        #uploadImage{
            display: none;
        }
        .tui-editor-defaultUI button{
            color:#424242;
        }

        .tui-editor-contents{
            font-size: 30px;
        }
        .textAlignCenter{
            display: none;
        }

        .textCenter{
            text-align: center;
        }
        .textLeft{
            text-align: left;
        }
        .te-ww-container>.te-editor{
            overflow: auto;
        }

        #donerGrade{
            width: 1080px;
            height: 400px;
            position: relative;
            margin: auto;
            margin-top: 30px;
            border: 2px solid #424242;
            border-radius: 10px;
        }

        .hiceGrade{
            width: 432px; height: 400px;
            float: left;
            position: relative;
        }
        .hiceBackground {
            width: 200px;
            height: 300px;
            background-image: url(/img/ice5.png);
            background-size: 100% 100%;
            margin: 50px auto;
            opacity: .2;
        }
        .hiceLevel {
            width: 200px;
            position: absolute;
            bottom: 50px;
            left: 117px;
        }
        .hice{
            width: 200px; height: 300px;
        }
        .hice input{
            display: none;
        }
        .hice>li{
            width: 200px;
            position: absolute;
            bottom: 0;
        }
        .hice5 {
            height: 300px;
            bottom: 0;
        }
        .hice5 img{
            height: 300px;
        }
        .hice4 {
            height: 254px;
            bottom: 0;
        }
        .hice4 img{
            height: 254px;
        }
        .hice3 {
            height: 220px;
            bottom: 0;
        }
        .hice3 img{
            height: 220px;
        }
        .hice2 {
            height: 183px;
            bottom: 0;
        }
        .hice2 img{
            height: 183px;
        }
        .hice1 {
            height: 145px;
            bottom: 0;
        }
        .hice1 img{
            height: 145px;
        }
        .ice img{
            width: 200px;
            display: none;
        }
        #evaluation {
            width: 250px;
            height: 30px;
            font-size: 20px;
            text-align: center;
            position: absolute;
            bottom: 0; left: 80px;
        }
        .on {
            display: block;
        }
        .hiceLevel .ice img{
            width: 200px;
            display: none;
            opacity: .6;
        }
        .hiceLevel .ice img.on{
            display: block;
            opacity: 1;
        }

        .hiceLevel .hice1:hover img{
            display: block;
        }
        .hiceLevel .hice2:hover img{
            display: block;
        }
        .hiceLevel .hice3:hover img{
            display: block;
        }
        .hiceLevel .hice4:hover img{
            display: block;
        }
        .hiceLevel .hice5:hover img{
            display: block;
        }
        .hiceTitle{
            font-size: 30px;
            position: absolute;
            top: 20px;
            left: 50px;
        }
        .hiceTitle span{
            font-size: 20px;
            cursor: pointer;
        }

        .hLogBtn{
            width: 100px;
            height: 50px;
            background-color: #424242;
            color: #fff;
            border: none;
            border-radius: 15px;
            font-size: 20px;
            position: relative;
            top: 10px;
            left: 870px;
            cursor: pointer;
            outline: none;
        }
        .hLogBtn:hover{
            box-shadow: 2px 2px 3px #424242;
        }
        .hLogBtn:active{
            transform: scale(.9);
        }
        .travelGrade{
            width: 648px;
            height: 400px;
            /*background-color: red;*/
            position: absolute;
            right: 0;
            /*float: left;*/
            border-left: 1px solid #424242 ;
        }
        .travelGrade h3{
            padding: 30px 50px 50px 30px;
            /*float: left;*/
            font-size: 25px;
        }
        .travelGrade span{
            width: 100px;
            height: 50px;
            font-size: 15px;
        }
        .travelGrade li {
            margin-top: 30px;
            float: left;
        }
        .travelBox{
            height: 340px;
            padding : 30px;
        }
        .travelType input, .travelStyle input{
            display: none;
        }
        .travelType label, .travelStyle label{
            cursor: pointer;
        }

        .travelStyle {
            width: 400px;
            height: 80px;
            position: absolute;
            top: 30px; right: 50px;
        }
        .travelStyle label{
            width: 120px; height: 50px;
            padding-bottom: 10px;
            display: inline-block;
            margin-right: 30px;

        }
        .travelStyle li{
            margin-left: 50px;
            height: 60px;
            position: relative;
            margin-top: 20px;
        }

        .travelType {
            width: 470px; height: 110px;
            position: absolute;
            top:160px; right: 0px;
        }
        .travelType li{
            width:110px; height: 45px;
            text-align: center;
            margin:0 0 0 1px;
            line-height: 50px;
        }

        .color{
            background-color: #8D6E63;
            color: #fff;
            padding: 8px 10px;
            border-radius: 40px;
        }
        .selectTravel{
            transform: scale(1.2);
            color: #8D6E63;
            border-bottom: 1px solid #8D6E63 ;
        }

        .searchTag {
            position: absolute;
            bottom: 70px; right: 50px;
        }
        .searchTag li {
            margin-left: 30px;
        }
        .searchTag .inputTag{
            width: 80px;
            height: 30px;
            padding-left: 10px;
            border: none;
            outline: none;
            font-size: 15px;
            color: #4b96e6;
            font-weight: bold;
        }

        .tui-calendar th,.tui-calendar  td {
            vertical-align: middle;
        }

        .tui-datepicker-input{
            border: none;
        }
        .noImg{
            display: none;
        }
        .tagList{
        	width: 100px; height: 30px;
        	background-color: blue;
        	font-size: 15px;
        }
        
}
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>

<div id="formWrap">
    <form action="/hlog" method="post">
        <fieldset>
            <legend class="screen_out">H_Log_Wrap</legend>
            <div id="heroWrap">
                <div id="colorWrap">
                    <input type="hidden" id="heroImgName" name="titlePic" value="#EEEEEE"/>
                    <input type="hidden" id="heroColor" name = "colorCode"/>
                    <img src="/img/defaultpic.png" id="heroImg" class="no_image"/>
                    <div id="titleBox">
                    <ul class="menuTools">
                        <li><label><i class="fas fa-camera"></i><input type="file" id="heroImage" class="screen_out" name="heroImage"/><span>사진</span></label></li>
                        <li class="delectImage"><label><i class="far fa-trash-alt"></i><span>사진삭제</span></label></li>
                        <li class="colorSelecter"><label><i class="fas fa-palette"></i><input type="hidden" id="heroColor" name="heroColor"/><span>색상</span></label></li>
                        <li class="lockSelecter"><label><i class="fas fa-lock-open"></i><input type="hidden" id="lock" name="open" value="Y"/><span>공개</span></label></li>
                    </ul>
                    <div class="hLogTitleBox">
                        <input id="hLogTitle" name="title" placeholder="제목을 입력해주세요."/>
                        <div class="dataRange">
                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                <input id="startpicker-input" class="datepick" type="text" aria-label="Date" name="goDate">
                                <div id="startpicker-container" style="margin-left: -1px;"></div>
                            </div>
                            <div class="tui-datepicker-input tui-datetime-input tui-has-focus">
                                <input id="endpicker-input" class="datepick" type="text" aria-label="Date" name="comeDate">
                                <div id="endpicker-container" style="margin-left: -1px;"></div>
                            </div>
                        </div><!--dataRange -->
                    </div><!--//hLogTitleBox-->
                </div><!--//titleBox-->
                </div><!--//colorWrap-->
            </div><!--//heroWrap-->

            <div id="contentsWrap">
                <input type="hidden" id="hLogContents" name="contents" autocomplete="off"/>
                <div id="editSection"></div>
                <input type = "file" id="uploadImage"/>
                <div class="textAlignLeft"></div>
                <div class="textAlignCenter"></div>


            <div id="donerGrade">
                <div class="hiceGrade">
                    <div class="hiceTitle">HICE <span><i class="far fa-question-circle"></i></span></div>
                    <div class="hiceBackground"></div>
                    <div class="hiceLevel">
                        <input id="hiceValue" type="hidden" name="hice" value="0"/>
                        <ul class="hice">
                            <li class="hice5 ice" data-hice = "5"><img src="/img/ice5.png"></li>
                            <li class="hice4 ice" data-hice = "4"><img src="/img/icecream4.png"/></li>
                            <li class="hice3 ice" data-hice = "3"><img src="/img/icecream3.png"/></li>
                            <li class="hice2 ice" data-hice = "2"><img src="/img/icecream2.png"/></li>
                            <li class="hice1 ice" data-hice = "1"><img src="/img/icecream1.png"/></li>
                        </ul><!-- .hice end -->
                    </div><!-- .hiceLevel end -->
                    <div id="evaluation">HICE지수를 선택해주세요!</div>
                </div>

                <div class="travelGrade">
                    <div class="travelBox">
                        <h3>여행스타일</h3>
                        <ul class="travelStyle travel">
                            <li>
                                <label><input class="styleSelect" type="radio" name="tripStyle" value="T" /><img src="/img/tight.png" width="50">타이트 </label>
                                <label><input class="styleSelect" type="radio" name="tripStyle" value="S" /><img src="/img/smooth.png" width="50">스무스</label>
                            </li>
                        </ul>
                        <h3>여행테마</h3>
                        <ul class="travelType travel">
                        	<input type="hidden" name ="contentsType" value="H"/>
                            <li><label><input type="checkbox" name="theme" value="196"/>TV여행</label></li>
                            <li><label><input type="checkbox" name="theme" value="191"/>힐링여행</label></li>
                            <li><label><input type="checkbox" name="theme" value="197"/>도심여행</label></li>
                            <li><label><input type="checkbox" name="theme" value="192"/>액티비티</label></li>
                            <li><label><input type="checkbox" name="theme" value="195"/>식도락</label></li>
                            <li><label><input type="checkbox" name="theme" value="198"/>역사·문화</label></li>
                            <li><label><input type="checkbox" name="theme" value="194"/>감성여행</label></li>
                            <li><label><input type="checkbox" name="theme" value="193"/>야경여행</label></li>
                        </ul>
                        <h3>검색태그</h3>
                        <ul class="searchTag travel">
                            <li><label>#<input class="inputTag" placeholder="태그1" name="tag1" autocomplete="off"/></label><ul class="tagList"></ul></li>
                            <li><label>#<input class="inputTag" placeholder="태그2" name="tag2" autocomplete="off"/></label><ul class="tagList"></ul></li>
                            <li><label>#<input class="inputTag" placeholder="태그3" name="tag3" autocomplete="off"/></label><ul class="tagList"></ul></li>
                        </ul>
                    </div>
                </div><!--//travelGrade-->
            </div><!--//donerGrade-->
            <button id="cancelBtn" class="hLogBtn" type="button">취소</button>
            <button class="hLogBtn">등록</button>
            </div><!--//contentsWrap-->
        </fieldset>
    </form>
</div><!--//formWrap-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="searchTmp">
    <@ _.each(searchList,function(search){@>
        <li class="selectSpot"><@=search.name@></li>
    <@ }) @>
</script>
<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/markdown-it.js"></script>
<script src="/js/to-mark.min.js"></script>
<script src="/js/codemirror.js"></script>
<script src="/js/highlight.js"></script>
<script src="/js/squire-raw.js"></script>
<script src="/js/tui-editor-Editor.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/tui-time-picker.min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>
<script>
    var $heroForm = $('#formWrap>form');
    var $heroImgName = $('#heroImgName');
    var $heroImg = $('#heroImg');
    var $heroImage = $('#heroImage');
    var heroReg = /^image/;
    var oldHero = null;
    
    var num = 0;

    $('#cancelBtn').click(function() {
		var test = confirm("정말 취소하시겠습니까?");
		if(test == true){
			location.href = '/hlog';
		}else{
			return false;
		}
	});
    
    $(document).ready(function() {
		//alert("test");
		$('.delectImage').hide();
	});

    function checkHeroImage() {
        var heroImage = $heroImage.get(0);

        var file = heroImage.files[0];
        if(file==null || file.size<=0){
            return;
        }// if end
        if(!heroReg.test(file.type)){
            alert("이미지 파일로 선택해주세요.");
            return;
        } //if end
        if(oldHero!=file.name){
            oldHero = file.name;
            var form = new FormData();

            form.append("type","H");
            form.append("uploadImage",file,file.name);

            $.ajax({
                url:"/ajax/hlog/hero/upload",
                dataType:"json",
                type:"POST",
                processData: false,
                contentType:false,
                data:form,
                error:function () {
                    alert("서버 점검 중입니다.");
                },
                success:function (json) {
                    $heroImg.attr("src","/img/upload/"+json.src);
                    console.log(json.src);
                    $heroImg.removeClass("no_image");
                    
                    $heroImgName.val(json.src);
                    console.log($heroImgName.val());
                    $('#heroWrap').css("background-color","transparent");
                    $('.colorSelecter').hide();
                    $('.delectImage').show();
                    $('.imageDelete').removeClass("no_image");
                    num = 0;
                }
            });//ajax() end
        }//if end
    }//checkHeroImage() end

    $heroImage.change(checkHeroImage); // change() end

    $('.lockSelecter').click(function () {
        var flag = $('.lockSelecter i').hasClass('fa-lock');
        if(flag){
            $('.lockSelecter i').removeClass('fa-lock');
            $('.lockSelecter i').addClass('fa-lock-open');
            $('.lockSelecter span').text("공개");
            $('#lock').attr("value","Y");
            console.log($('#lock').attr("value"));
        }else {
            $('.lockSelecter i').removeClass('fa-lock-open');
            $('.lockSelecter i').addClass('fa-lock');
            $('.lockSelecter span').text("비공개");
            $('#lock').attr("value","N");
            console.log($('#lock').attr("value"));
        }
    });

    $('.delectImage').click(function() {
		$heroImage.val("");
		$heroImgName.val("");
		$heroImg.addClass("no_image");
		$('.delectImage').hide();
		$('.colorSelecter').show();	
	});
    

    /* datePickter */
    var today = new Date();
    var picker = tui.DatePicker.createRangePicker({
        startpicker: {
            date: today,
            input: '#startpicker-input',
            container: '#startpicker-container'
        },
        endpicker: {
            date: today,
            input: '#endpicker-input',
            container: '#endpicker-container'
        },
        selectableRanges: [
            [today, new Date(today.getFullYear() + 1, today.getMonth(), today.getDate())]
        ],
        language: "ko"
    });
 
    /* TOAST UI Editor */
    var editor = new tui.Editor({
        el: document.querySelector('#editSection'),
        initialEditType: 'wysiwyg',
        previewStyle: 'vertical',
        height: '600px',
        language:"ko",
        toolbarItems: [
            'heading','bold','italic','strike','divider',
            'hr','quote','divider',
            'ul','ol','task','divider',
            'table','link','divider'
        ]
    });
    
    var $uploadImage = $("#uploadImage");
    var fileTypeExp = /^image\//;

    $('.te-mode-switch-section').attr("style","display:none");

    const toolbar = editor.getUI().getToolbar();
    editor.eventManager.addEventType('imageEvent');

    editor.eventManager.listen('imageEvent', function() {
        $uploadImage.click();
    });//listen() end

    toolbar.addButton({
        name: 'addImage',
        event: 'imageEvent',
        tooltip: '이미지 입력',
        $el: $('<button class="btn_image"><i class="fas fa-image"></i></button>')
    });

    
    $uploadImage.change(function() {
        var file = this.files[0];

        console.log(file);

        if(file.size==0) {
            alert("제대로 된 파일을 선택해주세요.");
            return;
        }

        //console.log(fileTypeExp.test(file.type));

        if(!fileTypeExp.test(file.type)) {
            alert("이미지만 선택해주세요.");
            return;
        }

        //alert("여기에 오면 파일이 있고 사진임");

        var form = new FormData();

        form.append("uploadImage",file,file.name);
        form.append("type","B");

        $.ajax({
            url: '/ajax/uploadImage.jsp',
            processData: false,
            contentType: false,
            data: form,
            type: 'POST',
            dataType:"json",
            error:function(xhr,error,code) {
                alert("에러:"+code);
            },
            success: function(result){
                console.log(result.src);
                var squireExt = editor.wwEditor.getEditor();
                squireExt.insertHTML("<img src='/img/"+result.src+"'>");
                $uploadImage.val("");
            }
        });//ajax() end
    });//change() end


    function hiceText(index) {
        if (index == 0) {
            $('#evaluation').text("혼자 완전 강추해요");
        } else if (index == 1) {
            $('#evaluation').text("혼자가기 매력적이에요");
        } else if (index == 2) {
            $('#evaluation').text("혼자 무난 했어요");
        } else if (index == 3) {
            $('#evaluation').text("혼자 갈순 있어요");
        } else if (index == 4) {
            $('#evaluation').text("혼자 가지 마세요");
        } else {
            $('#evaluation').text("");
        }
    } //hiceText() end

    var $hiceValue = $('#hiceValue');
    /* 아이스크림 클릭 시 평점 주기 */
    $(".ice").on("click", function () {
        var idx =$(this).index();
        var value = $(this).data("hice");
        $('#hiceValue').attr("value",value);
        console.log($hiceValue.attr("value"));
        $(".ice").children().removeClass('on');
        $(this).children().addClass("on");
        hiceText(idx);

    });//click() end

    $('.travelType input').on("change",function () {
        if($(".travelType input:checked").length < 4){
            $(this).parent().toggleClass("color");
            console.log($(this).val());
        } else {
            alert("3개만 선택해주세요.");
            $(this).prop("checked",false);
        }//if ~ else end
    });//change() end


    $(".styleSelect").click(function () {
        console.log($(this).val());
        $('.travelStyle label').removeClass("selectTravel");
        $(this).parent().addClass("selectTravel");
    }); // click() end

    
    /* 2018-11-30 태그검색*/
    function ckeckedTag(name) {
		_.ajax({
			url : "ajax/checkTag.jsp",
			type: "post",
			dataType : "json",
			data : {"name" : name},
			error:function(requset, status, error){
				alert("서비스 점검중입니다. ");
				console.log(requset+status+error);
			},
			success:function(json){
				
			}
		});//ajax() end
	}//cheackedTag() end
    
    
    /*     $(".sdfas").keyup(function() {
        	var that = this;
        	
        	$.ajax({
        		success:function() {
        			$(that).next().append
        		}
        	})
        	
        }) */
    
	
    
    /* 2018-11-21 배경색*/
    function colorChange() {
        var color = ["#F67066", "#F8972E","#FABB11","#23B877","#00C3BD","#50A1C3","#7878BC","#536B82","#A97857","#555555"];
        /* console.log(color[num]); */
        $("#heroColor").val(color[num]);
        if(num < 10 ){
            $('#heroWrap').css("background-color",color[num]);
            num++;
        }else if(num == 9){
            num = 0;
        }else {
            $('#heroWrap').css("background-color","transparent");
            num=0;
        } // if ~ else if ~ else end
    }//colorChange() end
    $('.colorSelecter').click(colorChange);//click() end
    

    $heroForm.submit(function () {
        var value = editor.getValue();
        $("#hLogContents").val(value);
    });//submit() end

</script>
</body>
</html>