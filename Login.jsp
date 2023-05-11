	<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	
	<!DOCTYPE html>
	<html>
	<head>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>로그인 페이지</title>
	</head>
	<body>
	    <!-- 네비게이션  -->
	    <nav>
	        <ul>
	            <li><a href="index.jsp">메인</a></li>
	        </ul>
	    </nav>
	    <h1>로그인 페이지입니다.</h1>
	    <div>	
	        <form method="post" action="LoginAction.jsp" style="text-align: center">
	            <h3 style="text-align: center;">로그인 화면</h3>
	                <div class="loginform-group">
	                    <input type="text" class="user_id" placeholder="아이디" name="user_id" value="" maxlength="20">
	                </div>
	                <div class="loginform-group">
	                    <input type="password" class="user_passwd" placeholder="비밀번호" name="user_passwd" value="" maxlength="20">
	                </div>
	                    <input type="submit" class="login" value="로그인">
	        </form>    
	    </div>
	</body>
	</html>