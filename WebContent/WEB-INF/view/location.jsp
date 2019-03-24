<%@page import="org.yolo.holo.dao.SpotsDAO"%>
<%@page import="org.yolo.holo.vo.Spot"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="org.yolo.holo.dao.LocationsDAO"%>
<%@page import="org.yolo.holo.vo.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>${location.name }</title>
    <%@ include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/posts.css"/>
    <link rel="stylesheet" href="/css/together.css"/>
    <link rel="stylesheet" href="/css/location.css"/>
   	<style>
    </style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp" %>

<div id="heroWrap">
	<img class="heroImg" src="/img/location/${location.img }" width="100%" height="400px" />
    <div class="infoWrap">
        <h3 class="travelTitle">${location.name }</h3>
        <div class="cityInfo">
            <ul>
                <li class="clock"><i class="far fa-clock"></i><span>(시차 ${location.parallax } 시간)</span></li>
                <li class="flyTime"><i class="fas fa-plane-departure"></i> (직항) ${location.directTime } </li>
            </ul>
        </div><!-- //cityInfo -->
        
        
        <ul class = "infoBox">
            <li class="hice list">
                <div class="infoTitle">HICE</div>
                <div class="infoImage">
                    <img src="/img/hice.png" alt="혼행지수">
                </div>
                <div class="infoValue">30</div>
            </li>

            <li class="weather list">
                <div class="infoTitle">체크리스트</div>
                <div class="infoImage">
                    <img src="/img/check-mark.png" alt="체크리스트">
                </div>
            </li>

            <li class="travelInfo list">
                <div class="infoTitle">여행정보</div>
                <div class="infoImage">
                    <img src="/img/help.png" alt="여행정보"/>
                </div>
            </li>

            <li class="optimizer list">
                <div class="infoTitle">최적기</div>
                <div class="infoImage"><img src="/img/calendar.png" alt="여행최적기"></div>
                <div class="infoValue"> ${location.goodDate }</div>
            </li>
            
            <li class="guide list">
                <a href="/file/${location.guidebook }" download="${location.guidebook }">
                    <div class="infoTitle">가이드북</div>
                    <div class="infoImage"><img src="/img/guide-book.png" alt="가이드북"></div>
                    <div class="infoValue"><i class="fas fa-download"></i></div>
                </a>
            </li>
        </ul><!-- //infoBox -->
    </div><!-- //infoWrap -->
</div> <!-- //heroWrap -->

