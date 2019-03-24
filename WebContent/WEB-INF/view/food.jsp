<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>HOLO</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    
    <link rel="stylesheet" href="/css/food.css">
    <link rel="stylesheet" href="/css/paginate.css">
    <link rel="stylesheet" href="/css/foodRegister.css">    
    <style>
    
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<div id="hiroSearch">
    <!-- <div class="restaurantSearch">
	    <input placeholder="내용을 입력해주세요"/>
	    <button class="restaurantSearchBtn"><img src="/img/s.png" width="30" height="30"></button>
    </div> -->
    
    <c:if test="${loginDounor != null }">
    <button class="restaurantAddBtn">등록하기</button>
    </c:if>   
</div><!-- #hiroSearch end -->

<div class="filterDetail">
    <div class="filterLine"><span class="f">필터</span> <button class="filterBtn down"><i class="fas fa-caret-down"></i></button></div>
    <div class="filterContents">
        <div class="restStyle restStyleAll"><span>종류</span>
            <ul class="filter">
                <li>식당</li>
                <li>디저트&카페</li>
                <li>바 & 펍</li>
            </ul><!-- .filter end -->
        </div><!-- .restStyle end -->

        <div class="restStyle"><span>가격</span>
            <div class="range-slider">
                <input class="range-sliderRange" type="range" value="5000" min="0" max="40000" step="1000" autocomplete="on">
                <span class="range-sliderValue">5000</span><span>원</span>
            </div>
            <div class="wonIconBox">
                <img id="won1" class="won" src="/img/won.png"/><!--
            --><img id="won2" class="won afterWon" src="/img/won.png"/><!--
            --><img id="won3" class="won afterWon" src="/img/won.png"/><!--
            --><img id="won4" class="won afterWon" src="/img/won.png"/>
            </div>
        </div><!-- .restStyle end -->

        <div class="restStyle restStyleOnly"><span>우선순위</span>
            <ul class="filterOne">
                <li>맛</li>
                <li>청결</li>
                <li>가성비</li>
                <li>서비스</li>
                <li>분위기</li>
            </ul>
        </div><!-- .restStyle end -->

        <div class="restStyle restStyleAll"><span>부가서비스</span>
            <ul  class="filter">
                <li>WIFI</li>
                <li>주차</li>
                <li>배달</li>
                <li>테이크아웃</li>
                <li>예약</li>
                <li>룸</li>
                <li>휠체어</li>
            </ul>
        </div>
    </div><!-- filterContents end -->
</div><!-- filterDetail end -->

<div id="restaurantContents">
    <!-- <div class="smallFilter">
        <a href="#">혼행지수순</a> <span><img src="/img/vertical-line.png" width="20" height="20"/></span>
        <a href="#">추천순</a>
    </div> -->
    <div class="restaurantAll">
    <c:forEach items="${spots }" var="food">
	    <div class="restaurantBox">
	        <div class="box">
	            <a href="/spot/${food.getNo() } "><div class="restaurantImg"><img src="/img/spot/${food.picname}"></div></a>
	            <div class="star restaurantStar"><img src="/img/star.png" width="20" height="20">${food.scrap}</div>
	            <div class="hashBox">	          
		            <c:forEach items="${food.tagList }" var="hash">
		            	<a href="/search/"><div class="h1 hash">#${hash.getName() }</div></a>
					</c:forEach>
	            </div>
	        </div>
	        <div class="box_m">
	            <a href="/profile/${food.getDounorNo() }"><img class="user" src="/img/profile/${food.getProfile() }"></a>
	            <div class="foodName">${food.getName()  }</div>
	            <div class="restaurantRealWon" >
	                <span class="restaurantRealWonNum">${food.getPrice() }</span>	       
	            
	                <c:forEach begin="0" end="${food.price/10000==0?1:food.price/10000 }">
	                	<img class="realWon " src="/img/won.png" width="20" height="20">
	                </c:forEach>
	                
	            </div>
	            <div class="restaurantNickname">${food.getNickname() }</div>
             	<img class="iceAvg" src="/img/ice${food.getHiceNum() }.png">    
	          	<div class="heart restaurantHeart"><img src="/img/heart.png" width="20" height="20">${food.like }</div>
	        </div><!-- .box_m end -->
	   	 </div><!-- .restaurantBox end -->
	   	 </c:forEach>
	 
    </div><!-- .restaurantAll end -->
  	     ${paginate }
</div><!-- #restaurantContents end -->


