<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>HOLO</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/tui-date-picker_togetherRegister.css">
<link rel="stylesheet" href="/css/popLogin.css">
</head>
<style>
body {
	font: 16px "Kakao", "Noto Sans KR", "나눔고딕", NanumGothic, "맑은고딕",
		"Malgun Gothic", "돋움", Dotum, "Helvetica Neue", Helvetica,
		AppleSDGothicNeo, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
		NotoColorEmoji, "Segoe UI Symbol", "Android Emoji", EmojiSymbols;
}

button {
	font-family: "kakao", sans-serif;
}
img {
	margin-left: 380px;
	width: 80px;
	height: 80px;
	float: left;
}

.title {
	margin-left: 380px;
	width: 150px;
	height: 50px;
	float: left;
	color: #773A16;
	/*background-color: #FFC107;*/
}

#contentsWrap {
	width: 1080px;
	padding-top: 90px;
	margin: auto;
}

#contentsWrap h2 {
	text-align: center;
	font-size: 32px;
	font-weight: bold;
	margin: 20px;
}

#spotBox {
	width: 500px;
	margin: auto;
	/*background-color: #FFC107;*/
}

#spotBox .row {
	margin-top: 20px;
}

#spotBox .label {
	display: block;
	font-size: 18px;
	color: #666;
	height: 20px;
	line-height: 20px;
	margin-bottom: 10px;
	font-weight: 900;
}

#spotBox .msg {
	color: #D32F2F;
	padding-top: 20px;
	font-weight: 500;
}

#spotBox .msg.ok {
	color: #C69963;
}

.radio>input[type="radio"] {
	width: 100px;
	height: 30px;
}

#spotBox .input>input {
	border: none;
	width: 456px;
	height: 30px;
	font-size: 21px;
	font-family: 'Kakao', sans-serif;
	font-weight: 500;
	padding: 15px 22px;
	color: #606060;
	transition: .2s ease;
	outline: 1px solid #dadada;
	position: relative;
}

#spotBox .textarea>input {
	border: none;
	width: 456px;
	height: 70px;
	font-size: 21px;
	font-family: 'Kakao', sans-serif;
	font-weight: 500;
	padding: 15px 22px;
	color: #606060;
	transition: .2s ease;
	outline: 1px solid #dadada;
	position: relative;
}

#spotBox select {
	border: none;
	width: 500px;
	height: 50px;
	font-size: 21px;
	font-family: 'Kakao', sans-serif;
	font-weight: 500;
	padding: 15px 22px;
	color: #606060;
	transition: .2s ease;
	outline: 1px solid #dadada;
	position: relative;
}

#spotBox .input>input:focus {
	outline: 2px solid #C69963;
}

#spotBox .textarea>input:focus {
	outline: 2px solid #C69963;
}

.input .datepicker {
	width: 500px;
	height: 50px;
	font-size: 20px;
	text-align: center;
	display: block;
	outline: 1px solid #dadada;
}

.searchSpot {
	right: 460px;
	top: 240px;
	position: absolute;
	width: 100px;
	height: 30px;
	color: white;
	outline: none;
	background-color: #C69963;
	border-radius: 10px;
	border: none;
	font-size: 16px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	cursor: pointer;
}

.searchSpot:hover {
	transform: scale(1.1);
}

.searchSpot:active {
	transform: scale(.9);
}

.box_btn {
	/*background-color: #FFC107;*/
	width: 1080px;
	height: 200px;
	margin-top: 20px;
	margin-left: 60px;
}

.btn {
	margin: 10px 10px;
	display: block;
	float: left;
	width: 100px;
	height: 30px;
	outline: none;
	background-color: #C69963;
	border-radius: 10px;
	border: none;
	font-size: 14px;
	box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0
		rgba(0, 0, 0, 0.12);
	cursor: pointer;
}

.box_btn a {
	color: black;
	text-decoration: none;
	line-height: 30px;
	text-align: center;
}

.btn:hover {
	transform: scale(1.1);
}

.btn:active {
	transform: scale(.9);
}

#result {
	width: 500px;
	position: relative;
	background-color: #C69863;
	overflow: auto;
	z-index: 4;
}