<div id="contentsWrap">
    <div class="contentsBox">
        <div class="titleBox">
            <h3>관광명소</h3>
            <a href="/tour.jsp?">+ 더보기</a>
        </div>

        <div class="contents">
            <div class="viewer">
                <ul class="contentList attractionList">
                <c:forEach items="${tourList }" var="tour">
                    <li class="listBox attractionListBox">
                        <div id="boxWrap">
                            <div class="box">
                            <div class="hlogClick hlogStar"><img src="/img/star_full.png" width="20" height="20">456</div>
                            	<a href="/spot/${tour.no }">
                                
                                <div class="backImage"><img src="/img/spot/${tour.picname }" width="290" height="200"/></div>
                                </a>
                                <div id="hashBox">
                                    <a href="" class="h1 hash">#음식점이름이름임ㄴ어ㅏ미ㅏ</a>
                                    <a href="" class="h2 hash">#오sasdas스</a>
                                    <a href="" class="h3 hash">#주메asasddaaada</a>
                                </div>
                            </div>
                            <div class="box_m">
                                <a class="profile" href="/spot/${tour.no }"><img class="user" src="/img/user_profile_img.png"></a>
                                <div class="hlogName">${tour.name }</div>
                                <div class="hlogNickname">${tour.nickname }</div>
                                <img class="ice" src="/img/hice4.png">
                                <div class="hlogClick hlogHeart"><img src="/img/like_empty.png" width="20" height="20">456</div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
                </ul>
            </div>
            <button class="btn leftBtn"><i class="fas fa-angle-left"></i></button>
            <button class="btn rightBtn"><i class="fas fa-angle-right"></i></button>
        </div>
    </div>
    <div class="contentsBox">
        <div class="titleBox">
            <h3>음식점</h3>
            <a href="/food.jsp?">+ 더보기</a>
        </div>
        <div class="contents">
            <div class="viewer">
                <ul class="contentList restaurantList">
                    <c:forEach items="${foodList }" var="food">
                    <li class="listBox restaurantListBox">
                        <div id="boxWrap">
                            <div class="box">
                                <div class="hlogClick hlogStar"><img src="/img/star_full.png" width="20" height="20">456</div>
                                <div class="backImage"><img src="/img/spot/${food.picname }" /></div>
                                <div id="hashBox">
                                    <a href="" class="h1 hash">#음식점이름이다</a>
                                    <a href="" class="h2 hash">#오사카에있이다</a>
                                    <a href="" class="h3 hash">#주메점이름이다</a>
                                </div>
                            </div>
                            <div class="box_m">
                                <a class="profile" href=""><img class="user" src="/img/user_profile_img.png"></a>
                                <div class="hlogName">${food.name }</div>
                                <div class="hlogNickname">${food.nickname }</div>
                                <img class="ice" src="/img/hice4.png">
                                <div class="hlogClick hlogHeart"><img src="/img/like_empty.png" width="20" height="20">456</div>
                            </div>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <button class="btn leftBtn"><i class="fas fa-angle-left"></i></button>
            <button class="btn rightBtn"><i class="fas fa-angle-right"></i></button>
        </div>
    </div>
    <div class="contentsBox">
        <div class="titleBox">
            <h3>H-Log</h3>
            <a href="/hlog.jsp?">+ 더보기</a>
        </div>

        <div class="contents">
            <div class="viewer">
                <ul class="contentList">
                <% for (int i = 0 ; i < 10 ;i++) { %>
                    <li class="listBox restaurantListBox">
                        <div id="boxWrap">
                            <div class="box">
                                <div class="hlogClick hlogStar"><img src="/img/star_full.png" width="20" height="20">456</div>
                                <div class="backImage"><img src="/img/susi.PNG" /></div>
                                <div id="hashBox">
                                    <a href="" class="h1 hash">#음식점이름이다</a>
                                    <a href="" class="h2 hash">#오사카에있이다</a>
                                    <a href="" class="h3 hash">#주메점이름이다</a>
                                </div>
                            </div>
                            <div class="box_m">
                                <a class="profile" href=""><img class="user" src="/img/user_profile_img.png"></a>
                                <div class="hlogName">오사카 1박2일 여행기</div>
                                <div class="hlogNickname">투디</div>
                                <img class="ice" src="/img/hice4.png">
                                <div class="hlogClick hlogHeart"><img src="/img/like_empty.png" width="20" height="20">456</div>
                            </div>
                        </div>
                    </li>
                    <%} %>
                </ul>
            </div>
            <button class="btn leftBtn"><i class="fas fa-angle-left"></i></button>
            <button class="btn rightBtn"><i class="fas fa-angle-right"></i></button>
        </div>
	</div>
    <div class="togetherBox">
        <div class="titleBox">
            <h3>동행</h3>
            <a href="/together.jsp?">+ 더보기</a>
        </div>

        <div class="togetherContent">
            <div class="togetherviewer">
                <ul class="togetherListsBox">
                <%for (int i = 0; i < 7; i ++){ %>
                    <li class="togetherList">
                        <div class="together">
                            <img class="image" src="/img/osaka.jpg">
                            <div class="date">2018.10.17 (금) 12:00~14:00</div>
                            <img class="siren" src="/img/alarm.png" width="25" height="25">
                            <div class="content">부다페스트 야경보면서 맥주 한잔 하실분 구합니다 부다페스트 야경보면서 맥주 한잔 하실분 구합니다</div>
                            <div class="tag">#부다페스트 #국회의사당</div>
                            <div class="personnel">4/4명</div>
                            <div class="gender"><img src="/img/woman.png"></div>
                            <div class="finish">모집완료</div>
                        </div><!--#together end-->
                    </li>
                <% } %>
                </ul>
            </div>
            <button class="withBtn withLeft"><i class="fas fa-angle-left"></i></button>
            <button class="withBtn withRight"><i class="fas fa-angle-right"></i></button>
        </div>
    </div>
</div> <!--//contentsWrap end-->

<div id="popWrap"></div><!-- //popWrap -->
<div id="popHice" class="popUp">
    <h3>HICE</h3>
    <span class="exit"><i class="fas fa-times"></i></span>

    <div><img class="popHice" src="/img/ice5.png"/></div>

    <div class="iceEx iceEx1"><i class="fas fa-ellipsis-h"></i> 혼자 가지 마세요</div>
    <div class="iceEx iceEx2"><i class="fas fa-ellipsis-h"></i> 혼자 갈순 있어요</div>
    <div class="iceEx iceEx3"><i class="fas fa-ellipsis-h"></i> 혼자 무난 했어요</div>
    <div class="iceEx iceEx4"><i class="fas fa-ellipsis-h"></i> 혼자가기 매력적이에요</div>
    <div class="iceEx iceEx5"><i class="fas fa-ellipsis-h"></i> 혼자 완전 강추해요</div>
    <div class="hiceCount">30개</div>
    <div class="introduce">평점 3.5이상 되는 명소, 음식점 등의 갯수표현</div>
