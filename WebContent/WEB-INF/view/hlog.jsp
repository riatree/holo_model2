<%@page import="java.util.List"%>
<%@page import="org.yolo.holo.vo.PageVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>h-Log</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
	<link rel="stylesheet" href="/css/hlog.css">
	<link rel="stylesheet" href="/css/paginate.css">
    <style>
    	#paginateBox{
    		height: 50px;
    		margin: auto;
    		margin-bottom: 20px;
    	}
    	.photoArea{
    		position: absolute;
    		width: 290px; height: 200px;
    		z-index: 1;
    	}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>
<div id="content">
    <div class="bestHLog">
        <div class="hLogTitleBox">
            <div class="hLogTitle"><img src="/img/crown.png" width="30" height="30"/> <span>BEST H-LOG</span>
            <c:if test="${loginDounor!=null }">
                <a class="writeGo" href="/hlog/register"><img src="/img/write.png" width="20" height="20"/> 글쓰기</a>
         	</c:if>
            </div><!-- .hLogTitle end -->
        </div><!-- .hLogTitleBox end -->

        <div class="boxAll">
            <div class="boxes">

				<% for(int i = 0; i < 9; i++) { %>
                	<div class="boxOne conBox">
                    	<div class="photoBox">
                        	<a href="/hlogDetail.jsp?no="><img src="/img/castle.jpg" width="290" height="200"></a>
                        	<div class="scrap"><img src="/img/emptyStar.png" width="20" height="20">456</div>
                        	<a href="/search.jsp?no="><div class="hash h1">#프라하ffffffffffffff</div></a>
                        	<a href="/search.jsp?no="><div class="hash h2">#하이루</div></a>
                        	<a href="/search.jsp?no="><div class="hash h3">#하이루2</div></a>
                    	</div><!-- .photoBox end -->
                    	<div class="boxM">
                        	<a href="/profile.jsp?no="><img class="userPhoto" src="/img/수진.PNG"></a>
                        	<a href="/hlogDetail.jsp?no="><div class="spotName">프라하성ffffffffffff </div></a>
                        	<div class="nickname">투디</div>
                        	<img class="hice" src="/img/icecream3.png">
                        	<div class="like"><img src="/img/emptyHeart.png" width="20" height="20">456</div>
                    	</div><!-- .boxM end -->
                </div><!-- .boxOne .conBox end -->
                <% } %>               
            </div><!-- .boxes end -->
        </div><!-- .boxAll end -->
        <button class="btn leftBtn"><i class="fas fa-angle-left"></i></button>
        <button class="btn rightBtn"><i class="fas fa-angle-right"></i></button>

        <ul id="navList">
            <li class="on"><i class="fas fa-circle"></i></li>
            <li><i class="fas fa-circle"></i></li>
            <li><i class="fas fa-circle"></i></li>
        </ul><!--//navList-->

    </div><!-- .bestHLog end -->

    <ul class="filter">
        <li>TV여행 </li>
        <li>힐링여행 </li>
        <li>도심여행 </li>
        <li>액티비티 </li>
        <li>식도락 </li>
        <li>역사·문화 </li>
        <li>감성여행 </li>
        <li>야경여행</li>
    </ul><!-- .filter end -->

    <div class="filterDetail">
        <div class="filterLine"><span class="f">필터</span> <button class="filterBtn down"><i class="fas fa-caret-down"></i></button></div>
        <div class="filterContents">
            <div class="travelStyle"><span>여행스타일</span>
                <ul>
                    <li><label><img src="/img/tight.png" width="50" height="50"/>타이트 <input class="hidden" type="radio" name="style" value="tight"></label></li>
                    <li><label><img src="/img/smooth.png" width="50" height="50">스무스 <input class="hidden" type="radio" name="style" value="smooth"></label></li>
                </ul>
            </div><!-- .travelStyle end -->

            <div class="season"><span class="seasonTitle">계절</span>
                <ul>
                    <li><label><img src="/img/spring.png" width="40" height="40"/>봄 <input class="hidden" type="radio" name="season" value="spring"></label></li>
                    <li><label><img src="/img/summer.png" width="40" height="40"/>여름 <input class="hidden" type="radio" name="season" value="summer"></label></li>
                    <li><label><img src="/img/autumn.png" width="40" height="40"/>가을 <input class="hidden" type="radio" name="season" value="autumn"></label></li>
                    <li><label><img src="/img/winter.png" width="40" height="40"/>겨울 <input class="hidden" type="radio" name="season" value="winter"></label></li>
                </ul>
            </div><!-- .season end -->
        </div><!-- filterContents end -->
    </div><!-- filterDetail end -->

    <div id="hLogContents">
        <div class="smallFilter">
            <span class="colorA">최신순</span>
            <span>추천순</span>
        </div>
        <div class="hLogSearch">
            <form action="" method="">
                <input name="searchHLog" placeholder="내용을 입력해주세요"/>
                <button><i class="fas fa-search"></i></button>
            </form>
        </div>
        <div class="hLogAll">
            <script type="text/template" id="hlogTmp">
    			<@ _.each(hlogs,function(hlog){ 
					var title = hlog.titlePic;
					
					var flag = hlog.titlePic.includes(".");
					var titlePic = null;
					if(flag){
						titlePic = "background-image:url("+title+")";
						console.log(titlePic);
					} else{
						titlePic = "background-color : " + title + "";
						console.log(titlePic);
					}
				@>
    				<li>
        				<div class="boxOne">
						<a href="/hlog/<@=hlog.no@>"><div class="photoArea"></div></a>
						<div class="photoBox" style = "<@=titlePic@>">
                			<%--<a href="/search.jsp?no="><div class="h1 hash">#<@=hlog.tag1@></div></a>
                			<a href="/search.jsp?no="><div class="h2 hash">#<@=hlog.tag2@></div></a>--%>
            			</div>

            			<div class="boxM">
                		<a href="/profile.jsp?no="><img class="userPhoto" src="/profile/<@=hlog.profile@>"></a>
                		<a href="/hlogDetail.jsp?no="><div class="spotName"><@=hlog.title@></div></a>
                		<div class="nickname"><@=hlog.nickname@></div>
                		<img class="hice" src="img/ice<@=hlog.hice@>.png">
                		<div class="scrap"><img src="/img/emptyStar.png" width="20" height="20"><@=hlog.star@></div>
                		<div class="heart like"><img src="/img/emptyHeart.png" width="20" height="20"><@=hlog.likeNum@></div>
            			</div>
        				</div><!-- hlog-->
    				</li>
    			<@ })@>

			</script>
			
            <ul class="hLogBox">

            </ul><!-- .hLogBox end -->
            <div id="paginateBox"></div>
        </div><!-- .hLogAll end -->
    </div><!-- #hLogContents end -->



