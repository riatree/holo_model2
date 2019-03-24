
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>HOLO</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<c:import url="/WEB-INF/template/popLogin.jsp"></c:import>

<link rel="stylesheet" href="/css/foodDetail.css">
<link rel="stylesheet" href="/css/foodReview.css">

</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>

	<div id="contentsBox">
		<div id="wraps">
			<div id="detailName">
				<a href="#"><span class="detailName kor">${spot.name }</span></a> <a
					href="#"><span class="detailName eng"></span></a>

				<div class="star">
					<img src="/img/star.png" width="30" height="30">44
				</div>
				<div class="heart">
					<img src="/img/heart.png" width="30" height="30">89
				</div>

				<button class="btn updateBtn">정보수정</button>
				<button class="btn writeBtn">리뷰작성</button>
				<button class="btn sirenBtn">
					<img src="/img/siren.png">
				</button>
			</div>
			<div id="detailTag">
				<c:forEach items="${tag }" var="tag">
					<a href="/search.jsp?no="><span class="detailTag">#${tag.name}</span></a>
				</c:forEach>
			</div><!-- detailTag -->
			
		</div>
		<!--wraps-->


		<div id="inf">
			<div id="infPic">
				<div class="plus">
					<img src="/img/camera.png">
				</div>
				<div>
					<button class="popBtn popleftBtn">
						<i class="fas fa-chevron-left"></i>
					</button>
				</div>
				<div>
					<button class="popBtn poprightBtn">
						<i class="fas fa-chevron-right"></i>
					</button>
				</div>

				<div class="popupPicView">
					<div class="popupPicAll">
						<c:forEach items="${spotpic }" var="spotPic">
							<div class="popupPicOne">
								<div class="popupPicture">
									<img src="/img/spot/${spotPic.picName }">
								</div>
								<a href="profile.jsp?no=" id="popupUser"><img
									class="user popUser" src="/img/profile/${spotPic.profile }"></a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!--infPic-->

			<div id="map"></div>
			<!--map-->


			<div id="dig">
				<div id="digUserInf">
					<a href="/profile.jsp?no="><img
						src="/img/profile/${spot.profile }"></a> <span id="digUser">Founder</span>
					<span id="nickname">${spot.nickname }</span>
				</div>
				<div id="resInf">
					<div id="resInfAddr">
						<span class="subject">주소</span> <span>${spot.address1 }
							${spot.address2 }</span>
					</div>
					<div id="resInfTime">
						<span class="subject">시간</span> <span>${spot.openTime } ~
							${spot.closeTime }</span>
					</div>
					<div id="resInfType">
						<span class="subject">종류</span>
						<c:choose>
							<c:when test="${spot.categoryType=='L' }">
								<span>랜드마크</span>
							</c:when>
							<c:when test="${spot.categoryType=='M' }">
								<span>박물관</span>
							</c:when>
							<c:when test="${spot.categoryType=='P' }">
								<span>자연&공원</span>
							</c:when>
							<c:when test="${spot.categoryType=='S' }">
								<span>쇼핑</span>
							</c:when>
							<c:when test="${spot.categoryType=='T' }">
								<span>교통장소</span>
							</c:when>
							<c:when test="${spot.categoryType=='C' }">
								<span>디저트&카페</span>
							</c:when>
							<c:when test="${spot.categoryType=='R' }">
								<span>식당</span>
							</c:when>
							<c:when test="${spot.categoryType=='B' }">
								<span>바&펍</span>
							</c:when>
							<c:when test="${spot.categoryType=='T' }">
								<span>놀이공원</span>
							</c:when>
							<c:otherwise>
								<span>그 외</span>
							</c:otherwise>
						</c:choose>
					</div>
					<div id="resInfPrice">
						<span class="subject">이용비용</span> <span>${spot.price }원 대</span>
					</div>
					<div id="resInfSer">
						<span class="subject">부가서비스</span>
						<c:forEach items="${service }" var="service">
							<span>${service.name } </span>
						</c:forEach>
					</div>
					<div id="resInfInt">
						<span class="subject">소개</span> <span>${spot.contents }</span>
					</div>
				</div>
			</div>
			<!--dig-->

			<c:choose>
				<c:when test="${spot.type=='F' }">
					<div id="menu">
						<span class="menuName kor">메 뉴</span> <span class="menuName eng">Menu</span>
						<button class="menuPlus">
							<i class="fas fa-plus-circle"></i>
						</button>

        	 <div id="menuAll">
        	 <c:forEach items="${menu }" var="menu">
                    <div class="menuInf">
                        <span class="subject"><i class="fas fa-utensils"></i> ${menu.name }</span>
                        <span> ${menu.price }원</span>
                    </div>
             </c:forEach>
            </div>

					</div>
					<!--menu-->

					<div id="hice">
						<span>HICE</span>
						<c:choose>
							<c:when test="${foodgrade.hiceCount>=4.5 }">
								<div id="hicePic">`1`
									<img src="/img/ice5.png">
								</div>
								<div id="hiceNum">${foodgrade.hiceCount }</div>
								<div id="hiceInf">혼자 완전 강추해요.</div>
							</c:when>
							<c:when
								test="${4.0<=foodgrade.hiceCount && foodgrade.hiceCount<4.5 }">
								<div id="hicePic">
									<img src="/img/ice4.png">
								</div>
								<div id="hiceNum">${foodgrade.hiceCount }</div>
								<div id="hiceInf">혼자가기 매력적이에요.</div>
							</c:when>
							<c:when
								test="${3.0<=foodgrade.hiceCount && foodgrade.hiceCount<4.0 }">
								<div id="hicePic">
									<img src="/img/ice3.png">
								</div>
								<div id="hiceNum">${foodgrade.hiceCount }</div>
								<div id="hiceInf">혼자 무난 했어요.</div>
							</c:when>
							<c:when
								test="${2.0<=foodgrade.hiceCount && foodgrade.hiceCount<3.0 }">
								<div id="hicePic">
									<img src="/img/ice2.png">
								</div>
								<div id="hiceNum">${foodgrade.hiceCount }</div>
								<div id="hiceInf">혼자 갈 순 있어요.</div>
							</c:when>
							<c:when test="${foodgrade.hiceCount<2.0 }">
								<div id="hicePic">
									<img src="/img/ice1.png">
								</div>
								<div id="hiceNum">${foodgrade.hiceCount }</div>
								<div id="hiceInf">혼자 가지 마세요.</div>
							</c:when>
							<c:otherwise>
								<div id="hicePic">
									<img src="/img/ice1.png">
								</div>
								<div id="hiceNum">0</div>
								<div id="hiceInf">아직 HICE가 없어요</div>
							</c:otherwise>
						</c:choose>
					</div>
					<!--hice-->


					<div id="graph">
						<div id="chart-area"></div>
					</div>
					<!--graph-->

				</c:when>
				<c:otherwise>


					<div id="hice">
						<c:choose>
							<c:when test="${tourgrade.hiceCount>=4.5 }">
								<div id="hicePic">
									<img src="/img/ice5.png">
								</div>
								<div id="hiceNum">${tourgrade.hiceCount }</div>
								<div id="hiceInf">혼자 완전 강추해요.</div>
							</c:when>
							<c:when
								test="${4.0<=tourgrade.hiceCount && tourgrade.hiceCount<4.5 }">
								<div id="hicePic">
									<img src="/img/ice4.png">
								</div>
								<div id="hiceNum">${tourgrade.hiceCount }</div>
								<div id="hiceInf">혼자가기 매력적이에요.</div>
							</c:when>
							<c:when
								test="${3.0<=tourgrade.hiceCount && tourgrade.hiceCount<4.0 }">
								<div id="hicePic">
									<img src="/img/ice3.png">
								</div>
								<div id="hiceNum">${tourgrade.hiceCount }</div>
								<div id="hiceInf">혼자 무난 했어요.</div>
							</c:when>
							<c:when
								test="${2.0<=tourgrade.hiceCount && tourgrade.hiceCount<3.0 }">
								<div id="hicePic">
									<img src="/img/ice2.png">
								</div>
								<div id="hiceNum">${tourgrade.hiceCount }</div>
								<div id="hiceInf">혼자 갈 순 있어요.</div>
							</c:when>
							<c:when test="${tourgrade.hiceCount<2.0 }">
								<div id="hicePic">
									<img src="/img/ice1.png">
								</div>
								<div id="hiceNum">${tourgrade.hiceCount }</div>
								<div id="hiceInf">혼자 가지 마세요.</div>
							</c:when>
							<c:otherwise>
								<div id="hicePic">
									<img src="/img/ice1.png">
								</div>
								<div id="hiceNum">0</div>
								<div id="hiceInf">아직 HICE가 없어요</div>
							</c:otherwise>
						</c:choose>
					</div>
					<!--hice-->


					<div id="graph">
						<div id="chart-areaT"></div>
					</div>
					<!--graph-->
				</c:otherwise>
			</c:choose>
		</div>
		<!--inf-->

		
    <div class="divReview">
        <div>
            <button class="btn reviewWriteBtn">리뷰작성</button>
        </div>
        <div class="filter">
            <div class="review">
                <button id="review_basic">리뷰</button>
                <span>|</span>
                <button id="review_together">동행리뷰</button>
            </div><!--review-->
            <div class="type">
                <button id="review_lastest">최신순</button>
                <span>|</span>
                <button id="review_best">추천순</button>
            </div><!--type-->

        </div><!--filter-->

        <div class="reviewBox">
        <c:choose>
        	<c:when test="${review.isEmpty() }">
        		<div class="null nullReview">등록된 리뷰가 없습니다.</div>
        	</c:when>
        	<c:otherwise>
        		<c:forEach items="${review }" var="review">
        			<div class="reviewOneBox">
                    <div class="reviewMal"><img src="/img/mal.jpg"></div>
                    <div class="reviewIce"><img src="/img/ice${review.hice }.png"></div>
                    <a href="/profile.jsp?no="><div class="reviewFace"><img src="/img/profile/${review.profile }" width="30" height="30"></div></a>
                    <span class="reviewNick">${review.nickname }</span>
                    <span class="reviewDay"><fmt:formatDate pattern="yyyy-MM-dd(E)" value="${review.regdate }"/></span>
                    <div class="reviewContent">${review.contents }</div>
                    <div class="heart reviewHeart"><img src="/img/heart.png" width="20" height="20">11</div>
                    <div class="siren reviewSiren"><img src="/img/siren.png" width="20" height="20"></div>
	                  <div class="reviewPic">
	                  <c:if test="${review.picRoute!=null }">
	                  	<i class="far fa-images"></i>
	                  </c:if>
	                   </div><!-- reviewPic -->
	                </div><!-- reviewOneBox -->
        		</c:forEach>
        	</c:otherwise>
        </c:choose>
        </div><!--reviewBox-->
        
		<div class="reviewBox_together">
		<c:choose>
			<c:when test="${reviewTogether.isEmpty() }">
				 <div class="null nullTogether">등록된 동행 리뷰가 없습니다.</div>
			</c:when>
			<c:otherwise>
                <div class="reviewOneBox_together">
                <c:forEach items="${reviewTogether }" var="together">
                	<div class="boxBasic">
                        <img class="image" src="/img//spot/${together.picName }">
                        <div class="date"><fmt:formatDate pattern="yyyy-MM-dd(E)" value="${together.meetDate }"/>  ${together.meetTime }</div>
                        <img class="siren" src="/img/siren.png" width="25" height="25">
                        <div class="content reviewContent">${together.contents }</div>
                        <div class="floatTag">
                        	 <c:forEach items="${together.tags }" var="tag">
								<a href="/search/"><div class="tag">#${tag.name }</div></a>
							</c:forEach>
						</div>
                        <div class="personnel">
                        	${together.personnelResult }/${together.personnel }명
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
                        
                        </div><!-- finish -->
                        
                    </div>
                    
                    	<c:forEach items="${together.reviews }" var="togetherReview">
		                    <div class="boxTogether">
		                        <div class="reviewMal"><img src="/img/mal.jpeg"></div>
		                        <c:choose>
		                        	<c:when test="${togetherReview.hice==0 }">
										 <div class="reviewIce"><img src="/img/ice1.png"></div>                        		
		                        	</c:when>
		                        	<c:otherwise>
		                        		 <div class="reviewIce"><img src="/img/ice${togetherReview.hice}.png"></div>
		                        	</c:otherwise>
		                        </c:choose>
		                     
		                        <a href="/profile.jsp?no="><div class="reviewFace"><img src="/img/profile/${togetherReview.profile  }" width="30" height="30"></div></a>
		                        <span class="reviewNick">${togetherReview.nickname }</span>
		                        <span class="reviewDay"><fmt:formatDate pattern="yyyy-MM-dd(E)" value="${togetherReview.regdate }"/></span>
		                        <c:choose>
		                        	<c:when test="${togetherReview.contents==null }">
										 <div class="reviewContent">아직 리뷰와 HICE가 작성되지 않았습니다.</div>                     		
		                        	</c:when>
		                        	<c:otherwise>
		                        		 <div class="reviewContent">${togetherReview.contents }</div>
		                        	</c:otherwise>
		                        </c:choose>
		                        <div class="heart reviewHeart"><img src="/img/heart.png" width="20" height="20">13</div>
		                        <div class="siren reviewSiren"><img src="/img/siren.png" width="20" height="20"></div>
		                        <div class="reviewPic">
									 <c:if test="${togetherReview.picRoute!=null }">
			                  	<i class="far fa-images"></i>
			                  		</c:if>
								</div>
		                    </div>
		                </c:forEach>
                </c:forEach>
			</c:otherwise>
		</c:choose>
        </div><!--reviewBox_together--> 
    </div>

   <%-- <div id="page">1 2 3</div>  --%>

 
    <div class="divTogether">

        <div class="divTitle">
            <div class="title">
                <span>동행</span>
            </div><!--title-->
            <div class="moreTogether">
                <a href="together.jsp?no=">더보기</a>
            </div>
        </div><!--divTitle-->
        <div class="togetherView">
            <div class="togetherContents">
            <c:forEach items="${spotTogether }" var="spotTogether">
                <div class="together">
                    <img class="image" src="/img/spot/${spotTogether.getPicName() }">
                    <div class="date">${spotTogether.getMeetDate() } ${spotTogether.getMeetTime() }</div>
                    <img class="siren" src="/img/siren.png" width="25" height="25">
                    <div class="content">${spotTogether.getContents()  }</div>
                  		 <div class="floatTag">
                        	 <c:forEach items="${spotTogether.tags }" var="tag">
								<a href="/search/"><div class="tag">#${tag.name }</div></a>
							</c:forEach>
						</div>
                    <div class="personnel">
                        	${spotTogether.personnelResult }/${spotTogether.personnel }명
                        </div>
                        <c:choose>
		        			<c:when test="${spotTogether.gender=='A' }">
		        				 <div class="gender"><img src="/img/womanman.png"></div>
		        			</c:when>
		        			<c:when test="${spotTogether.gender=='F' }">
		        				 <div class="gender"><img src="/img/woman.png"></div>
		        			</c:when>
		        			<c:otherwise>
		        				<div class="gender"><img src="/img/man.png"></div>
		        			</c:otherwise>
		        		</c:choose>
                    <div class="finish">
		        		
                        <jsp:useBean id="toDay2" class="java.util.Date"/>
						<fmt:formatDate value='${toDay2}' pattern='yyyy-MM-dd(E)' var="toDate"/>

                        <c:choose>
                        	<c:when test="${spotTogether.personnelResult==spotTogether.personnel || toDate>together.meetDate }">
                        		<em class="end">모집완료</em>
                        	</c:when>
                        	<c:otherwise>
                        		<em class="ing">모집중</em> 
                        	</c:otherwise>
                        </c:choose>
                        
                    </div><!-- finish -->
                </div><!--#together end-->
            </c:forEach>
     
            </div><!--.togetherContents end-->
        </div><!--.togetherView end-->
        <div><i class="fas fa-chevron-left togetherLeftBtn contentsBtn"></i></div>
        <div><i class="fas fa-chevron-right togetherRightBtn contentsBtn"></i></div>
    </div>

		<%-- <div class="divHlog">

        <div class="divTitle">
            <div class="title">
                <span>H-Log</span>
            </div><!--title-->
            <div class="moreTogether">
                <a href="hlog.jsp">더보기</a>
            </div>
        </div><!--divTitle-->

        <div class="HlogView">
            <div class="HlogContents">
            <%for(int i=0;i<9;i++){ %>
                <div class="hlog">
                   <div class="box">
                   		<a href="hlogDetail.jsp?no="><div class="hlogImg"><img src="img/castle.jpg"></div></a>
                        <div class="star hlogStar"><img src="/img/star.png" width="20" height="20">456</div>
                        <a href="/search.jsp?no="><div class="s1 hash">#프라하</div></a>
                        <a href="/search.jsp?no="><div class="s2 hash">#하이루</div></a>
                    </div>
                    <div class="box_m">
                        <a href="/profile.jsp?no="><img class="user" src="/img/수진.PNG"></a>
                        <a href="hlogDetail.jsp?no="><div class="hlogName">프라하성</div></a>
                        <div class="hlogNickname">투디</div>
                        <img class="ice" src="img/ice5.png">
                        <div class="heart hlogHeart"><img src="/img/heart.png" width="20" height="20">456</div>
                    </div>
                </div>
                <%} %>
            </div><!--.HlogContents end-->
        </div><!--.HlogView end-->
        <div><i class="fas fa-chevron-left HlogLeftBtn contentsBtn"></i></div>
        <div><i class="fas fa-chevron-right HlogRightBtn contentsBtn"></i></div>
    </div>
	
	--%>

    <div class="divAttractions">

        <div class="divTitle">
            <div class="title">
                <span>주변 스팟 추천</span>
            </div><!--title-->
            <div class="moreTogether">
                <a href="/tour.jsp?no=">더보기</a>
            </div>
        </div><!--divTitle-->

        <div class="attractionsView">
            <div class="attractionsContents">
             <c:forEach items="${spotList }" var="spotList">
             <c:choose>	
             	<c:when test="${(spotList.latitude<spot.latitude+0.5 and spotList.latitude>spot.latitude-0.5)
            		 and (spotList.longitude<spot.longitude+0.5 and spotList.longitude>spot.longitude-0.5)
            		 and (spotList.latitude!=spot.latitude and spotList.latitude!=spot.latitude)}">
            		 
                <div class="attractions">
                    <div class="box">
            			<a href="/spot/${spot.no }"><div class="attractionImg"><img src="/img/spot/${spotList.picname}"></div></a>
                        <div class="star attractionsStar"><img src="/img/star.png" width="20" height="20">456</div>
           				<div class="floatTag">
                        	 <c:forEach items="${spotList.tags }" var="tag">
								<a href="/search/"><div class="tag">#${tag.name }</div></a>
							</c:forEach>
						</div>
                    </div>
                    <div class="box_m">
                        <a href="/profile.jsp?no="><img class="user" src="/img/profile/${spotList.profile}"></a>
                        <a href="/spot/${spot.no }"><div class="attractionsName">${spotList.name }</div></a>
                        <img class="money" src="/img/coin.png" width="20" height="20">
                        <div class="attractionsNickname">${spotList.nickname }</div>
                        <img class="ice" src="/img/ice${spotList.hiceNum }.png">
                        <div class="heart attractionsHeart"><img src="/img/heart.png" width="20" height="20">456</div>
                    </div>
                </div>
                </c:when>
                </c:choose>
             </c:forEach>
            </div><!--.attractionsContents end-->
        </div><!--.attractionsView end-->
        <div><i class="fas fa-chevron-left attractionsLeftBtn contentsBtn"></i></div>
        <div><i class="fas fa-chevron-right attractionsRightBtn contentsBtn"></i></div>
    </div>

	</div>
	<!--contentsBox-->

