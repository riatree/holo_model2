<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>registerForm</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/default.css"/>
    <link rel="stylesheet" href="css/kakao.font.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <style>
        body {
            font: 16px "Kakao", "Noto Sans KR", "나눔고딕", NanumGothic, "맑은고딕", "Malgun Gothic", "돋움",
                  Dotum, "Helvetica Neue", Helvetica, AppleSDGothicNeo, sans-serif, "Apple Color Emoji", "Segoe UI Emoji",
                  NotoColorEmoji, "Segoe UI Symbol", "Android Emoji", EmojiSymbols;
            background-color: #EFEBE9;
        }

        #header h1 {
            width: 150px;
            position: relative;
            margin: auto;
        }

        .aux {
            width: 1080px;
            padding-top: 70px;
            margin: auto;
        }

        #contentWrap h2 {
            text-align: center;
            font-size: 36px;
            font-weight: bold;
            margin: 36px;
        }

        #contentWrap img {
            vertical-align: middle;
            margin-right: 20px;
        }

        #joinBox {
            width: 550px;
            margin: auto;
        }

        #joinBox .row {
            margin-top: 20px;
        }

        #joinBox .label {
            display: block;
            font-size: 18px;
            color: #666;
            height: 20px;
            line-height: 20px;
            margin-bottom: 10px;
            font-weight: 900;
        }

        #joinBox .msg {
            color: #D32F2F;
            padding-top: 20px;
            font-weight: 500;
        }

        #joinBox .msg.ok {
            color: #14BAB6;
        }

        #joinBox input {
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
        }

        #joinBox input:focus {
            outline: 2px solid #14bab6;
        }

        #joinBox #profile {
            font-size: 15px;
            cursor: pointer;
            height: 30px;
        }

        #birthDate {
            display: inline-block;
            text-align: right;
        }

        #birthDate input {
            width: 119px;
        }

        #birthDate label {
            font-size: 21px;
        }

        #gender input {
            width: 30px;
            outline: none;
            vertical-align: middle;
            display: none;
        }
        #gender label {
            margin-left: 100px;
            width: 100px;
            display: inline-block;
            font-size: 30px;
            cursor:pointer;
        }

        .fa-female{
            color: #f00;
        }
        .fa-male{
            color: #007cff;
        }
        .select{
            font-weight: bold;
            transform: scale(1.2);
            color: #8D6E63;
            text-shadow: 3px 3px 10px #BCAAA4;
        }

        #email input {
            width: 130px;
            vertical-align: middle;
        }

        #email select, option {
            width: 130px;
            height: 62px;
            padding-left: 10px;
            font: 16px "Kakao", "Noto Sans KR", "나눔고딕", NanumGothic, "맑은고딕", "Malgun Gothic", "돋움", Dotum, "Helvetica Neue", Helvetica, AppleSDGothicNeo, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", NotoColorEmoji, "Segoe UI Symbol", "Android Emoji", EmojiSymbols;
            font-weight: bold;
        }

        #phoneNum input {
            width: 115px;
        }

        #phoneNum select {
            width: 150px;
            height: 62px;
            font: 25px "Kakao", "Noto Sans KR", "나눔고딕", NanumGothic, "맑은고딕", "Malgun Gothic", "돋움", Dotum, "Helvetica Neue", Helvetica, AppleSDGothicNeo, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", NotoColorEmoji, "Segoe UI Symbol", "Android Emoji", EmojiSymbols;
            text-indent: 30px;
        }
        #profileBox {
            width: 140px;
            height: 140px;
            text-align: center;
            font-size: 140px;
            position: relative;
            color: #ddd;
            border-radius: 140px;
            display: block;
            margin: auto;
        }

        #profileBox.no_image #profileImg {
            display: none;
        }

        #profileBox label {
            width: 40px;
            height: 40px;
            position: absolute;
            bottom: 4px;
            right: 4px;
            background: #9E9E9E;
            font-size: 20px;
            line-height: 40px;
            text-align: center;
            border-radius: 40px;
            cursor: pointer;
            color: #fff;
            border: 2px solid #fff;
        }

        #profileBox label:hover {
            background: #14bab6;
        }

        #profileRow {
            height: 210px;
            position: relative;
        }

        #profile {
            display: none;
        }

        #profileImg {
            width: 140px;
            height: 140px;
            position: absolute;
            left: 0;
            top: 0;
            border-radius: 140px;
        }

        #profileBox.no_image .delete {
            display: none;
        }

        .delete {
            width: 24px;
            height: 24px;
            border-radius: 24px;
            text-align: center;
            line-height: 24px;
            cursor: pointer;
            position: absolute;
            border: none;
            outline: none;
            right: 8px;
            top: 8px;
            background: #9E9E9E;
            display: block;
        }

        .delete:hover {
            background: #14bab6;
            color: #fff;
        }

        .btn {
            border:0;
            margin:0;
            padding:8px 14px;
            background:#4D525A;
            color:#fff;
            text-decoration: none;
            font-weight: 500;
            box-sizing: content-box;
            display: inline-block;
            font-size:18px;
            line-height: normal;
        }
        button.btn {
            cursor: pointer;
            font: 18px "Kakao","Noto Sans CJK KR Thin","나눔고딕",NanumGothic,"맑은고딕","Malgun Gothic","돋움",Dotum,"Helvetica Neue",Helvetica,AppleSDGothicNeo,sans-serif,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Segoe UI Symbol","Android Emoji",EmojiSymbols;
        }

        .btn:hover {
            background:#14BAB6;
            color:#fff;
            box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }

        /* firefox가 가진 버튼의 크기를 없애줌 */
        button::-moz-focus-inner {
            padding: 0;
            border: 0
        }

        .box_btn {
            padding: 10px 0;
            text-align: right;
        }
        #theme{
            width: 500px;
            height: 80px;
        }
        #theme input{
            width: 30px;
            vertical-align: middle;
            display: none;
        }
        #theme label{
            width: 90px;
            height: 30px;
            display: inline-block;
            font-size: 20px;
            cursor: pointer;
            margin: 5px 10px;
            text-align: center;
            line-height: 30px;
        }

    </style>
