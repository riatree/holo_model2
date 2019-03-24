<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet" href="/css/proScrap.css"/>
    <link rel="stylesheet" href="/css/proFounder.css"/>
    <link rel="stylesheet" href="/css/proReview.css"/>
    <link rel="stylesheet" href="/css/proHlog.css"/>
    <link rel="stylesheet" href="/css/proTogether.css"/>
    <link rel="stylesheet" href="/css/popLogin.css"/>
    <link rel="stylesheet" href="/css/popReview.css"/>
    <link rel="stylesheet" href="/css/paginate.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <style>
        body{
            margin: 0px;
        }

        #mypageContents{
            width: 1080px;
            height: 230px;
            margin: auto;
            background-color: #fff;
            position: relative;
            border-left: 1px solid #424242;
            border-right: 1px solid #424242;
            margin-top: 70px;
        }
        #profile{
            position: absolute;
            width: 150px;
            height: 150px;
            left: 90px;
            top: 20px;
            cursor: pointer;
            border-radius: 75px;

        }
        #nickname{
            position: absolute;
            font-size: 15px;
            left: 135px;
            top: 190px;
        }
        .setBox{
        	width: 110px;
        	height: 50px;
        	 position: absolute;
            top: 5px;
            right:15px;
        }
        .setUpdate{
            font-size: 32px;
            position: absolute;
            top: 5px;
            right:15px;
            border: none;
            cursor: pointer;
            border-radius: 16px;
            background-color: transparent;
            outline: 0;
        }
        #followList{
            position: absolute;
            height: 20px;
            width: 240px;
            top: 15px;
            right: 130px;
        }
        #followList div{
            float: left;
            font-size: 20px;
        }
        #followList #follow{
            cursor: pointer;
        }
        #followList .followNum{
            position: relative;
            left: 10px;
        }
        #followList #followers{
            position: absolute;
            left: 125px;
            cursor: pointer;
        }
        #followList .followersNum{
            position: absolute;
            left:195px;
        }
        .followNum>p{
            color: #303F9F;
            font-weight: bold;
        }
        .followersNum>p{
            color: #303F9F;
            font-weight: bold;
        }

        #donutList{
            position: relative;
            top: 30px;
            left: 300px;

        }
        .doShadow{
            opacity: .2;
        }
        .donutBack{
            width: 90px;
            height: 90px;
            position: absolute;
            /*border: 1px solid #424242;*/
            /*border-radius: 50px;*/
            /*box-shadow: inset .5px .5px 10px #a0aabf;*/
        }
        .donutReal{
        	width: 90px;
            height: 90px;
            position: absolute;
        }
        .doTwo{
            margin-left: 100px;
        }
        .doTre{
            margin-left: 200px;
        }
        .doFour{
            margin-left: 300px;
        }
        .doFive{
            margin-top: 100px;
        }
        .doSix{
            margin-left: 100px;
            margin-top: 100px;
        }
        .doSev{
            margin-left: 200px;
            margin-top: 100px;
        }
        .doEig{
            margin-left: 300px;
            margin-top: 100px;
        }
        #menuList{
            width: 1080px;
            height: 100px;
            margin: auto;
            position: relative;
            background-color: #9E9E9E;
            text-align: center;
        }
        #menuList li{
            width: 214px;
            height: 98px;
            float: left;
            border: 1px solid #424242;
        }
        #menuList a{
            width: 212px;
            height: 96px;
            cursor: pointer;
            color: #000;
            text-decoration: none;
            

        }
        #menuList a>img{
            width: 50px;
            height: 50px;
            margin-top: 15px;
        }
        #menuList a>p{
            font-size: 15px;
        }
        #menuList li:hover{
            background-color: #81D4FA;
            box-shadow:  inset 0px 0px 10px gray;
        }
        #menuList li:active{
            background-color: #00B8D4;
            transform: scale(.95);
            transition: ease;

        }

        /*팔로윙*/

        #followShow{
            width: 400px;
            height: auto;
            overflow: auto;
            background-color: #fff;
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -250px -200px;
            border-radius: 10px;
            z-index: 2;

        }
        #followersShow{
            width: 400px;
            height: auto;
            overflow: auto;
            background-color:  #fff;
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            margin: -250px -200px;
            border-radius: 10px;
            z-index: 2;
        }
        ::-webkit-scrollbar{
            height: 0px;
            width: 10px;
            background: rgba(0,0,0,.2);
            -webkit-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)
        }
        ::-webkit-scrollbar-thumb{
            height: 2px;
            width: 50px;
            background: #333333;
            -webkit-border-radius: 5px;
            border-radius: 5px;
        }
        ::-webkit-scrollbar-track{
            height: 400px;
        }


        #popup{
            width: 100%;
            height: 100%;
            background-color: #3c3c3c;
            position: absolute;
            top: 0;
            left: 0;
            opacity: .3;
            display: none;
            z-index: 1;
        }
        .fTitle{
            position: relative;
            font-size: 25px;
            text-align: center;
            margin-top: 30px;
        }
        .followView{
            width: 300px;
            height: 100px;
            margin: auto;
            position: relative;
            list-style:none;
  			padding-left:0px;

        }
        .followersView{
            width: 300px;
            height: 100px;
            margin: auto;
            position: relative;
        }
        .fImg{
            width: 60px;
            height: 60px;
            border-radius: 30px;
            margin-top: 20px;
            margin-left: 10px;
            cursor: pointer;
        }
        .fNickname{
            position: absolute;
            top: 40px;
            left: 90px;
        }
        .followingBtn{
            width: 100px;
            height: 40px;
            font-size: 15px;
            border-radius: 20px;
            position: absolute;
            top: 30px;
            right: 10px;
            outline: 0;
            border: none;
            cursor: pointer;
            background-color: rgb(221, 221, 221);
            border: 1px solid #424242;
            line-height: 35px;
            text-align: center;
        }
        #followingTopBtn{
        	width: 100px;
            height: 40px;
            font-size: 15px;
            border-radius: 20px;
            position: absolute;
            outline: 0;
            border: none;
            cursor: pointer;
            border: 1px solid #424242;
            top:3px;
        }
        
        .follow{
            background-color: #E91E63;
            color: #fff;
        }


        /*menu 버튼*/
        .on{
            display: block;
        }
        
        /* 2차에 구현 부분 */
        
        #nextTime{
        	width: 1080px;
        	height: auto;
        	overflow: hidden;
        }
        #nextTime>p{
        	text-align: center;
        	font-size: 60px;
        }
        #nextTime>img{
        	margin-top: 15px;
        	margin-left: 250px;
        }
        
        .hashBox{
        	width: 280px;
        	height: 20px;
        	 position: absolute;
            bottom: 86px;
            right: 6px;
        }
		.hash {
            padding: 1px 5px;
            width: 80px;
            height: 20px;
            background-color: #A1887F;
            border-radius: 20px;
            font-size: 15px;
            text-align: center;
            text-shadow: 1px 1px 1px #424242;
            line-height: 20px;
            color: white;
            float: left;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            margin-left: 3px;
		}
        

    </style>
