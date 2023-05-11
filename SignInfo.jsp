<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test</title>
</head>
<body>
	<!-- 네비게이션  -->
	<nav>
		<ul>
			<li><a href="index.jsp">메인</a></li>
		</ul>
	</nav>
	<h1>회원수정 페이지입니다.</h1>
	<div>
		<form method="post" action="index.jsp" style="text-align: center">
			<h3 style="text-align: center;">회원정보수정 화면</h3>
				<div class="loginform-group">
					<input type="password" class="pass_wd" placeholder="비밀번호" name="passwd" maxlength="20">
				</div>
				<div class="loginform-group">
					<input type="text" class="nick_name" placeholder="닉네임" name="nickname" maxlength="20">
				</div>
				<div class="loginform-group">
					<input type="text" class="phone_number" placeholder="전화번호" name="phonenumber" maxlength="20">
				</div>
				<div class="loginform-group">
					<input type="text" class="email" placeholder="이메일" name="email" maxlength="20">
				</div>
				<div class="loginform-group">
					<label>
						<input type="radio" name="user_gender" autocomplete="off" value="남자" checked>남자
					</label>
					<label>
						<input type="radio" name="user_gender" autocomplete="off" value="여자" checked>여자
					</label>
				</div>
					<input type="submit" class="login" value="회원정보수정">
		</form>	
	</div>
</body>
</html>