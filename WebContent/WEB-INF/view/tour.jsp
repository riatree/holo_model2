<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOLO</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    
    <link rel="stylesheet" href="/css/tour.css">
    <link rel="stylesheet" href="/css/paginate.css">
    <link rel="stylesheet" href="/css/tourRegister.css">
    
    <style>    	

    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<div id="hiroSearch">
    <form action="" method="get">
        <!-- <div class="attractionsSearch">
        	<input placeholder="내용을 입력해주세요"/>
        	<button class="attractionsSearchBtn"><img src="/img/s.png" width="30" height="30"></button>
        </div> -->
    </form>
    
    <c:if test="${loginDounor != null }">
    <button class="attractionsAddBtn">등록하기</button>
    </c:if>     
</div><!-- #hiroSearch end -->

<div class="filterDetail">
    <div class="filterLine"><span class="f">필터</span> <button class="filterBtn down"><i class="fas fa-caret-down"></i></button></div>
    <div class="filterContents">
        <div class="travelStyle travelStyleAll"><span>종류</span>
            <ul class="filter">
                <li>랜드마크 </li>
                <li>박물관 </li>
                <li>자연/공원 </li>
                <li>쇼핑 </li>
                <li>교통 </li>
                <li>놀이공원</li>
                <li>그 외 </li>
            </ul><!-- .filter end -->
        </div><!-- .travelStyle end -->

        <div class="travelStyle travelStyleOnly"><span>우선순위</span>
            <ul class="filterOne">
                <li>편의시설</li>
                <li>볼거리</li>
                <li>포토존</li>
                <li>교통</li>
                <li>주변환경</li>
            </ul>
        </div><!-- .travelStyle end -->

        <div class="travelStyle travelStyleAll"><span>부가서비스</span>
            <ul  class="filter">
                <li>WIFI</li>
                <li>주차</li>
                <li>입장료</li>
                <li>화장실</li>
                <li>사진</li>
            </ul>
        </div>
    </div><!-- filterContents end -->
</div><!-- filterDetail end -->

<div id="attractionContents">
    <!-- <div class="smallFilter">
        <a href="#">혼행지수순</a> <span><img src="/img/vertical-line.png" width="20" height="20"/></span>
        <a href="#">추천순</a>
    </div> -->

    <div class="attractionsAll">
		   <c:forEach items="${spots }" var="tour">
		    <div class="attractionBox">
		        <div class="box">
		            <a href="/spot/${tour.getNo() }"><div class="attractionImg"><img src="/img/spot/${tour.picname }"></div></a>
		            <div class="star attractionStar"><img src="/img/star.png" width="20" height="20">${tour.scrap }</div>
		            <div class="hashBox">
		            	<c:forEach items="${tour.tagList }" var="hash">
		            	<a href="/searh/"><div class="hash">#${hash.getName() }</div></a>
		            	</c:forEach>
		            </div>
		        </div>
		        <div class="box_m">
		            <a href="/profile/${tour.getDounorNo() }"><img class="user" src="/img/profile/${tour.getProfile() }"></a>
		            <div class="tourName"><a href="/spot/${tour.getNo() }">${tour.getName() }</a></div>
		           
		            <c:if test="${tour.price > 0 }">	
		            	<img class="money" src="/img/coin.png" width="20" height="20" >
		            </c:if>
		            <div class="attractionNickname">${tour.getNickname() }</div>
		             
		            <img class="iceAvg" src="/img/ice${tour.getHiceNum() }.png">
		           <div class="heart attractionHeart"><img src="/img/heart.png" width="20" height="20">${tour.like }</div>
		        </div>
		    </div><!-- attractionBox end-->
		 </c:forEach>		  
    </div><!-- #attractionAll end -->
    ${paginate }
</div><!-- #attractionContentsend -->