</head>
<body>
<div id="header">
    <h1><a href="index.html"><img src="img/holo.png" width="150" height="70"/></a></h1>
</div> <!--//header-->

<div id="contentWrap">
    <div class="aux">
        <h2 class="title"><img src="img/doner.png" width="50"/>회원가입</h2>
        <div id="joinBox">
            <form action="register.jsp" method="post">
                <fieldset>
                    <legend class="screen_out">회원가입폼</legend>
                    
                    <input type ="hidden" name="blacklist" value="Y"/>
                    
                    <div class="row">
                        <label class="label" for="id">아이디</label>
                        <input id="id" name="id" autocomplete="off" placeholder="아이디를 입력해주세요" title="영어,숫자 4~20자 입력"/>
                        <div class="msg id">아이디를 입력해주세요.</div>
                    </div><!--//row--> <!--아이디-->

                    <div class="row">
                        <label class="label" for="nickname">별명</label>
                        <input id="nickname"
                               name="nickname"
                               placeholder="별명을 입력해주세요"
                               title="4~32자로 입력"/>
                        <div class="msg nickname">별명을 입력해주세요</div>
                    </div><!--//row--> <!--nickname-->

                    <div class="row">
                        <label class="label" for="pwd">비밀번호</label>
                        <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요"/>
                        <div class="msg pwd"></div>
                    </div><!--//row--> <!--pwd-->

                    <div class="row">
                        <label class="label" for="confirm">비밀번호 확인</label>
                        <input type="password" id="confirm"
                               placeholder="위와 동일하게 입력"
                               title="위와 동일하게 입력"/>
                        <div class="msg confirm"></div>
                    </div><!--//row--> <!--confirm-->

                    <div class="row">
                        <span class="label" for="gender">성별</span>
                        <p id="gender">
                            <label for="female" class="lbl select"><i class="fas fa-female"></i> 여성</label><input id="female" name="gender" class="input_sex"   value="F"  type="radio" checked/>
                            <label for="male"  class="lbl"><i class="fas fa-male"></i> 남성</label><input id="male" name="gender"  class="input_sex" value="M" type="radio"/>
                        </p>
                    </div><!--//row--> <!--gender-->

                    <div class="row">
                        <span class="label" for="birthDate">생년월일</span>
                        <p id="birthDate">
                            <label>
                                <input type="text" id="year" name="year"
                                       maxlength="4"
                                       title="태어난 년도를 입력"
                                       placeholder="년(4자리)"/></label>
                            <label>
                                <input type="text" id="month" name="month"
                                       maxlength="2"
                                       title="태어난 월을 입력"
                                       placeholder="월"/>
                            </label>
                            <label>
                                <input type="text" id="date"
                                       name="date"
                                       title="태어난 일을 입력"
                                       maxlength="2"
                                       placeholder="일"/>
                            </label>
                        </p>
                        <div class="msg birth"></div>
                    </div><!--//row--> <!--//birthDate-->

                    <div class="row">
                        <span class="label" for="email">이메일</span>
                        <p id="email">
                            <label><input id="emailId" name="emailId" autocomplete="off" placeholder="이메일"/></label>
                            <span> @ </span>
                            <input id="domain" name="domain" autocomplete="off" placeholder="직접입력">
                            <select id="emailSelect" name="domain">
                                <option value="1">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                        </p>
                        <div class="msg email"></div>
                    </div><!--//row-->
                    
                    <div class="row">
                        <span class="label">휴대전화</span>
                        <p id="phoneNum">
                            <select name="phone1">
                                <option>010</option>
                                <option>011</option>
                                <option>017</option>
                            </select> -
                            <input name="phone2" id="phone2" class="phone" placeholder="숫자입력" maxlength="4"/>
                             -
                            <input name="phone3" id="phone3" class="phone" placeholder="숫자입력" maxlength="4"/>
                        </p>
                        <div class="msg phone"></div>
                    </div><!--//row-->
                    
                    <div class="row">
                        <label class="label" for="name">실명</label>
                        <input id="name" name="name" placeholder="이름을 입력해주세요"/>
                        <div class="msg name"></div>
                    </div><!--//row-->

                    <div class="row" id="profileRow">
                        <span class="label">프로필사진</span>
                        <div id="profileBox" class="fas fa-user-circle no_image">
                            <img src="/img/profile/profile.png" width="140" height="140" id="profileImg"/>
                            <label class="fas fa-camera">
                                <input type="file" name="profile" id="profile"/>
                            </label>
                            <button type="button" class="delete fas fa-times"><span class="screen_out">삭제</span>
                            </button>
                        </div><!-- //profileBox -->
                        <div class="msg profile">동행을 위해 필요합니다.</div>
                    </div><!--//profileRow -->

                    <div class="box_btn">
                        <button class="btn" type="submit"><i class="fas fa-sign-in-alt"></i> 회원가입</button>
                        <button class="btn" type="reset"><i class="fas fa-redo"></i> 초기화</button>
                        <a class="btn" href="/index"><i class="far fa-list-alt"></i> index으로</a>
                    </div><!--//box_btn -->
                </fieldset>
            </form>
        </div><!--//joinBox-->
    </div><!--//aux-->
