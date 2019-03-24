<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="back">
</div><!-- #back end -->

    <div id="attractionRegisterBox">
        <div class="title"><h2>관광명소 등록</h2></div>
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
            <form action="/spot/tour" method="POST" name="form">  
            	<input type="hidden" id="uploadName" name="picName"/>
            	<input type="hidden" id="hicePoint" name="hice">
                <fieldset>
                    <legend class="screen_out">관광명소 등록</legend>

                    <div class="photo">
                        <span class="sub">&nbsp;사진</span>                        
                        <div class="photoBox no_image far fa-image">                        
                        	<img src="/img/spot/defaultpic.png" width="160" height="120" id="uploadImg"/>
                        </div>                        
                        <p><input class="upload" type="file"/></p>
                    </div>

                    <div class="attractionLocation">
                        <em>지역</em> <input id="locationInput" placeholder="지역을 입력해주세요"/>
                        <input type="hidden" name="noLocation" id="locationNo">
                        <ul id="result"> </ul>
                    </div><!-- .attractionLocation end -->
                    
                    <script type="text/template" id="searchTmp">
   						 <@ _.each(searchList,function(search){@>
       					 	<li class="selectLocation" data-no="<@=search.no@>"><@=search.name@></li>
    					 <@ }) @>
					</script>

                    <div class="attractionName">
                        <em>관광명소 명</em> <input name="name" placeholder="관광명소 이름을 입력해주세요" />
                    </div><!-- .attractionName end -->

                    <div class="attractionType">
                        <em>관광명소 종류</em>
                        <select name="categoryType">
                            <option value="L">랜드마크</option>
                            <option value="M">박물관</option>
                            <option value="P">자연/공원</option>
                            <option value="S">쇼핑</option>
                            <option value="T">교통장소</option>
                            <option value="A">놀이공원</option>
                            <option value="E">그 외</option>
                        </select>
                    </div><!-- .attractionType end -->

                    <div class="attractionAddr">
                        <em>주소</em>
                        <input class="addr1" name="address1" placeholder="주소를 입력해주세요"/> <button type="button">장소찾기</button>
                        <input class="addr2" name="address2" placeholder="상세주소를 입력해주세요"/>
                        <input id="placeLat" type="hidden" name="latitude" value="">
                        <input id="placeLng" type="hidden" name="longitude" value="">
                    </div><!-- .attractionAddr end -->

                    <div class="attractionCall">
                        <em>연락처</em> <input name="contact1" /> - <input name="contact2" /> - <input name="contact3" />
                    </div><!-- .attractionCall end -->

                    <div class="attractionTime">
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

                    </div><!-- .attractionTime end -->

                    <div class="attractionSite">
                        <em>웹사이트</em> <input name="website" placeholder="웹사이트 주소를 입력해주세요" />
                    </div><!-- .attractionSite end -->

                    <div class="attractionMoney">
                        <em>입장료</em> <input name="price" placeholder="숫자만 입력해주세요"/>
                    </div><!-- .attractionMoney end -->

                    <div class="attractionContent">
                        <em>소개</em> <textarea name="contents"></textarea>
                    </div><!-- .attractionContent end -->

                    <div class="attractionTheme">
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
                    </div><!-- .attractionTheme end -->

                    <div class="attractionService">
                        <em>부가서비스</em>
                        <div class="check">
                            <label><input name="service" type="checkbox" value="W"/>무료 와이파이</label>
                            <label><input name="service" type="checkbox" value="P"/>주차장</label>
                            <label><input name="service" type="checkbox" value="T"/>화장실</label>
                            <label><input name="service" type="checkbox" value="F"/>입장료</label>
                            <label><input name="service" type="checkbox" value="Z"/>포토존</label>
                        </div><!-- .check end-->
                    </div><!-- .attractionService end -->

                    <div class="attractionSatisfaction">
                        <em>만족도</em>
                        <div class="check">
                            <label><input name="good" type="checkbox" value="P"/>포토존</label>
                            <label><input name="good" type="checkbox" value="F"/>편의시설</label>
                            <label><input name="good" type="checkbox" value="T"/>교통</label>
                            <label><input name="good" type="checkbox" value="W"/>볼거리</label>
                            <label><input name="good" type="checkbox" value="A"/>주변환경</label>
                        </div><!-- .check end-->
                    </div><!-- .attractionSatisfaction end -->



                    <button type="reset" class="btn close">리셋</button>
                    <button type="submit" class="btn register">등록</button>
                </fieldset>
            </form>

        </div><!-- .form end-->
    </div><!-- #attractionRegisterBox end-->

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