<c:import url="/WEB-INF/template/popLogin.jsp"></c:import>
<c:import url="/WEB-INF/template/tourRegister.jsp"></c:import>
<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>


	_.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@(.+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

	var tmp = _.template($("#searchTmp").html());
    
    //console.log($("#searchTmp3").html());
    //console.log(tmp({"search":{no:1,name:"크크크"}}));

    function searchKeyword(searchWord){
        $.ajax({
            url:"/ajax/spot/location/" + searchWord,
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

    $('#locationInput').keyup(function () {
        var searchWord = $('#locationInput').val();
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
	$("#result").on("click",".selectLocation",function(){
		 var text = $(this).text();
		 
		 var no = this.dataset.no;
		 
		 console.log(no);
		 
	     $("#locationInput").val(text);
	     $("#locationNo").val(no);
	     $("#result").hide();
	});
	
	
	

    $('.scrap>img').on("click",function () {
        var starFlag = $(this).attr("src");
        /*alert(starFlag);*/

        if(starFlag=="/img/star.png"){
            $(this).attr("src","/img/emptyStar.png");
        }else {
            $(this).attr("src", "/img/star.png");
        }
    }); // on(click) end - 스크랩(별)

    $('.like>img').on("click",function () {
        var heartFlag = $(this).attr("src");
        /*alert(starFlag);*/

        if(heartFlag=="/img/heart.png"){
            $(this).attr("src","/img/emptyHeart.png");
        }else {
            $(this).attr("src", "/img/heart.png");
        }
    }); // on(click) end - 좋아요:like(하트)



    // filter

    $(".filter>li").on("click", function () {

        $(this).toggleClass("colorT");x
    }); // on(click) end - 필터 8개


    $(".travelStyleOnly li").on("click", function () {
        var idx = $(this).index();
        //alert(idx);
        var flag = $(".filterOne li").eq(idx).hasClass("colorT");
        //alert(flag);
        if(flag == false){
            $(".filterOne li").removeClass("colorT");
            //console.log("test1");
            $(".filterOne li").eq(idx).addClass("colorT");
            //console.log("test2");
        }

    });



    $(".filterLine").on("click", function () {

        var flag = $(".filterBtn i").hasClass("fa-caret-down");
        var cls = "";

        if(flag) {
            cls ="up";
            $(".filterContents").css("display", "block");
            $("#attractionContents").css("margin-top", "220px");
        } else {
            cls ="down";
            $(".filterContents").css("display", "none");
            $("#attractionContents").css("margin-top", "20px");
        }
        $(".filterBtn i").attr("class", "fa fa-caret-" + cls);
    }); // .filterBtn on() end
    
    /* 지도에 장소 등록 */
    // 은서 : key값 변경하기
    $(".addrBtn").click(function () {

        var address = $("#place-address").text();
        $(".addr1").val(address);
        $(".mapWrap").fadeOut();
    });

    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: 37.553709, lng: 126.969620},
            // 37.553709, 126.969620 : 서울역
            zoom: 14
        });

        var input = document.getElementById('pac-input');

        var autocomplete = new google.maps.places.Autocomplete(input);
        autocomplete.bindTo('bounds', map);
        var place = autocomplete.getPlace();
        // alert(place.geometry.location);

        map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);

        var infowindow = new google.maps.InfoWindow();
        var infowindowContent = document.getElementById('infowindow-content');
        infowindow.setContent(infowindowContent);
        var marker = new google.maps.Marker({
            map: map
        });
        marker.addListener('click', function() {
            infowindow.open(map, marker);
        });

        autocomplete.addListener('place_changed', function() {


            infowindow.close();

            var place = autocomplete.getPlace();

            if (!place.geometry) {
                return;
            }

            console.log(place.geometry.location.lat());
            console.log(place.geometry.location.lng());

            // 위도 경도 값
            var placeLat = place.geometry.location.lat();
            var placeLng = place.geometry.location.lng();
            
            document.form.latitude.value = placeLat;
            document.form.longitude.value = placeLng;            

            if (place.geometry.viewport) {
                map.fitBounds(place.geometry.viewport);
            } else {
                map.setCenter(place.geometry.location);
                map.setZoom(17);
            }

            // Set the position of the marker using the place ID and location.
            marker.setPlace({
                placeId: place.place_id,
                location: place.geometry.location
            });
            marker.setVisible(true);

            infowindowContent.children['place-name'].textContent = place.name;
            infowindowContent.children['place-id'].textContent = place.place_id;
            infowindowContent.children['place-address'].textContent =
                place.formatted_address;
            infowindow.open(map, marker);
        });
    }

    // 은서 : 관광명소 사진 등록
    var $upload = $(".upload");
    var $uploadName = $("#uploadName");
    var $uploadImg = $("#uploadImg");
    var $photoBox = $(".photoBox");
    var oldUpload = null;
    
   	function checkUpload() {
   		
   		// jquery 객체에서 순수자바스크립트요소객체 얻기
   		var upload = $upload.get(0);
   		
   		// 한 개의 파일
   		var file = upload.files[0];
   		
   		if(oldUpload != file.name) {
   			
   			oldUpload = file.name;
   			
   			var form = new FormData();
   			
   			// 우리가 선택한 파일을 붙임
   			form.append("uploadImg", file, file.name);
   			
   			$.ajax({
   				url: "/ajax/spot/upload",
   				dataType: "json",
   				type: "POST",
   				processData: false,
   				contentType: false,
   				data: form,
   				error: function() {
   					alert("사진 서버 점검 중!");
   				},
   				success: function(json) {
					$uploadImg.attr("src", "/img/spot/"+json.src);
					$uploadName.val(json.src);
					$photoBox.removeClass("no_image");
					
				} // success end
   				
   			}); // ajax() end  			
   			
   		} // if end 		
   		
   	} // checkProfile() end
   	
   	// upload 사진이 변경되면
   	$upload.change(checkUpload);
    


    /* 테마 최대 3개만 선택하게 하기 */
    $(".attractionTheme input").on("change", function () {
       // console.log("tse");

        if($(".attractionTheme input:checked").length < 4) {
            $(this).parent().toggleClass("color");
        }else {
            alert("최대 3개만 선택 가능합니다!");
            $(this).prop("checked",false);
        }
    }); // on(click) end - 필터 8개

    
    var $back = $("#back");
    var $attractionRegisterBox = $("#attractionRegisterBox");
    
    $(".attractionsAddBtn").click(function() {
		$back.fadeIn();
		$attractionRegisterBox.fadeIn();
	});

    $("#attractionRegisterBox .cancel").click(function () {
        $back.fadeOut();
        $attractionRegisterBox.fadeOut();
    });

    $('.attractionAddr button').click(function () {
        $('.mapWrap').show();
    });
    $(".mapWrap .cancel").click(function () {
        $(".mapWrap").hide();
    });

    /* 은서 : 약간 추가,,, 아이스크림 클릭 시 평점 주기 */
    $(".ice").on("click", function () {
        var idx = $(this).parent().index();
        // alert(idx);
        $(".ice").children('img').removeClass('on');
        $(".ice").parent().removeClass('on');
        $(this).children('img').addClass("on");
        $('#hicePoint').val($('.ice').children('.on').data('align'));
        hiceText(idx);
        // console.log($("#hicePoint").val());
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
    
 

</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKjfx50R2Ae99Vf4ccm0cGJ7rhlNd7rMo&libraries=places&callback=initMap"
        async defer></script>

</body>
<script src="/js/login.js"></script>
<script src="/js/dounorPop.js"></script>
</html>