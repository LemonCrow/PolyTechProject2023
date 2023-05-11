<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<link rel="stylesheet" href="css/bootstrap.css"> <!-- 참조  -->
<title>게시판</title>
<!-- 게시판 제목 밑줄과 클릭시 변하는 색을 검정색으로 고정  -->
<style type="text/css">
	a.over{
		color: #000000;
		text-decoration: none;
	}
</style>
</head>
<body>
    <nav>
        <div>
            <a>JSP 게시판 웹 사이트</a>
             <ul>
                <li><a class="over"  href="../index.jsp">메인</a></li>
                <li><a class="over"  href="ListView.jsp">게시판</a></li>
            </ul>
        </div>
    </nav>
    <div>
            <table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color:#eeeeee; text-align:center;">글번호</th>
                        <th style="background-color:#eeeeee; text-align:center;">제목</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성자</th>
                        <th style="background-color:#eeeeee; text-align:center;">작성일</th>
                        <th style="background-color:#eeeeee; text-align:center;">조회수</th>
                        <th style="background-color:#eeeeee; text-align:center;">추천수</th>
                    </tr>
                </thead>
                <tr>
                        <th style="text-align:center;">1</th>
                        <th style="text-align:center;"><a href="View.jsp">Test</a></th>
                        <th style="text-align:center;">Admin</th>
                        <th style="text-align:center;">2023-04-27</th>
                        <th style="text-align:center;">10</th>
                        <th style="text-align:center;">1</th>
                    </tr>
            </table>
            <button>
            <a class="over"  href="ListWrite.jsp">글쓰기</a>
            </button>
        </div>
</body>
</html>