<div id="popup"></div>

<div id="popupPicAdd">
    <button class="endBtn"><i class="fas fa-times"></i></button>

	<input type="hidden" id="foodPicName" name="food">
	<form method="post" action="/foodDetail.jsp?no=">
    	<div class="photo">
        	<span class="sub"><i class="fas fa-camera-retro"></i> 사진 등록하기</span>
        	<div class="photoBox no_image">
        		<img src="/img/defaultpic.png" width="300" height="200" id="foodPic">
	        	<p><input class="upload" type="file" name="upload"/></p>        		
        	</div>
    	</div><!-- .photo end -->
    	
	    <button class="addBtn">등록</button>
    </form>


</div>

<div id="popupMenuAdd">
    <span class="add"><i class="fas fa-utensils"></i> 메뉴 등록하기 <i class="fas fa-utensils"></i></span>
    <button class="endBtn"><i class="fas fa-times"></i></button>
	<form action="/spot/${spot.no }" method="POST">
    <div class="addMenu">
        <span>메뉴</span> <input class="menuName" placeholder="메뉴를 입력해주세요" id="addMenuName"/>
        <span>가격</span>
        <input class="menuPrice" placeholder="가격을 입력해주세요" id="addMenuPrice"/>원
        <i class="fas fa-plus"></i>
    </div>
    <ul class="menuList">
	
    </ul>
    
    <script type="text/template" id="menuTmp">
	<li>
		  <i class="fas fa-utensils"></i>
	      <span class="menuName"><@=menu.name@></span>
	      <span class="menuPrice"><@=menu.price@></span>원
		  <input type="hidden" class="menuName" name="menuName" value="<@=menu.name@>" />
		  <input type="hidden" class="menuPrice" name="menuPrice" value="<@=menu.price@>" />
	      <button>X</button>
    </li>
	</script>
        
    <button class="addBtn">등록</button>
    </form>
