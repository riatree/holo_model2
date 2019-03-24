<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HLog</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
    
    <link rel="stylesheet" href="/css/holodetail.css">
    <link rel="stylesheet" href="/css/paginate.css">
    <link rel="stylesheet" href="/css/tui-editor.min.css">
    <link rel="stylesheet" href="/css/tui-editor-contents.min.css" />
    
    <style>
    	#dateBox{
    		width : 500px; height: 100px;
    		background-color: #000;
    	}
        .profile img{
        	border-radius: 40px;
        }
       
        .regdate>.time{
        	font-size: 15px;
        }
        #paginateBox{
    		height: 50px;
    		margin: auto;
    		margin-bottom: 20px;
    	}
        
        #viewerSection{
        	margin-top : 20px;
        	border: 2px solid #424242;
        	border-radius: 10px; 
        }
        #viewerSection p{
        	font-size: 30px
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
	
	<div id="heroWrap"
		<c:choose>
		<c:when test="${fn:contains(hlog.titlePic,'.') }">
				style = "background-image : url(/img/${hlog.titlePic })"	
		</c:when>
		<c:otherwise>
				style = "background-color : ${hlog.titlePic }"
		</c:otherwise>
		</c:choose>
	>
	
	<div class="screen_out">${hlog.no }</div>
    <h2 class="hLogTitle">${hlog.title }</h2>
    <div id="dateBox">
    	<div class="dateValue">${hlog.goDate }</div>
    	<div class="dateValue">${hlog.comeDate }</div>
    </div><!-- //dateBox -->
    <ul class="clickBox">
    <%-- <li class="scrap clickSpot"><img src="img/star_empty.png" width="40"><span>123</span></li> --%>
        <li class="like clickSpot"><img src="/img/like_empty.png" width="40"><span>${hlog.likeNum }</span></li>
        <li><a href="profile.jsp?no=${hlog.dounorNo }"><img src="/img/profile/${hlog.profile }" width="50" height="50" title="${hlog.nickname }"/></a></li>
    </ul>
</div><!--//heroWrap-->

<div id="contentWrap">
    
    <div id="viewerSection"></div>
    
    <div id="donerGrade">
            <div class="hiceGrade">
                <div class="hiceTitle">HICE <span><i class="far fa-question-circle"></i></span></div>
                <div class="hiceLevel">
                       <img src="/img/ice${hlog.hice }.png" width="200px" height="300px">
                </div><!-- .hiceLevel end -->
                <div id="evaluation"></div>
            </div>

            <div class="travelGrade">
                <h3>여행스타일</h3>
                <ul class="travelStyle">
                    <li><img src="/img/tight.png" width="50">타이트</li>
                    <li><img src="/img/smooth.png" width="50">스무스</li>
                </ul>

                <h3>여행테마</h3>
                <ul class="travelType">
                    <li>TV여행</li>
                    <li>힐링여행</li>
                    <li>도심여행</li>
                    <li>액티비티</li>
                    <li>식도락</li>
                    <li>역사·문화</li>
                    <li>감성여행</li>
                    <li>야경여행</li>
                </ul>
                
                <h3>계절</h3>
                <ul class="season">
                    <li><img src="/img/spring.png"> 봄</li>
                    <li><img src="/img/sunmer.png"> 여름</li>
                    <li><img src="/img/fool.png"> 가을</li>
                    <li><img src="/img/winter.png"> 겨울</li>
                </ul>

                <h3>검색태그</h3>
                <ul class="searchTag">
                    <li class="tag">#asd</li>
                    <li class="tag">#asd</li>
                    <li class="tag">#asd</li>
                </ul>
            </div>
        </div>


    <div id="commentWrap">
        <h5 class="commentTitle">댓글</h5>
        <span class="commentNum">0</span>
        <div id="commentWrite">
            <h5>댓글달기</h5>
            <form id="commentForm" action="" method="post">
                <textarea id="writeArea" name="contents" placeholder="내용을 입력해주세요." maxlength="150"></textarea>
                <button class="commentBtn">댓글달기</button>                
            </form>
            <div class="commentCount"></div>
        </div><!--//commentWrite-->

        <div id="commentBox">
            <ul class="com"></ul>
            <div id="paginateBox" class="btn_box"></div>
        </div><!--//commentBox-->
    	
    </div><!--//commentWrap-->
</div><!--//contentWrap-->
<c:import url="/WEB-INF/template/popLogin.jsp"/>
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="commentTmp">
<@ _.each(comments,function(comment){ 
	var loginNo = 0
	<c:if test="${loginDounor!=null }">
		loginNo = ${loginDounor.no };
	</c:if>
@>
		 <li class="commentList">
            <div class="userBox">
                <a href=""><img src="/img/profile/<@=comment.profile@>" alt="도우너(유저)의 사진"></a>
                <div class="nickname"><@=comment.nickname@></div>
            </div><!--//userBox-->
            <div class="commentBox">
				<input type="hidden" id="no" name="no" value="<@=comment.no@>"/>
                <div class="commentTime">
                    <span><i class="fas fa-user-clock"></i> <@=moment(comment.regdate).format("YYYY-MM-DD hh:mm:ss")@></span>
					<@if(loginNo == comment.noDounor){@>
					 	<div class="btnBox">
							
                        		<button class="btn deleteBtn">삭제</button>
   	  
						</div>
					 <@ } @>             
				</div>
				
                <div class="commentArea">
                    <div class="commentDetail"><@=comment.contents@></div>
                </div>
            </div>
        </li>
	<@ }) @>