</div><!--//contentWrap-->
<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script>
    var $emailSelect = $('#emailSelect'),
        $domain = $('#domain');

    $emailSelect.change(function () {
        $('#emailSelect option:selected').each(function () {
            if($(this).val() == '1'){
                $domain.val('');
                $domain.attr('disabled',false);
            }else {
                $domain.val($(this).text());
                $domain.attr('disabled',true);
            } // if() ~  else end
        });//each() end
    });//change() end
    
    var $joinBox = $("#joinBox>form"), 
    	$id = $('#id'),
    	$pwd = $("#pwd"),
    	$confirm = $('#confirm'),
    	$nickname = $('#nickname'),
        $year = $("#year"),
        $month = $("#month"),
        $date = $("#date"),
        $email = $("#emailId"),
        $phone2 = ("#phone2"),
        $phone3 = ("#phone3"),
        $name = $('#name'),

    	$idMsg = $('.msg.id'),
    	$nicknameMsg = $('.msg.nickname'),
        $pwdMsg = $('.msg.pwd'),
        $confirmMsg = $('.msg.confirm'),
        $birthMsg = $(".msg.birth"),
        $emailMsg = $(".msg.email"),
        $nameMsg = $(".msg.name"),
        $phoneMsg = $(".msg.phone"),
        
        idReg = /^[a-z|A-Z][\w]{3,19}$/,
        pwdReg = /^[\w]{4,32}$/,
        nicknameReg = /^[ㄱ-힣|\w]{2,6}$/,
        phoneReg = /^[0-9]{3,4}$/,
        nameReg = /^[ㄱ-힣]{2,4}$/,
        
        isValidId = false,
        isValidNickname = false,
        isValidPwd = false,
        isValidConfirmPwd = false,
        isValidBirth = false,
        isValidPhone = false,
        isValidName = false,
        isValidEmail = false,
        isValidDomain = false,
        
        
        
        oldId = "",
        oldNickname = "";
        
    var $profile = $('#profile');
    var $profileMsg = $('.msg.profile');
    var profileReg = /^image/;

    function checkId() {
        var value = $id.val();

        if(oldId != value){
            oldId = value;

            if (idReg.test(value)){
                isValidId = false;
                $idMsg.removeClass("ok").text("확인중...");
                $.ajax({
                    url:"/ajax/dounor/check/id",
                    dataType : "json",
                    data:{"id":value},
                    error:function(){
                        alert("서버 점검중!");
                    },
                    success:function(json){
                        if(json.count==0){
                            isValidId = true;
                            $('.msg.id').addClass('ok').text("아주 좋은 아이디입니다.");
                        }else {
                            isValidId = false;
                            $('.msg.id').removeClass("ok").text("이미 사용중이거나 탈퇴한 아이디입니다.");
                        }//if ~ else end
                    }
                });//ajax end
            }else {
                $idMsg.removeClass("ok").text("아이디를 영어, 숫자 4~20글자로 입력해주세요.");
            }//if ~ else end
        }//if end
    }//checkId() end
    
    function checkPwd() {
        if(pwdReg.test($pwd.val())){
            $pwdMsg.addClass("ok").text("좋은 비밀번호입니다.");
            return true;
        } else{
            $pwdMsg.removeClass("ok").text("영어,숫자 4~32글자로 입력해주세요.");
            return false;
        }
    }//checkPwd() end
    
    function checkConfirm() {
        if($pwd.val() == $confirm.val()){
            $confirmMsg.addClass("ok").text("비밀번호가 일치합니다.");
            return true;
        } else {
            $confirmMsg.removeClass("ok").text("비밀번호가 일치하지 않습니다.");
            $pwd.focus();
            return false;
        }
    }//checkConfirm() end
    
    function checkNickname() {
        var value = $nickname.val();
        if(oldNickname != value){
            oldNickname = value;

            if (nicknameReg.test(value)){
                isValidNickname = false;
                $nicknameMsg.removeClass("ok").text("확인중...");
                $.ajax({
                    url:"/ajax/dounor/check/nickname",
                    dataType : "json",
                    data:{"nickname":value},
                    error:function(){
                        alert("서버 점검중!");
                    },
                    success:function(json){
                        if(json.count==0){
                            isValidNickname = true;
                            $nicknameMsg.addClass('ok').text("아주 좋은 별명입니다.");
                        }else {
                            isValidNickname = false;
                            $nicknameMsg.removeClass("ok").text("이미 사용중인 별명입니다.");
                        }//if ~ else end
                    }
                });//ajax end
            }else {
                $nicknameMsg.removeClass("ok").text("닉네임을 2~6글자로 입력해주세요.");
            }//if ~ else end
        }//if end
    }//checkNickname() end
	
    function checkBirthDate() {
		var year = $year.val(),
			month = $month.val(),
			date = $date.val();
		
		var birth = moment([year,month-1,date]);
		
		if(birth.isValid()){
			isValidBirth = true;
			$birthMsg.addClass("ok").text("");
		} else{
			isValidBirth = false;
			$birthMsg.removeClass("ok").text("제대로 된 생년월일을 입력해주세요.");
		} //if ~ else end
	}//checkBirthDate() end
	
	function checkName() {
		var name = $name.val();
		if(nameReg.test(name)){
			$nameMsg.addClass("ok").text("멋진 이름입니다."); 
			return true;
		}else{
			$nameMsg.removeClass("ok").text("제대로 된 이름을 입력해주세요.");
			return false;
		}//if ~ else end
	}//checkName() end
	
	function checkEmail() {
		var email = $email.val();
		console.log(email);
		if(email!=0){
			$emailMsg.addClass("ok").text("멋진 이메일입니다.");
			return true;
		}else {
			$emailMsg.removeClass("ok").text("제대로 된 이메일을 입력해주세요.");
		}
	}//checkEmail() end
	
    $id.keyup(checkId); //keyup() end
    $pwd.keyup(checkPwd); //keyup() end
    $nickname.keyup(checkNickname);//keyup() end
    $year.keyup(checkBirthDate); //keyup() end
    $month.keyup(checkBirthDate); //keyup() end
    $date.keyup(checkBirthDate); //keyup() end
	
    $name.keyup(checkName); //keyup() end
    
    $email.keyup(checkEmail);
    
    $id.blur(checkId); //blur() end
    $nickname.blur(checkNickname); //blur() end
    $confirm.blur(checkConfirm); // blur() end

    $(".input_sex").change(function () {
        //alert("test");
        $("#gender>.lbl").removeClass("select");
        $(this).prev().addClass("select");
    });//change() end

    
    $profile.change(function() {
        var profile = $profile.get(0);
        var file = profile.files[0];

        console.log(this.files);
        console.log(file);
        
            $profileMsg.removeClass("ok").text("제대로된 파일을 선택해주세요.");
        if( file.size <=0 ){
            return;
        }//if end
        if(!profileReg.test(file.type)){
            $profileMsg.removeClass("ok").text("이미지 파일을 선택해주세요.");
            return;
        }else{
            $profileMsg.text("");
        } // if ~ else end

        var form = new FormData();

        form.append("type","P"); //일반적인 데이터
        form.append("uploadImage",file,file.name);

        $.ajax({
            url : "ajax/uploadImage.jsp",
            dataType : "json",
            type:"POST",		//multipart/form-data
            processData:false,  //multipart/form-data
            contentType:false,  //multipart/form-data
            data:form,
            error:function(){
                alert("서버 점검 중");
            },
            success:function(json){
                $('#profileImg').attr("src",json.src);
                $("#profileBox").removeClass("no_image");
            }
        });//ajax() end

    });//change() end

    $('.delete').click(function() {
        $profile.val("");
        $("#profileBox").addClass("no_image");
    });//click() end

    $joinBox.submit(function () {
    	
        if(!isValidId){
            $idMsg.removeClass("ok").text("아이디를 영어, 숫자 4~20글자로 입력해주세요.");
            $id.focus();
            return false;
        }//if end
        if(!isValidNickname){
            $nicknameMsg.removeClass("ok").text("별명을 2~8글자로 입력해주세요.");
            $nickname.focus();
            return false;
        }//if end
        if(!checkPwd()){
        	$pwd.focus();
            return false;
        }//if end
        if(!checkConfirm()){
            return false;
        }//if end
        if(!isValidBirth){
        	$birthMsg.removeClass("ok").text("제대로 된 생년월일을 입력해주세요.");
        	return false;
        }
        if(!checkName()){
        	$name.focus();
        	return false;
        }
        
    });//submit() end
    
</script>
</body>
</html>