</head>
<body>
 <c:import url="/WEB-INF/template/header.jsp"></c:import> 

<div id="mypageContents" >
    <img id="profile" src="/img/profile/${dounorProfile.profile }" />
    <p id="nickname">${dounorProfile.nickname }</p>
    <div class="setBox">
   
    <c:choose>
    	<c:when test="${loginDounor.no==dounorProfile.no}">
    		<button class="setUpdate"><i class="set fas fa-cog"></i></button>
    	</c:when>
    	<c:otherwise>
    	<%-- <%
    	Follow follow = new Follow();
    	follow.setNoFollowing(${dounor.no});
    	follow.setNoFollower(${loginDounor});
    	int flag = FollowDAO.selectFollowingNow(follow);
    	System.out.println("mypage flag" + flag);
    	%> --%>
	    	<c:choose>
	    		<c:when test="${followFlag==1}">
	    			<button value="${dounorProfile.no}" id="followingTopBtn" class="f_btn follow">팔로우 중</button>
	    		</c:when>
	    		<c:otherwise>
	    			<button value="${dounorProfile.no}" id="followingTopBtn" class="f_btn"  style="background-color: rgb(221, 221, 221)">now following</button>
	    		</c:otherwise>
	    	</c:choose>
    	</c:otherwise>
    </c:choose>

    </div>
	
    <div id="followList">
        <div><p id="follow">팔로잉</p></div>
        <div class="followNum"><p>${FollowingNum }</p></div>
        <div><p id="followers">팔로워</p></div>
        <div class="followersNum"><p>${FollowerNum }</p></div>
    </div>
		<table id="donutList">
        <tbody>
            <tr>
                <!--
                donutBack :  전체 도넛
                donutShadow1 : 첫번째 .3 있는 도넛
                doShadow : .3 있는 도넛
                do번호번호 : 리얼 도넛 순서 ex)doOne1, doOne2
                do번호 도넛들 순서
                -->
                <td class="pink"><!-- 도넛 pink 도넛과함께 -->
                    <img class="donutBack doOne donutShadow1 doShadow" src="/img/pink2.png"/>
                    
                    <c:choose>
                    	<c:when test="${dounorProfile.pink==0}">
                    	</c:when>
                    	<c:when test="${dounorProfile.pink>0 && dounorProfile.pink<5}">
                    	<img class="donutBack doOne donutReal" src="/img/donut/d${dounorProfile.pink }.png"/>
                    	</c:when>
                    	<c:otherwise>
                    	    <img class="donutBack doOne donutReal" src="/img/donut/p${dounorProfile.pink }.png"/>
                    	</c:otherwise>
                    </c:choose>       
                </td>
                
               <td class="green"><!-- 도넛green 잃어버린 도넛을 찾아서 -->
                    <img class="donutBack doTwo donutShadow2 doShadow" src="/img/green2.png"/>
                    <c:choose>
                    	<c:when test="${dounorProfile.green==0 }"></c:when>
                    	<c:when test="${dounorProfile.green>0&&dounorProfile.green<5}">
                    	<img class="donutBack doTwo donutReal" src="/img/donut/d${dounorProfile.green }.png"/>
                    	</c:when>
                    	<c:otherwise>
                    		<img class="donutBack doTwo donutReal" src="/img/donut/g${dounorProfile.green }.png"/>
                    	</c:otherwise>
                    </c:choose>
                </td>
                <td class="red"><!-- 도넛red 도넛의유혹 -->
                 <img class="donutBack doTre donutShadow3 doShadow" src="/img/red2.png"/>
 					<c:choose>
 						<c:when test="${dounorProfile.red==0 }"></c:when>
 						<c:when test="${dounorProfile.red>0 && dounorProfile.red<5}">
                    	<img class="donutBack doTre donutReal" src="/img/donut/d${dounorProfile.red }.png"/>
                    	</c:when>
 						<c:otherwise>
 							<img class="donutBack doTre donutReal" src="/img/donut/r${dounorProfile.red }.png"/>
 						</c:otherwise>
 					</c:choose>
                </td>
                <td class="brown"><!-- 도넛chco 도넛의 질주 -->
                    <img class="donutBack doFour donutShadow4 doShadow" src="/img/brown2.png"/>
                  	<c:choose>
 						<c:when test="${dounorProfile.chco==0 }"></c:when>
 						<c:when test="${dounorProfile.chco>0 && dounorProfile.chco<5}">
                    	<img class="donutBack doFour donutReal" src="/img/donut/d${dounorProfile.chco }.png"/>
                    	</c:when>
 						<c:otherwise>
 							<img class="donutBack doFour donutReal" src="/img/donut/c${dounorProfile.red }.png"/>
 						</c:otherwise>
 					</c:choose>
                </td>
            </tr>
            <tr>
                <td class="orange"><!-- 도넛orange 웰컴투도넛 -->
                	<c:choose>
                		<c:when test="${dounorProfile.orange==0 }">
                			<img class="donutBack doFive donutShadow5 doShadow" src="/img/orange2.png"/>
                		</c:when>
                		<c:otherwise>
                			<img class="donutBack doFive donutReal" src="/img/donut/o${dounorProfile.orange }.png"/>
                		</c:otherwise>
                	</c:choose>
                </td>
                <td class="blue"><!-- 도넛blue 도넛왕 -->
                    <img class="donutBack doSix donutShadow6 doShadow" src="/img/blue2.png"/>
                    <c:choose>
                    	<c:when test="${dounorProfile.blue==0 }"></c:when>
                    	<c:when test="${dounorProfile.blue>0 && dounorProfile.blue<5}">
                    	<img class="donutBack doSix donutReal" src="/img/donut/d${dounorProfile.blue }.png"/>
                    	</c:when>
                    	<c:otherwise>
                    		 <img class="donutBack doSix donutReal" src="/img/donut/b${dounorProfile.blue }.png"/>
                    	</c:otherwise>
                    </c:choose>                    
                </td>
                <td class="white"><!-- 도넛white 머리속의 도넛 -->
                    <img class="donutBack doSev donutShadow7 doShadow" src="/img/white2.png"/>
                   	<c:choose>
	                   	<c:when test="${dounorProfile.white==0 }"></c:when>
	                   	<c:when test="${dounorProfile.white>0 && dounorProfile.white<5}">
                    	<img class="donutBack doSev donutReal" src="/img/donut/d${dounorProfile.white }.png"/>
                    	</c:when>	
                   		<c:otherwise>
                   			<img class="donutBack doSev donutReal" src="/img/donut/w${dounorProfile.white }.png"/>
                   		</c:otherwise>
                   	</c:choose>
                   	
                    
                </td>
                <td  class="yellow"><!-- 옐로우도넛 친절한 도넛씨 -->
                    <img class="donutBack doEig donutShadow8 doShadow" src="/img/yellow2.png"/>
                    <c:choose>
                    	<c:when test="${dounorProfile.yellow==0 }"></c:when>
                    	<c:when test="${dounorProfile.yellow>0 && dounorProfile.yellow<5}">
                    	<img class="donutBack doEig donutReal" src="/img/donut/d${dounorProfile.yellow }.png"/>
                    	</c:when>	
                    	<c:otherwise>
                    		<img class="donutBack doEig donutReal" src="/img/donut/y${dounorProfile.yellow }.png"/>
                    	</c:otherwise>
                    </c:choose>    
                </td>
            </tr>
        </tbody>
    </table>
