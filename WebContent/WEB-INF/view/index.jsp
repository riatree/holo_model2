<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
<%
   List<Together> togethers = TogethersDAO.selectTogetherList(); 

   List<Spot> tourSpots = SpotsDAO.selectMainTourList();
   List<Spot> foodSpots = SpotsDAO.selectMainFoodList();
%> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOLO</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <link rel="stylesheet" href="/css/index.css">    
    <link rel="stylesheet" href="/css/popLogin.css">    
    <style>
        
    </style>
</head>

<body>

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<div id="heroImage">
    <div class="wrapAll">
        <div class="title"><h1>Happen of Leave Oneself</h1></div>
        <div class="subtitle"><h3>혼자 여행을 떠났을 때 발생하는 모든 일,</h3></div>
        <div class="hice">
            <p class="con1">혼자 여행하기 좋은 곳</p>
            <p class="con2">한 눈에 알기 쉽다!</p>
            <img class="icecream" src="/img/ice5.png"/>
            <p class="con3">HICE</p>
        </div> <!--//hice-->

        <div class="wrap">
            <div class="continentBox continent">
                <a href="/region"><div class="continent korea"><span class="name">대한민국</span></div></a>
                <a href="/region"><div class="continent asia"><span class="name">동북아</span></div></a>
                <a href="/region"><div class="continent southAsia"><span class="name">동남아</span></div></a>
                <a href="/region"><div class="continent europe"><span class="name">유럽</span></div></a>
                <a href="/region"><div class="continent america"><span class="name">아메리카</span></div></a>
            </div><!--//continentBox-->

            <div class="location">
                <div class="regionWrap">
                    <div class="region"><a href="/region/1"><img src="/img/southkorea.png"/> <span>서울특별시</span></a></div>
                    <div class="region"><a href="/region/2"><img src="/img/southkorea.png"/> <span>부산광역시</span></a></div>
                    <div class="region"><a href="/region/3"><img src="/img/southkorea.png"/> <span>제주특별시</span></a></div>
                </div><!--//regionWrap-->
                <div class="regionWrap">
                    <div class="region"><a href="/region/32"><img src="/img/china.png"/> <span>베이징</span></a></div>
                    <div class="region"><a href="/region/31"><img src="/img/japan.png"/> <span>오사카</span></a></div>
                    <div class="region"><a href="/region/33"><img src="/img/macao.png"/> <span>마카오</span></a></div>
                </div><!--//regionWrap-->
                <div class="regionWrap">
                    <div class="region"><a href="/region/61"><img src="/img/singapore.png"/> <span>싱가포르</span></a></div>
                    <div class="region"><a href="/region/62"><img src="/img/philippines.png"/> <span>보라카이</span></a></div>
                    <div class="region"><a href="/region/63"><img src="/img/vietnam.png"/> <span>다낭</span></a></div>
                </div><!--//regionWrap-->
                <div class="regionWrap">
                    <div class="region"><a href="/region/91"><img src="/img/france.png"/> <span>파리</span></a></div>
                    <div class="region"><a href="/region/92"><img src="/img/unitedKingdom.png"/> <span>런던</span></a></div>
                    <div class="region"><a href="/region/93"><img src="/img/spain.png"/> <span>바르셀로나</span></a></div>
                </div><!--//regionWrap-->
                <div class="regionWrap">
                    <div class="region"><a href="/region/121"><img src="/img/unitedStates.png"/> <span>뉴욕</span></a></div>
                    <div class="region"><a href="/region/122"><img src="/img/unitedStates.png"/> <span>하와이</span></a></div>
                    <div class="region"><a href="/region/123"><img src="/img/unitedStates.png"/> <span>괌</span></a></div>
                </div><!--//regionWrap-->
            </div><!--//location-->

        </div><!--//wrap-->
    </div> <!--//wrapAll-->
</div> <!--//heroImage-->

