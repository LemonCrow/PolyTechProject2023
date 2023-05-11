<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<title>게시판</title>
<style type="text/css"> /* 게시판 위쪽 메인 게시판 부분 글씨 색 처리 */
	a.over{
		color: #000000;
		text-decoration: none;
	} 
</style>
<% 
	// 게시물 목록 조회 쿼리문
	String sql = "SELECT *, (SELECT COUNT(likey_idx) FROM likey_tb WHERE board_idx = board_tb.board_idx) AS like_count FROM board_tb ORDER BY board_idx DESC";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>
<body>
  <a href="../index.jsp" class="over"><h4>Home</h4></a>
  <a href="boardmain.jsp" class="over"><h4>게시판</h4></a>
  <table border="1">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
        <th>추천수</th>
      </tr>
    </thead>
    <tbody> <!-- 게시판 목록 보이는 부분  -->
      <% while (rs.next()) { %>
      <tr>
        <td><%= rs.getInt("board_idx") %></td>
        <td><a href="view.jsp?idx=<%= rs.getInt("board_idx") %>"><%= rs.getString("board_title") %></a></td>
        <td><%= rs.getString("user_nickname") %></td>
        <td><%= rs.getTimestamp("board_reg_date") %></td>
        <td><%= rs.getInt("board_view_count") %></td>
        <td><%= rs.getInt("like_count") %></td><!-- 좋아요 갯수 가져오기 -->
      </tr>
      <% } %>
    </tbody>
  </table>
  <button>
  	<a href="write.jsp" class="over">글쓰기</a>
  </button>
</body>
</html>