</div>

<!-- 동행 상세 팝업-->
<div id="popupTog">
    <div class="reaTogether">
        <button class="endBtn"><i class="fas fa-times"></i></button>
        <img class="image" src="/img/다운로드.jpg">
        <span>부다페스트부다페스트</span>
        <img class="siren" src="img/siren.png" width="25" height="25">
        <div class="date">2018.10.17 (금) 12:00~14:00</div>
        <div class="btn applyBtn">
            <button>신청하기</button>
        </div>
        <div class="personnel">4/4명</div>
        <div class="gender"><img src="img/woman.png"></div>
        <div class="finish">모집완료</div>
        <a href="/profile.jsp?no=" class="user" id="user1"><img src="img/수진.PNG"></a>
        <span class="nickname" id="nickname1">투디투디</span>
        <div class="content">부다페스트 야경보면서 맥주 한잔 하실분 구합니다 부다페스트 야경보면서 맥주 한잔</div>
    </div>

    <div class="addTogether">
        <div class="btn userLeft">
            <button><i class="fas fa-chevron-circle-left"></i></button>
        </div><!-- btn userLeft -->
        <div class="addUser">
            <a href="/profile.jsp?no=" class="user"><img src="img/수진.PNG"></a>
            <span class="nickname">투디투디</span>
        </div>
        <div class="addUser">
            <a href="/profile.jsp?no=" class="user"><img src="img/수진.PNG"></a>
            <span class="nickname">투디투디</span>
        </div>

        <div class="addUser">
            <a href="/profile.jsp?no=" class="user"><img src="img/수진.PNG"></a>
            <span class="nickname">투디투디</span>
        </div>
        <div class="addUser">
            <a href="/profile.jsp?no=" class="user"><img src="img/수진.PNG"></a>
            <span class="nickname">투디투디</span>
        </div>
        <div class="addUser">
            <a href="/profile.jsp?no=" class="user"><img src="img/수진.PNG"></a>
            <span class="nickname">투디투디</span>
        </div>

        <div class="btn userRight">
            <button><i class="fas fa-chevron-circle-right"></i></button>
        </div><!-- btn userRight -->
    </div><!-- addTogether -->