</div><!-- #mypageContents end --> 

<div id="menuList">
    <ul>
        <li id="hLogBtn">
        	<a href="/user/${dounorProfile.no}/hlog/page/1">
            <img src="/img/HLog.png"/>
            <p>H-Log</p>
            </a>
        </li>
        <li id="togetherBtn">
        	<a href="/user/${dounorProfile.no}/together/page/1">
            <img src="/img/together.png"/>
            <p >Together</p>
            </a>
        </li>
        <li id="reviewBtn">
        	<a href="/user/${dounorProfile.no}/review/page/1">
            <img src="/img/review.png"/>
            <p>Review</p>
            </a>
        </li>
        <li id="founderBtn">
        	<a href="/user/${dounorProfile.no}/founder">
            <img src="/img/founder.png"/>
            <p >Founder</p>
            </a>
        </li>
		<c:if test="${loginDounor.no==dounorProfile.no }">
			<a href="/user/${dounorProfile.no}/scrap">
			<li id="scrapBtn">
	            <img src="/img/scrap.png"/>
	            <p>Scrap</p>
	            </a>
	        </li>
		</c:if>
    </ul>
</div>

<!-- Hlog -->

<div class="proHLog on">
    <div id="hLogContent">
        <ul id="hLogList">
	        	<c:forEach items="${hlogList }" var="hlog">
			        	<li  class="hlog">			
			        		<div class="box">
		           		   <a href="/hlog${hlog.no }" class="hlogNext"><div  class="hlogImg"  style="${hlog.getPicType()}"></div></a>
		            	   <div class="star hlogStar"><img src="/img/star.png" width="20" height="20"></div>
		            	   <!-- <a href="search.jsp?no=" class="s1 hash">#</a>
		           		   <a href="search.jsp?no=" class="s2 hash">#</a> -->
		       			</div>
		        		<div class="box_m">
		            		<img class="user" src="/img/profile/${hlog.profile }">
		            		<a href="/hlog${hlog.no }" class="hlogName">${hlog.title }</a>
		            		<div class="hlogNickname">${hlog.nickname }</div>
		            		<img class="ice" src="/img/ice${hlog.hice }.png">
		            		<div class="heart hlogHeart"><img src="/img/heart.png" width="20" height="20">${hlog.likeNum }</div>
		        		</div>			
			    		</li><!-- hlog-->
			    	</c:forEach>
        </ul>
		<c:if test="${hlogTotal==0 }">
					<div id="emptyHlogListBox">
	        			<p id="emptyHlogList">작성하신 글이 없습니다.</p>
	        		</div>
		</c:if>	
    </div>
     ${paginate }
</div>

<!-- together -->
<%-- 
<div class="proTogetherList">
    <ul id="proTogetherContents"> <!--동행 리스트 영역 -->
    <%
    	List<Together> togethers = TogethersDAO.selectProTogetherList(dounor.getNo());
    	for( Together together : togethers ){
    		
    		Calendar thatTime = Calendar.getInstance();
    		long now = thatTime.getTimeInMillis();
    		thatTime.setTime(together.getMeetDate());
    		long that = thatTime.getTimeInMillis();
    %>
		<li class="togetherPerson">
		        <div class="proTogether">
		            <img class="togetherImage" src="/spot/<%=together.getPicName()%>">
		            <div class="togetherDate"><%=together.getMeetDate() %> <%=together.getMeetTime() %></div>
		            <img class="togetherSiren" src="img/alarm.png" width="25" height="25">
		            <div class="togetherContent"><%=together.getContents() %></div>
		 			<a href="/search.jsp?no=" class="togetherTag s1">#</a>
		            <a href="/search.jsp?no=" class="togetherTag s2">#</a>
		            <div class="togetherPersonnel">
		            <% 
		            	int result = TogethersDAO.selectPersonnelTotal(together.getNo());
		            	
		            %><%=result%>/<%=together.getPersonnel() %>명</div>
		            <%
		            	String flag = together.getGender();
		            	if(flag == "A"){
		            		flag = "womanman";		     
		            	}else if(flag == "M"){
		            		flag = "man";
		            	}else{
		            		flag = "woman";
		            	}//if~else end
		            %>
		            <div class="togetherGender"><img src="img/<%=flag %>.png"></div>
		            <div class="togetherFinish"><% if(result == together.getPersonnel() || now>=that) {
                        %><em class="end">모집완료</em>
                        <%} else { %>
                        	<em class="ing">모집중</em> 
                        <%} %></div>
		        </div>
		     <% 
		     List<Review> reviews = null;
		    	if(together.getSpotType().equals("T")){
		    		 reviews = ReviewsDAO.selectProTogetherReviewTourList(together.getNo());
		    	}else{
		    		 reviews = ReviewsDAO.selectProTogetherReviewfoodList(together.getNo());
		    	}//if end
		     for( Review review : reviews){ %>
		        <div class="otherPerson">
		            <div class="togetherReviewMal"><img src="img/mal.jpg"></div>
		            <div class="togetherReviewIce"><img src="img/ice<%=review.getHice() %>.png"></div>
		            <a href="profile.jsp?no=<%=review.getDounorNo()%>"><div class="togetherReviewFace"><img src="/profile/<%=review.getProfile()%>" width="30" height="30"></div></a>
		            <span class="togetherReviewNick"><%=review.getNickname()%></span>
		            <span class="togetherReviewDay"><%=review.getRegdate() %></span>
		            <div class="togetherReviewContent"><%=review.getContents() %></div>
		            <div class="heart togetherReviewHeart"><img src="img/heart.png" width="20" height="20"></div>
		            <div class="siren togetherReviewSiren"><img src="img/siren.png" width="20" height="20"></div>
		            <div class="togetherReviewPic"><i class="far fa-images"></i></div>
		        </div><!--.otherPerson end-->
		        <% }//for end %>
		 </li><!-- .togetherPerson end -->
		 <% }//for end %>
    </ul><!--.proTogetherContents end-->
    	<%
        	int TogetherCount = TogethersDAO.selectProTogetherCount(dounor.getNo());
        	if(TogetherCount==0){
        %>
        <div id="emptyTogetherListBox">
        	<p id="emptyTogetherList">작성하신 동행이 없습니다.</p>
        </div>
        <%}//if end %>
