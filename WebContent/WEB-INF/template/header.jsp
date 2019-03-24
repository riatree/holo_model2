<%@page import="org.yolo.holo.vo.Dounor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="header">
    <h1 class="screen_out">HOLO:Happen Of Leave Oneself</h1>
    <div class="headMenu">
        <ul>
            <li id="logoImage"><a href="/index">HOLO</a></li>
            <li class="menu"><a href="/region">여행지</a></li>
            <li class="menu"><a href="/tour">관광명소</a></li>
            <li class="menu"><a href="/food">음식점</a></li>
            <li class="menu"><a href="/hlog">Hlog</a></li>
            <li class="menu"><a href="/together">동행</a></li>
            <li class="fo">
                <form action="/search" method="get">
                    <input class="searchText" name="search" autocomplete="off" placeholder="검색어를 입력하세요"/>
                    <button class="searchBtn screen_out"><i class="fas fa-search"></i></button>
                </form>
                <button class="closeBtn"><i class="fas fa-times"></i></button>
            </li>
            <li class="search"><i class="fas fa-search"></i></li>
            
            <c:choose>
            	<c:when test="${loginDounor != null }">           
	            <li class="alarm"><i class="fas fa-bell"></i></li>
	            <li class="setting">
	                <a>
	                    <img src="/img/profile/${loginDounor.profile }" class="face_img" width="50" height="50">
	                    <span class="bu"></span>
	                </a>
	                <div class="myInf">
	                    <ul id="myInfList">
	                        <li><a href="/user/${loginDounor.no }/hlog/page/1">마이 페이지</a></li>
	                        
	                        <form action="/session" method="POST">
	                        	<input type="hidden" name="_method" value="DELETE"/>
	                        	<button class="logout">로그아웃</button>
	                        </form>
	                    </ul><!--//.myInfList -->
	                </div><!--//.myInf -->
	            </li><!-- // .setting -->
	            </c:when>
	            
	            <c:otherwise>
	            	<li class="login">로그인</li>
	            </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div> <!--//header-->