</div>


<!--리뷰 상세 팝업-->
<div id="reviewContents">
    <div id="reviewTitle">
        <span>REVIEW</span>
        <div class="heart reviewTopHeart"><img src="img/emptyHeart.png" width="20" height="20"> 20</div>

 
    </div>
    <div class="reviewPicContents">
        <button class="picBtn picBtnLeft"><i class="fas fa-angle-left"></i></i></button>
        <div>
            <ul class="reviewPicList">
                <li>
                    <img class="reviewPic" src="img/pic.jpg"/>
                    <a href="/profile.jsp?no="><img class="reviewPicUser" src="img/수진.PNG"></a>
                </li>
                <li>
                    <img class="reviewPic" src="img/pic2.jpg"/>
                    <a href="/profile.jsp?no="><img class="reviewPicUser" src="img/orange3.png"></a>
                </li>
                <li>
                    <img class="reviewPic" src="img/pic3.jpg"/>
                    <a href="/profile.jsp?no="><img class="reviewPicUser" src="img/white2.png"></a>
                </li>
            </ul>
        </div>
        <button class="picBtn picBtnRight"><i class="fas fa-angle-right"></i></button>
    </div>
    <div id="personReview">
        <div class="otherPerson">
            <a href="/profile.jsp?no="><img class="reviewUser" src="img/수진.PNG"></a>
            <p class="reviewNickname">투디</p>
            <img class="reviewHice" src="img/ice1.png">
            <p class="reviewDate">2018.10.18</p>
            <div class="reviewContentsBox"><p class="reviewContents">오늘 정말 재미있었습니다.</p></div>
            <button class="reviewSiren"><img src="img/siren.png" width="25" height="25"></button>
        </div>
        <div class="otherPerson"><!--동행 리뷰 리스트 영역 -->
            <a href="/profile.jsp?no="><img class="reviewUser" src="img/수진.PNG"></a>
            <p class="reviewNickname">아이후에</p>
            <img class="reviewHice" src="img/ice3.png">
            <p class="reviewDate">2018.10.18</p>
            <div class="reviewContentsBox"><p class="reviewContents">
                가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다가나다라마바사아자차카타파하다 </p>
            </div>
            <button class="reviewSiren"><img src="img/siren.png" width="25" height="25"></button>
        </div>
        <div class="otherPerson"><!--동행 리뷰 리스트 영역 -->
           <a href="/profile.jsp?no="><img class="reviewUser" src="img/수진.PNG"></a>
            <p class="reviewNickname">짠</p>
            <img class="reviewHice" src="img/ice5.png">
            <p class="reviewDate">2018.10.18</p>
            <div class="reviewContentsBox"><p class="reviewContents"></p> </div>
            <button class="reviewSiren"><img src="img/siren.png" width="25" height="25"></button>
        </div>
    </div>