</div><!--.proTogetherList end-->

<!-- review -->
<div class="proReview" >
    <ul id="reviewList">
				<% 
		List<Review> list = ReviewsDAO.selectProReviewList(dounor.getNo());
		for(Review review:list){ %>
		    <li class="reviewOneBox">
		        <div class="reviewMal"><img src="img/mal.jpg"></div>
		        <div class="reviewIce"><%
		        int reviewHice = 0;	
		        if(review.getSpotType().equals("F")){
		        	reviewHice = ReviewsDAO.selectProReviewFoodHice(review.getNo());	
		        }else{
		        	reviewHice = ReviewsDAO.selectProReviewTourHice(review.getNo());
		        }%>
		        <img src="img/ice<%=reviewHice %>.png"></div> 
		        <div class="reviewFace"><img src="/profile/<%=dounor.getProfile()%>" width="30" height="30"></div>
		        <span class="reviewNick"><%=dounor.getNickname()%></span>
		        <span class="reviewDay"><%
		        %><%=review.getRegdate() %></span>
		        <div class="reviewContent"><%=review.getContents() %></div>
		        <div class="heart reviewHeart"><img src="img/heart.png" width="20" height="20"></div>
		        <div class="siren reviewSiren"><img src="img/siren.png" width="20" height="20"></div>
		        <div class="reviewPic">
		        	<%
		        	if(review.getPicRoute()!=null){
			        	%>
			        	<i class="far fa-images"></i>
			        	<%}//if end %>
			        	<div class="reviewNum"><%=review.getNo() %></div>
			        	<div class="reviewHiceNum"><%=reviewHice %></div>
			        </div>
			        <% if(review.getSpotType().equals("F")){ %>
			       	<div class="reviewLocation"><%=review.getSpotName() %></div>
			        <% } else{ %>
			        <div class="reviewLocation"><%=review.getSpotName() %></div>
			        <% } // if~else end %>
			    </li><!--reviewOneBox-->
			<%
			}//for end %>
	    </ul>
        <%
        	int reviewCount = ReviewsDAO.selectProReviewCount(dounor.getNo());
        	if(reviewCount==0){
        %>
        <div id="emptyReviewListBox">
        	<p id="emptyReviewList">작성하신 리뷰가 없습니다.</p>
        </div>
        <%}//if end %>
</div>
<div class="proReview" >
    <ul id="reviewList">
	<script type="text/template" id="proReviewTmp">
		<@_.each(proReview,function(review){@>
    		<li class="reviewOneBox" value="<@=review.no@>">
				<div class="reviewNum"><@=review.no@></div>
		        <div class="reviewMal"><img src="img/mal.jpg"></div>
		        <div class="reviewIce"><img src="/img/ice3.png"></div>
		        <div class="reviewFace"><img src="/profile/<@=review.profile@>" width="30" height="30"></div>
		        <span class="reviewNick"><@=review.nickname@></span>
		        <span class="reviewDay"><@=review.regdate @></span>
		        <div class="reviewContent"><@=review.contents@></div>
		        <div class="heart reviewHeart"><img src="img/heart.png" width="20" height="20"></div>
		        <div class="siren reviewSiren"><img src="img/siren.png" width="20" height="20"></div>
		        <div class="reviewPic"><i class="far fa-images"></i></div>
		        <a href="#" class="reviewLocation"><@=review.spotName@></a>   		       
		    </li>
		<@})@>
	</script><!--reviewOneBox-->
    </ul>
    <%
        	int reviewCount = ReviewsDAO.selectProReviewCount(dounor.getNo());
        	if(reviewCount==0){
        %>
        <div id="emptyReviewListBox">
        	<p id="emptyReviewList">작성하신 리뷰가 없습니다.</p>
        </div>
        <%}//if end %>
