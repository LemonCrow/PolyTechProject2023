<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Verti by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>가족페이지</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="/assets/css/main.css" />
	</head>
	<body class="is-preload homepage">
		
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header-wrapper">
					<header id="header" class="container">

						<!-- Logo -->
							<div id="logo">
								<h1><a href="/index.jsp">Main</a></h1>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul>
									<!-- 사용자가 로그인하지 않은 경우에만 로그인 및 회원가입 버튼이 표시 --> 
									<% if (session.getAttribute("user_id") == null) { %>
										<li class="current"><a href="/user/Login.jsp">로그인</a></li>
										<li class="current"><a href="/user/SignUp.jsp">회원가입</a></li>
									<% } %>
									
									<!-- 사용자가 로그인한 경우에만 버튼이 표시 --> 
									<% if (session.getAttribute("user_id") != null) { %>
										<li class="current"><a href="/user/LogoutAction.jsp">로그아웃</a></li>
										<li>
											<a href="#">내정보</a>
											<ul>
												<li><a href="/user/UserEdit.jsp">회원정보수정</a></li>
												<li><a href="/user/DeleteAccount.jsp">회원탈퇴</a></li>
												<li>
													<a href="#">커뮤니티</a>
													<ul>
														<li><a href="/friends/FriendsList.jsp">친구</a></li>
														<li><a href="/friends/Friend.jsp">친구추가</a></li>
														<li><a href="/friends/FriendCheck.jsp">받은친구신청</a></li>
														<li><a href="/message/MsgSend.jsp">메시지 보내기</a></li>
														<li><a href="/message/MsgCheck.jsp">메시지 확인</a></li>
													</ul>
												</li>
											</ul>
										</li>
										<li><a href="/board/boardmain.jsp">게시판</a></li>
										<li><a href="family.jsp">가족생성</a></li>
									<% } %>
								</ul>
							</nav>				
					</header>
				</div>

			</div>
			
			<h1>가족생성 페이지입니다.</h1>
			<div>
				<form method="post" action="familyAction.jsp" style="text-align: center">
					<h3 style="text-align: center;">가족 생성 화면</h3>
						<div class="loginform-group">
							<input type="text" class="user_id" placeholder="아이디" name="user_id" maxlength="20" value="">
						</div>
						<div class="loginform-group">
							<input type="password" class="user_passwd" placeholder="비밀번호" name="user_passwd" maxlength="20" value="">
						</div><br>
							<input type="submit" class="login" value="가족 생성">
				</form>
			</div>

		<!-- Scripts -->

			<script src="/assets/js/jquery.min.js"></script>
			<script src="/assets/js/jquery.dropotron.min.js"></script>
			<script src="/assets/js/browser.min.js"></script>
			<script src="/assets/js/breakpoints.min.js"></script>
			<script src="/assets/js/util.js"></script>
			<script src="/assets/js/main.js"></script>

	</body>
</html>