</div><!-- //popHice -->
<div id="popCheckList" class="popUp">
    <h3>체크리스트</h3>
    <span class="exit"><i class="fas fa-times"></i></span>
    <div class="item"><img src="/img/checklist.png" width="100"/>
        <div>여행 전 <em>꼭</em> 확인!</div>
    </div>

    <div class="checkDatail">
        <ul>
            <li>1) 여권확인</li>
            <li>2) 공항 시간 확인</li>
            <li>3) 수하물 무게</li>
            <li>4) 간단한 회화</li>
            <li>5) 아무거나</li>
        </ul>
    </div>
</div><!-- //popCheckList -->
<div id="popinfo" class="popUp">
    <h3>기본정보</h3>
    <span class="exit"><i class="fas fa-times"></i></span>
    <ul>
        <li>
            <div class="item">
                <img src="/img/alarm.png" width="80"/>
                <div>응급 시</div>
            </div>
            <ul class="itemDatail">
                <li><img src="/img/police-badge.png" width="30"/> : 110</li>
                <li><img src="/img/ambulance.png" width="30"/> : 119</li>
                <li><img src="/img/embassy.png" width="30"/> : (02)2170-5200</i></li>
            </ul>
        </li>

        <li>
            <div class="item">
                <img src="/img/A.png" alt="110v 플로그 이미지" width="50"/>
                <div class="itemTitle">전압</div>
            </div>
            <div class="itemContent">${location.voltage }</div>
        </li>
        <li>
            <div class="item">
                <i class="fas fa-hand-holding-usd"></i>
                <div class="itemTitle">화폐단위</div>
            </div>
            <div class="itemContent">${location.money }</div>
        </li>
        <li>
            <div class="item"><i class="fas fa-globe"></i>
                <div class="itemTitle">언어</div>
            </div>
            <div class="itemContent">${location.language }</div>
        </li>
    </ul>
</div> <!-- //popinfo -->


<%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/moment-timezone-with-data.min.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
	$('.search').click(function () {
	    $('.menu').css("display",'none');
	    $('.fo').slideDown(300);
	    $('.search').css("display",'none');
	    $('.searchText').focus();
	 });
	 $('.closeBtn').click(function () {
	     $('.fo').hide();
	     $('.menu').css("display",'block');
	     $('.search').css("display",'block');
	 });
	 $('.login').click(function (e) {
	     e.preventDefault();
	    $('.login').css("display","none");
	    $('.afterLogin').css("display","block");
	 });

    var $list = $('.list');
    $list.eq(3).css("cursor", "auto");

    
    function displayTime(){
        var now = moment();
        var time = now.tz('Asia/Tokyo').format("HH:mm:ss");
        
        $('.fa-clock').text(time);
    }//displayTime() end 
    setInterval(displayTime,1000);
    


    $list.click(function () {
        var index = $(this).index();
        if(index == 0){
            $('#popWrap').fadeIn(500);
            $('#popHice').fadeIn(500);
        }else if (index == 1) {
            $('#popWrap').fadeIn(500);
            $('#popCheckList').fadeIn(100);
        }else if (index == 2) {
            $('#popWrap').fadeIn(500);
            $('#popinfo').fadeIn(100);
        }
    });/*click() end*/


    $('.exit').click(function () {
        $('#popinfo').fadeOut();
        $('#popCheckList').fadeOut();
        $('#popHice').fadeOut(500);
        $('#popWrap').fadeOut(500);
    });//click() end

    $('#popWrap').on("click", function () {
        $('#popinfo').fadeOut();
        $('#popCheckList').fadeOut();
        $('#popHice').fadeOut(500);
        $('#popWrap').fadeOut(500);
    });//on() end

    var num = 0;
    $('.rightBtn').on("click",function () {
        num-=1005;
        if(num == -3015){
            num = 0;
        }
        $(this).parent().find('.contentList').css("transform","translateX("+num+"px)");
        console.log(num);
    });
    $('.leftBtn').on("click",function () {
        num += 1005;
        if(num == 1005){
            num = -2010;
        }
        $(this).parent().find('.contentList').css("transform","translateX("+num+"px)");
        console.log(num);
    });
    $('.withRight').on("click",function () {
        num-=1000;
        if(num == -3000){
            num = 0;
        }
        $('.togetherListsBox').css("transform","translateX("+num+"px)");
        console.log(num);
    });
    $('.withLeft').on("click",function () {
        num += 1000;
        if(num == 1000){
            num = -2000;
        }
        $('.togetherListsBox').css("transform","translateX("+num+"px)");
        console.log(num);
    });

</script>
</body>
</html>