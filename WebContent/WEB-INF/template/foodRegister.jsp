<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="back">
</div><!-- #back end -->

    <div id="restaurantRegisterBox">
        <div class="title"><h2>음식점 등록</h2></div>
        <div class="cancel"><i class="fas fa-times"></i></div>

        <div class="hiceBackground"></div>

        <div class="hiceLevel">
            <ul class="hice">
                <li class="hice5"><div class="ice"><img data-align="5" class="on" src="/img/ice5.png"></div></li>
                <li class="hice4"><div class="ice"><img data-align="4" src="/img/icecream4.png"/></div></li>
                <li class="hice3"><div class="ice"><img data-align="3" src="/img/icecream3.png"/></div></li>
                <li class="hice2"><div class="ice"><img data-align="2" src="/img/icecream2.png"/></div></li>
                <li class="hice1"><div class="ice"><img data-align="1" src="/img/icecream1.png"/></div></li>
            </ul><!-- .hice end -->
        </div><!-- .hiceLevel end -->
        <div id="evaluation">HICE지수를 선택해주세요!</div>

        <div class="form">
            <form action="/spot/food" method="POST" name="form">
            	
            	<input type="hidden" id="uploadName" name="picName"/>
            	<input type="hidden" id="hicePoint" name="hice">
                <fieldset>
                    <legend class="screen_out">음식점 등록</legend>

                    <div class="photo">
                        <span class="sub">&nbsp;사진</span>
                        <div class="photoBox no_image far fa-image">
                        <img src="/img/spot/defaultpic.png" width="160" height="120" id="uploadImg"/>
                        </div>
                        <p><input class="upload" type="file"/></p>
                    </div>

                    <div class="restaurantLocation">
                        <em>지역</em> <input id="locationInput" placeholder="지역을 입력해주세요"/>
                        <input type="hidden" name="noLocation" id="locationNo">
                        <ul id="result"> </ul>
                    </div><!-- .restaurantLocation end -->
                    
                    <script type="text/template" id="searchTmp">
   						 <@ _.each(searchList,function(search){@>
       					 	<li class="selectLocation" data-no="<@=search.no@>"><@=search.name@></li>
    					 <@ }) @>
					</script>

                    <div class="restaurantName">
                        <em>음식점 명</em> <input name="name" placeholder="음식점 이름을 입력해주세요" />
                    </div><!-- .restaurantName end -->

                    <div class="restaurantType">
                        <em>음식점 종류</em>
                        <select name="categoryType">
                            <option value="R">식당</option>
                            <option value="C">디저트 & 카페</option>
                            <option value="B">바 & 펍</option>
                            <option value="E">그 외</option>
                        </select>
                    </div><!-- .restaurantType end -->

                    <div class="restaurantAddr">
                        <em>주소</em>
                        <input class="addr1" name="address1" placeholder="주소를 입력해주세요"/> <button type="button">google Map</button>
                        <input class="addr2" name="address2" placeholder="상세주소를 입력해주세요"/>
                        <input id="placeLat" type="hidden" name="latitude" value="">
                        <input id="placeLng" type="hidden" name="longitude" value="">
                    </div><!-- .restaurantAddr end -->

                    <div class="restaurantCall">
                        <em>연락처</em> <input name="contact1" /> - <input name="contact2" /> - <input name="contact3" />
                    </div><!-- .restaurantCall end -->

                    <div class="restaurantTime">
                        <em>운영시간</em>
                        <select name="openHour">
                            <% for(int i = 0; i <= 23; i++) { 
                        		if(i < 10) { %>
                            <option>0<%=i %></option>
                            <% } else { %>
                            <option><%=i %></option>
                            <% } } %>
                        </select>시
                        <select name="openMin">
                            <option>00</option>
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>40</option>
                            <option>50</option>
                        </select>분 ~
                        <select name="closeHour">
                            <% for(int i = 0; i <= 23; i++) { 
                        		if(i < 10) { %>
                            <option>0<%=i %></option>
                            <% } else { %>
                            <option><%=i %></option>
                            <% } } %>
                        </select>시
                        <select name="closeMin">
                            <option>00</option>
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>40</option>
                            <option>50</option>
                        </select>분
                    </div><!-- .restaurantTime end -->

                    <div class="restaurantMenu">
                        <span>*대표메뉴는 1개만 선택해주세요!</span>
                        <em>메뉴</em>

                        <div class="menuBox">
                        <input id="addMenuName" class="menuName" 
                        		placeholder="메뉴를 입력해주세요"/>
                        <i class="fas fa-ellipsis-h"></i>
                        <input id="addMenuPrice" class="menuPrice"
                        		 placeholder="가격을 입력해주세요" /> 원
                        </div>

                        <ul class="menuList">
                            <li>
                                
                            </li>
                        </ul>
                        <div class="addMenu"><i class="fas fa-plus"></i></div>
                    </div><!-- .restaurantMenu end -->            


                    <div class="restaurantMoney">
                        <em>가격대</em>
                        <span>*1개의 메뉴 기준으로 선택해주세요</span>
                        <div class="priceRange">
                            <div class="range-slider">
                                <input class="range-sliderRange" type="range" value="5000" min="0" max="40000" step="1000" autocomplete="on">
                                <!--<span class="range-sliderValue">0</span><span>원</span>-->
                            </div><!-- .range-slider end -->
                            <div class="wonIconBox">
                                <img id="won1" class="won" src="/img/won.png"/><!--
            --><img id="won2" class="won" src="/img/won.png"/><!--
            --><img id="won3" class="won" src="/img/won.png"/><!--
            --><img id="won4" class="won" src="/img/won.png"/>
                                <span class="range-sliderValue">0</span><span>원</span>
                                <input type="hidden" id="price" name="price" value="">                             
                            </div>
                        </div>
                    </div><!-- .restaurantMoney end -->

                    <div class="restaurantContent">
                        <em>소개</em> <textarea name="contents"></textarea>
                    </div><!-- .restaurantContent end -->

                    <div class="restaurantTheme">
                        <em>테마</em>
                        <ul>
                            <li><label>TV여행 <input type="checkbox" name="theme" value="196"/></label></li>
                            <li><label>힐링여행 <input type="checkbox" name="theme" value="191"/></label></li>
                            <li><label>도심여행 <input type="checkbox" name="theme" value="197"/></label></li>
                            <li><label>액티비티 <input type="checkbox" name="theme" value="192"/></label></li>
                            <li><label>식도락 <input type="checkbox" name="theme" value="195"/></label></li>
                            <li><label>역사·문화 <input type="checkbox" name="theme" value="198"/></label></li>
                            <li><label>감성여행 <input type="checkbox" name="theme" value="194"/></label></li>
                            <li><label>야경여행 <input type="checkbox" name="theme" value="193"/></label></li>
                        </ul>
                        <span>*최대 3개까지 선택 가능합니다!</span>
                    </div><!-- .restaurantTheme end -->

                    <div class="restaurantService">
                        <em>부가서비스</em>
                        <div class="check">
                            <label><input name="service" type="checkbox" value="W" />무료 와이파이</label>
                            <label><input name="service" type="checkbox" value="P" />주차장</label>
                            <label><input name="service" type="checkbox" value="D" />배달</label>
                            <label><input name="service" type="checkbox" value="O" />테이크아웃</label>&nbsp;&nbsp;
                            <label><input name="service" type="checkbox" value="S" />예약가능</label>
                            <label><input name="service" type="checkbox" value="R" />룸</label>
                        </div><!-- .check end-->
                    </div><!-- .restaurantService end -->

                    <div class="restaurantSatisfaction">
                        <em>만족도</em>
                        <div class="check">
                            <label><input name="good" type="checkbox" value="F" />맛</label>
                            <label><input name="good" type="checkbox" value="S" />서비스</label>
                            <label><input name="good" type="checkbox" value="C" />청결도</label>
                            <label><input name="good" type="checkbox" value="L" />분위기</label>
                            <label><input name="good" type="checkbox" value="H" />가성비</label>
                        </div><!-- .check end-->
                    </div><!-- .attractionSatisfaction end -->



                    <button type="reset" class="btn close">리셋</button>
                    <button type="submit" class="btn register">등록</button>
                </fieldset>
            </form>

        </div><!-- .form end-->
    </div><!-- #restaurantRegisterBox end-->

    <div class="mapWrap">
        <input id="pac-input" class="controls" type="text" placeholder="Enter a location">
        <div id="map"></div>
        <div id="infowindow-content">
            <span id="place-name" class="title"></span><br>
            Place ID <span id="place-id"></span><br>
            <span id="place-address"></span>
            <button class="addrBtn">추가</button>
        </div><!-- #infowindow-content end -->

        <div class="cancel"><i class="fas fa-times"></i></div>
    </div><!-- .mapWrap end -->