<div id="contentWrap">
    <div class="contents">
        <ul class="spot">
            <li class="color attrBox">관광명소 </li>
            <li class="restBox">음식점 </li>
            <li class="hBox">H-LOG</li>
            
        </ul><!--//spot-->

        <div class="box">
            <div class="boxes attractionBoxes">
            	<% for(Spot tour : tourSpots) { 
            		 List<Tag> hashs = TagsDAO.tagList(tour.getNo());
            	%>
                	<div class="conOne conBox">
                    	<div class="photoBox">
                        	<a href="/Detail.jsp?no=<%=tour.getNo()%>"><img src="/spot/<%=tour.getPicname() %>" width="290" height="200"></a>
               
                        	<div class="hashBox">
                        	<% for(Tag hash : hashs) { %>
                        	<a href="/search.jsp?no="><div class="hash">#<%=hash.getName() %></div></a>
                        	<% } %>
                        	</div><!-- //hashBox end -->
                    	</div><!-- //photoBox end -->

                    	<div class="boxM">
                        	<a href="/profile.jsp?no="><img class="userPhoto" src="/profile/<% if(tour.getProfile() != null) { %><%= tour.getProfile()%><% }else { %>noProfile.png <% } %>"></a>
                        	<a href="/Detail.jsp?no=<%=tour.getNo()%>"><div class="spotName"><%=tour.getName() %> </div></a>
                        	<div class="nickname"><%=tour.getNickname() %></div>
                        	<% 
	            				Double hice = FoodGradesDAO.selectFoodHice(tour.getNo());
	            				System.out.println("tour.jsp hice:"+hice);
	            				int num=0;
	            				if(hice >=0.0 && hice <1.5){
					            	num=1;
					            }else if(hice >=1.5 && hice <2.5){
					            	num=2;
					            }else if(hice >=2.5 && hice <3.5){
					            	num=3;
					            }else if(hice >=3.5 && hice <4.5){
					            	num=4;
					            }else if(hice >=4.5 && hice <=5.0){
					            	num=5;
					            }
	            			%>
                        	<img class="hiceOne" src="/img/ice<%=num%>.png">
                        	
                    	</div><!-- .boxM end -->
                	</div><!-- .conOne .conBox end -->
                <% } %>
            </div><!-- .boxes .attractionBoxes end -->


            <div class="boxes restaurantBoxes">            
            	<% for(Spot food : foodSpots) { 
            		 List<Tag> hashs2 = TagsDAO.tagList(food.getNo());
            	%>
                	<div class="conOne conBox">
                    	<div class="photoBox">
                        	<a href="/foodDetail.jsp?no=<%=food.getNo()%>"><img src="/spot/<%=food.getPicname()%>" width="290" height="200"></a>
                        	<% int foodScrap = DounorSavesDAO.selectSpotScrap(food.getNo()); %>
                        	
                        	<div class="hashBox">
                        	<% for (Tag hash : hashs2) { 
					            	System.out.println("해쉬태그:"+hash); %>
                        	<a href="/search.jsp?no="><div class="hash">#<%=hash.getName() %></div></a>
                        	<% } %>
                        	</div><!-- //hashBox end -->
                    	</div><!-- //photoBox end -->

                    	<div class="boxM">
                        	<a href="/profile.jsp?no="><img class="userPhoto" src="profile/<%=food.getProfile() %>"></a>
                        	<a href="/foodDetail.jsp?no="><div class="spotName"><%=food.getName() %></div></a>
                        	<div class="restaurantRealWon">
                            <span class="restaurantRealWonNum"><%=food.getPrice() %></span>
                            <%
                            	int count = 0;
                            	int value = 12000;
                            	
                            	if(value <= 10000) {
                            		count = 1;
                            	} else if(value > 10000 && value <= 20000) {
                                    count = 2;
                                } else if(value > 20000 && value <= 30000) {
                                   count = 3;
                                } else {
                                   count = 4;
                                }
                            	
                            	for(int j = 0; j < count; j++) { %>
                            		<img class="realWon" src="/img/won.png" width="20" height="20">                          		
                            	<% } %>                           
                        	</div><!-- .restaurantRealWon end -->
                        	<div class="nickname"><%=food.getNickname() %></div>
                        	<% 
					            Double hice = FoodGradesDAO.selectFoodHice(food.getNo());
					            System.out.println("food.jsp hice:"+hice);
					            int num=0;
					            if(hice >=0.0 && hice <1.5){
					            	num=1;
					            }else if(hice >=1.5 && hice <2.5){
					            	num=2;
					            }else if(hice >=2.5 && hice <3.5){
					            	num=3;
					            }else if(hice >=3.5 && hice <4.5){
					            	num=4;
					            }else if(hice >=4.5 && hice <=5.0){
					            	num=5;
					            }
					        %>
                        	<img class="hiceOne" src="/img/ice<%=num%>.png">
                        	<%  
            					int foodLike = DounorSavesDAO.selectSpotLike(food.getNo());
                        	
                        	%>
                        	<div class="like"><img src="/img/emptyHeart.png" width="20" height="20"><%=foodLike %></div>
                    	</div><!-- .boxM end -->
                	</div><!-- .conOne .conBox end -->
                	<% } %>
            </div><!-- .boxes .restaurantBoxes end -->


            <div class="boxes hLogBoxes">
            	<% for(int i = 0; i < 9; i++) { %>
                	<div class="conOne conBox">
                    	<div class="photoBox">
                        	<a href="/hlogDetail.jsp?no="><img src="/img/castle.jpg" width="290" height="200"></a>
                        	<div class="scrap"><img src="/img/emptyStar.png" width="20" height="20">456</div>
                        	<div class="hashBox">
                        	<a href="/search.jsp?no="><div class="hash">#오스트레일리아</div></a>
                        	<a href="/search.jsp?no="><div class="hash">#하이루</div></a>
                        	</div><!-- //hashBox end -->
                    	</div><!-- //photoBox end -->

                    	<div class="boxM">
                        	<a href="/profile.jsp?no="><img class="userPhoto" src="/img/수진.PNG"></a>
                        	<a href="/hlogDetail.jsp?no="><div class="spotName">hlog1</div></a>
                        	<div class="nickname">안녕하세용ㅇㅇ</div>
                        	<img class="hiceOne" src="/img/icecream3.png">
                        	<div class="like"><img src="/img/emptyHeart.png" width="20" height="20">456</div>
                    	</div><!-- .boxM end -->
                	</div><!-- .conOne .conBox end -->
                <% } %>                    
            </div><!-- .boxes .hLogBoxes end -->
        </div><!--//box-->

        <button class="btn leftBtn"><i class="fas fa-angle-left"></i></button>
        <button class="btn rightBtn"><i class="fas fa-angle-right"></i></button>

        <ul id="navList">
            <li class="on"><i class="fas fa-circle"></i></li>
            <li><i class="fas fa-circle"></i></li>
            <li><i class="fas fa-circle"></i></li>
        </ul><!--//navList-->
    </div>


    <div id="themeWrap">
        <h3 class="themeTitle">테마</h3>

        <!--ul요소 변경 필요-->
        <div class="theme">
            <a href="/search.jsp?no="><div class="boxOne healing"><img id="t1" class="themes" src="/img/힐링.JPG" width="240" height="180"><div class="cover"><span>#힐링</span></div></div></a>
            <a href="/search.jsp?no="><div class="boxOne activity"><img id="t2" class="themes" src="/img/액티비티.jpg" width="240" height="180"><div class="cover"><span>#액티비티</span></div></div></a>
            <a href="/search.jsp?no="><div class="boxOne night"><img id="t3" class="themes" src="/img/야경.jpg" width="240" height="180"><div class="cover"><span>#야경</span></div></div></a>
            <a href="/search.jsp?no="><div class="boxOne sensitivity"><img id="t4" class="themes" src="/img/감성.PNG" width="240" height="180"><div class="cover"><span>#감성</span></div></div></a>
            <a href="/search.jsp?no="><div class="boxOne delicious"><img id="t5" class="themes" src="/img/도시락.PNG" width="240" height="180"><div class="cover"><span>#식도락</span></div></div></a>
            <a href="/search.jsp?no="><div class="boxOne tv"><img id="t6" class="themes" src="/img/도깨비.PNG" width="240" height="180"><div class="cover"><span>#TV여행</span></div></div></a>
            <a href="/search.jsp?no="><div class="boxOne city"><img id="t7" class="themes" src="/img/경복궁.PNG" width="240" height="180"><div class="cover"><span>#도심</span></div></div></a>
            <a href="/search.jsp?no="><div class="boxOne history"><img id="t8" class="themes" src="/img/만리장성.jpg" width="240" height="180"><div class="cover"><span>#역사문화</span></div></div></a>
        </div>
    </div><!--//themeWrap-->

    <div id="togetherWrap">
        <h3 class="togetherTitle">동행</h3>
        <div class="together">
            <!--ul요소로 변경 필요-->
            <ul class="togetherBox">
            	<% for(Together together : togethers){
                    
            		List<Tag> tags = TagsDAO.tagList(together.getNoSpot());
                    
                    String gender = together.getGender();
                    String url = "/img/";
                    if(gender.equals("A")) {
                       url+= "womanman.png";
                    }else if(gender.equals("F")) {
                       url+= "woman.png";
                    }else {
                       url+= "man.png";
                    }//if %>            
                    
                       <li class="togeBox">
       				 <a href=""><img class="image" src="/spot/<%=together.getPicName()%>"></a>
       				 <div class="date"><%=together.getMeetDate()%></div>
        			<div class="time"><%=together.getMeetTime() %></div>
        			<a href=""><img class="siren" src="img/siren.png" width="25" height="25"></a>
       			 <a href=""><div class="content"><%=together.getContents()%></div></a>
        		<div class="floatTag">
                            <%for(Tag tag : tags){ %>
								<a href="/search.jsp?no="><div class="tag">#<%=tag.getName()%></div></a>
							<%} %>
                     </div>
     			   <div class="personnel">1/<%=together.getPersonnel()%>명</div>
      			  <div class="gender"><img src="<%=url%>"></div>
      			  <div class="finish">모집중</div>
  			  </li>
                    <%} %>
            </ul><!--//togetherBox-->
        </div><!--//together-->

        <button class="btn leftBtn2"><i class="fas fa-angle-left"></i></button>
        <button class="btn rightBtn2"><i class="fas fa-angle-right"></i></button>

        <ul id="navList2">
            <li class="on"><i class="fas fa-circle"></i></li>
            <li><i class="fas fa-circle"></i></li>
            <li><i class="fas fa-circle"></i></li>
        </ul><!--//navList-->

    </div><!--//togetherWrap-->