</div>
	<!-- 리뷰 팝업 -->
    <div id="reviewContents">
    
    <script type="text/template" id="proReviewDetailTmp">
		<div id="reviewTitle">
            <span>REVIEW</span>
            <img class="reviewTopHeart heart" src="img/emptyHeart.png" width="25" height="25">
            <button class="reviewBoxCloseBtn"><i class="fas fa-times"></i></button>
        </div>
        <@ if(proReviewDetail.spotType=="T"){@>
			<a href="tourDetail.jsp?no=<@=proReviewDetail.noSpot@>" class="reviewSpotName"><@=proReviewDetail.spotName@></a>
		<@ }else{ @>
		<a href="foodDetail.jsp?no=<@=proReviewDetail.noSpot@>" class="reviewSpotName"><@=proReviewDetail.spotName@></a>
        <@ } @>
		<div class="reviewPicContents">
            <div>       
                <ul class="reviewPicList">
                    <li>
                        <img class="reviewPic" src="/review/<@=proReviewDetail.picRoute @>"/>
                        <img class="reviewPicUser" src="/profile/<@=proReviewDetail.profile @>">
                    </li>
                </ul>
            </div>
        </div>
        <div id="personReview">
            <div class="otherPerson">
                <img class="reviewUser" src="/profile/<@=proReviewDetail.profile @>">
                <p class="reviewNickname"><@=proReviewDetail.nickname@></p>
                <img class="reviewHice" src="img/ice<@=proReviewDetail.hice@>.png">
                <p class="reviewDate"><@=proReviewDetail.formatRegdate@></p>
                <div class="reviewContentsBox"><p class="reviewContents"><@=proReviewDetail.contents@></p></div>
                <button class="reviewSiren"><img  src="img/siren.png" width="25" height="25"></button>
                <img class="reviewHeart heart" src="img/emptyHeart.png" width="25" height="25">
            </div>
        </div>
	</script><!--reviewPicList-->
    </div>
<!-- 리뷰 팝업 end -->
 --%>
<!-- founder -->

<div class="founderContents on">

	<c:if test="${tourFounderNum>0 }">
	<div id="founderSearchList">
        <input id="founderSearch" placeholder="내용을 입력해 주세요." />
        <button id="founderSearchBtn"><img src="/img/Search.png" width="20" height="20"></button>
    </div><!-- #founderSearchList end -->
	
     <div class="founderTitleBox">
        <span class="founderName">관광명소</span>
        <p class="founderAmount countNum">${tourFounderCount}</p>
        <a class="founderDetail" href="tour">+더보기</a>
        <c:if test="${tourFounderNum>3 }">
        <button class="founderBtn founderLeftBtn leftBtn"><i class="fas fa-angle-left"></i></button>
        <button class="founderBtn founderRightBtn rightBtn"><i class="fas fa-angle-right"></i></button>
        </c:if>
    </div>
    <div id="founderAttractionBox">
        <ul id="founderAttractionList"  style="width :${tourFounderNum*320}px" class="contentsBox">
        	<c:forEach items="${tourFounder}" var="founderTour">
        		<li class="founderAttraction">
		        <div class="founderBox">
		            <a href="/spot/${founderTour.getNo() }" class="founderAttractionImg"><img src="/img/spot/${founderTour.picname}"></a>
		            <div class="founderStar founderAttractionStar"><img src="/img/star.png" width="20" height="20"></div>
		        <div class="hashBox">
<%-- 	            <% 
	            List<Tag> hashs = TagsDAO.selectTag(founderTour.getNo());
	            for (Tag hash : hashs){ 
	            	System.out.println("Tour해쉬태그:"+hash.getName());
	            %>
	            	<a href="search.jsp?no="><div class="h1 hash">#<%=hash.getName() %></div></a>
				<% } //for end %> --%>
	            </div>
		        </div>
		        <div class="founderBox_m">
		            <img class="founderUser" src="/img/profile/${founderTour.getProfile() }" value="${founderTour.price}">
		            <a href="/spot/${founderTour.getNo() }" class="founderAttractionName">${founderTour.getName() }</a>
		 			<c:if test="${founderTour.price > 0 }">   
                     	<img class="founderMoney" src="/img/coin.png" width="20" height="20" >
                  	</c:if>
		            <div class="founderAttractionNickname">${founderTour.getNickname() }</div>
		            <img class="founderIce" src="/img/ice${founderTour.getHiceNum() }.png">
		            <div class="founderHeart founderAttractionHeart"><img src="/img/heart.png" width="20" height="20"></div>
		        </div>
		    </li><!-- attraction-->
        	</c:forEach>
        </ul>
    </div>
    </c:if><%-- //if end 파운더 관광명소 값이 없을경우 안나옴 --%>
	
	<c:if test="${foodFounderNum>0}">
		 <div id="founderSearchList">
	        <input id="founderSearch" placeholder="내용을 입력해 주세요." />
	        <button id="founderSearchBtn"><img src="/img/Search.png" width="20" height="20"></button>
	    </div><!-- #founderSearchList end -->	
			<div class="founderTitleBox">
		        <span class="founderName">음식점</span>
		        <p class="founderAmount countNum">${foodFounderNum}</p>
		        <a class="founderDetail" href="/food">+더보기</a>
		     <c:if test="${foodFounderNum>3}">
		        <button class="founderBtn founderLeftBtn leftBtn"><i class="fas fa-angle-left"></i></button>
		        <button class="founderBtn founderRightBtn rightBtn"><i class="fas fa-angle-right"></i></button>
		   	</c:if>
		    </div>
		    <div id="founderRestaurantBox" >
		        <ul id="founderRestaurantList" style="width : ${foodFounderNum*320}px" class="contentsBox">
				<c:forEach items="${foodFounder}" var="founderFood">
			 		<li class="founderRestaurant">
				        <div class="founderBox">
				            <a href="/spot/${founderFood.getNo() }" class="founderRestaurantImg"><img src="/img/spot/${founderFood.getPicname() }"></a>
				            <div class="founderStar founderRestaurantStar"><img src="/img/star.png" width="20" height="20"></div>
				            <div class="hashBox">
				            <%-- <% 
					            List<Tag> hashs = TagsDAO.selectTag(founderFood.getNo());
					            for (Tag hash : hashs){ 
					            	System.out.println("Food해쉬태그:"+hash.getName());
					            %>
					            	<a href="search.jsp?no="><div class="h1 hash">#<%=hash.getName() %></div></a>
								<% } //for end %> --%>
							</div>
				        </div>
				        <div class="founderBox_m">
				            <img class="founderUser" src="/img/profile/${founderFood.getProfile() }">
				            <a href="/spot/${founderFood.getNo() }" class="founderRestaurantName">${founderFood.getName() }</a>
				            <div class="founderRestaurantRealWon"  value="${founderFood.price }">	            
				               <c:forEach begin="0" end="${founderFood.price/10000==0?1:founderFood.price/10000 }">
                      				<img class="realWon " src="/img/won.png" width="20" height="20">
                   				</c:forEach>
				            </div>
				            <div class="founderRestaurantNickname">${founderFood.getNickname() }</div>
					            <img class="founderIce" src="/img/ice${founderFood.getHiceNum() }.png">
					            <div class="founderHeart founderRestaurantHeart"><img src="/img/heart.png" width="20" height="20"></div>
					        </div>
					    </li><!-- restaurant-->
				</c:forEach>
	        </ul>
	    </div>
	    </c:if><%--/if end 파운더 음식점이 없다면 --%>
	     <c:if test="${foodFounderNum==0 && tourFounderNum==0}">
	     	 <div id="emptyFounderListBox">
	        	<p id="emptyFounderList">찾으신 스팟들이 없습니다.</p>
	         </div>
	     </c:if>
