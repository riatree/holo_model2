<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HOLO</title>
    <c:import url="/WEB-INF/template/link.jsp" ></c:import>
    <link rel="stylesheet" href="/css/together.css"/>
    <link rel="stylesheet" href="/css/paginate.css"/>
    <link rel="stylesheet" href="/css/tui-date-picker_together.css">
    

    <style>

        body {
            font-family: 'Kakao', sans-serif;
        }

        #searchWrap{
            width: 100%; height: 300px;
            background-image: url(/img/withpic.jpg);
            background-size: 100% 100%;
            margin-top: 70px;
        }
        .apply{
            width: 100px; height: 30px;
            background-color: #C69963;
            margin: auto;
            transform: translateX(400px) translateY(20px);
            line-height: 30px;
            text-align: center;
            cursor: pointer;
            border-radius: 25px;
            font-size: 15px;
            transition: .2s ease;
            color: white;
            text-decoration: none;
            display: block;
        }

        .apply:hover{
            box-shadow: 1px 1px 3px #424242;
        }
        .dateSeleter{
            width: 960px; height: 50px;
            margin: 100px auto;
        }
        .dateSeleter .datepick{
            width: 200px; height: 50px;
            font-size: 20px;
            text-align: center;
            border: 1px solid #424242;
            border-radius: 15px ;
            display: block;
            float: left;
            outline: none;
        }
        #datepicker-input2{
            margin: auto 50px;
        }
        #wrapper2{
            margin-left: 250px;
        }
        #searchBox{
            width: 300px; height: 48px;
            border: 1px solid #424242;
            border-radius: 15px;
            font-size: 15px;
            padding-left: 20px;
            vertical-align: middle;
            outline: none;
        }
        .dateSeleter .btn{
            width: 50px; height: 50px;
            border: none; outline: none;
            background-color: rgba(0,0,0,.4);
            border-radius: 40px;
            font-size: 16px;
            margin-left: 5px;
        }

        #contentWrap{
            width: 1080px;
            margin: auto;
            padding-bottom: 30px;
        }
        .togetherFilter{
            width: 400px; height: 80px;
            margin: auto;
            transform: translateX(315px);
            line-height: 80px;
        }
        .togetherFilter select{
            width: 150px; height: 40px;
            font-size: 16px;
            padding-left: 10px;
            margin-left: 20px;
            border-radius: 10px;
            outline: none;
        }
        .genderFilter{
            vertical-align: middle;
        }

        .togetherBox{
            width: 960px;
            margin: auto;
        }
        .togetherListBox{
            width: 960px;
        }
        .togetherList{
            display: inline-block;
            margin-bottom: 15px;
        }
        
		.togetherListBox>li:nth-child(2n-1){
			margin-right: 20px;
		}

        #popUpWrap{
            width: 100%; height: 100%;
            position: fixed;
            top: 0; left: 0;
            background-color: rgba(0,0,0,.7);
            z-index: 1;
            display: none;
        }

        #popupTog{
            width: 530px;
            height: 380px;
            position: fixed;
            background-color: white;

            left:50%; top:50%;
            margin-left: -265px;
            margin-top: -200px;
            border-radius: 10px;
            z-index: 1;
            display: none;
        }

        #popupTog .reaTogether {
            position: relative;
            width: 530px;
            height: 280px;
            /*background-color: #525252;*/
        }

        #popupTog .addTogether {
            position: relative;
            width: 530px;
            height: 100px;
            /*background-color: #9d7a6d;*/
            float: left;
        }

        #popupTog .image {
            width: 130px;
            height: 100px;

            position: absolute;

            margin-left: 40px;
            margin-top: 40px;

            border-radius: 20px;

            /*background-color: #9d7a6d;*/
        }

        #popupTog h3 {
            font-size: 18px;
            font-weight: bold;

            /*background-color: #00E676;*/

            position: absolute;

            margin-left: 190px;
            margin-top: 50px;
        }

        #popupTog .siren {
            position: absolute;
            right: 40px;
            top: 10px;
        }

        #popupTog .date {
            position: absolute;
            width: 250px;
            height: 10px;

            /* background-color: #0000cc;*/

            font-size: 16px;
            margin-left: 100px;
            margin-top: 65px;
            color: #525252;

            font-weight: bold;
        }


        #popupTog .applyBtn {
            position: absolute;
            width: 70px;
            height: 20px;
            display: block;
            background-color: #FFC107;
            border-radius: 20px;
            border: none;
            outline: none;
            cursor: pointer;

            text-align: center;
            line-height: 20px;

            right: 30px;
            margin-top: 105px;
        }

        #popupTog .applyBtn button {
            width: 70px;
            height: 20px;
            display: block;
            background-color: #FFC107;
            border-radius: 20px;
            border: none;
            outline: none;
            cursor: pointer;
        }

        .applyBtn:hover{
            transform: scale(1.1);
        }
        .applyBtn:active{
            transform: scale(.9);
        }

        #popupTog .personnel {
            position: absolute;
            width: 40px;
            height: 20px;
            font-size: 12px;

            line-height: 20px;

            right: 40px;
            bottom: 30px;
        }

        #popupTog .gender {
            position: absolute;
            width: 30px;
            height: 20px;
            font-size: 14px;

            right: 90px;
            bottom: 30px;
        }

        #popupTog.gender img {
            width: 30px;
            height: 30px;
        }

        #popupTog .finish {
            position: absolute;
            width: 60px;
            height: 18px;

            font-size: 15px;
            font-weight: bold;
            right: 50px;
            bottom: 0;

            color: #117700;

            text-align: center;
            line-height: 18px;
            border-radius: 15px;
        }

        #popupTog .user {
            width: 300px;
            height: 40px;
            border-radius: 40px;

            position: absolute;

            left: 60px;
            bottom: 70px;
            float: left;
        }


        #popupTog .user img{
            width: 40px;
            height: 40px;
            border-radius: 40px;
            cursor: pointer;
        }

        #popupTog .userNickname {
            float: left;
            padding: 5px 5px;
            /*background-color: #673AB7;*/
            position: absolute;
            font-size: 13px;
            font-weight: bold;
        }


        #popupTog .content {

            position: absolute;
            width: 300px;
            height: 60px;
            padding: 10px 10px;
            /*background-color: #9d7a6d;*/

            margin-left: 70px;
            margin-top: 120px;

            border: 1px solid  #BDBDBD;
            border-radius: 20px;
            font-size: 14px;

        }

        .endBtn {
            position: absolute;
            right: 9px;
            top: 10px;

            border: none;
            outline: none;
            cursor: pointer;
            background-color: transparent;
            font-size: 15px;
        }

        .btn:hover{
            transform: scale(1.1);
        }
        .btn:active{
            transform: scale(.9);
        }

        #popupTog .addTogether button {
            width: 50px;
            height: 100px;

            font-size: 20px;
            font-weight: bold;

            border: none;
            outline: none;
            cursor: pointer;
            background-color: transparent;
            position: relative;

        }

        #popupTog .addTogether .userLeft {
            position: relative;
            left: 0;
            float: left;
        }

        #popupTog .addTogether .userRight {
            position: relative;
            right: 0;
            float: left;
        }

        #popupTog .addUser {
            position: relative;
            width: 86px;
            height: 100px;
            text-align: center;

            /*background-color: #f2bc00;*/
            /*border: 1px solid  #525252;*/

            float: left;

        }

        #popupTog .addUser img {
            width: 40px;
            height: 40px;
            border-radius: 40px;
            cursor: pointer;

            margin-left: 23px;
            margin-top: 30px;

        }

        #popupTog .addUserNickname {
            width: 80px;
            height: 20px;
            position: absolute;
            left: 18px;
            bottom: 0;
            font-size: 13px;

        }



    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp" ></c:import>