</div><!--//contentWrap-->

<%@ include file="/WEB-INF/template/popLogin.jsp" %>
<%@ include file="/WEB-INF/template/footer.jsp" %>

<script src="js/jquery.js"></script>
<script src="js/underscore-min.js"></script>
<script>

	//jsp에서 언더스코어를 활용하기 위해서
	//% -> @ 로 사용
	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
	};

    // 아이스크림 쌓이기
    function ice() {
        var flag = $(".hice img").hasClass("icecream");

        if(flag) {

            var x = 1;

            setInterval(function () {

                $(".icecream").attr("src", "img/ice" + x + ".png");
                x++;

                if(x > 5) {
                    x = 1;
                }
            }, 1000);
        }
    }
    ice();


    /* 관광명소, 음식점, hLog 선택 시 버튼 변경 */
    $(".spot li").on("click", function () {

        $(".spot li").removeClass("color");
        $(this).addClass("color");
    }); // on(click) end - 타이트, 스무스 필터

    /* 관광명소, 음식점, hLog 선택 시 박스 변경 */
    $(".spot .attrBox").on("click", function () {
        $(".box .attractionBoxes").css("display", "block");
        $(".box .restaurantBoxes").css("display", "none");
        $(".box .hLogBoxes").css("display", "none");

        $(".spot .attrPlus").css("display", "block");
        $(".spot .restPlus").css("display", "none");
        $(".spot .hPlus").css("display", "none");
    });
    $(".spot .restBox").on("click", function () {
        $(".box .attractionBoxes").css("display", "none");
        $(".box .restaurantBoxes").css("display", "block");
        $(".box .hLogBoxes").css("display", "none");

        $(".spot .attrPlus").css("display", "none");
        $(".spot .restPlus").css("display", "block");
        $(".spot .hPlus").css("display", "none");
    });
    $(".spot .hBox").on("click", function () {
        $(".box .attractionBoxes").css("display", "none");
        $(".box .restaurantBoxes").css("display", "none");
        $(".box .hLogBoxes").css("display", "block");

        $(".spot .attrPlus").css("display", "none");
        $(".spot .restPlus").css("display", "none");
        $(".spot .hPlus").css("display", "block");
    });


    /* 스크랩, 좋아요 버튼 클릭 */
    $('.scrap>img').on("click",function () {
        var starFlag = $(this).attr("src");
        /*alert(starFlag);*/

        if(starFlag=="img/emptyStar.png"){
            $(this).attr("src","img/star.png");
        }else {
            $(this).attr("src", "img/emptyStar.png");
        }
    }); // on(click) end - 스크랩(star)

    $('.like>img').on("click",function () {
        var heartFlag = $(this).attr("src");
        /*alert(starFlag);*/

        if(heartFlag=="img/emptyHeart.png"){
            $(this).attr("src","img/heart.png");
        }else {
            $(this).attr("src", "img/emptyHeart.png");
        }
    }); // on(click) end - 좋아요:like(heart)


    /* <, > 버튼 클릭 시 */
    var x = 0;
    var idx = 0;
    var $navList = $("#navList").children();
    var $navList2 = $("#navList2").children();

    $(".leftBtn").on("click", function () {
        x += 1005;

        if(x == 1005) { x = -2010; }
        $(".boxes").css("left", x);
        
        $(this).parent().next().find('.boxes').css("left", x);

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

    $(".leftBtn2").click(function () {
        x += 1000;

        if(x == 1000) { x = -2000; }
        $(".togetherBox").css("left", x);

        if(idx <= 0 || idx <= 2) {
            idx--;

            if(idx == -3) {
                idx = 0;
            }
            $navList2.removeClass("on");
            $navList2.eq(idx).addClass("on");
            // console.log(idx);
        }
    }); // .leftBtn click() end

    $(".rightBtn2").click(function () {
        x -= 1000;

        if(x == -3000) { x = 0; }
        $(".togetherBox").css("left", x);

        if(idx >= 0 || idx >= -2) {
            idx++;

            if (idx > 2) {
                idx = 0;
            }
            $navList2.removeClass("on");
            $navList2.eq(idx).addClass("on");
            // console.log(idx);
        }
    });

    
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
    
    
</script>

<script src="/js/login.js"></script>
<script src="/js/dounorPop.js"></script>
</body>
</html>
--%>