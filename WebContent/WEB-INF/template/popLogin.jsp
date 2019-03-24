<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="loginPopup"></div>
    <div id="loginView">
        <form id="loginform" action="/session" method="post">
            <fieldset id="loginfieldset">
                <h1 id="loginTitle"><u >로그인</u></h1>
                <i id="loginClose" class="fas fa-times"></i>
                    <div id="loginBox">
                        <div id="loginList">
                            <div id="loginIdBox">
                                <img src="/img/user.png" width="38px" height="38px" />
                                <input id="loginIdInput" name="id" placeholder="아이디를 입력해주세요"/>
                            </div><!--#loginId end-->
                            <div id="loginPasswordBox">
                                <img src="/img/password.png" width="38px" height="38px" />
                                <input id="loginPasswordInput" type="password" name="pwd" placeholder="비밀번호를 입력해주세요"/>
                            </div><!--#loginPassword end-->
                        </div><!--#loginList end-->
                        <button id="loginBtn">로그인</button>
                    </div>
                <div id="loginFind">
                    <button id="loginFindBtn">찾기</button>
                    <span>|</span>
                    <a href="/register" id="loginRegisterBtn">회원가입</a>
                </div>
                <div id="otherLoginBox">
                    <button class="kakao otherLogin">KAKAO로 로그인</button>
                    <button class="facebook otherLogin">FACEBOOK로 로그인</button>
                    <button class="naver otherLogin">NAVER로 로그인</button>
                </div>
            </fieldset><!--fieldset end-->
        </form><!--form  end-->
    </div><!--loginView  end-->