</div><!--reviewContents-->



	<c:import url="/WEB-INF/template/foodReview.jsp"></c:import>
	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script src="/js/tui-code-snippet.min.js"></script>
	<script src="/js/raphael.min.js"></script>
	<script src="/js/tui-chart.js"></script>

	<script>


		_.templateSettings = {
			interpolate: /\<\@\=(.+?)\@\>/gim,
			evaluate: /\<\@([\s\S]+?)\@\>/gim,
			escape: /\<\@\-(.+?)\@\>/gim
		};
/*
    // 사진 템플릿
    var photoTmp = _.template($("#photoTmp").html());

    $.ajax({
        url: "ajax/Photos.json",
        type: "get",
        dataType: "json",
        error: function () {
            alert("에러");
        }, success: function (json) {
            $(".popupPicAll").append(photoTmp({"Photos": json}));
        }
    });

    // 메뉴 템플릿
    var menuTmp = _.template($("#menuTmp").html());

    $.ajax({
        url: "/ajax/menu",
        type: "get",
        dataType: "json",
        error: function () {
            alert("에러");
        }, success: function (json) {
            $("#menuAll").append(menuTmp({"menus": json}));
        }
    });*/

    $('.star img').on("click", function () {
        var starFlag = $(this).attr("src");
        /*alert(starFlag);*/

        if (starFlag == "img/star.png") {
            $(this).attr("src", "img/emptyStar.png");
        } else {
            $(this).attr("src", "img/star.png");
        }
    });

    $('.heart img').on("click", function () {
        var heartFlag = $(this).attr("src");
        /*alert(starFlag);*/

        if (heartFlag == "img/heart.png") {
            $(this).attr("src", "img/emptyHeart.png");
        } else {
            $(this).attr("src", "img/heart.png");
        }
    });


    // 만약 변수안에 담는 데이터가 jquery 객체일 때는
    // 변수 앞에 $를 붙임 (전세계적으로 프론트엔드 개발자들 공용)
    var $popup = $("#popup");
    var $popupPic = $("#popupPic");
    var $popupPicAdd = $("#popupPicAdd");
    var $popupMenuAdd = $("#popupMenuAdd");
    var $reviewContents = $("#reviewContents");
    var $popupTog = $('#popupTog');

    var $picBtnLeft = $(".picBtnLeft");
    var $picBtnRight = $(".picBtnRight");
    var x = 0;

    $picBtnLeft.click(function () {
        x += 457.5;
        if (x > 0) {
            x = -915;
        }
        $(".reviewPicList").css("left", x);
    }); // .picBtnLeft click() end
    $picBtnRight.click(function () {
        x -= 457.5;

        if (x < -927) {
            x = 0;
        }
        $(".reviewPicList").css("left", x);
    }); // .picBtnRight click() end


    $('.divReview').on("click",".reviewContent",function () {
        $popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        $reviewContents.fadeIn();
    }); //writeBox click() end

    $('.divReview').on("click",".content",function () {
        $popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        $reviewContents.fadeIn();
    }); //writeBox click() end

    $('.together .content').click(function () {
        $popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        $popupTog.fadeIn();
    }); //writeBox click() end


    $('#pic>img').click(function () {
        $popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        $popupPic.fadeIn();
    }); //writeBox click() end

    $('#infPic .plus').click(function () {
        $popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        $popupPicAdd.fadeIn();
    }); //writeBox click() end

    $('#menu .menuPlus').click(function () {
        $popup.fadeIn(); // 메모리 적게 사용하기 위해 변수를 선언하고 사용
        //$('#popup').fadeIn();
        $popupMenuAdd.fadeIn();
        //$('#menu').fadeIn();
    }); //writeBox click() end

    $('#popup').click(function () {
        $popup.hide(); // $(this).css("display","none);
        $popupPic.hide();
        $popupPicAdd.hide();
        $popupMenuAdd.hide();
        $reviewContents.hide();
        $popupTog.hide();
        //$('#menu').fadeOut();
    }); //

    $('.endBtn').click(function () {
        $popup.hide(); // $(this).css("display","none);
        $popupPic.hide();
        $popupPicAdd.hide();
        $popupMenuAdd.hide();
        $reviewContents.hide();
        $popupTog.hide();
        //$('#menu').fadeOut();
    }); //


    <c:choose>
	<c:when test="${spot.type=='F'}">
    // 푸드 그래프
    var container = document.getElementById('chart-area');
    var data = {
        categories: ['${spot.name}'],
        
        series: [
            {
                name: '맛',
                data: [${foodgrade!=null?foodgrade.flavorCount:0 }]
            },
            {
                name: '청결',
                data: [${foodgrade!=null?foodgrade.cleanCount:0 }]
            },
            {
                name: '분위기',
                data: [${foodgrade!=null?foodgrade.feelingCount:0 }]
            },
            {
                name: '가성비',
                data: [${foodgrade!=null?foodgrade.cheapCount:0 }]
            },
            {
                name: '서비스',
                data: [${foodgrade!=null?foodgrade.serviceCount:0 }]
            },
            {
                name: '동행만족',
                data: [${foodgrade!=null?foodgrade.togetherGoodCount:0 }]
            }

        ]
    };
    
    var options = {
        chart: {
            width: 433,
            height: 250,
            format: '1,000'
        },
        // yAxis: {
        //     title: '평점'
        // },
        xAxis: {
            // title: '종류',
            min: 0,
            max: 100,
            suffix: '점'
        },
        series: {
            showLabel: true
        },
        legend: {
            align: 'right'
        }
    };
    var theme = {
        series: {
            colors: [
                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                '#289399'
            ]
        }
    };

    tui.chart.barChart(container, data, options);
    
    </c:when>
	<c:otherwise>
    
    // 투어 그래프
    
    var containerT = document.getElementById('chart-areaT');
    var dataT = {
        categories: ['${spot.name }'],
        series: [
            {
                name: '포토존',
                data: [${tourgrade!=null?tourgrade.photozonCount:0 }]
            },
            {
                name: '편의시설',
                data: [${tourgrade!=null?tourgrade.facilityCount:0 }]
            },
            {
                name: '교통',
                data: [${tourgrade!=null?tourgrade.trafficCount:0 }]
            },
            {
                name: '볼거리',
                data: [${tourgrade!=null?tourgrade.watchCount:0 }]
            },
            {
                name: '주변환경',
                data: [${tourgrade!=null?tourgrade.aroundCount:0 }]
            },
            {
                name: '동행만족',
                data: [${tourgrade!=null?tourgrade.togetherGoodCount:0 }]
            }

        ]
    };
    
    var optionsT = {
        chart: {
            width: 433,
            height: 250,
            format: '1,000'
        },
        // yAxis: {
        //     title: '평점'
        // },
        xAxis: {
            // title: '종류',
            min: 0,
            max: 100,
            suffix: '점'
        },
        series: {
            showLabel: true
        },
        legend: {
            align: 'right'
        }
    };
    var theme = {
        series: {
            colors: [
                '#83b14e', '#458a3f', '#295ba0', '#2a4175', '#289399',
                '#289399'
            ]
        }
    };


    // For apply theme

    // tui.chart.registerTheme('myTheme', theme);
    // options.theme = 'myTheme';

    tui.chart.barChart(containerT, dataT, optionsT);

    </c:otherwise>
    </c:choose>
    
    // 포토 보기
    var i = 0;
    var spotPicNum = ${fn:length(spotpic)};

    
    // 사진이 한개면 양쪽 버튼 display none
    if(spotPicNum==1){
    	$(".popleftBtn").css("display", "none");
    	$(".poprightBtn").css("display", "none");
    }
    
    $(".popleftBtn").click(function () {
        i += 470;
        
        if (i > 0) {
            i = -spotPicNum*470;
        }
        $(".popupPicAll").css("left", i);
    }); // .leftBtn click() end
    $(".poprightBtn").click(function () {
        i -= 470;
		
        if (i <= -spotPicNum*470) {
            i = 0;
        }
       
        $(".popupPicAll").css("left", i);
    });


    // 동행
    var x = 0;
    $(".togetherLeftBtn").click(function () {
        x += 900;

        if (x == 900) {
            x = -1800;
        }
        $(".togetherContents").css("left", x);
    }); // .leftBtn click() end
    $(".togetherRightBtn").click(function () {
        x -= 900;

        if (x <= -2700) {
            x = 0;
        }
        $(".togetherContents").css("left", x);
    });
    // Hlog
    var y = 0;
    $(".HlogLeftBtn").click(function () {
        y += 900;

        if (y == 900) {
            y = -1800;
        }
        $(".HlogContents").css("left", y);
    }); // .leftBtn click() end
    $(".HlogRightBtn").click(function () {
    	y -= 900;

        if (y <= -2700) {
            y = 0;
        }
        $(".HlogContents").css("left", y);
    });
    //attractions
    var z = 0;
    $(".attractionsLeftBtn").click(function () {
    	z += 900;

        if (z == 900) {
            z = -1800;
        }
        $(".attractionsContents").css("left", z);
    }); // .leftBtn click() end
    $(".attractionsRightBtn").click(function () {
    	z -= 900;

        if (z <= -2700) {
            z = 0;
        }
        $(".attractionsContents").css("left", z);
    });


    var $review_basic = $('#review_basic');
    var $review_together = $('#review_together');

    $review_basic.on("click", function () {
        $('.reviewBox').css("display", "block");
        $('.nullReview').css("display", "block");
        $('.reviewBox_together').css("display", "none");
        $('.nullTogether').css("display", "none");
        $('#review_basic').css("font-weight", "bold");
        $('#review_together').css("font-weight", "normal");
    });//on("click") end


    $review_together.on("click", function () {
        $('.reviewBox_together').css("display", "block");
        $('.nullTogether').css("display", "block");
        $('.reviewBox').css("display", "none");
        $('.nullReview').css("display", "none");
        $('#review_basic').css("font-weight", "normal");
        $('#review_together').css("font-weight", "bold");
    });//on("click") end


    

    // 지도 map

    var map;

    var latLng = {lat: ${spot.latitude }, lng: ${spot.longitude } };

    
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: latLng,
            zoom: 15
        });

        var marker = new google.maps.Marker({position: latLng, map: map});

    }

    var addMenu = _.template($('#menuTmp').html());
     //메뉴추가
     $('.addMenu i').click(function () {
        var menuName = $('#addMenuName').val();
        var menuPrice = $('#addMenuPrice').val();
        $('#addMenuName').val("");
        $('#addMenuPrice').val("");
        var menu = {"name":menuName, "price":menuPrice};
 		console.log($('#addMenuName').val(""));
        $('.menuList').append(addMenu({menu}));
    });
    
    $('.menuList').on('click', "button", function () {
        $(this).parent().remove();
    });
    
    /* 리뷰 창 열고 닫기 */
    var $back = $("#back");
    var $restaurantReviewBox = $("#restaurantReviewBox");
    
    $(".writeBtn").click(function() {
    	$back.fadeIn();
    	$restaurantReviewBox.fadeIn();
	});
    
    $(".reviewWriteBtn").click(function() {
    	$back.fadeIn();
		$restaurantReviewBox.fadeIn();
	});

    $("#restaurantReviewBox .cancel").click(function () {

        $restaurantReviewBox.fadeOut();
        $back.fadeOut();
    }); // #restaurantReviewBox .cancel end

    /* 배경 눌렀을 때 박스 끄기 */
    $back.click(function () {

        $restaurantReviewBox.fadeOut();
        $back.fadeOut();
    });

    /* 아이스크림 클릭 시 평점 주기 */
    $(".iceReview").on("click", function () {
        var idx =$(this).parent().index();
        // alert(idx);
        $(".iceReview").children('img').removeClass('on');
        $(".iceReview").parent().removeClass('on');
        $(this).children('img').addClass("on");
        hiceText(idx);
        // $(this).parent().addClass("on").css("cursor", "auto");

    });
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
            $('#evaluation').text(" ");
        }
    } //hiceText() end
    
    
    /* 음식점 사진만 등록 */
    //profile input요소(type file)
	var $upload = $(".upload");
	//profileName
	var $foodPicName = $("#foodPicName");
	//profileImg
	var $foodPic = $("#foodPic");
	//profileBox
	var $photoBox = $(".photoBox");
	var oldFoodPic = null;
	
	function checkfoodPic() {
		
		//jquery객체에서 순수자바스크립트요소객체 얻기
		var upload = $upload.get(0);
		
		//input type=file요소(순수자바스크립트)는 무조건
		//files배열을 가지고 있습니다.
		
		//한 개의 파일
		var file = upload.files[0];
		
		
			
		//File 객체의 속성
		//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
		//- name : 파일명
		//- lastModified : 최종수정일
		//- size : 파일 크기
		
		/*if(file==null||file.size<=0) {
			
			$profileMsg.removeClass("ok")
			           .text("제대로 된 파일을 선택해주세요.");
			
			return;
		}//if end */
		
		//이미지인지 확인!!
		/*if(!profileReg.test(file.type)) {
			
			$profileMsg.removeClass("ok")
	        .text("이미지 파일을 선택해주세요.");
			
			return;
		}else {
			
			$profileMsg.text("");
			
		}//if~else end */
		
		if(oldFoodPic!=file.name) {
			
			oldFoodPic = file.name;
		
		//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
		//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
		
		//ajax로 넘길 폼을 생성하고
		var form = new FormData();
		
		//우리가 선택한 파일을 붙임
		form.append("type","F");//일반적인 데이터
		
		//1)파라미터명, 2) 파일 3) 파일명
		form.append("uploadImg",file,file.name);
		
		//multipart/form-data로 ajax처리
		$.ajax({
			url:"/ajax/uploadImage.jsp",
			dataType:"json",
			type:"POST",//multipart/form-data
			processData:false,//multipart/form-data
			contentType:false,//multipart/form-data
			data:form,
			error:function() {
				alert("사진 서버 점검중!");
			},
			success:function(json) {
				// img요소의 src속성을 바꾸는 것
				$foodPic.attr("src",json.src);
				// input type=hidden 요소의 값에 단지 파일명만 입력 (경로만 넘어가는 것)
				$foodPicName.val(json.src);
				// default이미지 바꾸기
				$photoBox.removeClass("no_image");
				
			}//success end

		});//ajax() end
		
		}//if end
		
	}//checkProfile() end

    

</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKjfx50R2Ae99Vf4ccm0cGJ7rhlNd7rMo&callback=initMap"
		async defer></script>
	<script src="/js/login.js"></script>
	<script src="/js/dounorPop.js"></script>
</body>
</html>