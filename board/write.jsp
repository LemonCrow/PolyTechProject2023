<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 게시판 웹 사이트</title>
<style type="text/css">
	a, a:hover { 
		text-decoration: none;
	}
</style>

</head>
<body>
	<!--로그인 했으면 userID에 값 들어감-->
	<%
		String user_id = null;
		if(session.getAttribute("user_id") != null){
			user_id = (String)session.getAttribute("user_id");
		}
	%>
    <nav class ="navbar navbar-default">
        <div class="navbar-header">
            <a class ="navbar-brand" href="../index.jsp">Home</a>
            <a class ="navbar-brand" href="ListView.jsp">게시판</a>
        </div>
    </nav>
    <div class="container">
        <div class="row">
        	<form  action="writeAction.jsp" method="post">
	        	<input type="text" class="form-contorl" placeholder="글 제목" name="title" maxlength="50">
	            <textarea class="form-contorl" placeholder="글 내용" name="content" maxlength="5000" style="height: 350px"></textarea>
	            <input type="file" name="fName">
	            <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
            </form>
        </div>
    </div>
</body>
</html>