#result>li {
	width: 498px;
	height: 40px;
	background-color: #D7CCC8;
	cursor: pointer;
	line-height: 40px;
	text-align: center;
	border-right: 1px solid #424242;
	border-left: 1px solid #424242;
	border-bottom: 1px solid #424242;
}
</style>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>

	<div id="contentsWrap">
		<div class="aux">
			<img src="/img/brown3.png">
			<h2 class="title">동행 등록</h2>
			<div id="spotBox">
				<form method="POST" action="/together">
					<fieldset>
						<legend class="screen_out">동행 등록폼</legend>
						<div class="row input">
							<label class="label" for="addr1">동행을 원하는 장소</label>
							<input class="addr1" id="addr1" name="spotName" autocomplete="off"
								placeholder="장소를 검색하세요." title="동행을 원하는 장소" />
							<input type="hidden" name="noSpot" id="noSpot">
							<ul id="result"> </ul>

							<script type="text/template" id="searchTmp">
   						 	<@ _.each(searchList,function(search){@>
       					 		<li class="selectSpot" data-no="<@=search.no@>"><@=search.name@></li>
    					 	<@ }) @>
							</script>

							<div class="row input">
								<label class="label">동행을 원하는 날짜</label>
								<input name="meetDate" type="text" id="datepicker-input1" aria-label="Date-Time" class="datepicker">
								<!--<span class="tui-ico-date"></span>-->
								<div id="wrapper1" style="margin-top: -1px;"></div>
							</div>
							<!--//row-->
							<div class="row input">
								<label class="label" for="personnel">동행을 같이 하고 싶은 인원 수 (자신포함)</label>
								<input id="personnel" name="personnel" placeholder="인원 수만 정확하게 입력하세요." />
							</div>
							<!--//row-->
							<div class="row input">
								<label class="label" for="time">시간대</label>
								<select class="timeFilter" name="meetTime" id="time">
									<option value="00:00~02:00" selected="selected">00:00~02:00</option>
									<option value="02:00~04:00">02:00~04:00</option>
									<option value="04:00~06:00">04:00~06:00</option>
									<option value="06:00~08:00">06:00~08:00</option>
									<option value="08:00~10:00">08:00~10:00</option>
									<option value="10:00~12:00">10:00~12:00</option>
									<option value="12:00~14:00">12:00~14:00</option>
									<option value="14:00~16:00">14:00~16:00</option>
									<option value="16:00~18:00">16:00~18:00</option>
									<option value="18:00~20:00">18:00~20:00</option>
									<option value="20:00~22:00">20:00~22:00</option>
									<option value="22:00~24:00">22:00~24:00</option>
								</select>
							</div>
							<!--//row-->
							<div class="row input">
								<label class="label" for="kakaoLink">오픈 KAKAO TALK 링크</label>
								<input id="kakaoLink" name="kakao"
									placeholder="오픈 카카오톡 링크를 입력하세요." title="오픈 카카오톡 링크" />
							</div>
							<!--//row-->
							<div class="row">
								<label class="label">모집 성별</label>
								<label class="radio"><input type='radio' name='gender' value='A' checked='checked' />상관없음</label>
								<label class="radio"><input type='radio' name='gender' value='F' />여자만</label>
								<label class="radio"><input type='radio' name='gender' value='M' />남자만</label>
							</div>
							<!--//row-->
							<div class="row textarea">
								<label class="label" for="intro">간단한 소개</label>
								<input id="intro" name="contents" placeholder="간단한 소개글을 입력하세요." title="간단한 소개글" />
							</div>
							<!--//row-->

							<div class="box_btn">
								<button class="btn"><i class="fas fa-sign-in-alt"></i>동행신청</button>
								<button class="btn" type="reset"><i class="fas fa-redo"></i> 초기화</button>
								<a class="btn" href="/together"><i class="far fa-list-alt"></i>	동행메인으로</a>
							</div>
							<!--//box_btn -->
					</fieldset>
				</form>
			</div>
			<!--// spotBox -->
		</div>
	</div>


	<c:import url="/WEB-INF/template/popLogin.jsp" ></c:import>
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src="/js/tui-time-picker.min.js"></script>
	<script src="/js/tui-date-picker.min.js"></script>

	<script>
		
		_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
		};
		
		var tmp = _.template($("#searchTmp").html());
		
		function searchKeyword(searchWord){
	        $.ajax({
	            url:"/ajax/together/spot/" + searchWord,
	            type:"get",
	            dataType:"json",
	            error:function (requset, status, error) {
	                alert(requset+status+error);
	            },
	            success:function (json) {
	            	$('#result').children().remove();
	            	
	            	console.log(json);
	            	
	                $("#result").append(tmp({"searchList":json}));
	            }
	        });//ajax() end
	    }//searchKeyword() end	
	    
	    $('#addr1').keyup(function () {
	        var searchWord = $('#addr1').val();
	        var length = searchWord.length;
	        // console.log(length);
	        if(length == 0){
	            $('#result').hide();
	            $('#result').children().remove();
	        } else{
	            $('#result').show();
	            searchKeyword(searchWord);
	        }
	    });
		$("#result").on("click",".selectSpot",function(){
			 var text = $(this).text();
			 
			 var no = this.dataset.no;
			 
			 console.log(no);
			 
		     $("#addr1").val(text);
		     $("#noSpot").val(no);
		     $("#result").hide();
		});
	
	
		var datepicker1 = new tui.DatePicker('#wrapper1', {
			date : new Date(),
			input : {
				element : '#datepicker-input1',
				format : 'yyyy-MM-dd'
			},
			language : 'ko'
		});

		datepicker1.on('change', function() {
			var newDate = datepicker.getDate();

			console.log(newDate);
		});

		$('.applyBtn button').click(function() {
			alert("동행신청이 완료되었습니다.")
		});
	</script>
	<script src="/js/dounorPop.js"></script>
	<script src="/js/login.js"></script>
</body>
</html>
