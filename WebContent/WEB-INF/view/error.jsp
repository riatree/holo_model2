<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>error_page</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <style>
        body{
            font-family: 'Do Hyeon', sans-serif;
        }
        #contentsWrap{
            width: 1080px; height: 860px;
            text-align: center;
            margin: 70px auto 0 auto;
        }
        #errorWrap{
           padding-top: 50px;
        }
        
        .error{
            margin-top: 40px;
        }
        .contents_error{
            font-size: 40px;
        }
        .btn_error>img{
            vertical-align: middle;
            margin-right: 10px;
        }
        .btn{
            text-decoration: none;
            padding: 10px 15px;
            background-color: #C69963;
            color: #eee;
            border-radius: 5px;
            font-family: 'Do Hyeon', sans-serif;
            transition: .5s ease;
        }
        .btn:hover{
            box-shadow: 1px 1px 3px #424242, 2px 2px 3px #424242;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<div id="contentsWrap">
    <h2 class="screen_out">errorPage</h2>
    <dl id="errorWrap">
        <dt><img src="/img/error/error.png" width="300" height="300"/></dt>
        <dd class="error contents_error">페이지가 존재하지 않습니다.</dd>
        <dd class="error btn_error">
            <img src="/img/error/cute-donut.png" width="45" height="40"/>
            <a class="btn" href="/index">메인으로</a>
        </dd><!--//btnWrap-->
    </dl><!--//errorWrap-->
</div><!--//contentsWrap-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script src="/js/jquery.js"></script>
<script src="/js/fix-footer.js"></script>
</body>
</html>