</div><!-- #content end -->

<%@ include file="/WEB-INF/template/popLogin.jsp" %>
<%@ include file="/WEB-INF/template/footer.jsp" %>


<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
	
	//jsp에서 언더스코어를 활용하기 위해서
	//% -> @ 로 사용
	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
	};

	// hLog 템플릿
    var tmp = _.template($("#hlogTmp").html());
	
	var pageNo = 1;

	function getList() {
		$(".hLogBox").children().remove();
		$.ajax({
	        url:"/ajax/hlog/list/"+pageNo,
	        type:"get",
	        dataType:"json",
	        error:function (request,status,error) {
	            alert(request+status+error);
	        },success:function (json) {
	        	//json.list
	        	//json.paginate
	            $(".hLogBox").append(tmp({"hlogs":json.list}));
	        	$("#paginateBox").html(json.paginate);
	        }
	    });	
	}
    getList();

    
    $("#paginateBox").on("click",".paginate a",function(e) {
    	e.preventDefault();
    	pageNo = $(this).text();
    	getList();
    });

    
    var x = 0;
    var idx = 0;
    var $navList = $("#navList").children();

    $(".leftBtn").on("click", function () {
        x += 1005;

        if(x == 1005) { x = -2010; }
        $(".boxes").css("left", x);

        if(idx <= 0 || idx <= 2) {
            idx--;

            if(idx == -3) {
                idx = 0;
            }
            $navList.removeClass("on");
            $navList.eq(idx).addClass("on");
            // console.log(idx);
        }
    }); // .leftBtn click() end

    $(".rightBtn").click(function () {
        x -= 1005;

        if(x == -3015) { x = 0; }
        $(".boxes").css("left", x);

        if(idx >= 0 || idx >= -2) {
            idx++;

            if(idx > 2) {
                idx = 0;
            }
            $navList.removeClass("on");
            $navList.eq(idx).addClass("on");
            // console.log(idx);
        }
    });

    $(".filter>li").on("click", function () {

        $(this).toggleClass("color");
    }); // on(click) end - 필터 8개

    $(".travelStyle li").on("click", function () {

        $(".travelStyle li").removeClass("colorDetail");
        $(this).addClass("colorDetail");
    }); // on(click) end - 타이트, 스무스 필터

    $(".season li").on("click", function () {

        $(".season li").removeClass("colorDetail");
        $(this).addClass("colorDetail");
    }); // on(click) end - 계절 필터

    $(".smallFilter span").on("click", function () {

        $(".smallFilter span").removeClass("colorA").css("color","#000");
        $(this).addClass("colorA").css("color","#fff");
    }); // on(click) end - 최신순, 추천순 필터

    $(".filterLine").on("click", function () {

        var flag = $(".filterBtn i").hasClass("fa-caret-down");
        var cls = "";

        if(flag) {
            cls ="up";
            $(".filterContents").css("display", "block");
            $("#hLogContents").css("margin-top", "180px");
        } else {
            cls ="down";
            $(".filterContents").css("display", "none");
            $("#hLogContents").css("margin-top", "20px");
        }

        $(".filterBtn i").attr("class", "fa fa-caret-" + cls);
    }); // .filterBtn on() end

</script>
<script src="/js/login.js"></script>
<script src="/js/dounorPop.js"></script>
</body>
</html>