</div><!--#founderContents end-->
 <%--
<!-- scrap -->
<div class="scrapContents" >
 <!--    <div id="nextTime">
    	<p>현재 준비중입니다.</p>
    	<img src="/img/chopa.jpg"/>
    </div> -->
    
    <div id="scrapSearchList">
        <input id="scrapSearch" placeholder="내용을 입력해 주세요." />
        <button id="scrapSearchBtn"><img src="img/Search.png" width="20" height="20"></button>
    </div><!-- #scrapSearchList end -->

    <%
    	int scrapTourNum = DounorSavesDAO.selectProScrapTourCount(dounor.getNo());
    	if(scrapTourNum>0){
    %>
    <div class="scrapTitleBox">
        <span class="scrapName">관광명소</span>
        <p class="scrapAmount"><%=scrapTourNum %></p>
        <a href="tourDetail.jsp?no="  class="scrapDetail" href="tour.jsp?no=">+더보기</a>
        <button class="scrapBtn scrapLeftBtn leftBtn"><i class="fas fa-angle-left"></i></button>
        <button class="scrapBtn scrapRightBtn rightBtn"><i class="fas fa-angle-right"></i></button>
    </div>
    <div id="scrapAttractionBox">
        <ul id="scrapAttractionList">
        <%
        	List<DounorSave> scrapTours = DounorSavesDAO.selectProScrapTourList(dounor.getNo());
        	for(DounorSave scrapTour :scrapTours){
        %>
			<li class="scrapAttraction contentsBox" >
		        <div class="scrapBox">
		            <a href="tourDetail.jsp?no=<%=scrapTour.getSpotNo() %>" class="scrapAttractionImg"><img src="/spot/<%=scrapTour.getPicname()%>"></a>
		            <div class="scrapStar scrapAttractionStar"><img src="img/star.png" width="20" height="20"></div>
		        <div class="hashBox">
	            <% 
	            System.out.println("스크랩투어번호 :"+scrapTour.getSpotNo());
	            List<Tag> hashs = TagsDAO.selectTag(scrapTour.getSpotNo());
	            for (Tag hash : hashs){ 
	            	System.out.println("해쉬태그:"+hash);
	            %>
	            	<a href="search.jsp?no="><div class="h1 hash">#<%=hash.getName() %></div></a>
				<% } //for end %>
	            </div>
		        </div>
		        <div class="scrapBox_m">
		            <a href="profile.jsp?no=<%=scrapTour.getNoDounor() %>" ><img class="scrapUser" src="/profile/<%=scrapTour.getProfile() %>"></a>
		            <a href="tourDetail.jsp?no=" class="scrapAttractionName"><%=scrapTour.getSpotName() %></a>
					<%
		            if(scrapTour.getPrice()>0){
		            	%><img class="scrapmoney" src="/img/coin.png" width="20" height="20" >
		            <%}//if end%>
		            <div class="scrapAttractionNickname"><%=scrapTour.getNickname() %></div>
		             <% 
		            Double hice = FoodGradesDAO.selectFoodHice(scrapTour.getSpotNo());
	
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
		            <img class="scrapIce" src="img/ice<%=num %>.png">
		            <div class="scrapHeart scrapAttractionHeart"><img src="img/heart.png" width="20" height="20"></div>
		        </div>
		    </li><!-- attraction-->
		    <%}//for end %>
        </ul>
    </div>
    <%}//if end 스크랩 관광명소 %>


	<%
		int scrapFoodNum = DounorSavesDAO.selectProScrapFoodCount(dounor.getNo());
		if(scrapFoodNum>0){
	%>
    <div class="scrapTitleBox">
        <span class="scrapName">음식점</span>
        <p class="scrapAmount"><%=scrapFoodNum %></p>
        <a href="foodDetail.jsp?no=" class="scrapDetail" href="food.jsp?no=">+더보기</a>
        <button class="scrapBtn scrapLeftBtn leftBtn"><i class="fas fa-angle-left"></i></button>
        <button class="scrapBtn scrapRightBtn rightBtn"><i class="fas fa-angle-right"></i></button>
    </div>
    <div id="scrapRestaurantBox">
        <ul id="scrapRestaurantList">
			<%
			List<DounorSave> scrapFoods = DounorSavesDAO.selectProScrapFoodList(dounor.getNo());
			for( DounorSave scrapFood : scrapFoods ){
				%>
			<li class="scrapRestaurant contentsBox">
			        <div class="scrapBox">
			            <a href="foodDetail.jsp?no=<%=scrapFood.getSpotNo() %>" class="scrapRestaurantImg"><img src="/spot/<%=scrapFood.getPicname() %>"></a>
			            <div class="scrapStar scrapRestaurantStar"><img src="img/star.png" width="20" height="20"></div>
			            <a href="search.jsp?no=" class="scrapS1 scrapHash">#<a>
			            <a href="search.jsp?no=" class="scrapS2 scrapHash">#</a>
			        </div>
			        <div class="scrapBox_m">
			            <a  href="profile.jsp?no=<%=scrapFood.getNoDounor() %>"><img class="scrapUser" src="/profile/<%=scrapFood.getProfile() %>"></a>
			            <a href="foodDetail.jsp?no=" class="scrapRestaurantName"><%=scrapFood.getSpotName() %></a>
			            <div class="scrapRestaurantRealWon" >
			                 <%int count = 0;
				                int value = scrapFood.getPrice();
				
				                if(value<=10000){
				                	count=1;
				                }else if(value>10000 && value<=20000){
				                	count=2;
				                }else if(value>20000 && value<=30000){
				                	count=3;
				                }else{
				                	count=4;
				                }
				                for(int i = 0; i < count;i++) {
					                %><img class="scrapRealWon" src="img/won.png" width="20" height="20">
					                <%}//for end %>
					            </div>
					            <div class="scrapRestaurantNickname"><%=scrapFood.getNickname() %></div>
					        <% 
		            Double hice = FoodGradesDAO.selectFoodHice(scrapFood.getSpotNo());
	
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
			            <img class="scrapIce" src="/img/ice<%=num %>.png">
			            <div class="scrapHeart scrapRestaurantHeart"><img src="img/heart.png" width="20" height="20"></div>
			        </div>
			    </li><!-- restaurant-->
			   <%}//for end %> 
        </ul>
    </div>
    <%}//if end 스크랩 food %>
	
	<%
		int scrapHlogNum = 0;		   
		if(scrapHlogNum>0){
	%>
    <div class="scrapTitleBox">
        <span class="scrapName">HLog</span>
        <p class="scrapAmount">1</p>
        <a href="hlogDetail.jsp?no=" class="scrapDetail" href="hlog.jsp?no=">+더보기</a>
        <button class="scrapBtn scrapLeftBtn leftBtn"><i class="fas fa-angle-left"></i></button>
        <button class="scrapBtn scrapRightBtn rightBtn"><i class="fas fa-angle-right"></i></button>
    </div>
    <div id="scrapHLogBox">
        <ul id="scrapHLogList">

        </ul>
    </div>
    <%}//if end 스크랩 Hlog %>
    
    <%
	     if(scrapFoodNum==0 && scrapTourNum==0 && scrapHlogNum==0){
	%>
	        <div id="emptyFounderListBox">
	        	<p id="emptyFounderList">스크랩한 글들이 없습니다.</p>
	        </div>
	        <%}//if end %>