<c:import url="/WEB-INF/template/footer.jsp"></c:import>
<c:import url="/WEB-INF/template/popLogin.jsp"></c:import>
<c:import url="/WEB-INF/template/foodRegister.jsp"></c:import>
<c:import url="/WEB-INF/template/menuAdd.jsp"></c:import>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script>

	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@([\s\S]+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
	};
	
	
	var cnt = 0;
	

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

    
    //////
    
    
    $(".filter>li").on("click", function () {

        $(this).toggleClass("colorT");x
    }); // on(click) end - 필터 8개


    $(".restStyleOnly li").on("click", function () {
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
            $("#restaurantContents").css("margin-top", "280px");
        } else {
            cls ="down";
            $(".filterContents").css("display", "none");
            $("#restaurantContents").css("margin-top", "20px");
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
            
            // console.log($("#placeLat").val());
            // console.log($("#placeLng").val());

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


    /* 은서 : 약간 추가,, 아이스크림 클릭 시 평점 주기 */
    $(".ice").on("click", function () {
        var idx =$(this).parent().index();
        // alert(idx);
        $(".ice").children('img').removeClass('on');
        $(".ice").parent().removeClass('on');
        $(this).children('img').addClass("on");
        $('#hicePoint').val($('.ice').children('.on').data('align'));
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


    /* 테마 최대 3개만 선택하게 하기 */
    $(".restaurantTheme input").on("change", function () {
       // console.log("tse");

        if($(".restaurantTheme input:checked").length < 4) {
            $(this).parent().toggleClass("color");
        }else {
            alert("최대 3개만 선택 가능합니다!");
            $(this).prop("checked",false);
        }
    }); // on(click) end - 필터 8개

    var $back = $("#back");
    var $restaurantRegisterBox = $("#restaurantRegisterBox");
    
    $(".restaurantAddBtn").click(function() {
		$back.fadeIn();
		$restaurantRegisterBox.fadeIn();
	});
    
    $("#restaurantRegisterBox .cancel").click(function () {
        $back.fadeOut();
        $("#restaurantRegisterBox").fadeOut();
    });

    $('.restaurantAddr button').click(function () {
    	console.log("지도 등록 버튼 클릭");
        $('.mapWrap').show();
    });
    $(".mapWrap .cancel").click(function () {
        $(".mapWrap").hide();
    });

    /* 가격 슬라이드 바 */
    // 은서 : 약간 추가
    var $won1= $("#won1");
    var $won2= $("#won2");
    var $won3= $("#won3");
    var $won4= $("#won4");

    var $slider = $('.range-slider'),
        $range = $('.range-sliderRange'),
        $value = $('.range-sliderValue');
    

    // 원 아이콘
    var wonIcon = function (value) {

        // console.log(value);
        if(value<=10000){
            $won1.css("display","inline-block");
            $won2.css("display","none");
            $won3.css("display","none");
            $won4.css("display","none");
            document.form.price.value = value;            
            // console.log("현쟂ㅈㅈㅈㅈㅈ"+value);
            // console.log("1개");
        }else if(value>10000 && value<=20000){
            $won2.css("display","inline-block");
            $won3.css("display","none");
            $won4.css("display","none");
            document.form.price.value = value;  
            // console.log("2개");
        }else if(value>20000 && value<=30000){
            $won2.css("display","inline-block");
            $won3.css("display","inline-block");
            $won4.css("display","none");
            document.form.price.value = value;  
            // console.log("3개");
        }else{
            $won2.css("display","inline-block");
            $won3.css("display","inline-block");
            $won4.css("display","inline-block");
            document.form.price.value = value;  
            // console.log("4개");
        } // if end
        
    }; 

    $range.on("input",function () {

        var value = this.value;
        wonIcon(value);
        $value.text(value);      
    })
    
    
    

    /* 대표메뉴 하나만 선택하게 하기 */
    var maxChecked = 1;
    var totalChecked = 0;
    function Countchecked(field) {
        if(field.checked) {
            totalChecked += 1;
        } else {
            totalChecked -= 1;
        }

        if(totalChecked > maxChecked) {
            alert("1개만 선택해주세요!");

            field.checked = false;
            totalChecked -= 1;
        }
    }
    function ResetCount() {
        totalChecked = 0;
    }
    
    
    

</script>
<script src="/js/menuAdd.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKjfx50R2Ae99Vf4ccm0cGJ7rhlNd7rMo&libraries=places&callback=initMap"
        async defer></script>
<script src="/js/login.js"></script>
<script src="/js/dounorPop.js"></script>
</body>
</html>