</script>

<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/tui-code-snippet.min.js"></script>
<script src='/js/markdown-it.js'></script>
<script src="/js/to-mark.min.js"></script>
<script src="/js/codemirror.js"></script>
<script src="/js/highlight.js"></script>
<script src="/js/squire-raw.js"></script>
<script src="/js/tui-editor-Editor.js"></script>
<script src ="/js/moment-with-locales.js"></script>
<script src="/js/login.js"></script>
<script src="/js/dounorPop.js"></script>
<script>
	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};

	$(function() {
	    $('.writeArea').keyup(function (){
	        var content = $(this).val();
	        $(this).height(((content.split('\n').length + 1)));
	        $('.commentCount').html(content.length + '/150');
	    });
	    $('.writeArea').keyup();
	});

	
    var tmp =_.template($("#commentTmp").html());

    var pageNo = 1;
    var no = ${hlog.no };
    
    function getCommentList() {
    	$(".com").children().remove();
		$.ajax({
			url : "/ajax/hlog/"+no+"/page/"+pageNo,
			type : "get",
			dataType : "json",
			error:function(request, status, error) {
				alert(request + status + error);
			},success:function(json){
				$(".com").append(tmp({"comments":json.hlogComments}));
				$('.commentNum').text(json.total);
				$("#paginateBox").html(json.paginate);
			}
		});//ajax() end
	};
    getCommentList();

    <c:if test="${loginDounor!=null }">
    function insertComment() {
    	var noHLog = ${hlog.no };
    	var dounorNo = ${loginDounor.no };
    	var contents = $('#writeArea').val();
    	
		$.ajax({
			url: "/ajax/hlog/comment",
			type:"post",
			dataType : "json",
			data: {
				"noHLog" : noHLog,
				"noDounor" : dounorNo,
				"contents" : contents
			},
			error:function(request, status, error) {
				alert("서버 점검 중입니다.");
				alert(request + status + error);
			},
			success:function(json){
				if(json.result) {
					 getCommentList();
				}else {
					alert("다시 시도해주세요.");
				}//if ~ else end
			}
		}); //ajax() end
	}
    </c:if>
    
    function deleteComment() {
		var no = $("#no").val();
		$.ajax({
			url : "/ajax/hlog/comment/delete",
			type : "post",
			dataType : "json",
			data : {"no" : no},
			error:function(){
				alert("서버 점검 중입니다.");
			},
			success:function(json){
				if(json.result) {
					getCommentList();
				}else{
					alert("다시 시도해주세요.");
				}//if ~ else() end
			}
		});
	}//deleteComment() end
    
    
	$(".com").on("click",".deleteBtn",function(e) {
		var flag = confirm("정말 삭제하시겠습니까?");
		if(flag){
			deleteComment();		
		}//if() end
		e.preventDefault();
	});
	
    $(".commentBtn").click(function(e) {
		if(${loginDounor!= null}){
			$("#commentForm").submit(function(e) {
				e.preventDefault();
				insertComment();	
			});
		}else {
			e.preventDefault();
			alert("로그인 후 사용해주세요. ");
		}
	});
    
    
    $(".btn_box").on("click",".paginate a",function(e) {
    	e.preventDefault();
    	pageNo = $(this).text();
    	getCommentList();
    });
    
    
    $('#viewerSection').tuiEditor({
        viewer: true,
        height: 600,
        initialValue: `${hlog.contents }`
    });

    
   $(document).ready(function() {
		if(${hlog.tripStyle=="T"}){
			$(".travelStyle>li").eq(0).addClass("on");
		}else if (${hlog.tripStyle=="S"}){
			$(".travelStyle>li").eq(1).addClass("on");
		}
		
		displayHiceValue();
	});//readt() end
     
	function displayHiceValue() {
		var idx = ${hlog.hice };
		if(idx == 1){
			$("#evaluation").text("혼자 가지마세요.");
		} else if (idx == 2) {
			$("#evaluation").text("혼자 갈 순 있어요.");
		} else if (idx == 3) {
			$("#evaluation").text("혼자 무난했어요.");
		}else if (idx == 4) {
			$("#evaluation").text("혼자가기 매력적이에요.");
		}else if (idx == 5) {
			$("#evaluation").text("혼자 완전 강추해요.");
		}
	}//displayHiceValue() end
	
</script>
</body>
</html>