</div><!--#scrapContents end-->

 --%>


<div id="footer">
    <a href="">회사소개</a>
    <a href="">이용약관</a>
    <a href="">개인정보처리방침</a>
    <a href="">고객센터</a>
    <a href="">&copy; I(YOLO) corp.</a>
</div>

<div id="followShow" class="show"><!--팝업-->
    <p class="fTitle"><u>팔로우</u></p>
    <ul id="followingBox">
	<script type="text/template" id="proFollowingTmp">
	<@_.each(followingList,function(following){@>
	    <li class="followView flag1">
	        <img class="fImg" src="/img/profile/<@=following.dounorProfile@>"/>
	        <span class="fNickname"><@=following.dounorNickname@></span>
	        <a href="/user/<@=following.dounorNo@>/hlog/page/1"><div class="followingBtn f_btn follow">방문하기</div></a>
			<%-- <button value="<@=following.dounorNo@>" class="followingBtn f_btn" <@=followCount@>"><%if(myFollowerFlag==1){%>팔로우 중<%}else{%>Now Following<%}//if~else end %></button> --%>
	    </li>
	<@})@>
	</script><!--proFollowingTmp-->
    </ul>
</div><!-- #followBtn end -->

<div id="followersShow" class="show"><!--팝업-->
	<p class="fTitle"><u>팔로워</u></p>
	<ul id="followerBox">
   	<script type="text/template" id="proFollowerTmp">
	<@_.each(followerList,function(follower){@>
    <li class="followView flag1">
        <img class="fImg" src="/img/profile/<@=follower.dounorProfile@>"/>
        <span class="fNickname"><@=follower.dounorNickname@></span>
        <a href="/user/<@=follower.dounorNo@>/hlog/page/1"><div class="followingBtn f_btn follow">방문하기</div></a>
    </li>
   <@})@>
	</script><!--profollowerTmp-->
	</ul>
</div><!-- #followersBtn end -->


<div id="popup"></div>



<c:import url="/WEB-INF/template/popLogin.jsp"></c:import>
<script src="/js/moment-with-locales.js"></script>
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

	
	//리뷰
    	
