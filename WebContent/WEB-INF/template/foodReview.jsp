<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="back"></div>

        <div id="restaurantReviewBox">

            <div class="title"><h2>음식점 리뷰</h2></div>
            <div class="cancel"><i class="fas fa-times"></i></div>

            <div class="hiceBackground"></div>

            <div class="hiceLevel">
                <ul class="hice">
                    <li class="hice5"><div class="iceReview"><img data-align="0" class="on" src="img/ice5.png"/></div></li>
                    <li class="hice4"><div class="iceReview"><img data-align="1" src="img/icecream4.png"/></div></li>
                    <li class="hice3"><div class="iceReview"><img data-align="2" src="img/icecream3.png"/></div></li>
                    <li class="hice2"><div class="iceReview"><img data-align="3" src="img/icecream2.png"/></div></li>
                    <li class="hice1"><div class="iceReview"><img data-align="4" src="img/icecream1.png"/></div></li>
                </ul><!-- .hice end -->
            </div><!-- .hiceLevel end -->

            <!--<div class="ice ice5"><img src="img/ice5.png"/></div>-->
            <!--<div class="ice ice4"><img src="img/icecream4.png"/></div>-->
            <!--<div class="ice ice3"><img src="img/icecream3.png"/></div>-->
            <!--<div class="ice ice2"><img src="img/icecream2.png"/></div>-->
            <!--<div class="ice ice1 on"><img src="img/icecream1.png"/></div>-->
            <div id="evaluation">HICE지수를 선택해주세요!</div>

            <div id="form">
                <form action="" method="get" >
                    <fieldset>
                        <legend class="screen_out">음식점 리뷰</legend>
                        <div class="satisfication">
                            <span class="sub">&nbsp;만족도</span>
                            <p> <label>&nbsp;<input type="checkbox">맛 &nbsp;</label>
                                <label><input type="checkbox">분위기 &nbsp; </label>
                                <label><input type="checkbox">서비스</label></p>
                            <p> <label>&nbsp;<input type="checkbox">청결 </label>
                                <label><input type="checkbox">가성비</label></p>
                        </div>

                        <span class="sub">&nbsp;사진</span>
                        <div class="photoPop">
                            <canvas class="photoBoxPop"></canvas>
                            <input class="uploadPop" type="file" name="upload"/>
                        </div>

                        <div class="content">
                            <span class="sub">&nbsp;리뷰</span>
                            <p><textarea placeholder="내용을 입력해주세요."></textarea></p>
                        </div>

                        <button class="btnPop">취소</button>
                        <button class="btnPop">등록</button>
                    </fieldset>
                </form>
            </div><!-- #form end -->
        </div><!-- #restaurantReviewBox end -->