<h1 class="screen_out">동행구하기</h1>
<div id="searchWrap">
    <a class="apply" href="/together/register"> 동행등록 </a>
    <div class="dateSeleter">
        <form action="#" method="get">
        <input type="text" id="datepicker-input1" name="firstDate" aria-label="Date-Time" class="datepick">
        <div id="wrapper1" style="margin-top: -1px;"></div>
        <input type="text" id="datepicker-input2" name="lastDate" aria-label="Date-Time" class="datepick">
        <div id="wrapper2" style="margin-top:-1px;"></div>
        <input type="text" id="searchBox" name="searchDate" autocomplete="off" placeholder="여행지를 검색하세요."/>
        <button class="btn"><i class="fas fa-search"></i></button>
        </form>
    </div><!--//dateSeleter-->

</div><!--//searchWrap-->

<div id="contentWrap">
    <div class="togetherFilter">
        <select class="genderFilter" name="성별">
            <option value="성별상관없음" selected="selected">성별 상관없음</option>
            <option value="여자">여자</option>
            <option value="남자">남자</option>
        </select>

        <select class="timeFilter" name="시간대">
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
    </div> <!--//togetherFilter-->

    <div class="togetherBox">
        <ul class="togetherListBox">
        <c:forEach items="${list }" var="together">
        
                <li class="togetherList">
                    <div class="together">
                        <img class="image" src="/img/spot/${together.getPicName()}">
                        <div class="date"><fmt:formatDate pattern="yyyy-MM-dd(E)" value="${together.meetDate }"/>  ${together.getMeetTime() }</div>
                        <img class="siren" src="/img/siren.png" width="25" height="25">
                        <div class="content">${together.getContents() }</div>
                        <div class="floatTag">
                        	 <c:forEach items="${together.tags }" var="tag">
								<a href="/search/"><div class="tag">#${tag.name }</div></a>
							</c:forEach>
						</div>
                        <div class="personnel">
                        	${together.personnelResult }/${together.getPersonnel() }명
                        </div>
                        <c:choose>
		        			<c:when test="${together.gender=='A' }">
		        				 <div class="gender"><img src="/img/womanman.png"></div>
		        			</c:when>
		        			<c:when test="${together.gender=='F' }">
		        				 <div class="gender"><img src="/img/woman.png"></div>
		        			</c:when>
		        			<c:otherwise>
		        				<div class="gender"><img src="/img/man.png"></div>
		        			</c:otherwise>
		        		</c:choose>
        		
                  
                        <div class="finish">
                        
						<jsp:useBean id="toDay" class="java.util.Date"/>
						<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd(E)' var="toDate"/>

                        <c:choose>
                        	<c:when test="${together.personnelResult==together.personnel || toDate>together.meetDate }">
                        		<em class="end">모집완료</em>
                        	</c:when>
                        	<c:otherwise>
                        		<em class="ing">모집중</em> 
                        	</c:otherwise>
                        </c:choose>
                        </div>
                    </div>
                </li>
   			</c:forEach>
        </ul>
    </div>
    ${paginate }