<%-- 	var proReviewTmp = _.template($("#proReviewTmp").html());
	
	var pageNo = 1;
	
	
    url:"ajax/proReview.jsp",
        type:"get",
        dataType:"json",
        data:{"pageNo" : pageNo, "no" : dounorNo},
        error:function (request,status,error) {
            alert("에러");
            alert(request+status+error);
        },success:function (json) {
        	//json.list
        	//json.paginate
        	console.log(json.list[0].no);
            $("#reviewList").append(proReviewTmp({"proReview":json.list}));
        	
        	$("#paginateBox").html(json.paginate);
        }
    });	 --%>
	
	//리뷰 팝업
	var dounorNo = ${dounorProfile.no};
	console.log("프로필유저 번호 : "+dounorNo);
	var proReviewNum = 0;
	var reviewHiceNum = 0;
	/* var proReviewDetailTmp = _.template($("#proReviewDetailTmp").html());
	
	
	function getproReviewDetail() {
		
		$.ajax({
	        url:"ajax/proReviewDetail.jsp",
	        type:"get",
	        dataType:"json",
	        data:{"no" : proReviewNum, "noDounor" : dounorNo,"hice":reviewHiceNum},
	        error:function (request,status,error) {
	            alert("에러");
	            alert(request+status+error);
	        },success:function (json) {
	        	console.log(json);
	            $("#reviewContents").append(proReviewDetailTmp({"proReviewDetail":json}));
	        }
	    });
	}//getproReviewDetail() end
	 */
	
	
	$(".reviewPic").click(function() {
		
		console.log("리뷰상세 클릭");
		proReviewNum = $(this).find('.reviewNum').text();
		reviewHiceNum = $(this).find('.reviewHiceNum').text();
		console.log("proReviewNum : "+ proReviewNum);
		console.log("reviewHiceNum : "+ reviewHiceNum);
		getproReviewDetail();
		$('#reviewContents').css('display','block');
		console.log("proReviewNum : "+proReviewNum + " dounorNo : "+ dounorNo);
	});
	
	 $('#reviewContents').on("click",".reviewBoxCloseBtn",function () {
	    	console.log("리뷰팝업 닫기");
	    	$('#reviewContents').children().remove();
	    	$('#reviewContents').css('display','none'); 
	    	console.log("리뷰팝업 닫기 누름");
	 });

	
    var $follow = $("#follow");
    var $followShow = $("#followShow");
    var $followers = $("#followers");
    var $followersShow = $("#followersShow");
    var $popup = $("#popup");
    var $show = $(".show .followingBtn");
    var $followingBtn = $(".followingBtn");  
    var $f_btn = $(".f_btn");  


    $follow.click(function () {
        console.log("팔로우 클릭");
        $('#followingBox').children().remove();
        getfollowingBix();
        $followShow.show();
        $popup.show(); 
        console.log("팔로우창 켜짐");
    });

    $followers.click(function () {
        console.log("팔로우 클릭");
        $('#followerBox').children().remove();
        getfollowerBix();
        $followersShow.show();
        $popup.show();
        console.log("팔로우창 켜짐");
    });

    $popup.click(function () {
        $popup.hide();
        $followShow.hide();
        $followersShow.hide();
    });

    //팔로우 버튼 클릭 시
    var followerNum = ${loginDounor.no};
    var followingNum = 0;
    
    $f_btn.click(function () {
        followingNum = $(this).val();  
    	
    	console.log("팔로우 유저 넘버 : " + followerNum+ "팔로잉 유저 넘버 : " + followingNum);
       
        	followBtnClick();
        
        	 var flag = $(this).text();
        	 console.log("flag : "+flag);
        	 if(flag =="now following"){
        		 $(this).css({"background-color":"#E91E63","color":"rgb(255, 255, 255)"}).text("팔로우중");
        	 }else{
        		 $(this).css({"background-color":"rgb(221, 221, 221)","color":"rgb(0, 0, 0)"}).text("now following");
        	 }//if~else end
        
    });
    
    var pageNo = 1;
    
	function followBtnClick() {
		
		$.ajax({
	        url:"/ajax/follow",
	        type:"post",
	        dataType:"json",
	        data:{noFollowing : followingNum},
	        error:function (request,status,error) {
	            alert("에러");
	            alert(request+status+error);
	        },success:function (value) {
	        	console.log(value);
	        }
	    });
	}//followBtnClick() end
   
    
    $("#paginateBox").on("click",".paginate a",function(e) {
    	e.preventDefault();
    	pageNo = $(this).text();
    });

	
	var proFollowingTmp = _.template($("#proFollowingTmp").html());
	
	function getfollowingBix() {
		
		$.ajax({
	        url:"/ajax/user/"+dounorNo+"/hlog/page/"+pageNo,
	        type:"get",
	        dataType:"json",
	        error:function (request,status,error) {
	            alert("에러");
	            alert(request+"///"+status+"///"+error);

	        },
	        success:function (json) {
	        	console.log(json.followingList);
	        	$("#followingBox").append(proFollowingTmp({"followingList":json.followingList}));
	           
	        }
	    });
	}//getfollowingBix() end
	//getfollowingBix();
	
	var proFollowerTmp = _.template($("#proFollowerTmp").html());
	
	function getfollowerBix() {
		
		$.ajax({
	        url:"/ajax/user/"+dounorNo+"/hlog/page/"+pageNo,
	        type:"get",
	        dataType:"json",
	        error:function (request,status,error) {
	            alert("에러");
	            alert(request+"///"+status+"///"+error);

	        },
	        success:function (json) {
	        	console.log(json.followerList);
	        	$("#followerBox").append(proFollowerTmp({"followerList":json.followerList}));
	        }
	    });
	}//getfollowerBix() end
	//getfollowerBix();

    //버튼 클릭시
    var px =0;
	var thisWidthPx = 0;
    $('.leftBtn').click(function () {
        px += 960;
        console.log(px);

        thisWidthPx = $(this).find('.countNum').text();
        console.log("누른 곳의 width값"+ thisWidthPx*320);
        
        //옮길 시 3의 배수가 아닐 경우를 위해 
       	var thisWidthPxOver =  thisWidthPx%3;
        
        //나머지가 0보다 크면 1로 고정
        if(thisWidthPxOver>0){
        	
        	thisWidthPxOver=1; 
        	
        }//if end

        if(px > 0) {
        	//                      -1은 끝으로 보내면 안되서 그럼
        	//-{(3개씩 묶음 + 나머지-1)*960}+1
            px = -((thisWidthPx/3 + thisWidthPxOver-1)*960);
            //px값이 width 값보다 크다면
           
        }//if end

        $(this).parent().next().find('.contentsBox').css("left", px);
    });

    $('.rightBtn').click(function () {
    	
        px -= 960;
        console.log(px);
        
        thisWidthPx = $(this).find('.countNum').text();
        console.log("누른 곳의 width값"+ thisWidthPx*320);
       
    	if(px < -(thisWidthPx*320) ) {
            px = 0;
            
        }//if end

        $(this).parent().next().find('.contentsBox').css("left", px);
    });

    //메뉴 클릭시

    var $proHlog = $("#proHLog");
    var $proTogether = $("#proTogetherList");
    var $proReview = $("#proReview");
    var $proFonder = $("#founderContents");
    var $proScrap = $("#scrapContents");
    var $on = $(".on");
    var $off = $(".off");

    $("#menuList li").on("click",function (e) {
        var idx =$(this).index();
        //alert(idx);

        if(idx==0){
            $(".on").removeClass("on");
            $(".proHLog").addClass("on");
            console.log("Hlog클릭");

        }else if(idx==1){
            $(".on").removeClass("on");
            $(".proTogetherList").addClass("on");
            console.log("Together클릭");

        }else if(idx==2){
            $(".on").removeClass("on");
            $(".proReview").addClass("on");
            console.log("Review클릭");
        }else if(idx==3){
            $(".on").removeClass("on");
            $(".founderContents").addClass("on");
            console.log("founder클릭");
        }else{
            $(".on").removeClass("on");
            $(".scrapContents").addClass("on");
            console.log("scrap클릭");
        }//if~else end
    });

    //해더

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

    
    
    $('.reviewList').on('click','.reviewBox', function name() {
		alert("리뷰등장");
    	console.log("리뷰등장");
		
	});
    $('.proTogetherContents').on('click','.togetherPerson', function name() {
    	alert("동행리뷰등장");
    	console.log("동행리뷰등장");
	});
    
    //다른유저가 들어올시
    var $li = $("#menuList li");
    $(document).ready(function () {
        //alert("1");

        var test = $li.eq(4).text();
        var test2= $li.eq(5).text();
        //alert(test);
        if(test==test2){
            //alert("1");
            $li.css("width","268px");
        }

    });

</script>
<script src="/js/dounorPop.js"></script>
<script src="/js/popReview.js"></script>
</body>
</html>