</div><!--//contentWrap-->

<div id="popUpWrap"></div>
<div id="popupTog">
    <div class="reaTogether">
        <button class="endBtn"><i class="fas fa-times"></i></button>
        <img class="image" src="/spot/옵스1.JPG" >
        <h3>옵스</h3>
        <img class="siren" src="/img/siren.png" width="25" height="25">
        <div class="date">2018-12-01 (토) 14:00 ~ 16:00</div>
        <div class="btn applyBtn"><button>신청하기</button></div>
        <div class="personnel">1/3명</div>
        <div class="gender"><img src="/img/womanman.png"></div>
        <div class="finish">모집중</div>
        <div class="user">
            <a href="/profile.jsp?no="><img src="/img/profile/제니제니.jpg"></a>
            <span class="userNickname">제니제니</span>
        </div>
        <div class="content">같이 빵 먹을 솨람~~ 빵먹자 빵!</div>
    </div>

    <div class="addTogether">
        <!-- <div class="btn userLeft"><button><i class="fas fa-caret-left"></i></button></div> -->
        <div class="addUser">
            <a href="/profile.jsp?no="><img src="/profile/제니제니.jpg"></a>
            <span class="addUserNickname" >제니제니</span>
        </div>
        <!--<div class="addUser">
            <a href="/profile.jsp?no="><img src="/img/수진.PNG"></a>
            <span class="addUserNickname" >투디투디</span>
        </div>

         <div class="addUser">
            <a href="/profile.jsp?no="><img src="/img/수진.PNG"></a>
            <span class="addUserNickname" >투디투디</span>
        </div>
        <div class="addUser">
            <a href="/profile.jsp?no="><img src="/profile/사나사나.jpg"></a>
            <span class="addUserNickname" >사나사나</span>
        </div>
        <div class="addUser">
            <a href="/profile.jsp?no="><img src="/profile/제니제니.jpg"></a>
            <span class="addUserNickname" >제니제니</span>
        </div> -->

  <!--       <div class="btn userRight"><button><i class="fas fa-caret-right"></i></button></div> -->
    </div>
</div><!--//popupTog-->

<c:import url="/WEB-INF/template/popLogin.jsp" ></c:import>
<c:import url="/WEB-INF/template/footer.jsp" ></c:import>

<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src="/js/tui-time-picker.min.js"></script>
<script src="/js/tui-date-picker.min.js"></script>
<script>

    var datepicker3 = new tui.DatePicker('#wrapper1', {
        date: new Date(),
        input: {
            element: '#datepicker-input1',
            format: 'yyyy-MM-dd'
        },
        language:'ko'
    });

    datepicker3.on('change', function() {
        var newDate = datepicker.getDate();

        console.log(newDate);
    });

    var datepicker2 = new tui.DatePicker('#wrapper2', {
        date: new Date(),
        input: {
            element: '#datepicker-input2',
            format: 'yyyy-MM-dd'
        },
        language:'ko'
    });

    datepicker2.on('change', function() {
        var newDate = datepicker.getDate();

        console.log(newDate);
    });

    

    var $popup = $("#popUpWrap");
    var $popupTog = $("#popupTog");


    $('.togetherList').click(function () {
    	$popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        $popupTog.fadeIn();
    }); //writeBox click() end


 	
    $('.apply').click(function () {
        $popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        $popupTogetherAdd.fadeIn();
    }); //writeBox click() end


    $('#popup').click(function () {
        $popup.fadeOut(); // $(this).css("display","none);
        $popupTog.fadeOut();
        //$('#menu').fadeOut();
    }); //

    $('.endBtn').click(function () {
        $popup.fadeOut(); // $(this).css("display","none);
        $popupTog.fadeOut();
        //$('#menu').fadeOut();
    }); //
    
    $(".applyBtn").click(function() {
    	var flag = confirm("오픈카톡에 입장하시겠습니까?");
    	if(flag == true){
    		location.href = "https://open.kakao.com/o/gEAVb93";
    	}
        alert("동행 신청이 완료되었습니다!");
        $popup.fadeOut(); // $(this).css("display","none);
          $popupTog.fadeOut();
     });

</script>
<script src="/js/dounorPop.js"></script>
<script src="/js/login.js"></script>
</body>
</html>